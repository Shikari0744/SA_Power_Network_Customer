namespace: AssetDeletion
operation:
  name: UpdateHardwareStatus_CI
  inputs:
    - access_token
    - sys_id_CI
    - status
  python_action:
    use_jython: false
    script: "def execute(status,sys_id_CI,access_token): \n    import requests\n    \n    if status != None:\n        if status == \"IN STOCK\":\n            update_status = \"in_stock\"\n        elif status == \"IN MAINTENANCE\":\n            update_status = \"in_maintenance\"\n        \n        url = \"https://platform1.sapowernetworks.com.au/api/now/table/cmdb_ci_computer/\"+sys_id_CI\n        body = \"{\\\"hardware_status\\\":\\\"\"+update_status+\"\\\"}\"\n        headers = {'Content-Type': \"application/json\",'Authorization': \"Bearer \" + access_token}\n        responseCode = requests.request(\"PUT\", url, data=body, headers=headers)\n        errorMessage_status = \"No error\"\n        return{'responseCode':responseCode,'errorMessage_status':errorMessage_status}\n    else:\n        errorMessage_status = \"No status entered\"\n        return{'errorMessage_status':errorMessage_status}"
  outputs:
    - responseCode
    - errorMessage_status
  results:
    - FAILURE: '${errorMessage_status == "No status entered"}'
    - SUCCESS
