namespace: FieldServicesMonthlyTrainingReports
flow:
  name: MonthlyTrainingReports_ReportsAlreadyDownloaded
  inputs:
    - saveReportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/'
    - groupSplitHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Training Reports Group Splits.xlsx'
    - fs_cert: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Field Services Compliance Certification Report (Operational Reporting - Hierarchy Manager).xlsx'
    - fs_curr: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Field Services Compliance Curricula Report (Operational Reporting - Hierarchy Manager).xlsx'
    - ss_cert: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Shared Services Compliance Certification Report (Operational Reporting - Hierarchy Manager).xlsx'
    - ss_curr: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Monthly Training Reports/Shared Services Compliance Curricula Report (Operational Reporting - Hierarchy Manager).xlsx'
  workflow:
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
              - field_compcertification_location: '${fs_cert}'
              - field_compcurricula_location: '${fs_curr}'
              - shared_compcertification_location: '${ss_cert}'
              - shared_compcurricula_location: '${ss_curr}'
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
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '56923'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      GetRowCount:
        x: 100
        'y': 150
      LoopTrainingReports:
        x: 400
        'y': 150
      ClearCompletedColumn:
        x: 700
        'y': 150
      DeleteOldFiles:
        x: 1000
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1300
        'y': 150
        navigate:
          cca105fa-87f3-37d2-39e8-2467cca9f985:
            targetId: ead714fd-14e0-86a2-2945-2616b83475cc
            port: SUCCESS
    results:
      SUCCESS:
        ead714fd-14e0-86a2-2945-2616b83475cc:
          x: 1600
          'y': 150
