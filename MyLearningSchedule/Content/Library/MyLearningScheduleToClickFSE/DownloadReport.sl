namespace: MyLearningScheduleToClickFSE
operation:
  name: DownloadReport
  inputs:
    - fileName
  python_action:
    use_jython: false
    script: "def execute(fileName):\r\n    import pandas as pd\r\n    from openpyxl import load_workbook\r\n    \r\n    wb = load_workbook(filename=fileName,read_only=False)\r\n    ws = wb.active\r\n    \r\n    pd_xl_file = pd.ExcelFile(fileName)\r\n    df = pd_xl_file.parse(\"Sheet 1\")\r\n    count = df.shape\r\n    rowCount = count[0] + 1\r\n    \r\n    totalRowValue = \"\"\r\n    for emp in range(1,rowCount):\r\n        totalRowValue = totalRowValue + \",\" + \"1\"\r\n        \r\n    ws[\"T1\"].value = \"Travel To Result\"\r\n    ws[\"U1\"].value = \"Training Result\"\r\n    ws[\"V1\"].value = \"Travel From Result\"\r\n    wb.save(fileName)\r\n    wb.close()\r\n    \r\n    totalRowValue = totalRowValue.replace(\",\",\"\",1)\r\n    length = len(totalRowValue)\r\n\r\n    return{\"rowCount\":totalRowValue,\"length\":length}\r\n     \r\n#     import requests\r\n#     import json\r\n#     import base64\r\n#     import datetime\r\n#     import pandas as pd\r\n    \r\n#     #GET ACCESS TOKEN\r\n#     url = \"https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/v2.0/token\"\r\n#     d = {\"grant_type\":\"client_credentials\",\"client_id\":\"a7e41e17-18cf-4fd3-9dbb-d1322ad23e3f\",\"client_secret\":\"Ao3l_06~Df_q3W.kIl9woUVC8Xlc3A_Ys9\",\"scope\":\"https://graph.microsoft.com/.default\",\"userName\":userName,\"password\":password}\r\n#     head = {\"Content-Type\": \"application/x-www-form-urlencoded\"}\r\n    \r\n#     accessToken = requests.post(url, data=d, headers=head)\r\n#     accessToken = accessToken.text\r\n    \r\n#     accessToken = accessToken.split('\"access_token\":\"')\r\n#     accessToken = str(accessToken[1])\r\n#     accessToken = accessToken.split('\"')\r\n#     accessToken = str(accessToken[0])\r\n    \r\n#     #GET EMAIL WITH REPORT\r\n#     #change this search query\r\n#     url = \"https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages?$search=\\\"Weekly\\\"\"\r\n#     payload = {}\r\n#     headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer ' + accessToken}\r\n#     response = requests.request(\"GET\", url, headers=headers, data = payload)\r\n#     response = response.text\r\n    \r\n#     messID = response.split('\"id\":\"')\r\n#     messID = str(messID[1])\r\n#     messID = messID.split('\",\"')\r\n#     messageID = str(messID[0])\r\n    \r\n#     attach = response.split('\"hasAttachments\":')\r\n#     attach = str(attach[1])\r\n#     attach = attach.split(',\"')\r\n#     hasAttachments = str(attach[0])\r\n\r\n#     #DOWNLOAD REPORT\r\n#     if hasAttachments == \"true\":\r\n#         url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\r\n#         body = {}\r\n#         head = {\"Authorization\": \"Bearer \" + accessToken}\r\n#         responseCode = requests.request(\"GET\", url, headers=head, data = body)\r\n#         response = responseCode.text\r\n#         test = json.loads(responseCode.text.encode('utf8'))\r\n    \r\n#         attachName = response.split('\"name\":\"')\r\n#         attachName = str(attachName[1])\r\n#         attachName = attachName.split('\",\"')\r\n#         attachment = str(attachName[0])\r\n        \r\n#         for file in test[\"value\"]:\r\n#             fileName = file[\"name\"]\r\n#             if fileName == 'MyLearningSchedule.xlsx':\r\n#                 imgdata = base64.b64decode(file[\"contentBytes\"])  \r\n#                 filename = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/My Learning/\" + attachment\r\n#                 with open(filename, 'wb') as f:\r\n#                     f.write(imgdata)        \r\n        \r\n#     pd_xl_file = pd.ExcelFile(fileName)\r\n#     df = pd_xl_file.parse(\"Sheet 1\")\r\n#     count = df.shape\r\n#     rowCount = count[0]\r\n    \r\n#     return{'rowCount':rowCount,'hasAttachments':hasAttachments,'accessToken':accessToken}"
  outputs:
    - rowCount
    - length
  results:
    - SUCCESS