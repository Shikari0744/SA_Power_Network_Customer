namespace: RiverMurrayFloodReconnections
operation:
  name: RetailerEmail
  inputs:
    - csvlistExtract
    - accesstoken
  python_action:
    use_jython: false
    script: "def execute(csvlistExtract,accesstoken):\r\n    global requests, json\r\n    import requests\r\n    import json\r\n    from openpyxl import load_workbook\r\n    from openpyxl.worksheet.table import Table\r\n    from openpyxl.utils import get_column_letter\r\n    import pandas as pd\r\n    \r\n    #converting csv into xlsx\r\n    listExtract = csvlistExtract.replace(\"csv\",\"xlsx\")\r\n    \r\n    df_new = pd.read_csv(csvlistExtract)\r\n    writer = pd.ExcelWriter(listExtract)\r\n    df_new.to_excel(writer, index = False)\r\n    writer.save()    \r\n    \r\n    #open xlsx\r\n    workbook = load_workbook(filename = listExtract, read_only = False)\r\n    worksheet = workbook.active\r\n    \r\n    #convert data into table\r\n    if len(worksheet.tables) < 1:\r\n        table = Table(displayName=\"Table1\", ref=\"A1:\" + get_column_letter(worksheet.max_column) + str(worksheet.max_row))\r\n        worksheet.add_table(table)   \r\n    \r\n    workbook.save(listExtract)\r\n    rowCount = worksheet.max_row + 1\r\n    \r\n    #iterate through each row and send email\r\n    for r in range(1,rowCount):\r\n        sendEmail = False\r\n        status = worksheet[\"B\"+str(r)].value\r\n        activePrior = worksheet[\"C\"+str(r)].value\r\n        currentSiteStatus = worksheet[\"D\"+str(r)].value\r\n        source = worksheet[\"E\"+str(r)].value\r\n        dateActioned = worksheet[\"F\"+str(r)].value\r\n        resultAction = worksheet[\"G\"+str(r)].value\r\n        nmi = worksheet[\"H\"+str(r)].value\r\n        address = worksheet[\"I\"+str(r)].value\r\n        retailer = worksheet[\"J\"+str(r)].value\r\n        retailerEmail = worksheet[\"K\"+str(r)].value\r\n        dateofAttendance = worksheet[\"L\"+str(r)].value\r\n        emailedRetailer = worksheet[\"M\"+str(r)].value\r\n        if resultAction == \"R34 REEN Without SO\" and (status == \"Requires Processing\" or status == \"Imported Bulk Attendance\") and activePrior == \"Yes\" and currentSiteStatus == \"DEACTIVE\" and dateActioned != None and address != \"Get from Disconnections\" and retailerEmail != None and emailedRetailer == None and dateofAttendance != None:\r\n            dateofAttendance = dateofAttendance.replace(\"T\",\" \")\r\n            dateofAttendance = dateofAttendance.replace(\"Z\",\"\")\r\n            body = f\"Hi Team\\n\\nPower has been restored to the below listed properties.\\n\\nA service order will not be required. Customers will be encouraged via our communication that they contact their Retailer to ensure their ongoing retail account requirements are in place.\\n\\nIf the customer is unsure about circuits or appliances which may have been impacted by floodwater, they will need to engage a qualified electrician.\\n\\nAs the previous Retailer prior to the temporary disconnection, we now encourage you to reach out to your customer(s) to confirm their account details are correct to avoid any billing disputes.\\n\\nThere were no service charges applied for the period the property was disconnected.\\n\\nThe RCCRW fee will be waived for our reconnection attendance.\\n\\nIf you believe there have been charges added that should be waived, please contact the SA Power Networks B2B Team (b2b@sapowernetworks.com.au).\\n\\n{nmi}     {address}     {retailer}     {dateofAttendance}\\n\\nThanks,\\nSA Power Networks\"\r\n            sendEmail = True\r\n        elif resultAction == \"REEN to Main Switch\" and (status == \"Requires Processing\" or status == \"Imported Bulk Attendance\") and activePrior == \"Yes\" and currentSiteStatus == \"DEACTIVE\" and dateActioned != None and address != \"Get from Disconnections\" and retailerEmail != None and emailedRetailer == None and dateofAttendance != None:\r\n            dateofAttendance = dateofAttendance.replace(\"T\",\" \")\r\n            dateofAttendance = dateofAttendance.replace(\"Z\",\"\")\r\n            body = f\"Hi Team\\n\\nPower has been restored to the below listed properties up to the main switch.\\n\\nA service order will not be required. Customers will be encouraged via our communication that they contact their Retailer to ensure their ongoing retail account requirements are in place.\\n\\nThe customer can turn the main switch back on if safe to do so, however if the customer is unsure about wiring or appliances that may have been impacted by floodwater, they will need to engage a qualified electrician to check them.\\n\\nUNSAFE WIRING - If an 'unsafe wiring' tag has been left in the switchboard, the customer will need a qualified electrician to test the installation, reconnect the appropriate wiring and then restore power. Refer to fact sheet at: https://www.sapowernetworks.com.au/public/download.jsp?id=322685\\n\\nAs the previous Retailer prior to the temporary disconnection, we now encourage you to reach out to your customer(s) to confirm their account details are correct to avoid any billing disputes.\\n\\nThere were no service charges applied for the period the property was disconnected.\\n\\nIf you believe there have been charges added that should be waived, please contact the SA Power Networks B2B Team (b2b@sapowernetworks.com.au).\\n\\n{nmi}     {address}     {retailer}     {dateofAttendance}\\n\\nThanks,\\nSA Power Networks\"\r\n            sendEmail = True\r\n        elif resultAction == \"REEN to SP - ECOC & SO RQD\" and (status == \"Requires Processing\" or status == \"Imported Bulk Attendance\") and activePrior == \"Yes\" and currentSiteStatus == \"DEACTIVE\" and dateActioned != None and address != \"Get from Disconnections\" and retailerEmail != None and emailedRetailer == None and dateofAttendance != None:\r\n            dateofAttendance = dateofAttendance.replace(\"T\",\" \")\r\n            dateofAttendance = dateofAttendance.replace(\"Z\",\"\")\r\n            body = f\"Hi Team\\n\\nPower has been restored to the below listed properties up to the service point only and remains isolated due to safety. The customer has been advised they will need to engage an electrician to complete relevant work before reconnection can occur.\\n\\nFor re-energisation SA POWER NETWORKS will require an eCoC on site after electrical repairs are performed and a Retailer requested reconnection service order.\\n\\nThe range of work required to be completed by the customer's electrician will be varied and could range from minor (e.g. general inspection and site testing to ensure safe reconnection) to major (e.g. replacement of customer wiring and equipment - which may include the customer switchboard).\\n\\nMFN's - it is expected that during the reconnection of some sites, a meter bypass will be required so customers get power restored as soon as practicable. Where this is the case, a B2B MFN will be sent to the Retailer to inform them that they will need to engage the relevant MP ASAP to complete the required metering work (please note this will be for any meter type).\\n\\nAbolishment's - it is expected that some customer may determine that a reconnection is not possible and wish to abolish the current supply to the property. Where this is the case, the customer will be required to request their current Retailer to raise a B2B Service Order Abolishment to SA Power Networks (please ensure you have considered this process given these sites are likely to remain in a disconnected status - both physically and within MSATS).\\n\\nThere were no service charges applied for the period the property was disconnected.\\n\\nIf you believe there have been charges added that should be waived, please contact the SA Power Networks B2B Team (b2b@sapowernetworks.com.au).\\n\\n{nmi}     {address}     {retailer}     {dateofAttendance}\\n\\nThanks,\\nSA Power Networks\"\r\n            sendEmail = True\r\n        elif source == \"Consumption Found Report\" and dateActioned != None and retailerEmail != None and emailedRetailer == None and dateofAttendance != None:\r\n            dateofAttendance = dateofAttendance.replace(\"T\",\" \")\r\n            dateofAttendance = dateofAttendance.replace(\"Z\",\"\")\r\n            body = f\"Hi Team\\n\\nPlease be advised that consumption has been recorded at the below listed properties.\\n\\nThis site(s) has now been turned back on in our system to capture any further consumption.  A service order will not be required.\\n\\nAs the previous Retailer prior to the temporary disconnection, we now encourage you to reach out to your customer(s) to confirm their account details are correct to avoid any billing disputes.\\n\\nThere were no service charges applied for the period the property was disconnected.\\n\\nIf you believe there have been charges added that should be waived, please contact the SA Power Networks B2B Team (b2b@sapowernetworks.com.au).\\n\\n{nmi}     {address}     {retailer}     {dateofAttendance}\\n\\nThanks,\\nSA Power Networks\"\r\n            sendEmail = True\r\n        elif source == \"Meter Exchange/Alteration\" and dateActioned != None and retailerEmail != None and emailedRetailer == None and dateofAttendance != None:\r\n            dateofAttendance = dateofAttendance.replace(\"T\",\" \")\r\n            dateofAttendance = dateofAttendance.replace(\"Z\",\"\")\r\n            body = f\"Hi Team\\n\\nPlease be advised consumption has been recorded at the below listed properties.\\n\\nThis site(s) has been reconnected after a Meter Exchange/Churn was completed without a re-energisation service order.\\n\\nA service order will not be required.\\n\\nAs the previous Retailer prior to the temporary disconnection, we now encourage you to reach out to your customer(s) to confirm their account details are correct to avoid any billing disputes.\\n\\nThere were no service charges applied for the period the property was disconnected.\\n\\nIf you believe there have been charges added that should be waived, please contact the SA Power Networks B2B Team (b2b@sapowernetworks.com.au).\\n\\n{nmi}     {address}     {retailer}     {dateofAttendance}\\n\\nThanks,\\nSA Power Networks\"\r\n            sendEmail = True\r\n        if sendEmail:\r\n            result = SendEmail(resultAction, body, retailerEmail, accesstoken)\r\n            if result >= 200 and result < 300:\r\n                worksheet[\"M\"+str(r)].value = \"Completed\"\r\n            else:\r\n                worksheet[\"M\"+str(r)].value = result                      \r\n    workbook.save(listExtract)\r\n    workbook.close()\r\n    \r\n    return{\"listExtract\":listExtract}\r\n    \r\ndef SendEmail(resultAction,emailbody,retailerEmail,accessToken):\r\n    url = \"https://graph.microsoft.com/v1.0/users/b2b@sapowernetworks.com.au/sendMail\"\r\n    payload = json.dumps({\"message\":{\"subject\": \"Murray River Flood Reconnections\",\"body\": {\"contentType\": \"Text\",\"content\": +emailbody},\"toRecipients\":[{\"emailAddress\":{\"address\": +retailerEmail}}],\"ccRecipients\":[{\"emailAddress\":{\"address\":\"LNSP@sapowernetworks.com.au\"}},{\"emailAddress\": {\"address\": \"MDP@sapowernetworks.com.au\"}},{\"emailAddress\": {      \"address\": \"Billing@sapowernetworks.com.au\"}},{\"emailAddress\": {\"address\": \"MarketOperations@sapowernetworks.com.au\"}}]},\"saveToSentItems\": \"true\"})                   \r\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+ accessToken}\r\n    response = requests.request(\"POST\", url, headers=headers, data = payload)\r\n    return response.status_code"
  outputs:
    - listExtract
  results:
    - SUCCESS