namespace: MSATS_CTC_Compliance
operation:
  name: DownloadExcelFromOutlook
  inputs:
    - api_user
    - api_pass:
        sensitive: true
    - accessToken
  python_action:
    use_jython: false
    script: "#for outlook download\ndef execute(api_user, api_pass,accessToken): \n    import requests\n    import json\n    import base64\n\timport datetime\n\n    now = datetime.datetime.now()\n\tnow = now.strftime(\"%d/%m/%Y %H:%M:%S\")\n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\n\"+now)\n    f.write(\"\\nDownload Excel from Outlook\")\n    f.close()      \n\n    url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\\\"CTC Compliance\\\"'\n    payload = {}\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n    response = requests.request(\"GET\", url, headers=headers, data = payload)\n    \n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\nGetting message ID\")\n    f.write(\"\\n\"+str(response))\n    f.write(\"\\n\"+response.text)\n    f.close()      \n    \n    messageID = response.split('\"id\":\"')\n    messageID = str(messageID[1])\n    messageID = messageID.split('\"')\n    messageID = str(messageID[0])\n    \n    #TO GET ATTACHMENT\n    url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.request(\"GET\", url, headers=head, data = body)\n    test = json.loads(response.text.encode('utf8'))\n    \n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\nGet CTC excel\")\n    f.write(\"\\n\"+str(response))\n    f.write(\"\\n\"+response.text)\n    f.close()      \n    \n    #where to save\n    for file in test[\"value\"]:\n        imgdata = base64.b64decode(file[\"contentBytes\"])  \n        name = file[\"name\"]\n        filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/\" + name\n        with open(filename, 'wb') as f:\n            f.write(imgdata)\n        if name.find(\"CTC\") >= 0:\n            ctcFileName = name\n            break\n\n    return{\"ctcFileName\":ctcFileName,\"response\":response}"
  outputs:
    - ctcFileName
    - response
  results:
    - SUCCESS
