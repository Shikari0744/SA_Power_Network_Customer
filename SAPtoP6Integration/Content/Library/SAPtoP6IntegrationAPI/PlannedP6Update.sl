namespace: SAPtoP6IntegrationAPI
operation:
  name: PlannedP6Update
  inputs:
    - P6ServiceAccountUsername:
        sensitive: true
    - P6ServiceAccountPassword:
        sensitive: true
    - PlannedActivitiesFileName
    - PlannedResourcesFileName
    - Environment
    - FilePath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/SAP to P6 Integration/'
  python_action:
    use_jython: false
    script: "def execute(P6ServiceAccountUsername, P6ServiceAccountPassword, PlannedActivitiesFileName, PlannedResourcesFileName, Environment, FilePath):\r\n    import requests\r\n    import datetime\r\n    import random\r\n    import xmltodict\r\n    import pandas as pd\r\n    \r\n    #This script updates the primavera planned activities and resource assignments.\r\n    #Inputs: Authentication username and password, Extraction from SAP with updated details\r\n    #Outputs: NA\r\n    #TLDR: Updates the activities fs estimate hours + $\r\n    # - Updates material, service, labour planned estimates (resources assignments for activities)\r\n    \r\n    \r\n    #Username /Password\r\n    UserName = P6ServiceAccountUsername\r\n    Password = P6ServiceAccountPassword\r\n    \r\n    \r\n    #Used to generate the nonce and created/expired times for authentication in the request\r\n    #Needs to be generated for every request\r\n    def authBody(body):\r\n       random_string = ''\r\n       for _ in range(22):\r\n          # Considering only upper and lowercase letters\r\n          random_integer = random.randint(97, 97 + 26 - 1)\r\n          flip_bit = random.randint(0, 1)\r\n          # Convert to lowercase if the flip bit is on\r\n          random_integer = random_integer - 32 if flip_bit == 1 else random_integer\r\n          # Keep appending random characters using chr(x)\r\n          random_string += (chr(random_integer))\r\n    \r\n       created = datetime.datetime.utcnow()\r\n       expired = created + datetime.timedelta(seconds= 5*60)\r\n       data = f\"\"\"\r\n        <soap-env:Envelope xmlns:soap-env=\"http://schemas.xmlsoap.org/soap/envelope/\">\r\n            <soap-env:Header>\r\n                <wsse:Security soap-env:mustUnderstand=\"1\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\" xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\">\r\n                <wsu:Timestamp>\r\n                    <wsu:Created>{created.strftime(\"%Y-%m-%dT%H:%M:%SZ\")}</wsu:Created>\r\n                    <wsu:Expires>{expired.strftime(\"%Y-%m-%dT%H:%M:%SZ\")}</wsu:Expires>\r\n                </wsu:Timestamp>\r\n                <wsse:UsernameToken>\r\n                    <wsse:Username>{UserName}</wsse:Username>\r\n                    <wsse:Password Type=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText\">{Password}</wsse:Password>\r\n                    <wsse:Nonce EncodingType=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary\">{random_string}==</wsse:Nonce>\r\n                    <wsu:Created>{created.strftime(\"%Y-%m-%dT%H:%M:%SZ\")}</wsu:Created>\r\n                </wsse:UsernameToken>\r\n                </wsse:Security>\r\n            </soap-env:Header>\r\n            <soap-env:Body>\r\n                {body}\r\n            </soap-env:Body>\r\n        </soap-env:Envelope>\r\n        \"\"\"\r\n       return(data)\r\n    \r\n    #Function to return endpoint URL based on environment\r\n    def serviceURL(service):\r\n        if Environment == \"QAS\":\r\n            endpoint = f\"http://prvqas612:8206/p6ws/services/{service}?wsdl\"\r\n        else:\r\n            endpoint = f\"http://prvprd612:8206/p6ws/services/{service}?wsdl\"\r\n        return(endpoint)\r\n    \r\n    #Updates user defined field at the activity level i.e. fs estimate hrs, fs estimate ($)\r\n    def updateFSEstimates(Activites):\r\n        url = serviceURL(\"UDFValueService\")\r\n        #QAS and PRD have different code values, once PRD codes found update the if to reflect PRD codes\r\n        if Environment == \"QAS\":\r\n            FSEstimatedollarcode = \"767\"\r\n            FSEstimatehrscode = \"772\"\r\n        elif Environment == \"PRD\":\r\n            FSEstimatedollarcode = \"767\"\r\n            FSEstimatehrscode = \"772\"\r\n        ActivitiesToUpdate = []\r\n        for i in Activites:\r\n            #Compare original p6 value to sap value, if different at the update operation to the request body\r\n            if i['FSEstimate$P6'] != i['FSEstimate$SAP'] and pd.isna(i['FSEstimate$SAP']) == False:\r\n                if pd.isna(i['FSEstimate$P6']) == False:\r\n                    ActivitiesToUpdate.append(f\"\"\"\r\n                        <ns0:UDFValue>\r\n                            <ns0:UDFTypeObjectId>{FSEstimatedollarcode}</ns0:UDFTypeObjectId>\r\n                            <ns0:ForeignObjectId>{int(i['ActivityID'])}</ns0:ForeignObjectId>\r\n                            <ns0:Cost>{float(i['FSEstimate$SAP'])}</ns0:Cost>\r\n                        </ns0:UDFValue>\r\n                        \"\"\")\r\n            if i['FSEstimateHrsP6'] != i['FSEstimateHrsSAP'] and pd.isna(i['FSEstimateHrsSAP']) == False:\r\n                if pd.isna(i['FSEstimateHrsP6']) == False:\r\n                    ActivitiesToUpdate.append(f\"\"\"\r\n                        <ns0:UDFValue>\r\n                            <ns0:UDFTypeObjectId>{FSEstimatehrscode}</ns0:UDFTypeObjectId>\r\n                            <ns0:ForeignObjectId>{int(i['ActivityID'])}</ns0:ForeignObjectId>\r\n                            <ns0:Integer>{int(i['FSEstimateHrsSAP'])}</ns0:Integer>\r\n                        </ns0:UDFValue>\r\n                        \"\"\")\r\n        if ActivitiesToUpdate == []:\r\n            return(True)\r\n        #Add outer bits to body of updates\r\n        for i in range(0, len(ActivitiesToUpdate), 950):\r\n            #print(list[i:i+950])\r\n            #print(i)\r\n            body = ''\r\n            for b in ActivitiesToUpdate[i:i+950]:\r\n                body = body+b\r\n            body = f\"\"\"\r\n                <ns0:UpdateUDFValues xmlns:ns0=\"http://xmlns.oracle.com/Primavera/P6/WS/UDFValue/V1\">\r\n                        {body}\r\n                </ns0:UpdateUDFValues>\r\n            \"\"\"\r\n            print(body)\r\n            #Sending the Request\r\n            resp = requests.post(url, data=authBody(body))\r\n            x = xmltodict.parse(resp.content)\r\n            print(x)\r\n        return(True)\r\n    \r\n    #creates user defined field at the activity level i.e. fs estimate hrs, fs estimate ($) (we use the create operation if there was no value before)\r\n    def createFSEstimates(Activites):\r\n        url = serviceURL(\"UDFValueService\")\r\n        #QAS and PRD have different code values, once PRD codes found update the if to reflect PRD codes\r\n        if Environment == \"QAS\":\r\n            FSEstimatedollarcode = \"767\"\r\n            FSEstimatehrscode = \"772\"\r\n        elif Environment == \"PRD\":\r\n            FSEstimatedollarcode = \"767\"\r\n            FSEstimatehrscode = \"772\"\r\n        ActivitiesToUpdate = []\r\n        for i in Activites:\r\n            #Compare original p6 value to sap value, if different at the update operation to the request body\r\n            if i['FSEstimate$P6'] != i['FSEstimate$SAP'] and pd.isna(i['FSEstimate$SAP']) == False:\r\n                if pd.isna(i['FSEstimate$P6']):\r\n                    ActivitiesToUpdate.append(f\"\"\"\r\n                        <ns0:UDFValue>\r\n                            <ns0:UDFTypeObjectId>{FSEstimatedollarcode}</ns0:UDFTypeObjectId>\r\n                            <ns0:ForeignObjectId>{int(i['ActivityID'])}</ns0:ForeignObjectId>\r\n                            <ns0:Cost>{float(i['FSEstimate$SAP'])}</ns0:Cost>\r\n                        </ns0:UDFValue>\r\n                        \"\"\")\r\n            if i['FSEstimateHrsP6'] != i['FSEstimateHrsSAP'] and pd.isna(i['FSEstimateHrsSAP']) == False:\r\n                if pd.isna(i['FSEstimateHrsP6']):\r\n                    ActivitiesToUpdate.append(f\"\"\"\r\n                        <ns0:UDFValue>\r\n                            <ns0:UDFTypeObjectId>{FSEstimatehrscode}</ns0:UDFTypeObjectId>\r\n                            <ns0:ForeignObjectId>{int(i['ActivityID'])}</ns0:ForeignObjectId>\r\n                            <ns0:Integer>{int(i['FSEstimateHrsSAP'])}</ns0:Integer>\r\n                        </ns0:UDFValue>\r\n                        \"\"\")\r\n        if ActivitiesToUpdate == []:\r\n            return(True)\r\n        #Add outer bits to body of updates\r\n        for i in range(0, len(ActivitiesToUpdate), 950):\r\n            #print(list[i:i+950])\r\n            #print(i)\r\n            body = ''\r\n            for b in ActivitiesToUpdate[i:i+950]:\r\n                body = body+b\r\n            body = f\"\"\"\r\n                <ns0:CreateUDFValues xmlns:ns0=\"http://xmlns.oracle.com/Primavera/P6/WS/UDFValue/V1\">\r\n                        {body}\r\n                </ns0:CreateUDFValues>\r\n            \"\"\"\r\n            print(body)\r\n            #Sending the Request\r\n            resp = requests.post(url, data=authBody(body))\r\n            x = xmltodict.parse(resp.content)\r\n            print(x)\r\n        return(True)\r\n    \r\n    \r\n    #Function to return the object ID of the resource to be updated (depends on environment)\r\n    def resourceAssignmentCode(resourceName):\r\n        if Environment == \"QAS\":\r\n            if resourceName == \"Labour\":\r\n                return(\"4346\")\r\n            elif resourceName == \"Material\":\r\n                return(\"4457\")\r\n            elif resourceName == \"Services\":\r\n                return(\"4458\")\r\n        elif Environment == \"PRD\":\r\n            if resourceName == \"Labour\":\r\n                return(\"4373\")\r\n            elif resourceName == \"Material\":\r\n                return(\"4387\")\r\n            elif resourceName == \"Services\":\r\n                return(\"4388\")\r\n    \r\n    def updateResourceAssignments(resourceAssignments):\r\n        url = serviceURL(\"ResourceAssignmentService\")\r\n        ActivitiesToUpdate = []\r\n        #Updating assignments with existing values in P6... check if assignmentobjectid is not a number\r\n        for i in resourceAssignments:\r\n            if pd.isna(i['AssignmentObjectID']) == False and i[\"EmployeeID\"] in [\"Labour\",\"Material\",\"Services\"]:\r\n                #print(resourceAssignmentCode(i[\"EmployeeID\"]))\r\n                print(i)\r\n                if i['Planned Cost'] != i['SAP Planned Cost'] or i['Planned Duration'] != i['SAP Planned Hours']:\r\n                    if pd.isna(i['SAP Planned Cost']):\r\n                        SC ='0'\r\n                    else:\r\n                        SC = i['SAP Planned Cost']\r\n                    if pd.isna(i['SAP Planned Hours']):\r\n                        SH ='0'\r\n                    else:\r\n                        SH = i['SAP Planned Hours']\r\n                    ActivitiesToUpdate.append(f\"\"\"\r\n                    <ns0:ResourceAssignment>\r\n                        <ns0:ObjectId>{int(i['AssignmentObjectID'])}</ns0:ObjectId>\r\n                        <ns0:ResourceObjectId>{resourceAssignmentCode(i[\"EmployeeID\"])}</ns0:ResourceObjectId>\r\n                        <ns0:PlannedCost>{SC}</ns0:PlannedCost>\r\n                        <ns0:PlannedUnits>{SH}</ns0:PlannedUnits>\r\n                        <ns0:IsCostUnitsLinked>False</ns0:IsCostUnitsLinked>\r\n                    </ns0:ResourceAssignment>\r\n                    \"\"\")\r\n        if ActivitiesToUpdate == []:\r\n            return(True)\r\n        #Add outer bits to body of updates\r\n        for i in range(0, len(ActivitiesToUpdate), 950):\r\n            body = ''\r\n            for b in ActivitiesToUpdate[i:i+950]:\r\n                body = body+b\r\n            body = f\"\"\"\r\n                <ns0:UpdateResourceAssignments xmlns:ns0=\"http://xmlns.oracle.com/Primavera/P6/WS/ResourceAssignment/V1\">\r\n                        {body}\r\n                </ns0:UpdateResourceAssignments>\r\n            \"\"\"\r\n            print(body)\r\n            #Sending the Request\r\n            resp = requests.post(url, data=authBody(body))\r\n            x = xmltodict.parse(resp.content)\r\n            print(x)\r\n        return(True)\r\n    \r\n    def createResourceAssignments(resourceAssignments):\r\n        url = serviceURL(\"ResourceAssignmentService\")\r\n        ActivitiesToUpdate = []\r\n        #Updating assignments with no existing values in P6... check if assignmentobjectid is not a number\r\n        for i in resourceAssignments:\r\n            if pd.isna(i['AssignmentObjectID']) and i[\"EmployeeID\"] in [\"Labour\",\"Material\",\"Services\"]:\r\n                #print(resourceAssignmentCode(i[\"EmployeeID\"]))\r\n                if pd.isna(i['SAP Planned Cost']):\r\n                    SC ='0'\r\n                else:\r\n                    SC = i['SAP Planned Cost']\r\n                if pd.isna(i['SAP Planned Hours']):\r\n                    SH ='0'\r\n                else:\r\n                    SH = i['SAP Planned Hours']\r\n                ActivitiesToUpdate.append(f\"\"\"\r\n                <ns0:ResourceAssignment>\r\n                    <ns0:ActivityObjectId>{int(i['ActivityID'])}</ns0:ActivityObjectId>\r\n                    <ns0:ResourceObjectId>{resourceAssignmentCode(i[\"EmployeeID\"])}</ns0:ResourceObjectId>\r\n                    <ns0:PlannedCost>{SC}</ns0:PlannedCost>\r\n                    <ns0:PlannedUnits>{SH}</ns0:PlannedUnits>\r\n                    <ns0:IsCostUnitsLinked>False</ns0:IsCostUnitsLinked>\r\n                </ns0:ResourceAssignment>\r\n                \"\"\")\r\n        if ActivitiesToUpdate == []:\r\n            return(True)\r\n        #Add outer bits to body of updates\r\n        for i in range(0, len(ActivitiesToUpdate), 950):\r\n            body = ''\r\n            for b in ActivitiesToUpdate[i:i+950]:\r\n                body = body+b\r\n            body = f\"\"\"\r\n                <ns0:CreateResourceAssignments xmlns:ns0=\"http://xmlns.oracle.com/Primavera/P6/WS/ResourceAssignment/V1\">\r\n                        {body}\r\n                </ns0:CreateResourceAssignments>\r\n            \"\"\"\r\n            print(body)\r\n            #Sending the Request\r\n            resp = requests.post(url, data=authBody(body))\r\n            x = xmltodict.parse(resp.content)\r\n            print(x)\r\n        return(True)\r\n    \r\n    xls = pd.read_excel(FilePath + PlannedActivitiesFileName, header=0)\r\n    Activities = xls.to_dict('record')\r\n    #print(Activities)\r\n    \r\n    #Update fs estimates hours and $ section\r\n    updateFSEstimates(Activities)\r\n    createFSEstimates(Activities)\r\n    \r\n    #read resource list to be updates based on SAP values\r\n    xls = pd.read_excel(FilePath + PlannedResourcesFileName, header=0)\r\n    resourceAssignments = xls.to_dict('record')\r\n    updateResourceAssignments(resourceAssignments)\r\n    createResourceAssignments(resourceAssignments)"
  results:
    - SUCCESS
