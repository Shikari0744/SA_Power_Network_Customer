namespace: AssetDeletion
flow:
  name: Remove_Asset_From_AD_SCCM
  inputs:
    - singleAssetToUpdate_ID:
        required: false
    - singleAssetToUpdate_status:
        required: false
    - singleAssetToUpdate_storeroom:
        required: false
  workflow:
    - DownloadDocumentFromTeams:
        do:
          AssetDeletion.DownloadDocumentFromTeams:
            - singleAsset: '${singleAssetToUpdate_ID}'
        publish:
          - locationOfDownloadedExcel
          - accessToken_Teams
        navigate:
          - SUCCESS: ExcelDocumentOfAssets
          - FAILURE: on_failure
    - ExcelDocumentOfAssets:
        do:
          AssetDeletion.ExcelDocumentOfAssets:
            - excelLocation: '${locationOfDownloadedExcel}'
            - singleAsset_ID: '${singleAssetToUpdate_ID}'
            - singleAsset_status: '${singleAssetToUpdate_status}'
            - singleAsset_stockroom: '${singleAssetToUpdate_storeroom}'
        publish:
          - asset_info
          - errorMessage_asset
        navigate:
          - SUCCESS: APIcallsToUpdateAsset
          - WARNING: APIcallsToUpdateAsset
          - FAILURE: FailureEmail
    - APIcallsToUpdateAsset:
        loop:
          for: asset in asset_info
          do:
            AssetDeletion.APIcallsToUpdateAsset:
              - single_asset_to_be_removed: '${asset}'
              - username_serviceNow: "${get_sp('servicenowAPIUSER')}"
              - password_serviceNow:
                  value: "${get_sp('servicenowAPIPASS')}"
                  sensitive: true
          break: []
        navigate:
          - SUCCESS: UploadDocumentToTeams
          - FAILURE: FailureEmail
    - UploadDocumentToTeams:
        do:
          AssetDeletion.UploadDocumentToTeams:
            - accessToken: '${accessToken_Teams}'
            - singleAsset: '${singleAssetToUpdate_ID}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - FailureEmail:
        do:
          AssetDeletion.FailureEmail:
            - errorMessage_asset: '${errorMessage_asset}'
            - asset_ID: '${singleAssetToUpdate_ID}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      DownloadDocumentFromTeams:
        x: 100
        'y': 250
      ExcelDocumentOfAssets:
        x: 400
        'y': 250
      APIcallsToUpdateAsset:
        x: 700
        'y': 125
      UploadDocumentToTeams:
        x: 1000
        'y': 125
        navigate:
          ea02b66b-19c0-bdca-d6eb-00d6380ea64f:
            targetId: 4907c638-9479-c7a7-2d48-a320defdee3b
            port: SUCCESS
      FailureEmail:
        x: 700
        'y': 375
        navigate:
          22a5ca97-8a5b-c572-04b8-2e467e37b4e5:
            targetId: 4907c638-9479-c7a7-2d48-a320defdee3b
            port: SUCCESS
          7cbc1e73-2ce2-1f7e-7a5c-ef2ae58975e6:
            targetId: 4907c638-9479-c7a7-2d48-a320defdee3b
            port: WARNING
    results:
      SUCCESS:
        4907c638-9479-c7a7-2d48-a320defdee3b:
          x: 1000
          'y': 375
