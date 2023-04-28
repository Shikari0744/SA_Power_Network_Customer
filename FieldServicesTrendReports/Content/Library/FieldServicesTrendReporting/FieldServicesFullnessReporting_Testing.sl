namespace: FieldServicesTrendReporting
flow:
  name: FieldServicesFullnessReporting_Testing
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
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
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
      Kill_ProcessByName_1:
        x: 1300
        'y': 150
        navigate:
          396e1a22-3401-3112-e648-390bf845daab:
            targetId: 98e7172f-67f2-5f6e-85f0-d1cbd08cfa1b
            port: SUCCESS
          d2398775-dbf8-eb24-5eb8-f5759e1a1a85:
            targetId: 98e7172f-67f2-5f6e-85f0-d1cbd08cfa1b
            port: WARNING
    results:
      SUCCESS:
        98e7172f-67f2-5f6e-85f0-d1cbd08cfa1b:
          x: 1600
          'y': 150
