namespace: AEMOSnapshots
operation:
  name: Download_All
  inputs:
    - accessToken
    - filePath
    - downloadlog
    - folderName
  python_action:
    use_jython: false
    script: "def execute(accessToken,filePath,downloadlog,folderName): \r\n    import requests\r\n    import json\r\n    import os.path\r\n    import os\r\n    \r\n    url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot:/children\"\r\n    body = {}\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, headers=head, data = body)\r\n    json_data = json.loads(response.text)\r\n    \r\n    downloaded = 0\r\n    \r\n    if response.status_code >= 200 and response.status_code < 300:\r\n        resultsfound = len(json_data['value'])\r\n        for x in json_data['value']:\r\n            if x['name'] == folderName:\r\n                url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot/\"+folderName+\":/children\"\r\n                body = {}\r\n                head = {\"Authorization\": \"Bearer \" + accessToken}\r\n                response = requests.get(url, headers=head, data = body)\r\n                json_data = json.loads(response.text)\r\n                if response.status_code >= 200 and response.status_code < 300:\r\n                    resultsfound = len(json_data['value'])\r\n                    for x in json_data['value']:\r\n                        fileName = x['name']\r\n                        newPath = filePath+folderName\r\n                        fileNameCSV = fileName.replace(\"xml\",\"csv\")\r\n                        if os.path.exists(newPath+\"/\"+fileNameCSV) == False:\r\n                            xmlFile = newPath+\"/\"+fileName\r\n                            url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot/\"+folderName+\"/\"+fileName+\":/content\"\r\n                            body = {}\r\n                            head = {\"Authorization\": \"Bearer \" + accessToken}\r\n                            downloadresponse = requests.get(url, headers=head, data=body)\r\n                            if os.path.exists(newPath) == False:\r\n                                os.mkdir(newPath)\r\n                            with open(xmlFile, 'wb') as f:\r\n                                f.write(downloadresponse.content) \r\n                            f = open(downloadlog, \"a\")\r\n                            f.write(fileName)\r\n                            f.close() \r\n                            break\r\n                        else:\r\n                            xmlFile = \"csv exists\"\r\n    \r\n    if response.status_code >= 200 and response.status_code < 300:\r\n        successfulResult = response.reason\r\n        failureResult = \"\"\r\n    else:\r\n        successfulResult = \"\"\r\n        failureResult = response.reason\r\n\r\n    return{\"xmlFile\":xmlFile,\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
    - xmlFile
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
