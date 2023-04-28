namespace: FieldServicesLeaveReporting
flow:
  name: FieldServicesLeaveBalances
  inputs:
    - date:
        required: false
    - reportLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/Reports/'
    - structureLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/SAP Organisational Structures.xlsx'
    - robot: B603
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: DateofRun
          - WARNING: DateofRun
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
        navigate:
          - SUCCESS: LoopLeaveExtractions
          - WARNING: LoopLeaveExtractions
          - FAILURE: on_failure
    - LoopLeaveExtractions:
        loop:
          for: row in loopCount
          do:
            FieldServicesLeaveReporting.LoopLeaveExtractions:
              - processDate: '${currentDate}'
              - processMonth: '${currentMonth}'
              - structureFile: '${structureLocation}'
              - reportFolder: '${reportLocation}'
              - iteration: '${row}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetAccessToken_Teams
          - CUSTOM: GetAccessToken_Teams
    - DateofRun:
        do:
          FieldServicesLeaveReporting.DateofRun:
            - runDate: '${date}'
            - structureLocation: '${structureLocation}'
        publish:
          - currentDate
          - currentMonth
          - loopCount
        navigate:
          - SUCCESS: OpenSAP
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${reportLocation}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
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
    - UploadAllLeaveReportsToTeams:
        do:
          FieldServicesLeaveReporting.UploadAllLeaveReportsToTeams:
            - accessToken: '${accessToken}'
            - structureLocation: '${structureLocation}'
            - month: '${currentMonth}'
            - date: '${currentDate}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: DeleteOldFiles
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51991'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
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
          f073b61d-cb94-484c-d629-d06e6e6f4df3:
            targetId: 6077b060-a009-ce19-d02b-08c957c4ff67
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
        6077b060-a009-ce19-d02b-08c957c4ff67:
          x: 2800
          'y': 150
