namespace: RecloserAutomation
operation:
  name: getAttachments
  inputs:
    - accessToken
    - rundate:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken,rundate):\n    import requests\n    import json\n    import base64\n    from datetime import date, timedelta, datetime\n    \n    result = \"\"\n    \n    if rundate != \"\":\n        todayDate = datetime.strptime(rundate, '%d/%m/%Y').date()\n        today = todayDate.strftime('%d/%m/%Y')\n        yesterdayDate = datetime.strptime(rundate, '%d/%m/%Y')- timedelta(1)\n        yesterday = yesterdayDate.strftime('%Y-%m-%d')\n    else:\n        todayDate = date.today()\n        today = todayDate.strftime('%d/%m/%Y')\n        yesterdayDate = date.today() - timedelta(1)\n        yesterday = yesterdayDate.strftime('%Y-%m-%d')\n    \n    #ADMS DAILY INCIDENT REPORT\n    \n    url = f'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\\\"Archived Incident Log V1 was executed at {today}\\\"'\n    payload = {}\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n    response = requests.request(\"GET\", url, headers=headers, data = payload)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        result = \"Successful\"\n        json_data = json.loads(response.text)\n        for x in json_data['value']:\n            messageID = x['id']\n        \n        #TO GET ATTACHMENT\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        response = requests.request(\"GET\", url, headers=head, data = body)\n        test = json.loads(response.text.encode('utf8'))\n        \n        if response.status_code >= 200 and response.status_code < 300:\n            result = \"Successful\"    \n    \n            #where to save\n            for file in test[\"value\"]:\n                if \"Archived Incident\" in file:\n                    imgdata = base64.b64decode(file[\"contentBytes\"]) \n                    filename = f\"C:/Users/svcrpabot/OneDrive - SA Power Networks/Recloser Patrol Automation/ADMS Daily Incident Reports/Recloser Incidents {yesterday}.csv\"\n                    with open(filename, 'wb') as f:\n                        f.write(imgdata)\n        else:\n            result = \"\"\n    \n    #ADMS DAILY PHASE DATA\n    \n    url = f'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\\\"Event Summary - Trip Targets was executed at {today}\\\"'\n    payload = {}\n    headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n    response = requests.request(\"GET\", url, headers=headers, data = payload)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        result = \"Successful\"\n        json_data = json.loads(response.text)\n        for x in json_data['value']:\n            messageID = x['id']\n        \n        #TO GET ATTACHMENT\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        response = requests.request(\"GET\", url, headers=head, data = body)\n        test = json.loads(response.text.encode('utf8'))\n        \n        if response.status_code >= 200 and response.status_code < 300:\n            result = \"Successful\"    \n    \n            #where to save\n            for file in test[\"value\"]:\n                if \"Event Summary\" in file:\n                    imgdata = base64.b64decode(file[\"contentBytes\"]) \n                    filename = f\"C:/Users/svcrpabot/OneDrive - SA Power Networks/Recloser Patrol Automation/ADMS Daily Phase Data/Incident Phase Data {yesterday}.csv\"\n                    with open(filename, 'wb') as f:\n                        f.write(imgdata)\n        else:\n            result = \"\"\n    \n    return{\"result\":result}"
  outputs:
    - result
  results:
    - SUCCESS
