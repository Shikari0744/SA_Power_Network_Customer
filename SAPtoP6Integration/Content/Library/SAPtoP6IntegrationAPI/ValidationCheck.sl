namespace: SAPtoP6IntegrationAPI
operation:
  name: ValidationCheck
  inputs:
    - validationFile
    - userInput
  python_action:
    use_jython: false
    script: "def execute(validationFile, userInput):\r\n    import os.path\r\n    import pandas as pd\r\n    \r\n    successfulResult = \"\"\r\n    failureResult = \"\"\r\n    \r\n    if userInput.upper() == \"ALL\":\r\n        successfulResult = \"At least 1 Project meets requirements\"\r\n    elif os.path.isfile(validationFile):\r\n        xls = pd.read_excel(validationFile, header=0)\r\n        Projects = xls.to_dict('record')\r\n        for project in Projects:\r\n            if project[\"Validation\"] == True:\r\n                successfulResult = \"At least 1 Project meets requirements\"\r\n                break\r\n        #look for at least 1 TRUE, if found, success\r\n    else:\r\n        failureResult = \"No Projects meet requirements\"\r\n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
