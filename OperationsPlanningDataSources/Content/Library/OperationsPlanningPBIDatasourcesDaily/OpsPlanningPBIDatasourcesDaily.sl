namespace: OperationsPlanningPBIDatasourcesDaily
flow:
  name: OpsPlanningPBIDatasourcesDaily
  inputs:
    - filesHere: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Operations Planning PBI Data Sources\\"
    - wihFile: WIH Data.xlsx
    - wihProcessFile: Data_WIHProcessView.xlsx
    - estVactFile: Data_Estimate v Actuals.xlsx
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - 2_DataWIHProcessView:
        do:
          OperationsPlanningPBIDatasourcesDaily.2_DataWIHProcessView:
            - location: '${filesHere}'
            - dataWIHProcess: '${wihProcessFile}'
            - environment: prd
        publish:
          - originalUpdate
          - updated
          - reason
        navigate:
          - SUCCESS: Kill_ProcessByName_2
          - WARNING: Kill_ProcessByName_2
          - FAILURE: Kill_ProcessByName_2
    - 3_WIHData:
        do:
          OperationsPlanningPBIDatasourcesDaily.3_WIHData:
            - location: '${filesHere}'
            - wihdata: '${wihFile}'
            - environment: prd
        publish:
          - originalUpdate
          - updated
          - reason
        navigate:
          - SUCCESS: Kill_ProcessByName_3
          - WARNING: Kill_ProcessByName_3
          - FAILURE: Kill_ProcessByName_3
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: 2_DataWIHProcessView
          - WARNING: 2_DataWIHProcessView
          - FAILURE: on_failure
    - Kill_ProcessByName_2:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: 3_WIHData
          - WARNING: 3_WIHData
          - FAILURE: on_failure
    - Kill_ProcessByName_3:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: FinishedNotification
          - WARNING: FinishedNotification
          - FAILURE: on_failure
    - UploadFiles:
        do:
          OperationsPlanningPBIDatasourcesDaily.UploadFiles:
            - accessToken: '${accessToken}'
            - WIH: '${wihFile}'
            - WIHProcess: '${wihProcessFile}'
            - EstVAct: '${estVactFile}'
            - filePath: '${filesHere}'
        publish:
          - response
        navigate:
          - FAILURE: on_failure
          - SUCCESS: STATS_IncreaseRunCountInDevOps
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
    - 1_DataEstimateVActuals:
        do:
          OperationsPlanningPBIDatasourcesDaily.1_DataEstimateVActuals: []
        publish:
          - originalUpdate
          - updated
          - reason
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: Kill_ProcessByName_1
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
    - DownloadFiles:
        do:
          OperationsPlanningPBIDatasourcesDaily.DownloadFiles:
            - accessToken: '${accessToken}'
            - filePath: '${filesHere}'
            - WIH: '${wihFile}'
            - WIHProcess: '${wihProcessFile}'
            - EstVAct: '${estVactFile}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: 1_DataEstimateVActuals
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51993'
        navigate:
          - SUCCESS: SUCCESS
    - FinishedNotification:
        do:
          OperationsPlanningPBIDatasourcesDaily.FinishedNotification: []
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 1300
        'y': 150
      Kill_ProcessByName_2:
        x: 1900
        'y': 150
      Kill_ProcessByName_3:
        x: 2500
        'y': 150
      GetAccessToken_Teams_1:
        x: 3100
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 3700
        'y': 150
        navigate:
          20ece5dd-9417-6b4d-e2bc-8839be720cde:
            targetId: bb7dbfde-31b1-7bfe-012c-b8ca614ff4e1
            port: SUCCESS
      DownloadFiles:
        x: 700
        'y': 150
      1_DataEstimateVActuals:
        x: 1000
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      3_WIHData:
        x: 2200
        'y': 150
      2_DataWIHProcessView:
        x: 1600
        'y': 150
      UploadFiles:
        x: 3400
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      FinishedNotification:
        x: 2800
        'y': 150
    results:
      SUCCESS:
        bb7dbfde-31b1-7bfe-012c-b8ca614ff4e1:
          x: 4000
          'y': 150
