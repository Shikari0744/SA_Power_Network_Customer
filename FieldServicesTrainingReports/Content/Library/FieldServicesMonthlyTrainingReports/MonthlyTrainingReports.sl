namespace: FieldServicesMonthlyTrainingReports
flow:
  name: MonthlyTrainingReports
  inputs:
    - saveReportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/'
    - groupSplitHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Training Reports Group Splits.xlsx'
  workflow:
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
          - SUCCESS: DownloadFromEmail
    - DownloadFromEmail:
        do:
          FieldServicesMonthlyTrainingReports.DownloadFromEmail:
            - accessToken: '${accessToken}'
            - location: '${saveReportsHere}'
        publish:
          - SS_complianceCertification
          - SS_complianceCurricula
          - FS_complianceCertification
          - FS_complianceCurricula
          - downloadResponse
        navigate:
          - SUCCESS: GetRowCount
    - GetRowCount:
        do:
          FieldServicesMonthlyTrainingReports.GetRowCount:
            - fileName: '${groupSplitHere}'
        publish:
          - loopCount
          - currentMonth
          - currentDate
          - currentYear
          - reportDate
        navigate:
          - SUCCESS: LoopTrainingReports
    - ClearCompletedColumn:
        do:
          FieldServicesMonthlyTrainingReports.ClearCompletedColumn:
            - groupSplit: '${groupSplitHere}'
        navigate:
          - SUCCESS: DeleteOldFiles
    - LoopTrainingReports:
        loop:
          for: x in loopCount
          do:
            FieldServicesMonthlyTrainingReports.LoopTrainingReports:
              - field_compcertification_location: '${FS_complianceCertification}'
              - field_compcurricula_location: '${FS_complianceCurricula}'
              - shared_compcertification_location: '${SS_complianceCertification}'
              - shared_compcurricula_location: '${SS_complianceCurricula}'
              - process_reportDate: '${reportDate}'
              - process_month: '${currentMonth}'
              - process_year: '${currentYear}'
              - groupSplitLocation: '${groupSplitHere}'
              - reportLocation: '${saveReportsHere}'
          break: []
        navigate:
          - SUCCESS: ClearCompletedColumn
          - FAILURE: LoopTrainingReports
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${saveReportsHere}'
        navigate:
          - SUCCESS: DeleteEmail
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '56923'
        navigate:
          - SUCCESS: SUCCESS
    - DeleteEmail:
        do:
          FieldServicesMonthlyTrainingReports.DeleteEmail:
            - accessToken: '${accessToken}'
        publish:
          - deleteResponse
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_HTTP:
        x: 100
        'y': 150
      DownloadFromEmail:
        x: 400
        'y': 150
      GetRowCount:
        x: 700
        'y': 150
      LoopTrainingReports:
        x: 1000
        'y': 150
      ClearCompletedColumn:
        x: 1300
        'y': 150
      DeleteOldFiles:
        x: 1600
        'y': 150
      DeleteEmail:
        x: 1900
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 2200
        'y': 150
        navigate:
          e141a804-6882-b7dd-f30e-b24d0b607607:
            targetId: 266675dd-3796-6d65-e128-b2f5eb6042f3
            port: SUCCESS
    results:
      SUCCESS:
        266675dd-3796-6d65-e128-b2f5eb6042f3:
          x: 2500
          'y': 150
