namespace: GoCanvasUploads
operation:
  name: DownloadFromSP
  inputs:
    - accessToken
    - filePath
  python_action:
    use_jython: false
    script: "def execute(accessToken,filePath):\n    import requests\n    import json\n    \n    files = 0\n\n    url = 'https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/2021:/children'\n    body = None\n    head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, data=body, headers=head)\n    \n    results = json.loads(response.text)\n    folders = results['value']\n    \n    for folder in folders:\n        folderName = folder['name']\n        if 'Test Sheets' in folderName:\n            url = 'https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/2021/'+folderName+':/children?$top=2305'\n            body = None\n            head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n            response = requests.get(url, data=body, headers=head)   \n            \n            results = json.loads(response.text)\n            \n            if 'Type 6' in folderName:\n                testSheets = results['value']     \n                for sheet in testSheets:\n                    sheetName = sheet['name']\n                    url = 'https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/2021/'+folderName+'/'+sheetName+':/content'\n                    body = None\n                    head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n                    response = requests.get(url, data=body, headers=head)  \n                    \n                    filename = filePath+'Type 6/'+sheetName\n                    with open(filename, 'wb') as f:\n                        f.write(response.content)\n                    files = files + 1\n                    \n            else:\n                subfolders = results['value'] \n                for subfolder in subfolders:\n                    subfolderName = subfolder['name']\n                    url = 'https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/2021/'+folderName+'/'+subfolderName+':/children'\n                    body = None\n                    head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n                    response = requests.get(url, data=body, headers=head)   \n                    \n                    results = json.loads(response.text)\n                    testSheets = results['value']     \n                    for sheet in testSheets:\n                        sheetName = sheet['name']\n                        url = 'https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/2021/'+folderName+'/'+subfolderName+'/'+sheetName+':/content'\n                        body = None\n                        head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n                        response = requests.get(url, data=body, headers=head)  \n                        \n                        filename = filePath+'Type 5/'+sheetName\n                        with open(filename, 'wb') as f:\n                            f.write(response.content)\n                        files = files + 1\n                        \n    return{'files':files}"
  outputs:
    - files
  results:
    - SUCCESS
