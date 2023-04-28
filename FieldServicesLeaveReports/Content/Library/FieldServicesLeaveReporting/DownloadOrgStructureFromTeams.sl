namespace: FieldServicesLeaveReporting
operation:
  name: DownloadOrgStructureFromTeams
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken): \r\n    import requests\r\n    import os.path\r\n    import os\r\n    from msal import PublicClientApplication\r\n    import pandas as pd  \r\n    import requests\r\n    import json\r\n    from msal import PublicClientApplication \r\n    \r\n    #TO DOWNLOAD ORG STRUCTURE EXCEL\r\n    file = \"SAP Organisational Structures.xlsx\"\r\n    filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/HR Reports/\"+file\r\n        \r\n    #TO DOWNLOAD FILES\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS:/children'\r\n    body = None\r\n    head = { \"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    statuscode = response.status_code\r\n    json_data = json.loads(response.text)\r\n        \r\n    downloadURL = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS/'+ file +':/content'\r\n    downloadBody = None\r\n    downloadHead = {\"Authorization\": \"Bearer \" + accessToken}\r\n    downloadResponse = requests.get(downloadURL, data=downloadBody, headers=downloadHead)\r\n    \r\n    result = str(downloadResponse.status_code)\r\n    \r\n    #WHERE THE FILE WILL BE SAVED\r\n    with open(filename, 'wb') as f:\r\n        f.write(downloadResponse.content)        \r\n    \r\n    #GET ROW COUNT\r\n    pd_xl_file = pd.ExcelFile(filename)\r\n    df = pd_xl_file.parse(\"Email OrgStruct\")\r\n    count = df.shape\r\n    rowCount = count[0] \r\n    rowCount = rowCount\r\n    \r\n    x = 1\r\n    loopCount = \"\"\r\n    while x <= rowCount:\r\n        loopCount = loopCount + \",1\"\r\n        x = x + 1\r\n    loopCount = loopCount.replace(\",\",\"\",1)\r\n    \r\n    \r\n    return{\"loopCount\":loopCount,\"result\":result}"
  outputs:
    - loopCount
    - result
  results:
    - SUCCESS
