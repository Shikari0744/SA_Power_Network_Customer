namespace: AEMOSnapshots
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
          AEMOSnapshots.Download_All:
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
          AEMOSnapshots.ParseXMLtoCSV:
            - downloadlog: '${downloadLog}'
            - xmlFile: '${xmlFile}'
            - folderName: '${folderName}'
            - folderdirec: '${location}'
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
          43049be8-e40c-eb53-df75-cfad2ad9bbae:
            targetId: f06c77e7-3d98-095c-cce4-239a09ef2cf0
            port: SUCCESS
    results:
      SUCCESS:
        f06c77e7-3d98-095c-cce4-239a09ef2cf0:
          x: 1000
          'y': 150
