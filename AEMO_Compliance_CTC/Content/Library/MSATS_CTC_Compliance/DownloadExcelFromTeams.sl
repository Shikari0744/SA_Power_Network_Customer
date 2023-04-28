namespace: MSATS_CTC_Compliance
operation:
  name: DownloadExcelFromTeams
  inputs:
    - api_user
    - api_pass:
        sensitive: true
    - accessToken
  python_action:
    use_jython: false
    script: "#for teams download\ndef execute(api_user, api_pass,accessToken): \n    import requests\n    import os.path\n    import os\n    from msal import PublicClientApplication\n    import pandas as pd  \n    import requests\n    import json\n    from msal import PublicClientApplication \n\timport datetime\n\n    now = datetime.datetime.now()\n\tnow = now.strftime(\"%d/%m/%Y %H:%M:%S\")\n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\n\"+now)\n    f.write(\"\\nDownload Excel from Teams\")\n    f.close()      \n    \n    #TO DOWNLOAD ORG STRUCTURE EXCEL\n    ctcFileName = \"CTC Compliance.xlsx\"\n    filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/CTC_Compliance/\"+ctcFileName\n        \n    #TO DOWNLOAD FILES\n    url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS:/children'\n    body = None\n    head = { \"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, data=body, headers=head)\n    json_data = json.loads(response.text)\n \n\n    #IF FILE EXISTS, DELETE\n    if os.path.exists(filename):\n        os.remove(filename)\n        \n    downloadURL = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS/'+ ctcFileName +':/content'\n    downloadBody = None\n    downloadHead = {\"Authorization\": \"Bearer \" + accessToken}\n    downloadResponse = requests.get(downloadURL, data=downloadBody, headers=downloadHead)\n    \n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\nGet CTC excel\")\n    f.write(\"\\n\"+str(downloadResponse))\n    f.write(\"\\n\"+downloadResponse.text)\n    f.close()        \n    \n    #WHERE THE FILE WILL BE SAVED\n    with open(filename, 'wb') as f:\n        f.write(downloadResponse.content)        \n    \n    return{\"ctcFileName\":ctcFileName,\"response\":response}"
  outputs:
    - ctcFileName
    - response
  results:
    - SUCCESS
