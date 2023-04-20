namespace: GenericActivities
operation:
  name: GetAttachments_Teams
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken):\n    import requests\n    \n    url = \"https://graph.microsoft.com/v1.0/drives/b!otNF9Z0tQUehMtn3HlVtgdH1pKDhu15Gj-GFGJyMhBm5Uf2EBi_aRqcRvqdJVhxS/root:/General/\"+year+\"/Type%206%20Test%20Results:/children\"\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        result = \"Successful\"\n        \n        resultsfound = len(json_data['value'])\n        for x in json_data['value']:\n            jfileName = x['name']\n            if \"Sample Lot\" in jfileName:\n                newFileName = jfileName.replace(\" \", \"%20\")\n                \n                fileURL = \"https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/\"+year+\"/Type%206%20Test%20Results/\"+ newFileName + \":/content\"\n                filebody = {}\n                fileHead = {\"Authorization\": \"Bearer \" + accessToken}\n                fileResponse = requests.get(fileURL, headers=fileHead, data = filebody)\n                \n                if fileResponse.status_code >= 200 and fileResponse.status_code < 300:\n                    result = \"Successful\"\n                    with open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/Enerven Meter Testing/\"+jfileName, 'wb') as f:\n                        f.write(fileResponse.content)\n                else:\n                    result = \"\"\n    else:\n        result = \"\"\n        \n    return{\"result\":result}"
  outputs:
    - result
  results:
    - FAILURE: '${result}'
    - SUCCESS
