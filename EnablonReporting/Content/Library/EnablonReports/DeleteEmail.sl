namespace: EnablonReports
operation:
  name: DeleteEmail
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken): \n    import requests\n    import json\n    import base64\n\n    emailSubjects = [\"Electrical Services, Workplace Inspections\",\"Operations Metro North, Workplace Inspections\",\"Operations Metro South, Workplace Inspections\",\"Operations Planning, Workplace Inspections\",\"Construction, ETS\",\"Regional North, Workplace Inspections\",\"Regional South, Workplace Inspections\",\"Electrical Services Field Observation\",\"Operations Metro North, Field Observation\",\"Operations Metro South, Field Observation\",\"Operations Planning, Field Observation\",\"Construction, Field Observation\",\"Regional North, Field Observation\",\"Regional South, Field Observation\"]\n    deleteResponse = \"\"\n    \n    for subject in emailSubjects:\n        #TO GET EMAIL\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\"'+subject+'\"'\n        payload = {}\n        headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n        response = requests.request(\"GET\", url, headers=headers, data = payload)\n        json_data = json.loads(response.text)\n\n        for x in json_data['value']:\n            messageID = x['id']\n            break\n\n        #DELETE EMAIL\n        if result >= 200 and result < 300:\n            url = \"https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/\"+messageID\n            payload = {}\n            headers = {'Authorization': 'Bearer '+accessToken}\n            delResponse = requests.request(\"DELETE\", url, headers=headers, data = payload)\n            delResult = delResponse.status_code    \n            \n            deleteResponse = deleteResponse + \" \" + str(delResult)\n        \n    return{\"deleteResponse\":deleteResponse}"
  outputs:
    - deleteResponse
  results:
    - SUCCESS
