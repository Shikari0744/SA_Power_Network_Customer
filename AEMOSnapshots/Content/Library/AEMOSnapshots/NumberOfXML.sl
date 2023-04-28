namespace: AEMOSnapshots
operation:
  name: NumberOfXML
  inputs:
    - accessToken
  python_action:
    use_jython: false
    script: "def execute(accessToken): \r\n    import requests\r\n    import json\r\n    import os.path\r\n    import os\r\n    import time\r\n    \r\n    url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot:/children\"\r\n    body = {}\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, headers=head, data = body)\r\n    json_data = json.loads(response.text)\r\n\r\n    if response.status_code >= 200 and response.status_code < 300:\r\n        for x in json_data['value']:\r\n            folderName = x['name']\r\n            if folderName.find(\".\") == -1:\r\n                url = \"https://graph.microsoft.com/v1.0//drives/b!Yvle4cP0I0uX1BYaeqA9a3DWAqmX-etInALzCDmVYzhLcRsxueZjRbicTnUQ4Qet/root:/AEMO%20Snapshots/Current%20Snapshot/\"+folderName+\":/children\"\r\n                body = {}\r\n                head = {\"Authorization\": \"Bearer \" + accessToken}\r\n                response = requests.get(url, headers=head, data = body)\r\n                json_data = json.loads(response.text)\r\n                if response.status_code >= 200 and response.status_code < 300:\r\n                    resultsfound = len(json_data['value'])      \r\n                    if \"_CMR_\" in folderName:\r\n                        cmr = folderName + \"|\" + str(resultsfound)\r\n                    elif \"_CND_\" in folderName:\r\n                        cnd = folderName + \"|\" + str(resultsfound)\r\n                    elif \"_CNDS_\" in folderName:\r\n                        cnds = folderName + \"|\" + str(resultsfound)\r\n                    elif \"_CNPR_\" in folderName:\r\n                        cnpr = folderName + \"|\" + str(resultsfound)\r\n                    elif \"_CRI_\" in folderName:    \r\n                        cri = folderName + \"|\" + str(resultsfound)\r\n    return{\"cmr\":cmr,\"cnd\":cnd,\"cnds\":cnds,\"cnpr\":cnpr,\"cri\":cri}"
  outputs:
    - cmr
    - cnd
    - cnds
    - cnpr
    - cri
  results:
    - SUCCESS
