namespace: AssetDeletion
operation:
  name: DownloadOfExcel
  inputs:
    - accessToken
    - singleAsset:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken, singleAsset): \n    import importlib\n    import os\n    requests = importlib.import_module('requests')\n    from os import path\n\n    if singleAsset == \"\":\n        url = \"https://graph.microsoft.com/v1.0/drives/b!HmbowSkj60uuHqB3HpLR9x7zYshvshRHtFy1qeBzNLnyYMDWKeW6RqiSVhUL2wRl/root:/General/Automation/AssetsToBeDeleted.xlsx:/content\"\n        body = None\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        response = requests.get(url, data=body, headers=head)\n    \n        filePath = 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ServiceNowAutomation/AssetsToBeDeleted.xlsx'\n        with open(filePath, 'wb') as f:\n            f.write(response.content)\n            \n        return{'response':response,'filePath':filePath}"
  outputs:
    - response
    - filePath
  results:
    - SUCCESS
