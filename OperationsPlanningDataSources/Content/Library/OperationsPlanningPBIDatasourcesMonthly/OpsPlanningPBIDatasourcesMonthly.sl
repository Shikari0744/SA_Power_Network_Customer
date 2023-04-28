namespace: OperationsPlanningPBIDatasourcesMonthly
flow:
  name: OpsPlanningPBIDatasourcesMonthly
  inputs:
    - filesHere: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Operations Planning PBI Data Sources\\"
    - loopTrendDataFile: Loop_Trend_data.xlsx
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - 1_LoopTrendData:
        do:
          OperationsPlanningPBIDatasourcesMonthly.1_LoopTrendData:
            - location: '${filesHere}'
            - looptrend: '${loopTrendDataFile}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: FailureNotification
    - GetAccessToken_Teams_1:
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
          - SUCCESS: UploadFiles
    - UploadFiles:
        do:
          OperationsPlanningPBIDatasourcesMonthly.UploadFiles:
            - accessToken: '${accessToken}'
            - LoopTrend: '${loopTrendDataFile}'
            - filePath: '${filesHere}'
        publish:
          - response
        navigate:
          - FAILURE: on_failure
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - GetAccessToken_Teams:
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
          - SUCCESS: DownloadFiles
    - FailureNotification:
        do:
          OperationsPlanningPBIDatasourcesMonthly.FailureNotification:
            - currentReport: '${loopTrendDataFile}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - DownloadFiles:
        do:
          OperationsPlanningPBIDatasourcesMonthly.DownloadFiles:
            - accessToken: '${accessToken}'
            - filePath: '${filesHere}'
            - LoopTrend: '${loopTrendDataFile}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: 1_LoopTrendData
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62667'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 1600
        'y': 150
      GetAccessToken_Teams_1:
        x: 1900
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 2500
        'y': 150
        navigate:
          bb5b9bde-9a82-bb4a-031b-13ec08b77a65:
            targetId: 13c97d92-69af-68a1-31de-847864813117
            port: SUCCESS
      DownloadFiles:
        x: 700
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      1_LoopTrendData:
        x: 1000
        'y': 150
      FailureNotification:
        x: 1280
        'y': 360
      UploadFiles:
        x: 2200
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
    results:
      SUCCESS:
        13c97d92-69af-68a1-31de-847864813117:
          x: 2800
          'y': 150
