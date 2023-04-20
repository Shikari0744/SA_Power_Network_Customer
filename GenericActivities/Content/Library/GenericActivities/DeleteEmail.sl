namespace: GenericActivities
operation:
  name: DeleteEmail
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken):\n    import requests\n    \n    subject = \"\"\n    deleteResponse = \"\"\n    \n    #TO GET EMAIL\n    url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\"'+subject+'\"'\n    payload = {}\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n    response = requests.request(\"GET\", url, headers=headers, data = payload)\n    json_data = json.loads(response.text)\n\n    for x in json_data['value']:\n        messageID = x['id']\n        break\n\n    if response.status_code >= 200 and response.status_code < 300:\n        url = \"https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/\"+messageID\n        payload = {}\n        headers = {'Authorization': 'Bearer '+accessToken}\n        delResponse = requests.request(\"DELETE\", url, headers=headers, data = payload)\n        delResult = delResponse.status_code    \n        \n        deleteResponse = deleteResponse + \" \" + str(delResult)\n        \n    return{\"deleteResponse\":deleteResponse}"
  outputs:
    - deleteResponse
  results:
    - SUCCESS
