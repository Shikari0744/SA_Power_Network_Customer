namespace: BCRM_Reports
operation:
  name: Upload_MDP_Reports_Teams
  inputs:
    - accessToken
    - TeamsNullsFolder: 'RM11%20Reports%20(NULLS)'
    - TeamsEstFolder: 'RM26%20Reports%20(ESTIMATES)'
    - FilesFolder
  python_action:
    use_jython: false
    script: "def execute(accessToken, TeamsNullsFolder, TeamsEstFolder, FilesFolder): \n    import os\n    import requests\n    \n    successfulResult = \"\"\n    failureResult = \"\"\n\n    # from the folder get all the file names and based on Names upload the files to relavent folder in Teams\n    for file in os.listdir(FilesFolder):\n        if 'ESTIMATES' in file:\n            importFile = FilesFolder + file\n            # read file into binary\n            body = open(importFile, 'rb').read()\n            url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + TeamsEstFolder + '/' + file + ':/content'\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n            response1 = requests.put(url, data=body, headers=head)\n            \n            if response1.status_code >= 200 and response1.status_code < 300:\n             \tsuccessfulResult = response1.reason + \" (Estimates)\"\n            else:\n                failureResult = response1.reason + \" (Estimates)\"\n            \n        elif 'NULLS' in file:\n            importFile = FilesFolder + file\n            # read file into binary\n            body = open(importFile, 'rb').read()\n            url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/MDP/' + TeamsNullsFolder + '/' + file + ':/content'\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n            response2 = requests.put(url, data=body, headers=head)\n\n            if response2.status_code >= 200 and response2.status_code < 300:\n             \tsuccessfulResult = response2.reason + \" (Nulls)\"\n            else:\n                failureResult = response2.reason + \" (Nulls)\"\n            \n    return {\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
