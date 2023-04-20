namespace: FieldServicesTrendReporting
flow:
  name: FieldServicesFullnessReporting
  inputs:
    - robot: B603
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - GetAccessToken_Teams:
        worker_group: '${robot}'
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
          - SUCCESS: DownloadSharePointFile
    - DownloadSharePointFile:
        worker_group: '${robot}'
        do:
          FieldServicesTrendReporting.DownloadSharePointFile:
            - accessToken: '${accessToken}'
        navigate:
          - SUCCESS: FieldServicesFullnessReport
    - FieldServicesFullnessReport:
        robot_group: '${robot}'
        do:
          FieldServicesTrendReporting.FieldServicesFullnessReport: []
        navigate:
          - SUCCESS: UploadFiletoSharePoint
          - WARNING: UploadFiletoSharePoint
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - Send_Email:
        robot_group: '${robot}'
        do:
          FieldServicesTrendReporting.Send_Email: []
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - UploadFiletoSharePoint:
        worker_group: '${robot}'
        do:
          FieldServicesTrendReporting.UploadFiletoSharePoint:
            - accessToken: '${accessToken}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Send_Email
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      DownloadSharePointFile:
        x: 700
        'y': 150
      FieldServicesFullnessReport:
        x: 1000
        'y': 150
      UploadFiletoSharePoint:
        x: 1300
        'y': 150
      Send_Email:
        x: 1600
        'y': 150
      Kill_ProcessByName_1:
        x: 1900
        'y': 150
        navigate:
          45e09493-3002-2160-e9a1-0ac557e57891:
            targetId: 6a1bd35f-b045-b350-eba7-943e2c0e0e40
            port: SUCCESS
          2a336c71-b494-79a0-3d18-f50dd97718e6:
            targetId: 6a1bd35f-b045-b350-eba7-943e2c0e0e40
            port: WARNING
    results:
      SUCCESS:
        6a1bd35f-b045-b350-eba7-943e2c0e0e40:
          x: 2200
          'y': 150
