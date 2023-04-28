namespace: BCRM_Reports
operation:
  name: TeamsDownload_CalenderFile
  inputs:
    - accessToken
    - location
  python_action:
    use_jython: false
    script: "def execute(accessToken,location): \n    import requests\n    import datetime\n \n    url = 'https://graph.microsoft.com/v1.0/drives/b!XzFsmY1Kq0igO0h8q2rIbI_Y65-XttFBjLIAg7M2WP69e-fSMQUITYMJLaNZ3ol_/root:/General/AEMO_Settlements_Calender/AEMO-Calendar-File.xlsx:/content'\n    body = None\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, data=body, headers=head)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n     \tsuccessfulResult = response.reason\n     \tfailureResult = \"\"\n    else:\n        successfulResult = \"\"\n        failureResult = response.reason   \n\n    filename = location+\"AEMO Calendar File.xlsx\"\n    with open(filename, 'wb') as f:\n        f.write(response.content)\n        \n    return{'AEMO_CalenderFile':filename,\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - AEMO_CalenderFile
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
