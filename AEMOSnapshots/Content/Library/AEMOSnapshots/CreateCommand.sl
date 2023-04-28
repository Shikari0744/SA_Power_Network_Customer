namespace: AEMOSnapshots
operation:
  name: CreateCommand
  inputs:
    - reportType
    - rowData
  python_action:
    use_jython: false
    script: "def execute(reportType,rowData):\r\n    \r\n    if reportType == \"CMR\":\r\n        command = \"INSERT INTO cats_meter_register VALUES (\"+rowData+\")\"\r\n    elif reportType == \"CND\":\r\n        command = \"INSERT INTO cats_nmi_data VALUES (\"+rowData+\")\"\r\n    elif reportType == \"CNDS\":\r\n        command = \"INSERT INTO cats_nmi_data_stream VALUES (\"+rowData+\")\"\r\n    elif reportType == \"CNPR\":\r\n        command = \"INSERT INTO cats_nmi_participant_relations VALUES (\"+rowData+\")\"\r\n    elif reportType == \"CRI\":\r\n        command = \"INSERT INTO cats_register_identifier VALUES (\"+rowData+\")\"\r\n     \r\n\r\n    return{\"command\":command}"
  outputs:
    - command
  results:
    - SUCCESS
