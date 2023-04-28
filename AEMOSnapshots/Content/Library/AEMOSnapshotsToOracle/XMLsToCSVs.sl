namespace: AEMOSnapshotsToOracle
flow:
  name: XMLsToCSVs
  inputs:
    - location
    - downloadLog
    - folderName
  workflow:
    - GetAccessToken_Teams:
        worker_group: B604
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('svcrpabotAPIuser')}"
            - Password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Download_All
    - Download_All:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Download_All:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
            - downloadlog: '${downloadLog}'
            - folderName: '${folderName}'
        publish:
          - successfulResult
          - failureResult
          - xmlFile
        navigate:
          - FAILURE: on_failure
          - SUCCESS: ParseXMLtoCSV
    - ParseXMLtoCSV:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.ParseXMLtoCSV:
            - downloadlog: '${downloadLog}'
            - xmlFile: '${xmlFile}'
            - folderName: '${folderName}'
            - folderdirec: '${location}'
        publish:
          - completed
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      Download_All:
        x: 400
        'y': 150
      ParseXMLtoCSV:
        x: 700
        'y': 150
        navigate:
          6588a466-185e-6ca1-34af-8a6466b83d16:
            targetId: 2966547d-a63d-5dda-ebbb-3d2822d06f7d
            port: SUCCESS
    results:
      SUCCESS:
        2966547d-a63d-5dda-ebbb-3d2822d06f7d:
          x: 1000
          'y': 150
