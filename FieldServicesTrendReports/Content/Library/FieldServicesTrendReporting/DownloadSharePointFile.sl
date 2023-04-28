namespace: FieldServicesTrendReporting
operation:
  name: DownloadSharePointFile
  inputs:
    - accessToken
    - FileName: SM-4 Trend v2.xlsx
    - teamsFolder: Reporting
  python_action:
    use_jython: false
    script: "def execute(accessToken,FileName,teamsFolder): \r\n    import importlib\r\n    import os\r\n    from os import path\r\n    import requests\r\n    import datetime\r\n    \r\n\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!-w74JklmiUqedmM-66qnd43Lo6vFFrxHnOVsm7qf6lZDqHHUS8z2RZ_MozFiOnpM/root:/' + teamsFolder + '/' + FileName+':/content'\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    responseCode = response.status_code\r\n\r\n    filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Trend Report/\" + FileName\r\n    with open(filename, 'wb') as f:\r\n        f.write(response.content)\r\n    return {\"result\":filename,\"responseCode\":responseCode}"
  outputs:
    - result
  results:
    - SUCCESS
