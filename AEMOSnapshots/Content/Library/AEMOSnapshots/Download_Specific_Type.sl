namespace: AEMOSnapshots
operation:
  name: Download_Specific_Type
  inputs:
    - accessToken
    - filePath
    - type
  python_action:
    use_jython: false
    script: "def execute(accessToken,filePath,type):\n    import requests\n    import json\n    import os.path\n    import os\n    import xmltodict\n    import pandas as pd\n    import glob\n    import urllib.parse\n    \n    downloadedXML = \"\"\n    \n    #DOWNLOAD ALL XMLs\n    url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot:/children\"\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n    \n    if response.status_code == 200:\n        resultsfound = len(json_data['value'])\n        for x in json_data['value']:\n            folderName = x['name']\n            if folderName.find(type) > -1:\n                combinedCSVName = folderName + \".csv\"\n                url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot/\"+folderName+\":/children\"\n                body = {}\n                head = {\"Authorization\": \"Bearer \" + accessToken}\n                response = requests.get(url, headers=head, data = body)\n                json_data = json.loads(response.text)\n                if response.status_code == 200:\n                    resultsfound = len(json_data['value'])\n                    for x in json_data['value']:\n                        fileName = x['name']\n                        url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot/\"+folderName+\"/\"+fileName+\":/content\"\n                        body = {}\n                        head = {\"Authorization\": \"Bearer \" + accessToken}\n                        response = requests.get(url, headers=head, data=body)\n                        newPath = filePath+folderName\n                        if os.path.exists(newPath) == False:\n                            os.mkdir(newPath)\n                        with open(newPath+\"/\"+fileName, 'wb') as f:\n                            f.write(response.content)\n                        downloadedXML = downloadedXML + \"1,\"\n    \n    return{\"downloadedXML\":downloadedXML,\"newPath\":newPath,\"combinedCSVName\":combinedCSVName}"
  outputs:
    - downloadedXML
    - newPath
    - combinedCSVName
  results:
    - SUCCESS
