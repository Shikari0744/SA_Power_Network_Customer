namespace: ITAzureChargeBack
operation:
  name: uploadFile
  inputs:
    - accessToken
    - filePath
  python_action:
    use_jython: false
    script: "def execute(accessToken,filePath): \n    import requests\n    from openpyxl import load_workbook\n    import time\n    \n    workbook = load_workbook(filename=filePath,read_only=False)\n    worksheet = workbook[\"Configuration\"]\n    rowCount = worksheet.max_row + 1\n\n    for row in range(1,rowCount):\n        worksheet[\"G\"+str(row)].value = \"\"\n    workbook.save(filePath)\n    workbook.close()\n    \n    time.sleep(30)\n    \n    # read file into binary\n    body = open(filePath, 'rb').read()\n    url = 'https://graph.microsoft.com/v1.0/drives/b!HmbowSkj60uuHqB3HpLR9x7zYshvshRHtFy1qeBzNLnyYMDWKeW6RqiSVhUL2wRl/root:/General/Automation/Azure%20Charge%20Back/CAPEX%20Project%20Azure%20Expenditure.xlsx:/content'\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n    response = requests.put(url, data=body, headers=head)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n     \tsuccessfulResult = response.reason\n     \tfailureResult = \"\"\n    else:\n        successfulResult = \"\"\n        failureResult = response.reason\n    \n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
