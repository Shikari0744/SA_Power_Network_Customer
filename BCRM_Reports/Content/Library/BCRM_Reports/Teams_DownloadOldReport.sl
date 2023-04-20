namespace: BCRM_Reports
operation:
  name: Teams_DownloadOldReport
  inputs:
    - accessToken
    - fileStr
    - teamsFolder
    - location
  python_action:
    use_jython: false
    script: "def execute(accessToken, fileStr, teamsFolder, location): \n    import importlib\n    import os\n    from os import path\n    import requests\n    import base64\n    import json\n    \n    successfulResult = \"\"\n    failureResult = \"\"\n    \n    url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + teamsFolder  + ':/children'\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n\n    attachCnt = len(json_data['value'])\n    \n    for x in json_data['value']:\n        jfileName = x['name']\n        if fileStr in jfileName:\n            newFileName = jfileName.replace(\" \", \"%20\")\n            fileURL = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + teamsFolder + '/' + newFileName + ':/content'\n            filebody = {}\n            fileHead = {\"Authorization\": \"Bearer \" + accessToken}\n            fileResponse = requests.get(fileURL, headers=fileHead, data = filebody)\n            \n            if fileResponse.status_code >= 200 and fileResponse.status_code < 300:\n             \tsuccessfulResult = fileResponse.reason\n            else:\n                failureResult = fileResponse.reason  \n            \n            filename = location+\"Old Reports/\" + jfileName\n            with open(filename, 'wb') as f:\n                f.write(fileResponse.content)\n    \n    \n    return{\"response\":response,\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - response
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
      CUSTOM_0: '${failureResult != ""}'
    - SUCCESS
