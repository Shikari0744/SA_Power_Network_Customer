namespace: OperationsPlanningPBIDatasourcesMonthly
flow:
  name: OpsPlanningPBIDatasourcesMonthly_FirstMonth
  inputs:
    - filesHere: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Operations Planning PBI Data Sources\\"
    - loopTrendDataFile: Loop_Trend_data.xlsx
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: 1_LoopTrendData
          - WARNING: 1_LoopTrendData
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
          - SUCCESS: SUCCESS
    - FailureNotification:
        do:
          OperationsPlanningPBIDatasourcesMonthly.FailureNotification:
            - currentReport: '${loopTrendDataFile}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      1_LoopTrendData:
        x: 400
        'y': 150
      Kill_ProcessByName_1:
        x: 1000
        'y': 150
      GetAccessToken_Teams_1:
        x: 1300
        'y': 150
      UploadFiles:
        x: 1600
        'y': 150
        navigate:
          04216800-8c92-b37b-9eff-e307cdadd017:
            targetId: af881cb9-1566-87a1-ce37-1722035505c5
            port: SUCCESS
      FailureNotification:
        x: 680
        'y': 360
    results:
      SUCCESS:
        af881cb9-1566-87a1-ce37-1722035505c5:
          x: 1900
          'y': 150
