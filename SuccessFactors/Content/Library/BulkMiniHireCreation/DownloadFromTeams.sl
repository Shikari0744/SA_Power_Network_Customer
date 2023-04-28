namespace: BulkMiniHireCreation
operation:
  name: DownloadFromTeams
  inputs:
    - accessToken
    - filename: Bulk Mini Hires.xlsx
    - folderLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Bulk Mini Hires/'
  python_action:
    use_jython: false
    script: "def execute(accessToken,filename,folderLocation): \r\n    import importlib\r\n    import os\r\n    from os import path\r\n    import requests\r\n\r\n    filePath = folderLocation + filename\r\n\r\n    url = \"https://graph.microsoft.com/v1.0/drives/b!5Mtw26_7KUiWRA7tW7IB_gCr29z7OylNhOsSM1ka46iRNzvfoGgTSK71KRJlJ64T/root:/General/8.%20TEAM/Automation/\" + filename + \":/content\"\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n\r\n    if response.status_code >= 200 and response.status_code < 300:\r\n        successfulResult = response.reason\r\n        failureResult = \"\"\r\n    else:\r\n        successfulResult = \"\"\r\n        failureResult = response.reason\r\n\r\n    with open(filePath, 'wb') as f:\r\n        f.write(response.content)\r\n\r\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
