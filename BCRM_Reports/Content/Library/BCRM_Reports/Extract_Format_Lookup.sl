########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: BCRM_Reports
flow:
  name: Extract_Format_Lookup
  inputs:
    - ReportsDate:
        required: false
    - robot
    - location: "C:\\Users\\SVCRPABOT\\OneDrive - SA Power Networks\\AEMO Reports\\MDP Reports\\"
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: CleanupAndPrepare
          - WARNING: CleanupAndPrepare
          - FAILURE: on_failure
    - CleanupAndPrepare:
        robot_group: '${robot}'
        do:
          BCRM_Reports.CleanupAndPrepare:
            - location: '${location}'
        publish:
          - oldReports
          - xmlFolder
          - excelFolder
          - formattedFiles
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - TeamsDownload_CalenderFile:
        worker_group: '${robot}'
        do:
          BCRM_Reports.TeamsDownload_CalenderFile:
            - accessToken: '${accessToken}'
            - location: '${location}'
        publish:
          - AEMO_CalenderFile
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetDateFrom_LogFile
    - GetDateFrom_LogFile:
        robot_group: '${robot}'
        do:
          BCRM_Reports.GetDateFrom_LogFile:
            - RunDate: '${ReportsDate}'
            - location: '${location}'
        publish:
          - currReportDate
          - oldRptNameStr
        navigate:
          - SUCCESS: ArchiveOldFiles
          - WARNING: ArchiveOldFiles
          - FAILURE: on_failure
    - ArchiveOldFiles:
        worker_group: '${robot}'
        do:
          BCRM_Reports.ArchiveOldFiles:
            - Teams_Folder: 'RM11%20Reports%20(NULLS)'
            - accessToken: '${accessToken}'
        navigate:
          - SUCCESS: Teams_DownloadOldReport
    - Teams_DownloadOldReport:
        worker_group: '${robot}'
        do:
          BCRM_Reports.Teams_DownloadOldReport:
            - accessToken: '${accessToken}'
            - fileStr: '${oldRptNameStr}'
            - teamsFolder: 'RM11%20Reports%20(NULLS)'
            - location: '${location}'
        publish:
          - response
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: ArchiveOldFiles_1
    - ArchiveOldFiles_1:
        worker_group: '${robot}'
        do:
          BCRM_Reports.ArchiveOldFiles:
            - Teams_Folder: 'RM26%20Reports%20(ESTIMATES)'
            - accessToken: '${accessToken}'
        navigate:
          - SUCCESS: Teams_DownloadOldReport_1
    - Teams_DownloadOldReport_1:
        worker_group: '${robot}'
        do:
          BCRM_Reports.Teams_DownloadOldReport:
            - accessToken: '${accessToken}'
            - fileStr: '${oldRptNameStr}'
            - teamsFolder: 'RM26%20Reports%20(ESTIMATES)'
            - location: '${location}'
        publish:
          - response
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetCurrentandReportWeekNumber
    - GetCurrentandReportWeekNumber:
        robot_group: '${robot}'
        do:
          BCRM_Reports.GetCurrentandReportWeekNumber:
            - calenderFilePath: '${AEMO_CalenderFile}'
            - rptDate: '${currReportDate}'
        publish:
          - currentWeekNumber
          - ESTIMATES_WEEK_A
          - ESTIMATES_WEEK_B
          - NULLS_PRELIM_A
          - NULLS_R1_A
          - NULLS_R2_A
          - NULLS_FINAL_A
          - NULLS_PRELIM_B
          - NULLS_R1_B
          - NULLS_R2_B
          - NULLS_FINAL_B
          - todayDate
          - todayYear
          - currentdayofWeek
        navigate:
          - SUCCESS: StartandEndDateReports
          - WARNING: StartandEndDateReports
          - FAILURE: on_failure
    - StartandEndDateReports:
        robot_group: '${robot}'
        do:
          BCRM_Reports.StartandEndDateReports:
            - EstimatesWeekA_Number: '${ESTIMATES_WEEK_A}'
            - EstimatesWeekB_Number: '${ESTIMATES_WEEK_B}'
            - NullsPrelimA_Number: '${NULLS_PRELIM_A}'
            - NullsPrelimB_Number: '${NULLS_PRELIM_B}'
            - NullsR1A_Number: '${NULLS_R1_A}'
            - NullsR1B_Number: '${NULLS_R1_B}'
            - NullsR2A_Number: '${NULLS_R2_A}'
            - NullsR2B_Number: '${NULLS_R2_B}'
            - NullsFinalA_Number: '${NULLS_FINAL_A}'
            - NullsFinalB_Number: '${NULLS_FINAL_B}'
            - calenderFilePath: '${AEMO_CalenderFile}'
            - todayDate: '${todayDate}'
            - todayYear: '${todayYear}'
            - todayWeekNumber: '${currentWeekNumber}'
        publish:
          - EstimatesWeekA_Start
          - EstimatesWeekA_End
          - EstimatesWeekB_Start
          - EstimatesWeekB_End
          - NullsPrelimA_Start
          - NullsPrelimA_End
          - NullsPrelimB_Start
          - NullsPrelimB_End
          - NullsR1A_Start
          - NullsR1A_End
          - NullsR1B_Start
          - NullsR1B_End
          - NullsR2A_Start
          - NullsR2A_End
          - NullsR2B_Start
          - NullsR2B_End
          - NullsFinalA_Start
          - NullsFinalA_End
          - NullsFinalB_Start
          - NullsFinalB_End
        navigate:
          - SUCCESS: ConvertandFormatReports_1
          - WARNING: ConvertandFormatReports_1
          - FAILURE: on_failure
    - ConvertandFormatReports_1:
        robot_group: '${robot}'
        do:
          BCRM_Reports.ConvertandFormatReports_1:
            - EstimatesWeekA_StartDate: '${EstimatesWeekA_Start}'
            - EstimatesWeekA_EndDate: '${EstimatesWeekA_End}'
            - EstimatesWeekB_StartDate: '${EstimatesWeekB_Start}'
            - EstimatesWeekB_EndDate: '${EstimatesWeekB_End}'
            - NullsPrelimA_StartDate: '${NullsPrelimA_Start}'
            - NullsPrelimA_EndDate: '${NullsPrelimA_End}'
            - NullsPrelimB_StartDate: '${NullsPrelimB_Start}'
            - NullsPrelimB_EndDate: '${NullsPrelimB_End}'
            - NullsR1A_StartDate: '${NullsR1A_Start}'
            - NullsR1A_EndDate: '${NullsR1A_End}'
            - NullsR1B_StartDate: '${NullsR1B_Start}'
            - NullsR1B_EndDate: '${NullsR1B_End}'
            - NullsR2A_StartDate: '${NullsR2A_Start}'
            - NullsR2A_EndDate: '${NullsR2A_End}'
            - NullsR2B_StartDate: '${NullsR2B_Start}'
            - NullsR2B_EndDate: '${NullsR2B_End}'
            - NullsFinalA_StartDate: '${NullsFinalA_Start}'
            - NullsFinalA_EndDate: '${NullsFinalA_End}'
            - NullsFinalB_StartDate: '${NullsFinalB_Start}'
            - NullsFinalB_EndDate: '${NullsFinalB_End}'
            - EstimatesWeekA_Number: '${ESTIMATES_WEEK_A}'
            - EstimatesWeekB_Number: '${ESTIMATES_WEEK_B}'
            - NullsPrelimA_Number: '${NULLS_PRELIM_A}'
            - NullsPrelimB_Number: '${NULLS_PRELIM_B}'
            - NullsR1A_Number: '${NULLS_R1_A}'
            - NullsR1B_Number: '${NULLS_R1_B}'
            - NullsR2A_Number: '${NULLS_R2_A}'
            - NullsR2B_Number: '${NULLS_R2_B}'
            - NullsFinalA_Number: '${NULLS_FINAL_A}'
            - location: '${location}'
            - NullsFinalB_Number: '${NULLS_FINAL_B}'
            - runDate: '${currReportDate}'
        publish:
          - currentFormatFolder
        navigate:
          - SUCCESS: FormatCleanUp
          - WARNING: FormatCleanUp
          - FAILURE: on_failure
    - FormatCleanUp:
        robot_group: '${robot}'
        do:
          BCRM_Reports.FormatCleanUp:
            - FormattedFolder: '${currentFormatFolder}'
        navigate:
          - SUCCESS: LookupandCompare
          - WARNING: LookupandCompare
          - FAILURE: on_failure
    - LookupandCompare:
        robot_group: '${robot}'
        do:
          BCRM_Reports.LookupandCompare:
            - location: '${location}'
            - currentWeekDay: '${currentdayofWeek}'
            - reportDate: '${currReportDate}'
        navigate:
          - SUCCESS: CheckIfReportsFull
          - WARNING: CheckIfReportsFull
          - FAILURE: on_failure
    - Upload_MDP_Reports_Teams:
        worker_group: '${robot}'
        do:
          BCRM_Reports.Upload_MDP_Reports_Teams:
            - accessToken: '${accessToken}'
            - FilesFolder: '${currentFormatFolder}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Send_Email
    - Send_Email:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email:
            - RunDate: '${currReportDate}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
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
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - GetAccessToken_Teams_1:
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
          - SUCCESS: Upload_MDP_Reports_Teams
    - CheckIfReportsFull:
        worker_group: '${robot}'
        do:
          BCRM_Reports.CheckIfReportsFull:
            - formattedFilesFolder: '${currentFormatFolder}'
        navigate:
          - FAILURE: GetAccessToken_Teams_1_1
          - SUCCESS: GetAccessToken_Teams_1
    - Send_Email_IncorrectReports:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email_IncorrectReports: []
        navigate:
          - SUCCESS: Kill_ProcessByName_2
          - WARNING: Kill_ProcessByName_2
          - FAILURE: on_failure
    - Kill_ProcessByName_2:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: FAILURE_1
          - WARNING: FAILURE_1
          - FAILURE: on_failure
    - GetAccessToken_Teams_1_1:
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
          - SUCCESS: Upload_MDP_Reports_Teams_1
    - Upload_MDP_Reports_Teams_1:
        worker_group: '${robot}'
        do:
          BCRM_Reports.Upload_MDP_Reports_Teams:
            - accessToken: '${accessToken}'
            - FilesFolder: '${currentFormatFolder}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Send_Email_IncorrectReports
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62338'
        navigate:
          - SUCCESS: SUCCESS
    - on_failure:
        - FailureNotification:
            do:
              BCRM_Reports.FailureNotification:
                - robot: '${robot}'
                - runDate: '${ReportsDate}'
  results:
    - FAILURE
    - SUCCESS
    - FAILURE_1
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 5500
        'y': 375
      Kill_ProcessByName_2:
        x: 5500
        'y': 125
        navigate:
          3279c2aa-fd85-1bc7-5d01-12214c36793c:
            targetId: 76acaa28-b533-9448-91a1-d6de707e1cca
            port: SUCCESS
          5821b5b7-1321-8de0-92f9-6e0046822447:
            targetId: 76acaa28-b533-9448-91a1-d6de707e1cca
            port: WARNING
      ArchiveOldFiles_1:
        x: 2200
        'y': 250
      Upload_MDP_Reports_Teams_1:
        x: 4900
        'y': 125
      Send_Email:
        x: 5200
        'y': 375
      GetCurrentandReportWeekNumber:
        x: 2800
        'y': 250
      LookupandCompare:
        x: 4000
        'y': 250
      GetAccessToken_Teams_1:
        x: 4600
        'y': 375
      STATS_IncreaseRunCountInDevOps:
        x: 5800
        'y': 375
        navigate:
          02525385-2b96-2a38-6636-796d18be11e9:
            targetId: 6f0427b4-4e40-f7ea-c054-75df572342dd
            port: SUCCESS
      CheckIfReportsFull:
        x: 4300
        'y': 250
      Teams_DownloadOldReport:
        x: 1900
        'y': 250
      StartandEndDateReports:
        x: 3100
        'y': 250
      FormatCleanUp:
        x: 3700
        'y': 250
      GetDateFrom_LogFile:
        x: 1300
        'y': 250
      Kill_ProcessByName:
        x: 100
        'y': 250
      Upload_MDP_Reports_Teams:
        x: 4900
        'y': 375
      ArchiveOldFiles:
        x: 1600
        'y': 250
      CleanupAndPrepare:
        x: 400
        'y': 250
      Send_Email_IncorrectReports:
        x: 5200
        'y': 125
      GetAccessToken_Teams:
        x: 700
        'y': 250
      ConvertandFormatReports_1:
        x: 3400
        'y': 250
      TeamsDownload_CalenderFile:
        x: 1000
        'y': 250
      GetAccessToken_Teams_1_1:
        x: 4600
        'y': 125
      Teams_DownloadOldReport_1:
        x: 2500
        'y': 250
    results:
      SUCCESS:
        6f0427b4-4e40-f7ea-c054-75df572342dd:
          x: 6100
          'y': 250
      FAILURE_1:
        76acaa28-b533-9448-91a1-d6de707e1cca:
          x: 5800
          'y': 125
