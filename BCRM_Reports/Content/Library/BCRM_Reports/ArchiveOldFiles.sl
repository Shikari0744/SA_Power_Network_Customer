namespace: BCRM_Reports
operation:
  name: ArchiveOldFiles
  inputs:
    - Teams_Folder
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(Teams_Folder, accessToken): \n    import importlib\n    import os\n    from os import path\n    import requests\n    import base64\n    import json\n    import datetime\n\n    url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + Teams_Folder  + ':/children'\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n      \n    \n    # get id of the Archive folder\n    for folderName in json_data['value']:\n        jFolderName = folderName['name']\n        if jFolderName == 'Archive':\n            archiveFolderID = folderName['id']\n            \n            \n    # move old files (more that 14 days old) to Archive folder\n    for x in json_data['value']:\n        jfileName = x['name']\n        if '.xlsx' in jfileName:\n            lastmodstamp = x['lastModifiedDateTime']\n            splitDT = lastmodstamp.find('T')\n            #print(splitDT)\n            dtStanp = lastmodstamp[0:splitDT]\n            datetime_obj = datetime.datetime.strptime(dtStanp, '%Y-%m-%d')\n            todaydate = datetime.datetime.today()\n            diffdays = abs((datetime_obj-todaydate).days)\n            if diffdays > 7:\n                newFileName = jfileName.replace(\" \", \"%20\")\n                moveURL = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + Teams_Folder  +'/'+ newFileName\n                moveBody = {\"parentReference\": {\"id\": archiveFolderID},\"name\": jfileName}\n                moveHead = {\"Authorization\": \"Bearer \" + accessToken}\n                MoveResponse = requests.patch(moveURL, headers=moveHead, json = moveBody)"
  results:
    - SUCCESS
