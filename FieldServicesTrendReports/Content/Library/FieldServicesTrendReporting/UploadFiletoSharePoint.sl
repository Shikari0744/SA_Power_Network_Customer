namespace: FieldServicesTrendReporting
operation:
  name: UploadFiletoSharePoint
  inputs:
    - FileName: SM-4 Trend v2.xlsx
    - accessToken
    - teamsFolder: Reporting
  python_action:
    use_jython: false
    script: "def execute(FileName, accessToken, teamsFolder): \r\n    import requests\r\n    \r\n    result = \"\"\r\n\r\n    # get import file size \r\n    importFile = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Trend Report/\" + FileName\r\n\r\n    # read file into binary\r\n    body = open(importFile, 'rb').read()\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!-w74JklmiUqedmM-66qnd43Lo6vFFrxHnOVsm7qf6lZDqHHUS8z2RZ_MozFiOnpM/root:/' + teamsFolder + '/' + FileName+':/content'\r\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n    response = requests.put(url, data=body, headers=head)\r\n    \r\n    if response.status_code >= 200 and response.status_code < 300:\r\n        result = \"Successful\"\r\n  \r\n    return {'result':result}"
  outputs:
    - result
  results:
    - FAILURE: '${result == ""}'
    - SUCCESS
