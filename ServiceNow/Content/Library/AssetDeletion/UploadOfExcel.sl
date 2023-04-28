namespace: AssetDeletion
operation:
  name: UploadOfExcel
  inputs:
    - accessToken
    - singleAsset:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken,singleAsset): \r\n    import importlib\r\n    import os\r\n    from os import path\r\n    requests = importlib.import_module('requests')\r\n    \r\n    if singleAsset == \"\":\r\n        # get import file size \r\n        importFile = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/ServiceNowAutomation/AssetsToBeDeleted.xlsx\"\r\n    \r\n        # read file into binary\r\n        body = open(importFile, 'rb').read()\r\n        url = 'https://graph.microsoft.com/v1.0/drives/b!HmbowSkj60uuHqB3HpLR9x7zYshvshRHtFy1qeBzNLnyYMDWKeW6RqiSVhUL2wRl/root:/General/Automation/AssetsToBeDeleted.xlsx:/content'\r\n        head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n        response = requests.put(url, data=body, headers=head)\r\n    \r\n        return {'response':response}"
  outputs:
    - response
  results:
    - SUCCESS
