namespace: FieldServicesLeaveReporting
operation:
  name: UploadLeaveReportToTeams
  inputs:
    - accessToken
    - structureLocation
    - month
    - date
  python_action:
    use_jython: false
    script: "def execute(accessToken, structureLocation, month, date): \r\n    import requests\r\n    from openpyxl import load_workbook\r\n    \r\n    workbook = load_workbook(filename=structureLocation,read_only=False)\r\n    worksheet = workbook.active\r\n    rowCount = worksheet.max_row + 1\r\n    \r\n    successfulResult = \"\"\r\n    failureResult = \"\"\r\n    \r\n    for row in range(1,rowCount):\r\n        if worksheet[\"I\"+str(row)].value != \"reportName\":\r\n            if worksheet[\"I\"+str(row)].value != None:\r\n                folder = worksheet[\"G\"+str(row)].value\r\n                reportName = worksheet[\"I\"+str(row)].value\r\n                reportLocation = worksheet[\"J\"+str(row)].value\r\n                \r\n                if folder == \"Powerline Regional\":\r\n                    folderLocation = \"POWERLINE%20REGIONAL/\"\r\n                elif folder == \"Metro Ops\":\r\n                    folderLocation = \"METRO%20OPERATIONS/\"\r\n                elif folder == \"Powerline Metro\":\r\n                    folderLocation = \"POWERLINE%20METRO/\" \r\n                    \r\n                body = open(reportLocation, 'rb').read()\r\n                url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS/'+ folderLocation + month + '/' + date + \"/\" + reportName +':/content'\r\n                head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n                response = requests.put(url, data=body, headers=head)\r\n                \r\n                if response.status_code >= 200 and response.status_code < 300:\r\n                 \tsuccessfulResult = response.reason\r\n                    worksheet[\"E\"+str(row)].value = \"\"\r\n                    worksheet[\"I\"+str(row)].value = \"\"\r\n                    worksheet[\"J\"+str(row)].value = \"\"\r\n                else:\r\n                    failureResult = response.reason\r\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - failureResult
    - successfulResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
