namespace: ProjectExpensing
operation:
  name: DownloadProjectSupportFiles
  inputs:
    - accessToken
    - filePath
    - supportFile
    - hoursJournal
    - costsJournal
  python_action:
    use_jython: false
    script: "def execute(accessToken, filePath, supportFile, hoursJournal, costsJournal): \r\n    from os import path\r\n    import os \r\n    import requests\r\n    import json\r\n    from msal import PublicClientApplication\r\n    from os import listdir\r\n    \r\n    fileNames = [supportFile,hoursJournal,costsJournal]\r\n    \r\n    results = \"\"\r\n    \r\n    for file in fileNames:\r\n        #CHECK IF FILE EXISTS, DELETE\r\n        file_path = filePath+file   \r\n        if os.path.exists(file_path):\r\n            os.remove(file_path)\r\n        \r\n        downloadURL = 'https://graph.microsoft.com/v1.0/drives/b!dTrXQn_yX0KjyH_UWTheGsdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/root:/General/Project Expensing/'+ file +':/content'\r\n        downloadBody = None\r\n        downloadHead = {\"Authorization\": \"Bearer \" + accessToken}\r\n        downloadResponse = requests.get(downloadURL, data=downloadBody, headers=downloadHead)\r\n        \r\n        results = results + \" \" + str(downloadResponse.status_code)\r\n        \r\n        #WHERE THE FILE WILL BE SAVED\r\n        file_path = filePath+file   \r\n        with open(file_path, 'wb') as f:\r\n            f.write(downloadResponse.content)\r\n    \r\n    return{\"results\":results}"
  outputs:
    - results
  results:
    - SUCCESS
