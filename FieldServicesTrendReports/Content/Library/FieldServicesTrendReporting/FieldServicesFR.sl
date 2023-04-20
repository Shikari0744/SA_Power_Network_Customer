namespace: FieldServicesTrendReporting
flow:
  name: FieldServicesFR
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
    - UploadFiletoSharePoint:
        worker_group: '${robot}'
        do:
          FieldServicesTrendReporting.UploadFiletoSharePoint:
            - accessToken: '${accessToken}'
        navigate:
          - FAILURE: CUSTOM
          - SUCCESS: Send_Email
    - Send_Email:
        robot_group: '${robot}'
        do:
          FieldServicesTrendReporting.Send_Email: []
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62365'
        navigate:
          - SUCCESS: SUCCESS
    - on_failure:
        - FailureNotification:
            do:
              FieldServicesTrendReporting.FailureNotification:
                - robot: '${robot}'
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 250
      GetAccessToken_Teams:
        x: 400
        'y': 250
      DownloadSharePointFile:
        x: 700
        'y': 250
      FieldServicesFullnessReport:
        x: 1000
        'y': 250
      UploadFiletoSharePoint:
        x: 1300
        'y': 250
        navigate:
          b6f50faa-03de-4807-46b7-483663c6fe2a:
            targetId: b345a089-65ef-2ea3-86c9-52d24933b435
            port: FAILURE
      Send_Email:
        x: 1600
        'y': 375
      Kill_ProcessByName_1:
        x: 1840
        'y': 400
      STATS_IncreaseRunCountInDevOps:
        x: 2040
        'y': 400
        navigate:
          2a5ebbb3-7c6f-90a8-9081-a2f518b1ed74:
            targetId: 84f74148-bb56-b0fd-50c7-997013c46c2e
            port: SUCCESS
    results:
      SUCCESS:
        84f74148-bb56-b0fd-50c7-997013c46c2e:
          x: 2200
          'y': 400
      CUSTOM:
        b345a089-65ef-2ea3-86c9-52d24933b435:
          x: 1600
          'y': 125
