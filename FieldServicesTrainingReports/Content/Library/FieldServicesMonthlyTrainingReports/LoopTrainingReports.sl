namespace: FieldServicesMonthlyTrainingReports
flow:
  name: LoopTrainingReports
  inputs:
    - field_compcertification_location
    - field_compcurricula_location
    - shared_compcertification_location
    - shared_compcurricula_location
    - process_reportDate
    - process_month
    - process_year
    - groupSplitLocation
    - reportLocation
  workflow:
    - CreateCombinedReport:
        do:
          FieldServicesMonthlyTrainingReports.CreateCombinedReport:
            - groupSplits: '${groupSplitLocation}'
            - fileLocation: '${reportLocation}'
            - fs_certification: '${field_compcertification_location}'
            - fs_curricula: '${field_compcurricula_location}'
            - ss_certification: '${shared_compcertification_location}'
            - ss_curricula: '${shared_compcurricula_location}'
            - reportDate: '${process_reportDate}'
        publish:
          - combinedReport
          - folder
          - finished
        navigate:
          - SUCCESS: GetAccessToken_Teams
    - UploadTrainingReportToTeams:
        do:
          FieldServicesMonthlyTrainingReports.UploadTrainingReportToTeams:
            - accessToken: '${accessToken}'
            - fileLocation: '${reportLocation}'
            - fileName: '${combinedReport}'
            - folder: '${folder}'
            - month: '${process_month}'
            - year: '${process_year}'
            - finished: '${finished}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: SUCCESS
          - SUCCESS: SUCCESS
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
          - SUCCESS: ValidateReport
    - ValidateReport:
        do:
          FieldServicesMonthlyTrainingReports.ValidateReport:
            - completedReportName: '${combinedReport}'
            - fileLocation: '${reportLocation}'
            - groupSplits: '${groupSplitLocation}'
            - accesstoken: '${accessToken}'
        navigate:
          - SUCCESS: UploadTrainingReportToTeams
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      CreateCombinedReport:
        x: 100
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      ValidateReport:
        x: 700
        'y': 150
      UploadTrainingReportToTeams:
        x: 1000
        'y': 150
        navigate:
          56850818-148d-383b-0437-da0cf53b1e23:
            targetId: 35d9d584-457d-3e04-f0af-c9baa10d5e2b
            port: FAILURE
          7f0368fa-39f8-6929-f2ae-e23ff1493dc6:
            targetId: 35d9d584-457d-3e04-f0af-c9baa10d5e2b
            port: SUCCESS
    results:
      SUCCESS:
        35d9d584-457d-3e04-f0af-c9baa10d5e2b:
          x: 1300
          'y': 150
