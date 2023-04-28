namespace: FieldServicesMonthlyTrainingReports
operation:
  name: DeleteEmail
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken): \n    import requests\n    import json\n    import base64\n    import pandas as pd\n    import shutil\n    import os \n    \n    deleteResponse = \"\"\n    emailSubjects = [\"Your ''Field Services Compliance Certification'' report is ready.\",\"Your ''Field Services Compliance Curricula'' report is ready.\", \"Your ''Field Services Compliance Certification (Org Units outside of FS)' report is ready.\", \"Your ''Field Services Compliance Curricula (Org Units outside of FS) report is ready.\"]\n    \n    for subject in emailSubjects:\n        #TO GET EMAIL\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\"'+subject+'\"'\n        payload = {}\n        headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n        response = requests.request(\"GET\", url, headers=headers, data = payload)\n        json_data = json.loads(response.text)\n        for x in json_data['value']:\n            messageID = x['id']  \n            break\n        \n        #DELETE EMAIL\n        if str(result) == \"200\":\n            url = \"https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/\"+messageID\n            payload = {}\n            headers = {'Authorization': 'Bearer '+accessToken}\n            response = requests.request(\"DELETE\", url, headers=headers, data = payload)\n            result = response.status_code              \n            \n            deleteResponse = deleteResponse + \" \" + str(result)    \n        \n    return{\"deleteResponse\":deleteResponse}"
  outputs:
    - deleteResponse
  results:
    - SUCCESS
