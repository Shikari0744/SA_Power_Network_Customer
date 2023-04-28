namespace: ITAzureChargeBack
operation:
  name: downloadExcel
  inputs:
    - accessToken
    - fileName: CAPEX Project Azure Expenditure.xlsx
    - fileLocation
  python_action:
    use_jython: false
    script: "def execute(accessToken, fileLocation, fileName): \n    import requests\n    \n    url = \"https://graph.microsoft.com/v1.0/drives/b!HmbowSkj60uuHqB3HpLR9x7zYshvshRHtFy1qeBzNLnyYMDWKeW6RqiSVhUL2wRl/root:/General/Automation/Azure%20Charge%20Back/CAPEX%20Project%20Azure%20Expenditure.xlsx:/content\"\n    body = None\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, data=body, headers=head)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n     \tsuccessfulResult = response.reason\n     \tfailureResult = \"\"\n    else:\n        successfulResult = \"\"\n        failureResult = response.reason\n\n    filePath = fileLocation+fileName\n    with open(filePath, 'wb') as f:\n        f.write(response.content)\n        \n    return{'response':response,\"failureResult\":failureResult,'filePath':filePath}"
  outputs:
    - successfulResult
    - filePath
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
