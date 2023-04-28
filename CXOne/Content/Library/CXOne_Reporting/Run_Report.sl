namespace: CXOne_Reporting
operation:
  name: Run_Report
  inputs:
    - accessToken
    - reportID
  python_action:
    use_jython: false
    script: "def execute(accessToken, reportID):\n    import requests\n    import json\n \n    url = 'https://api-au1.niceincontact.com/inContactAPI/services/v22.0/report-jobs/' + reportID + '?fileType=Excel&includeHeaders=true&appendDate=true&overwrite=true'\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.post(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n    \n    jobid = json_data['jobId']\n    return{'JobId':jobid}"
  outputs:
    - JobId
  results:
    - SUCCESS
