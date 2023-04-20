namespace: FieldServicesConsolidatedLeaveReporting
flow:
  name: ConsolidatedFieldServicesLeaveBalances
  inputs:
    - date:
        required: false
    - reportLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/Reports/'
    - structureLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/Consolidated Organisational Structures.xlsx'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: DateofRun
          - WARNING: DateofRun
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcfsleavebUSER')}"
            - pass:
                value: "${get_sp('svcfsleavebPASS')}"
                sensitive: true
            - environment: PRD
            - system: ERP
        publish: []
        navigate:
          - SUCCESS: LoopLeaveExtractions
          - WARNING: LoopLeaveExtractions
          - FAILURE: on_failure
    - LoopLeaveExtractions:
        loop:
          for: x in loopCount
          do:
            FieldServicesConsolidatedLeaveReporting.LoopLeaveExtractions:
              - processDate: '${currentDate}'
              - processMonth: '${currentMonth}'
              - structureFile: '${structureLocation}'
              - reportFolder: '${reportLocation}'
              - iteration: '${x}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetAccessToken_Teams
    - DateofRun:
        do:
          FieldServicesConsolidatedLeaveReporting.DateofRun:
            - runDate: '${date}'
            - structureLocation: '${structureLocation}'
        publish:
          - currentDate
          - currentMonth
          - loopCount
        navigate:
          - SUCCESS: OpenSAP
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${reportLocation}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
    - UploadAllLeaveReportsToTeams:
        do:
          FieldServicesConsolidatedLeaveReporting.UploadAllLeaveReportsToTeams:
            - accessToken: '${accessToken}'
            - month: '${currentMonth}'
            - date: '${currentDate}'
            - structureLocation: '${structureLocation}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: DeleteOldFiles
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
          - SUCCESS: UploadAllLeaveReportsToTeams
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62666'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 2200
        'y': 150
      DateofRun:
        x: 400
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 2500
        'y': 150
        navigate:
          f893d8d7-e082-5bcd-7408-fe74b73ac48c:
            targetId: bde911ad-f90d-6b69-715d-85dcb5e04245
            port: SUCCESS
      Kill_ProcessByName:
        x: 100
        'y': 150
      UploadAllLeaveReportsToTeams:
        x: 1600
        'y': 150
      GetAccessToken_Teams:
        x: 1300
        'y': 150
      OpenSAP:
        x: 700
        'y': 150
      LoopLeaveExtractions:
        x: 1000
        'y': 150
      DeleteOldFiles:
        x: 1900
        'y': 150
    results:
      SUCCESS:
        bde911ad-f90d-6b69-715d-85dcb5e04245:
          x: 2800
          'y': 150
