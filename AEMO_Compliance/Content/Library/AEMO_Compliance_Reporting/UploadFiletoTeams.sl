namespace: AEMO_Compliance_Reporting
operation:
  name: UploadFiletoTeams
  inputs:
    - FileName: AEMO Compliance Summary Report - Performance Tracking 2021_2022.xlsx
    - accessToken
    - teamsFolder
    - location
  python_action:
    use_jython: false
    script: "def execute(FileName, accessToken, teamsFolder, location): \r\n    import importlib\r\n    import os\r\n    from os import path\r\n    import requests\r\n\r\n    importFile = location+\"Formatted Files/\" + FileName\r\n   \r\n    # read file into binary\r\n    body = open(importFile, 'rb').read()\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/AEMO%20Compliance%20%26%20Reporting/'+ teamsFolder + '/' + FileName + ':/content'\r\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n    response = requests.put(url, data=body, headers=head)\r\n    \r\n    if response.status_code >= 200 and response.status_code < 300:\r\n     \tsuccessfulResult = response.reason\r\n     \tfailureResult = \"\"\r\n    else:\r\n        successfulResult = \"\"\r\n        failureResult = response.reason\r\n    \r\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - failureResult
    - successfulResult
  results:
    - FAILURE: '${failureResult != ""}'
      CUSTOM_0: '${result == ""}'
    - SUCCESS
