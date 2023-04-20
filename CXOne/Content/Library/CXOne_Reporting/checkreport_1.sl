namespace: CXOne_Reporting
operation:
  name: checkreport_1
  inputs:
    - accessToken
    - reportID
    - job_ID
  python_action:
    use_jython: false
    script: "def execute(accessToken, reportID, job_ID):\n    import requests\n    import json\n    import time\n    \n    # wait for 30 sec before checking for report availability\n    time.sleep(30)\n    \n    # check if report is available \n    url = 'https://api-au1.niceincontact.com/inContactAPI/services/v22.0/report-jobs/' + job_ID\n    body = {}\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/json\"}\n    response = requests.get(url, headers=head, data = body)\n    json_data = json.loads(response.text)\n    \n    # get status if the report from the response\n    for node in json_data.values():\n        jobState = node['state']\n    \n    # keep checking for 30 min for status to be 'Finished'   \n    status = True\n    incrementer = 0\n    \n    while status:\n        if jobState == 'Finished':\n            status = False\n        else:\n            url = 'https://api-au1.niceincontact.com/inContactAPI/services/v22.0/report-jobs/' + job_ID\n            body = {}\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/json\"}\n            response = requests.get(url, headers=head, data = body)\n            json_data = json.loads(response.text)\n\n            for node in json_data.values():\n                jobState = node['state']\n            time.sleep(15)\n            incrementer = incrementer + 1\n            if incrementer == 120:\n                break\n                \n    #if incrementer equals 120, do not continue\n    if incrementer == 120:\n        failure = 'Failure'\n        return{'failure':failure}\n    else:        \n        #Capture reponse text and load as json\n        failure = \"No failure\"\n        json_data = json.loads(response.text)\n        \n    # get the jobID and report ID from response\n    for node in json_data.values():\n        jobID = node['jobId'] \n        report_ID = node['reportId']\n        if (jobID == job_ID) and (report_ID == reportID):\n            resultFileURL = node['resultFileURL']\n            return{'ResultFileURL':resultFileURL}"
  outputs:
    - ResultFileURL
    - failure
  results:
    - SUCCESS
