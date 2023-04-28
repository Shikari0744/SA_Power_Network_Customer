namespace: AEMO_Compliance_Reporting
operation:
  name: CheckIfReportsDownloaded
  inputs:
    - reportsDownloaded:
        required: false
  python_action:
    use_jython: false
    script: "def execute(reportsDownloaded):\n    if reportsDownloaded == \"\":\n        result = \"reports downloaded\"\n    else:\n        result = \"reports not downloaded\"\n    \n    return{\"result\":result}"
  outputs:
    - result
  results:
    - CUSTOM: '${result == "reports not downloaded"}'
    - SUCCESS
