namespace: AssetDeletion
operation:
  name: UpdateStockroom_ALM
  inputs:
    - access_token
    - sys_id_ALM
    - storeroom:
        required: false
    - status
  python_action:
    use_jython: false
    script: "def execute(status,storeroom,sys_id_ALM,access_token): \n    import requests\n    \n    if \"BUILDROOM\" in storeroom:\n        storeroom = \"Buildroom - 1RR\"\n    elif \"STORE\" in storeroom:\n        storeroom = \"IT Store - 1RR\"\n        \n    if status == \"IN STOCK\":\n        if storeroom != None:\n            url = \"https://platform1.sapowernetworks.com.au/api/now/table/alm_hardware/\"+sys_id_ALM\n            body = \"{\\\"stockroom\\\":\\\"\"+storeroom+\"\\\"}\"\n            headers = {'Content-Type': \"application/json\",'Authorization': \"Bearer \" + access_token}\n            responseCode = requests.request(\"PUT\", url, data=body, headers=headers)\n            errorMessage_storeroom = \"No error\"\n            return{'responseCode':responseCode,'errorMessage_storeroom':errorMessage_storeroom}\n        else:\n            errorMessage_storeroom = \"No storeroom entered\"\n            return{'errorMessage_storeroom':errorMessage_storeroom}\n    else:\n        errorMessage_storeroom = \"No error\"\n        return{'errorMessage_storeroom':errorMessage_storeroom}"
  outputs:
    - responseCode
    - errorMessage_storeroom
  results:
    - FAILURE: '${errorMessage_storeroom != "No error"}'
      CUSTOM_0: '${errorMessage_storeroom}'
    - SUCCESS
