namespace: AssetDeletion
flow:
  name: APIcallsToUpdateAsset
  inputs:
    - single_asset_to_be_removed:
        required: false
    - username_serviceNow
    - password_serviceNow:
        sensitive: true
  workflow:
    - GetAccessToken_ServiceNow:
        do:
          GenericActivities.GetAccessToken_ServiceNow:
            - username: svcbot.disableasset
            - password:
                value: "zg\\o(VQ4wi"
                sensitive: true
        navigate:
          - SUCCESS: GetAssetInfo_CI
    - GetAssetInfo_CI:
        do:
          AssetDeletion.GetAssetInfo_CI:
            - asset_line_excel: '${single_asset_to_be_removed}'
            - access_token: '${access_token}'
        publish:
          - sys_id_CI
          - status
          - storeroom
          - asset_id
        navigate:
          - SUCCESS: UpdateHardwareStatus_CI
    - UpdateHardwareStatus_CI:
        do:
          AssetDeletion.UpdateHardwareStatus_CI:
            - access_token: '${access_token}'
            - sys_id_CI: '${sys_id_CI}'
            - status: '${status}'
        publish:
          - errorMessage_status
        navigate:
          - FAILURE: FailureEmail
          - SUCCESS: GetAssetInfo_ALM
    - GetAssetInfo_ALM:
        do:
          AssetDeletion.GetAssetInfo_ALM:
            - asset_id: '${asset_id}'
            - access_token: '${access_token}'
        publish:
          - sys_id_ALM
        navigate:
          - SUCCESS: UpdateStockroom_ALM
    - FailureEmail:
        do:
          AssetDeletion.FailureEmail:
            - errorMessage_status: '${errorMessage_status}'
            - errorMessage_storeroom: '${errorMessage_storeroom}'
            - asset_ID: '${single_asset_to_be_removed}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - SuccessEmail:
        do:
          AssetDeletion.SuccessEmail:
            - asset_ID: '${asset_id}'
            - successMessage_status: '${status}'
            - successMessage_storeroom: '${storeroom}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - UpdateStockroom_ALM:
        do:
          AssetDeletion.UpdateStockroom_ALM:
            - access_token: '${access_token}'
            - sys_id_ALM: '${sys_id_ALM}'
            - storeroom: '${storeroom}'
            - status: '${status}'
        navigate:
          - FAILURE: FailureEmail
          - SUCCESS: SuccessEmail
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_ServiceNow:
        x: 100
        'y': 250
      GetAssetInfo_CI:
        x: 400
        'y': 250
      UpdateHardwareStatus_CI:
        x: 700
        'y': 250
      FailureEmail:
        x: 1600
        'y': 125
        navigate:
          b432c903-a688-29b4-b6f8-4579254b970d:
            targetId: d5318305-db12-e0a4-6bcf-18ed6ea9773b
            port: SUCCESS
          45017e21-6e97-f8a0-a7f4-0562647c310a:
            targetId: d5318305-db12-e0a4-6bcf-18ed6ea9773b
            port: WARNING
      GetAssetInfo_ALM:
        x: 1000
        'y': 250
      UpdateStockroom_ALM:
        x: 1300
        'y': 250
      SuccessEmail:
        x: 1600
        'y': 375
        navigate:
          499e50a1-315f-b262-1794-eb4fe1ae2d0d:
            targetId: d5318305-db12-e0a4-6bcf-18ed6ea9773b
            port: SUCCESS
          3ee870f5-dc67-ccfd-bb39-201e79baefb6:
            targetId: d5318305-db12-e0a4-6bcf-18ed6ea9773b
            port: WARNING
    results:
      SUCCESS:
        d5318305-db12-e0a4-6bcf-18ed6ea9773b:
          x: 1900
          'y': 250
