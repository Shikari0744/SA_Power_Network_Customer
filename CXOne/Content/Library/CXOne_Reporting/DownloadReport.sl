namespace: CXOne_Reporting
operation:
  name: DownloadReport
  inputs:
    - accessToken
    - reportURL
  python_action:
    use_jython: false
    script: "def execute(accessToken, reportURL):\n    import requests\n    import base64\n    import os\n    from os import listdir\n    from os import path\n    import json\n    from datetime import date\n    \n    # get todays month and year for file file name\n    today = date.today()\n    currMonth = str(today.month)\n    currYear  = str(today.year)\n    currMonLen = len(currMonth)\n    if currMonLen == 1:\n        currMonth = '0' + currMonth\n    # prepare string for file name     \n    fileStr = currYear + '.' + currMonth\n        \n    reportFolder = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/CXOne Reports\"\n    \n    if not os.path.exists(reportFolder):\n        os.mkdir(reportFolder)\n        \n    # remove any existing reports\n    for file in os.listdir(reportFolder):\n        os.remove(os.path.join(reportFolder,file))\n        \n    # download report and save locally\n    fileHead = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/json\"}\n    fileResponse = requests.get(reportURL, headers=fileHead)\n    file_json_data = json.loads(fileResponse.text)\n\n    # save the data from the response by capturing binary information \n    for node in file_json_data.values():\n        fileNme = 'CXone_Call_Details_v1.' + fileStr + '.xls'\n        fileContent = node['file']\n        imgdata = base64.b64decode(fileContent) \n        filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/CXOne Reports/\" + fileNme\n        with open(filename, 'wb') as f:\n            f.write(imgdata)\n        return{'ReportFile':filename, 'rptFileName':fileNme, 'reportFileLocation': reportFolder}"
  outputs:
    - ReportFile
    - rptFileName
  results:
    - SUCCESS
