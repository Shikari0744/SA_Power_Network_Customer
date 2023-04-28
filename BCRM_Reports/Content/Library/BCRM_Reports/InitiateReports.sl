namespace: BCRM_Reports
flow:
  name: InitiateReports
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
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
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
          - SUCCESS: GetCurrentandReportWeekNumber
    - GetCurrentandReportWeekNumber:
        robot_group: '${robot}'
        do:
          BCRM_Reports.GetCurrentandReportWeekNumber:
            - calenderFilePath: '${AEMO_CalenderFile}'
            - rptDate: '${ReportsDate}'
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
          - SUCCESS: Initiate_Report_Download
          - WARNING: Initiate_Report_Download
          - FAILURE: on_failure
    - Initiate_Report_Download:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Initiate_Report_Download:
            - EstimatesWeekA_StartDT: '${EstimatesWeekA_Start}'
            - EstimatesWeekA_EndDT: '${EstimatesWeekA_End}'
            - EstimatesWeekB_StartDT: '${EstimatesWeekB_Start}'
            - EstimatesWeekB_EndDT: '${EstimatesWeekB_End}'
            - NullsPrelimA_StartDT: '${NullsPrelimA_Start}'
            - NullsPrelimA_EndDT: '${NullsPrelimA_End}'
            - NullsR1A_StartDT: '${NullsR1A_Start}'
            - NullsR1A_EndDT: '${NullsR1A_End}'
            - NullsR2A_StartDT: '${NullsR2A_Start}'
            - NullsR2A_EndDT: '${NullsR2A_End}'
            - NullsFinalA_StartDT: '${NullsFinalA_Start}'
            - NullsFinalA_EndDT: '${NullsFinalA_End}'
            - NullsPrelimB_StartDT: '${NullsPrelimB_Start}'
            - NullsPrelimB_EndDT: '${NullsPrelimB_End}'
            - NullsR1B_StartDT: '${NullsR1B_Start}'
            - NullsR1B_EndDT: '${NullsR1B_End}'
            - NullsR2B_StartDT: '${NullsR2B_Start}'
            - NullsR2B_EndDT: '${NullsR2B_End}'
            - NullsFinalB_StartDT: '${NullsFinalB_Start}'
            - NullsFinalB_EndDT: '${NullsFinalB_End}'
            - MSATS_UserID: "${get_sp('rmbbot1USER')}"
            - MSATS_UserPWD: "${get_sp('rmbbot1PASS')}"
            - runDate: '${ReportsDate}'
            - location: '${location}'
        publish:
          - numberOfRows
          - ReportsDownloaded
          - executionLog
        navigate:
          - SUCCESS: CheckIfReportsDownloaded
          - WARNING: CheckIfReportsDownloaded
          - FAILURE: on_failure
    - CheckIfReportsDownloaded:
        worker_group: '${robot}'
        do:
          BCRM_Reports.CheckIfReportsDownloaded:
            - reportsDownloaded: '${ReportsDownloaded}'
        navigate:
          - FAILURE: Send_Email_Unavailable
          - SUCCESS: Kill_ProcessByName_1
    - Send_Email_Unavailable:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email_Unavailable:
            - RunDate: '${todayDate}'
        navigate:
          - SUCCESS: CUSTOM
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - on_failure:
        - FailureNotification:
            do:
              BCRM_Reports.FailureNotification:
                - robot: '${robot}'
                - runDate: '${ReportsDate}'
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      CheckIfReportsDownloaded:
        x: 1900
        'y': 250
      Kill_ProcessByName_1:
        x: 2200
        'y': 375
        navigate:
          bfa9cfda-2a1e-f0c9-dc0e-7bfb16bae9d8:
            targetId: 477bb0c4-1821-a386-442f-118e91e6754d
            port: SUCCESS
          8217fa9e-9c53-22ae-6532-7e9f47c7b2c0:
            targetId: 477bb0c4-1821-a386-442f-118e91e6754d
            port: WARNING
      GetCurrentandReportWeekNumber:
        x: 1000
        'y': 250
      StartandEndDateReports:
        x: 1300
        'y': 250
      Initiate_Report_Download:
        x: 1600
        'y': 250
      Kill_ProcessByName:
        x: 100
        'y': 250
      Send_Email_Unavailable:
        x: 2200
        'y': 125
        navigate:
          c5379aeb-2388-a724-259a-984c869e82a4:
            targetId: b3967180-eec6-2edd-0b8c-c418e5b271df
            port: SUCCESS
          64940523-621d-0c7d-89fb-61867ec0c690:
            targetId: b3967180-eec6-2edd-0b8c-c418e5b271df
            port: WARNING
      GetAccessToken_Teams:
        x: 400
        'y': 250
      TeamsDownload_CalenderFile:
        x: 700
        'y': 250
    results:
      SUCCESS:
        477bb0c4-1821-a386-442f-118e91e6754d:
          x: 2500
          'y': 375
      CUSTOM:
        b3967180-eec6-2edd-0b8c-c418e5b271df:
          x: 2500
          'y': 125
