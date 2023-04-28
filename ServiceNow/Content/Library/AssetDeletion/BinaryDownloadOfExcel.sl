namespace: AssetDeletion
operation:
  name: BinaryDownloadOfExcel
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken): \n    import importlib\n    import os\n    requests = importlib.import_module('requests')\n    from os import path\n\n    #if not os.path.exists(file_path):\n    #    os.makedirs(file_path)\n        \n    url = \"https://graph.microsoft.com/v1.0/drives/b!HmbowSkj60uuHqB3HpLR9x7zYshvshRHtFy1qeBzNLnyYMDWKeW6RqiSVhUL2wRl/root:/General/Automation/AssetsToBeDeleted.xlsx:/content\"\n    body = None\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, data=body, headers=head)\n\n    #filePath = 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ServiceNowAutomation/' + AssetsToBeDeleted.xlsx\n    #with open(filePath, 'wb') as f:\n    #    f.write(response.content)\n        \n    return{'filePath':response}"
  outputs:
    - filePath
  results:
    - SUCCESS
