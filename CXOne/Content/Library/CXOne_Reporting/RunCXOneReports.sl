namespace: CXOne_Reporting
flow:
  name: RunCXOneReports
  inputs:
    - ReportID: '5493'
    - robot
  workflow:
    - GenerateAccessToken:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.GenerateAccessToken:
            - cxAccessKeySecret:
                value: "${get_sp('CXoneAccessKeySecret')}"
                sensitive: true
            - cxAccessKeyId:
                value: "${get_sp('CXoneAccessKeyId')}"
                sensitive: true
        publish:
          - AccessToken
          - result
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Run_Report
    - Run_Report:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.Run_Report:
            - accessToken: '${AccessToken}'
            - reportID: '${ReportID}'
        publish:
          - JobId
        navigate:
          - SUCCESS: CheckReport
    - CheckReport:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.CheckReport:
            - accessToken: '${AccessToken}'
            - reportID: '${ReportID}'
            - job_ID: '${JobId}'
        publish:
          - ResultFileURL
          - failure
        navigate:
          - SUCCESS: DownloadReport
    - DownloadReport:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.DownloadReport:
            - accessToken: '${AccessToken}'
            - reportURL: '${ResultFileURL}'
        publish:
          - ReportFile
          - rptFileName
        navigate:
          - SUCCESS: ConvertToXlsx
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
          - outcome
        navigate:
          - FAILURE: on_failure
          - SUCCESS: UploadToSharepoint
    - UploadToSharepoint:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.UploadToSharepoint:
            - accessTokenMSAL: '${accessToken}'
            - xlsxFile: '${xlsx}'
            - xlsFile: '${rptFileName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - ConvertToXlsx:
        worker_group: '${robot}'
        do:
          CXOne_Reporting.ConvertToXlsx:
            - xlsFile: '${ReportFile}'
            - file: '${rptFileName}'
        publish:
          - xlsx
          - xlsxFile
        navigate:
          - SUCCESS: GetAccessToken_Teams
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62351'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GenerateAccessToken:
        x: 100
        'y': 150
      Run_Report:
        x: 400
        'y': 150
      CheckReport:
        x: 700
        'y': 150
      DownloadReport:
        x: 1000
        'y': 150
      GetAccessToken_Teams:
        x: 1600
        'y': 150
      UploadToSharepoint:
        x: 1900
        'y': 150
      ConvertToXlsx:
        x: 1300
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 2200
        'y': 150
        navigate:
          e68b9b72-c274-bbce-a398-ed91b5572f7d:
            targetId: 358e3f86-e7ea-905a-4c54-026a4bab7b54
            port: SUCCESS
    results:
      SUCCESS:
        358e3f86-e7ea-905a-4c54-026a4bab7b54:
          x: 2500
          'y': 150
