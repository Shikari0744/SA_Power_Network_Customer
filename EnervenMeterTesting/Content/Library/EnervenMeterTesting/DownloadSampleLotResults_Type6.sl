namespace: EnervenMeterTesting
operation:
  name: DownloadSampleLotResults_Type6
  inputs:
    - accessToken
    - filePath
  python_action:
    use_jython: false
    script: "def execute(accessToken, filePath): \n    import requests\n    import json\n    import datetime\n    import os\n\n    today = datetime.datetime.now()\n    year = today.strftime(\"%Y\") \n    \n    url = \"https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/\"+year+\"/Type%206%20Test%20Results:/children\"\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n    \n    resultsDownloaded = 0\n    if response.status_code >= 200 and response.status_code < 300:\n        resultsfound = len(json_data['value'])\n        for x in json_data['value']:\n            jfileName = x['name']\n            if \"Results.xlsx\" in jfileName:\n                resultsDownloaded = resultsDownloaded + 1 \n                newFileName = jfileName.replace(\" \", \"%20\")\n                fileURL = \"https://graph.microsoft.com/v1.0/drives/b!qLnxhp_SHUuAsdyx2DVZTU3MsDyQjVJIpIH-wKwcAy65QTGBahSSTpZ_Rt2cU8qw/root:/General/\"+year+\"/Type%206%20Test%20Results/\"+ newFileName + \":/content\"\n                filebody = {}\n                fileHead = {\"Authorization\": \"Bearer \" + accessToken}\n                fileResponse = requests.get(fileURL, headers=fileHead, data = filebody)\n                with open(filePath+jfileName, 'wb') as f:\n                    f.write(fileResponse.content)   \n    else:\n        resultsfound = response.reason\n    return{\"resultsfound\":resultsfound,\"resultsDownloaded\":resultsDownloaded}"
  outputs:
    - resultsfound
    - resultsDownloaded
  results:
    - SUCCESS
