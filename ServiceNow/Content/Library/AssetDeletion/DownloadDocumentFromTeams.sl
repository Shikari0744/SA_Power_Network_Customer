namespace: AssetDeletion
flow:
  name: DownloadDocumentFromTeams
  inputs:
    - singleAsset:
        required: false
  workflow:
    - GetAccessToken_Teams:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('removeassetsAPIUSER')}"
            - Password:
                value: "${get_sp('removeassetsAPIPASS')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: DownloadOfExcel
    - DownloadOfExcel:
        do:
          AssetDeletion.DownloadOfExcel:
            - accessToken: '${accessToken}'
            - singleAsset: '${singleAsset}'
        publish:
          - filePath
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - locationOfDownloadedExcel: '${filePath}'
    - accessToken_Teams: '${accessToken}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      DownloadOfExcel:
        x: 400
        'y': 150
        navigate:
          2a66bada-2e85-5140-cca8-85cffbfd58ea:
            targetId: b2410797-fca3-c219-67da-c257be58add7
            port: SUCCESS
    results:
      SUCCESS:
        b2410797-fca3-c219-67da-c257be58add7:
          x: 700
          'y': 150
