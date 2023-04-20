namespace: AEMO_Compliance_Reporting
operation:
  name: ArchiveOldFiles
  inputs:
    - Teams_Folder
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(Teams_Folder, accessToken): \r\n    import importlib\r\n    import os\r\n    from os import path\r\n    import requests\r\n    import base64\r\n    import json\r\n    import datetime\r\n    \r\n    now = datetime.datetime.now()\r\n    now = now.strftime(\"%d/%m/%Y %H:%M:%S\")\r\n\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/AEMO%20Compliance%20%26%20Reporting/' + Teams_Folder  + ':/children'\r\n    body = {}\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, headers=head, data = body)\r\n    json_data = json.loads(response.text)\r\n\r\n    # get id of the Archive folder\r\n    for folderName in json_data['value']:\r\n        jFolderName = folderName['name']\r\n        if jFolderName == 'Archive':\r\n            archiveFolderID = folderName['id']\r\n            break\r\n            \r\n    # move old files (more that 60 days old) to Archive folder\r\n    for x in json_data['value']:\r\n        jfileName = x['name']\r\n        if '.xlsx' in jfileName:\r\n            lastmodstamp = x['lastModifiedDateTime']\r\n            splitDT = lastmodstamp.find('T')\r\n            #print(splitDT)\r\n            dtStanp = lastmodstamp[0:splitDT]\r\n            datetime_obj = datetime.datetime.strptime(dtStanp, '%Y-%m-%d')\r\n            todaydate = datetime.datetime.today()\r\n            diffdays = abs((datetime_obj-todaydate).days)\r\n            if diffdays > 60:\r\n                newFileName = jfileName.replace(\" \", \"%20\")\r\n                moveURL = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/AEMO%20Compliance%20%26%20Reporting/' + Teams_Folder  +'/'+ newFileName\r\n                moveBody = {\"parentReference\": {\"id\": archiveFolderID},\"name\": jfileName}\r\n                moveHead = {\"Authorization\": \"Bearer \" + accessToken}\r\n                MoveResponse = requests.patch(moveURL, headers=moveHead, json = moveBody)"
  results:
    - SUCCESS