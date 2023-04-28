namespace: MarketDemandHistory
flow:
  name: MarketDemandHistoryForRetailers
  inputs:
    - file: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Market Demand History\\"
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - GetDemandHistory:
        do:
          MarketDemandHistory.GetDemandHistory:
            - location: '${file}'
        publish:
          - emailLogTextFile
          - completedBPEMs
        navigate:
          - SUCCESS: GetAccessToken_HTTP
          - WARNING: GetAccessToken_HTTP
          - FAILURE: GetAccessToken_HTTP
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcdemandhisUSER')}"
            - pass:
                value: "${get_sp('svcdemandhisPASS')}"
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: GetDemandHistory
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - GetAccessToken_HTTP:
        do:
          GenericActivities.GetAccessToken_HTTP:
            - username: "${get_sp('svcrpabotAPIuser')}"
            - password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: RetailerEmail
    - RetailerEmail:
        do:
          MarketDemandHistory.RetailerEmail:
            - accesstoken: '${accessToken}'
            - emailTextFile: '${emailLogTextFile}'
        publish:
          - emailsSent
          - results
        navigate:
          - WARNING: DeleteOldFiles
          - SUCCESS: DeleteOldFiles
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${file}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '54490'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 250
      OpenSAP:
        x: 400
        'y': 250
        navigate:
          f2794404-7748-d5f2-53c5-7ed7824b332d:
            targetId: 8e30eb07-140f-8fdf-cedb-2e26a240c20b
            port: WARNING
      GetDemandHistory:
        x: 700
        'y': 125
      GetAccessToken_HTTP:
        x: 1000
        'y': 250
      RetailerEmail:
        x: 1300
        'y': 250
      DeleteOldFiles:
        x: 1600
        'y': 250
      Kill_ProcessByName_1:
        x: 1900
        'y': 250
      STATS_IncreaseRunCountInDevOps:
        x: 2200
        'y': 250
        navigate:
          51fce61c-8b04-9817-5e57-43655a4d3dbf:
            targetId: 33683068-190a-a12e-1be7-89543acd26bf
            port: SUCCESS
    results:
      CUSTOM:
        8e30eb07-140f-8fdf-cedb-2e26a240c20b:
          x: 700
          'y': 375
      SUCCESS:
        33683068-190a-a12e-1be7-89543acd26bf:
          x: 2500
          'y': 250
