namespace: FieldServicesMonthlyTrainingReports
operation:
  name: DownloadFromEmail
  inputs:
    - accessToken
    - location
  python_action:
    use_jython: false
    script: "def execute(accessToken,location): \n    import requests\n    import json\n    import base64\n    import pandas as pd\n    import shutil\n    import os \n    \n    downloadResponse = \"\"\n    emailSubjects = [\"Your ''Field Services Compliance Certification'' report is ready.\",\"Your ''Field Services Compliance Curricula'' report is ready.\", \"Your ''Field Services Compliance Certification (Org Units outside of FS)' report is ready.\", \"Your ''Field Services Compliance Curricula (Org Units outside of FS) report is ready.\"]\n    \n    for subject in emailSubjects:\n        #TO GET EMAIL\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\"'+subject+'\"'\n        payload = {}\n        headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n        response = requests.request(\"GET\", url, headers=headers, data = payload)\n        json_data = json.loads(response.text)\n        for x in json_data['value']:\n            messageID = x['id']  \n            break\n        \n        \n        #TO GET ATTACHMENT\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        responseCode = requests.request(\"GET\", url, headers=head, data = body)\n        result = responseCode.status_code\n        json_data = json.loads(responseCode.text)\n        \n        downloadResponse = downloadResponse + \" \" + str(result)    \n        \n        for file in json_data[\"value\"]:\n            imgdata = base64.b64decode(file[\"contentBytes\"])  \n            name = file[\"name\"]\n            if subject.find(\"Org Units outside of FS\") > 0:\n                name = name.replace(\"Field Services\",\"Shared Services\")\n            filename = location + name\n            with open(filename, 'wb') as f:\n                f.write(imgdata)\n    \n            #extract zip file\n            if \".zip\" in name:\n                shutil.unpack_archive(filename, location, \"zip\")  \n                os.remove(filename)\n            if filename.find(\"zip\") > 0:\n                filename = filename.replace(\"zip\",\"csv\")   \n            \n            #convert csv to xlsx\n            if filename.find(\"csv\") > 0:\n                read_file = pd.read_csv (filename)\n                filenamexlsx = filename.replace(\"csv\",\"xlsx\")  \n                read_file.to_excel (filenamexlsx, index = None, header=True)\n                os.remove(filename)\n                \n            if subject == \"Your ''Field Services Compliance Certification (Org Units outside of FS)' report is ready.\":\n                SS_complianceCertification = filenamexlsx\n            elif subject == \"Your ''Field Services Compliance Curricula (Org Units outside of FS) report is ready.\":\n                SS_complianceCurricula = filenamexlsx   \n            elif subject == \"Your ''Field Services Compliance Certification'' report is ready.\":\n                FS_complianceCertification = filenamexlsx\n            elif subject == \"Your ''Field Services Compliance Curricula'' report is ready.\":\n                FS_complianceCurricula = filenamexlsx\n        \n    return{\"SS_complianceCertification\":SS_complianceCertification,\"SS_complianceCurricula\":SS_complianceCurricula,\n        \"FS_complianceCertification\":FS_complianceCertification,\"FS_complianceCurricula\":FS_complianceCurricula,\n        \"downloadResponse\":downloadResponse\n        }"
  outputs:
    - SS_complianceCertification
    - SS_complianceCurricula
    - FS_complianceCertification
    - FS_complianceCurricula
    - downloadResponse
  results:
    - SUCCESS