namespace: GenericActivities
operation:
  name: GetAttachments_HTTP
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "#for outlook download\ndef execute(accessToken): \n    import requests\n    import json\n    import base64\n    \n    result = \"\"\n\n    url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\\\"CTC Compliance\\\"'\n    payload = {}\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n    response = requests.request(\"GET\", url, headers=headers, data = payload)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        result = \"Successful\"\n\n        json_data = json.loads(response.text)\n        \n        for x in json_data['value']:\n            messageID = x['id']\n        \n        #TO GET ATTACHMENT\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        response = requests.request(\"GET\", url, headers=head, data = body)\n        test = json.loads(response.text.encode('utf8'))\n        \n        if response.status_code >= 200 and response.status_code < 300:\n            result = \"Successful\"    \n    \n            #where to save\n            for file in test[\"value\"]:\n                imgdata = base64.b64decode(file[\"contentBytes\"])  \n                name = file[\"name\"]\n                filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/CTC_Compliance/\" + name\n                with open(filename, 'wb') as f:\n                    f.write(imgdata)\n                if name.find(\"CTC\") >= 0:\n                    ctcFileName = name\n                    break\n        else:\n            result = \"\"\n\n    return{\"ctcFileName\":ctcFileName,\"result\":result}"
  outputs:
    - ctcFileName
    - result
  results:
    - SUCCESS
