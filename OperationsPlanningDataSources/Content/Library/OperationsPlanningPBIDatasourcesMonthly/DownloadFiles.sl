namespace: OperationsPlanningPBIDatasourcesMonthly
operation:
  name: DownloadFiles
  inputs:
    - accessToken
    - filePath
    - LoopTrend
  python_action:
    use_jython: false
    script: "def execute(accessToken,filePath,LoopTrend):\n    import requests\n    \n    successfulResult = \"\"\n    failureResult = \"\"\n\n    datasources = [LoopTrend]\n    \n    for file in datasources:\n        url = \"https://graph.microsoft.com/v1.0/drives/b!iNpCk0vDRUqjFOiHGRUw6yEF2KAbQ0VOhsv1sr1znznU9gwbqyvFS4r2ab-uNM6X/root:/Planning/Reporting/Datasets/\"+ file +\":/content\"\n        body = None\n        head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n        response = requests.get(url, data=body, headers=head)\n        if response.status_code >= 200 and response.status_code < 300:\n            successfulResult = response.reason\n            failureResult = \"\"\n            filename = filePath+file \n            with open(filename, 'wb') as f:\n                f.write(response.content)\n        else:\n            successfulResult = \"\"\n            failureResult = response.reason\n\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
