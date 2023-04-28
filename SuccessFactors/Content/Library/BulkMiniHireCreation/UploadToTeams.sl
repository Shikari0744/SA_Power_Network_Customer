namespace: BulkMiniHireCreation
operation:
  name: UploadToTeams
  inputs:
    - accessToken
    - folderLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Bulk Mini Hires/'
    - filename: Bulk Mini Hires.xlsx
  python_action:
    use_jython: false
    script: "def execute(accessToken,folderLocation,filename): \n    import requests\n    \n    filePath = folderLocation + filename\n\n    body = open(filePath, 'rb').read()\n    url = \"https://graph.microsoft.com/v1.0/drives/b!5Mtw26_7KUiWRA7tW7IB_gCr29z7OylNhOsSM1ka46iRNzvfoGgTSK71KRJlJ64T/root:/General/8.%20TEAM/Automation/\" + filename + \":/content\"\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n    response = requests.put(url, data=body, headers=head)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        successfulResult = response.reason\n        failureResult = \"\"\n    else:\n        successfulResult = \"\"\n        failureResult = response.reason\n    \n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
