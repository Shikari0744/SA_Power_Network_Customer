namespace: EnablonReports
operation:
  name: UploadToSharePoint
  inputs:
    - accessToken
    - electrical:
        required: false
    - metro:
        required: false
    - ops:
        required: false
    - regional:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken, electrical, metro, ops, regional): \r\n    import requests\r\n    import os.path\r\n    import urllib.parse\r\n    import os\r\n    from os import path\r\n    from msal import PublicClientApplication\r\n    from os import listdir\r\n    import shutil\r\n    \r\n    result = \"\"\r\n\r\n    #TO UPLOAD FILES\r\n    fileNames = [electrical, metro, ops, regional]\r\n\r\n    for file in fileNames:\r\n        filePath = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/Enablon Reports/\"+ file\r\n        if file.find(\"Workplace Inspections\") > 0:\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/Enablon%20Reports/Workplace%20Inspections/'+ file +':/content'\r\n        elif file.find(\"Field Observation\") > 0:\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/Enablon%20Reports/Field%20Observation/'+ file +':/content'\r\n        # read file into binary\r\n        body = open(filePath, 'rb').read()\r\n        head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n        response = requests.put(url, data=body, headers=head)\r\n        \r\n        if response.status_code >= 200 and response.status_code < 300:\r\n\t        result = \"Successful\"\r\n\t\t        \r\n        if file.find(\"Electrical\") > 0:\r\n            electricalResult = response.reason\r\n        elif file.find(\"Metro Ops\") > 0:\r\n            metroOpsResult = response.reason\r\n        elif file.find(\"Metro\") > 0:\r\n            metroResult = response.reason\r\n        elif file.find(\"Regional\") > 0:\r\n            regionalResult = response.reason\r\n    \r\n    return{\"result\":result,\"electricalResult\":electricalResult,\"metroOpsResult\":metroOpsResult,\"metroResult\":metroResult,\"regionalResult\":regionalResult}"
  outputs:
    - electricalResult
    - metroOpsResult
    - metroResult
    - regionalResult
    - result
  results:
    - FAILURE: '${result == ""}'
    - SUCCESS
