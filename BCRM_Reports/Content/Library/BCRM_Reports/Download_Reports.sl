namespace: BCRM_Reports
flow:
  name: Download_Reports
  inputs:
    - ReportDate:
        required: false
    - robot
    - location: 'C:/Users/SVCRPABOT/OneDrive - SA Power Networks/AEMO Reports/MDP Reports/'
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: DownloadReports
          - WARNING: DownloadReports
          - FAILURE: on_failure
    - DownloadReports:
        robot_group: '${robot}'
        do:
          BCRM_Reports.DownloadReports:
            - UserName: "${get_sp('rmbbot1USER')}"
            - Password: "${get_sp('rmbbot1PASS')}"
            - rptDate: '${ReportDate}'
            - location: '${location}'
        publish:
          - ReportsAvailable
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Send_Email_Unavailable_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - Send_Email_Unavailable_1:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email_Unavailable_1:
            - RunDate: '${ReportDate}'
        navigate:
          - SUCCESS: CUSTOM
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - on_failure:
        - FailureNotification:
            do:
              BCRM_Reports.FailureNotification:
                - robot: '${robot}'
                - runDate: '${ReportDate}'
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 250
      DownloadReports:
        x: 400
        'y': 250
      Kill_ProcessByName_1:
        x: 700
        'y': 125
        navigate:
          60325860-1b59-670a-7d3e-8869ec182c61:
            targetId: 70a29f89-a9f3-3afb-16ab-6f7f67ab59ea
            port: SUCCESS
          44a5bef0-cde4-c89a-56bb-59f9eff7dda6:
            targetId: 70a29f89-a9f3-3afb-16ab-6f7f67ab59ea
            port: WARNING
      Send_Email_Unavailable_1:
        x: 700
        'y': 375
        navigate:
          5d30a154-f027-69a6-496e-14b7f895e4ef:
            targetId: 7b559ec0-fb21-bba2-3a1f-5db00d35eb79
            port: SUCCESS
          65308599-c7d6-08a9-af6b-91b2e97885ad:
            targetId: 7b559ec0-fb21-bba2-3a1f-5db00d35eb79
            port: WARNING
    results:
      SUCCESS:
        70a29f89-a9f3-3afb-16ab-6f7f67ab59ea:
          x: 1000
          'y': 125
      CUSTOM:
        7b559ec0-fb21-bba2-3a1f-5db00d35eb79:
          x: 1000
          'y': 375
