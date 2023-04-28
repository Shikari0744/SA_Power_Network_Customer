namespace: AEMO_Compliance_Reporting
flow:
  name: Compliance_Reporting_ManualDownload
  inputs:
    - DateForRunningReports:
        required: false
    - robot: B601
    - location
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - GetCurrentWeekNumber:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.GetCurrentWeekNumber:
            - calenderFilePath: '${AEMO_CalenderFile}'
            - rptDate: '${DateForRunningReports}'
        publish:
          - currentWeekNumber
          - todayDate
        navigate:
          - SUCCESS: MSATS_Login_Download
          - WARNING: MSATS_Login_Download
          - FAILURE: on_failure
    - MSATS_Login_Download:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.MSATS_Login_Download:
            - LNSP_User: "${get_sp('lnspbot1USER')}"
            - LNSP_Pass: "${get_sp('lnspbot1PASS')}"
            - MP_User: "${get_sp('mpbbot1USER')}"
            - MDP_User: "${get_sp('mdpbot1USER')}"
            - MP_Pass: "${get_sp('mpbbot1PASS')}"
            - MDP_Pass: "${get_sp('mdpbot1PASS')}"
            - DateForRpt: '${todayDate}'
            - location: '${location}'
            - downloadReports: 'No'
        publish:
          - dateForRptName
          - ReportRole
          - return_result
          - error_message
          - rptDownloadFolder
          - formatrptFolder
          - xlsWorkingFolder
          - currentdayofWeek
          - dateForLastWeekRpt
          - teamsRptFolder
          - ReportsDownloaded
        navigate:
          - SUCCESS: CheckIfReportsDownloaded
          - WARNING: CheckIfReportsDownloaded
          - FAILURE: on_failure
    - ExtractData:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.ExtractData:
            - fileNameString: '${dateForRptName}'
            - weeknumber: '${currentWeekNumber}'
            - rptRole: '${ReportRole}'
            - location: '${location}'
            - prevWeekrptdate: '${dateForLastWeekRpt}'
            - TodaydayofWeek: '${currentdayofWeek}'
        publish:
          - wipDataFileName
          - summaryFileName
          - prevWeekRptName
        navigate:
          - SUCCESS: FormatCleanup
          - WARNING: FormatCleanup
          - FAILURE: on_failure
    - FormatCleanup:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.FormatCleanup:
            - wipFile: '${wipDataFileName}'
            - weekDay: '${currentdayofWeek}'
            - location: '${location}'
        navigate:
          - SUCCESS: DownloadTeamsFile
          - WARNING: DownloadTeamsFile
          - FAILURE: on_failure
    - DownloadTeamsFile:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.DownloadTeamsFile:
            - accessToken: '${accessToken}'
            - FileName: '${prevWeekRptName}'
            - teamsFolder: '${teamsRptFolder}'
            - location: '${location}'
        publish:
          - trackingFile
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Lookup_Compare
    - Lookup_Compare:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.Lookup_Compare:
            - PreviousDayFile: '${prevWeekRptName}'
            - location: '${location}'
            - PresentDayFile: '${wipDataFileName}'
            - todayWeekday: '${currentdayofWeek}'
        navigate:
          - SUCCESS: ArchiveOldFiles
          - WARNING: ArchiveOldFiles
          - FAILURE: on_failure
    - UploadFiletoTeams:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.UploadFiletoTeams:
            - FileName: '${wipDataFileName}'
            - accessToken: '${accessToken}'
            - teamsFolder: '${teamsRptFolder}'
            - location: '${location}'
        publish:
          - failureResult
          - successfulResult
        navigate:
          - FAILURE: DownloadTeamsFile_1
          - SUCCESS: Send_Email
    - DownloadTeamsFile_1:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.DownloadTeamsFile:
            - accessToken: '${accessToken}'
            - FileName: AEMO Compliance Summary Report - Performance Tracking 2022_2023.xlsx
            - teamsFolder: 'Compliance%20Reporting%20Summary'
            - location: '${location}'
        publish:
          - trackingFile
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Update_PerformanceTrackingSheet
    - Update_PerformanceTrackingSheet:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.Update_PerformanceTrackingSheet:
            - dayofWeek: '${currentdayofWeek}'
            - role: '${ReportRole}'
            - SummaryDoc: '${summaryFileName}'
            - PerfTrackingDate: '${todayDate}'
            - location: '${location}'
        navigate:
          - SUCCESS: UploadFiletoTeams_1
          - WARNING: UploadFiletoTeams_1
          - FAILURE: on_failure
    - UploadFiletoTeams_1:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.UploadFiletoTeams:
            - accessToken: '${accessToken}'
            - teamsFolder: 'Compliance%20Reporting%20Summary'
            - location: '${location}'
        publish:
          - failureResult
          - successfulResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Send_Email
    - TeamsDownload_CalenderFile:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.TeamsDownload_CalenderFile:
            - accessToken: '${accessToken}'
            - location: '${location}'
        publish:
          - AEMO_CalenderFile
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetCurrentWeekNumber
    - ArchiveOldFiles:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.ArchiveOldFiles:
            - Teams_Folder: '${teamsRptFolder}'
            - accessToken: '${accessToken}'
        navigate:
          - SUCCESS: UploadFiletoTeams
    - Send_Email:
        robot_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.Send_Email:
            - RunDate: '${DateForRunningReports}'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
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
          - SUCCESS: TeamsDownload_CalenderFile
    - CheckIfReportsDownloaded:
        worker_group: '${robot}'
        do:
          AEMO_Compliance_Reporting.CheckIfReportsDownloaded:
            - reportsDownloaded: '${ReportsDownloaded}'
        navigate:
          - CUSTOM: CUSTOM
          - SUCCESS: ExtractData
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51010'
        navigate:
          - SUCCESS: SUCCESS
    - on_failure:
        - FailureNotification:
            do:
              AEMO_Compliance_Reporting.FailureNotification: []
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      GetCurrentWeekNumber:
        x: 1000
        'y': 250
      Lookup_Compare:
        x: 2800
        'y': 250
      CheckIfReportsDownloaded:
        x: 1600
        'y': 250
        navigate:
          e0a3bccf-fbcb-9668-ec1e-2703c6e04600:
            targetId: be9f1d99-b2bf-eeea-6a75-5837b68a58ed
            port: CUSTOM
      MSATS_Login_Download:
        x: 1300
        'y': 250
      Send_Email:
        x: 3700
        'y': 375
      STATS_IncreaseRunCountInDevOps:
        x: 4000
        'y': 375
        navigate:
          37847cb1-6f45-4676-53f4-311ed0bf46c7:
            targetId: 8ba8fb47-11b5-5b6f-11d4-0f0211a5b3d7
            port: SUCCESS
      DownloadTeamsFile:
        x: 2500
        'y': 250
      ExtractData:
        x: 1900
        'y': 375
      FormatCleanup:
        x: 2200
        'y': 250
      Update_PerformanceTrackingSheet:
        x: 4000
        'y': 125
      UploadFiletoTeams_1:
        x: 4300
        'y': 125
      Kill_ProcessByName:
        x: 100
        'y': 250
      ArchiveOldFiles:
        x: 3100
        'y': 250
      GetAccessToken_Teams:
        x: 400
        'y': 250
      TeamsDownload_CalenderFile:
        x: 700
        'y': 250
      DownloadTeamsFile_1:
        x: 3700
        'y': 125
      UploadFiletoTeams:
        x: 3400
        'y': 250
    results:
      SUCCESS:
        8ba8fb47-11b5-5b6f-11d4-0f0211a5b3d7:
          x: 4300
          'y': 375
      CUSTOM:
        be9f1d99-b2bf-eeea-6a75-5837b68a58ed:
          x: 1900
          'y': 125
