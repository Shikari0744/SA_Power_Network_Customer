namespace: EnablonReports
operation:
  name: DownloadFromEmail
  inputs:
    - accessToken
    - reportsFolder
  python_action:
    use_jython: false
    script: "def execute(accessToken,reportsFolder): \n    import requests\n    import json\n    import base64\n    \n    emailSubjects = [\"Electrical Services, Workplace\",\"Operations Metro North, Workplace\",\"Operations Metro South, Workplace\",\"Operations Planning, Workplace\",\"Construction, ETS\",\"Operations Delivery - Regional, Workplace\",\"Electrical Services Field\",\"Operations Metro North, Field\",\"Operations Metro South, Field\",\"Operations Planning, Field\",\"Construction, Field\",\"Operations Delivery - Regional, Safety Leadership, Field\"]\n        \n    for subject in emailSubjects:\n        #TO GET EMAIL\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\"'+subject+'\"'\n        payload = {}\n        headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer '+accessToken}\n        response = requests.request(\"GET\", url, headers=headers, data = payload)\n        json_data = json.loads(response.text)\n        \n        for x in json_data['value']:\n            messageID = x['id']\n            break\n        \n        #TO GET ATTACHMENT\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        responseCode = requests.request(\"GET\", url, headers=head, data = body)\n        result = responseCode.status_code\n        results = json.loads(responseCode.text.encode('utf8'))\n        \n        #SAVING THE ATTACHMENT\n        for file in results[\"value\"]:\n            imgdata = base64.b64decode(file[\"contentBytes\"])  \n            name = file[\"name\"]\n            filename = reportsFolder + name\n            with open(filename, 'wb') as f:\n                f.write(imgdata)\n            \n            if name.find(\"Electrical Services, Workplace\") >= 0:\n                electricalWorkplace = name\n                break\n            elif name.find(\"Operations Metro North, Workplace\") >= 0:\n                metroNorthWorkplace = name\n                break\n            elif name.find(\"Operations Metro South, Workplace\") >= 0:\n                metroSouthWorkplace = name\n                break\n            elif name.find(\"Operations Planning, Workplace\") >= 0:\n                opsPlanningWorkplace = name\n                break\n            elif name.find(\"Construction, ETS\") >= 0:\n                metroOpsWorkplace = name  \n                break\n            elif name.find(\"Operations Delivery - Regional, Workplace\") >= 0:\n                opsRegionalWorkplace = name  \n                break\n            elif name.find(\"Electrical Services Field\") >= 0:\n                electricalField = name\n                break\n            elif name.find(\"Operations Metro North, Field\") >= 0:\n                metroNorthField = name\n                break\n            elif name.find(\"Operations Metro South, Field\") >= 0:\n                metroSouthField = name\n                break\n            elif name.find(\"Operations Planning, Field\") >= 0:\n                opsPlanningField = name\n                break\n            elif name.find(\"Projects & Construction, Field\") >= 0:\n                metroOpsField = name  \n                break\n            elif name.find(\"Operations Delivery - Regional, Safety Leadership, Field\") >= 0:\n                opsRegionalField = name\n                break\n    \n    return{\n        \"electricalWorkplace\":electricalWorkplace,\n        \"metroNorthWorkplace\":metroNorthWorkplace,\n        \"metroSouthWorkplace\":metroSouthWorkplace,\n        \"opsPlanningWorkplace\":opsPlanningWorkplace,\n        \"metroOpsWorkplace\":metroOpsWorkplace,\n        \"opsRegionalWorkplace\":opsRegionalWorkplace,\n        \"electricalField\":electricalField,\n        \"metroNorthField\":metroNorthField,\n        \"metroSouthField\":metroSouthField,\n        \"opsPlanningField\":opsPlanningField,\n        \"metroOpsField\":metroOpsField,\n        \"opsRegionalField\":opsRegionalField\n    }"
  outputs:
    - electricalWorkplace
    - metroNorthWorkplace
    - metroSouthWorkplace
    - opsPlanningWorkplace
    - metroOpsWorkplace
    - opsRegionalWorkplace
    - electricalField
    - metroNorthField
    - metroSouthField
    - opsPlanningField
    - metroOpsField
    - opsRegionalField
  results:
    - SUCCESS
