namespace: FieldServicesMonthlyTrainingReports
operation:
  name: UploadTrainingReportToTeams
  inputs:
    - accessToken
    - fileLocation
    - fileName
    - folder
    - month
    - year
    - finished:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken, fileLocation, fileName, folder, month, year, finished): \r\n    import requests\r\n    \r\n\r\n    if finished == None or finished == \"\":\r\n\r\n        #TO UPLOAD FILES\r\n        filePath = fileLocation + fileName\r\n        \r\n        if folder == \"Regional\":\r\n            folderLocation = \"REGIONAL/\"\r\n        elif folder == \"Metro Ops\":\r\n            folderLocation = \"METRO%20OPERATIONS/\"\r\n        elif folder == \"Metropolitan\": \r\n            folderLocation = \"METRO/\"\r\n            \r\n        # read file into binary\r\n        body = open(filePath, 'rb').read()\r\n        url = 'https://graph.microsoft.com/v1.0/drives/b!M1EXTKKvAECDJjdYXXAW_fQ7eUsAkxVMulbxUzWCDDt5H0McXUl8Sr3SyHluHtUG/root:/Training/Automated%20Monthly%20Training%20Reports/'+ folderLocation + year + '/' + month + \"/\" + fileName +':/content'\r\n        head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n        response = requests.put(url, data=body, headers=head)\r\n        \r\n        if response.status_code >= 200 and response.status_code < 300:\r\n         \tsuccessfulResult = response.reason\r\n         \tfailureResult = \"\"\r\n        else:\r\n            successfulResult = \"\"\r\n            failureResult = response.reason\r\n    else:\r\n        successfulResult = \"All reports completed\"\r\n        failureResult = \"\"\r\n        \r\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
