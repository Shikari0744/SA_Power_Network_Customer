namespace: AssetDeletion
flow:
  name: UploadDocumentToTeams
  inputs:
    - accessToken
    - singleAsset:
        required: false
  workflow:
    - UploadOfExcel:
        do:
          AssetDeletion.UploadOfExcel:
            - accessToken: '${accessToken}'
            - singleAsset: '${singleAsset}'
        navigate:
          - SUCCESS: DeleteExcel
    - DeleteExcel:
        do:
          AssetDeletion.DeleteExcel:
            - singleAsset: '${singleAsset}'
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
      UploadOfExcel:
        x: 100
        'y': 150
      DeleteExcel:
        x: 400
        'y': 150
        navigate:
          258b2023-c0ab-2d5f-39ed-f57b11a9419d:
            targetId: 96841ba1-6988-b293-acc9-dcf315e44fbf
            port: SUCCESS
          f9bc6233-4f62-9891-b8f7-ccd234079c57:
            targetId: 96841ba1-6988-b293-acc9-dcf315e44fbf
            port: WARNING
    results:
      SUCCESS:
        96841ba1-6988-b293-acc9-dcf315e44fbf:
          x: 700
          'y': 150
