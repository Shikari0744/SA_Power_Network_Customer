namespace: BCRM_Reports
flow:
  name: Download_Format_Lookup_Import
  inputs:
    - f_ReportsDate:
        required: false
    - robot
    - location: "C:\\Users\\SVCRPABOT\\OneDrive - SA Power Networks\\AEMO Reports\\MDP Reports\\"
  workflow:
    - CheckLogIfReportsWereDownloaded:
        worker_group: '${robot}'
        do:
          BCRM_Reports.CheckLogIfReportsWereDownloaded:
            - location: '${location}'
        publish:
          - result
        navigate:
          - FAILURE: Send_Email_Unavailable
          - SUCCESS: Download_Reports
    - Download_Reports:
        worker_group:
          value: '${robot}'
          override: true
        do:
          BCRM_Reports.Download_Reports:
            - ReportDate: '${f_ReportsDate}'
            - robot: '${robot}'
        navigate:
          - SUCCESS: Extract_Format_Lookup
          - FAILURE: on_failure
          - CUSTOM: CUSTOM
    - Extract_Format_Lookup:
        worker_group:
          value: '${robot}'
          override: true
        do:
          BCRM_Reports.Extract_Format_Lookup:
            - ReportsDate: '${f_ReportsDate}'
            - robot: '${robot}'
            - location: '${location}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
          - FAILURE_1: CUSTOM
    - Send_Email_Unavailable:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email_Unavailable:
            - RunDate: '${f_ReportsDate}'
        navigate:
          - SUCCESS: CUSTOM
          - WARNING: CUSTOM
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      CheckLogIfReportsWereDownloaded:
        x: 100
        'y': 250
      Download_Reports:
        x: 400
        'y': 375
        navigate:
          6e9a6111-c0a4-7ab2-74e6-69463eb7c447:
            targetId: 5fff8555-78cb-7d8a-406c-d39aa1d3e97a
            port: CUSTOM
      Extract_Format_Lookup:
        x: 700
        'y': 125
        navigate:
          989162ce-d97a-fbe5-a36e-e1e28b96c94a:
            targetId: cb6bf8d0-9ec8-b71f-6f9d-e8a5418e3718
            port: SUCCESS
          1881dfb8-3f18-014d-f9b0-6b972bf2917a:
            targetId: 5fff8555-78cb-7d8a-406c-d39aa1d3e97a
            port: FAILURE_1
      Send_Email_Unavailable:
        x: 400
        'y': 125
        navigate:
          a3139d84-e392-3c9b-d0cc-6b9475e16c4b:
            targetId: 5fff8555-78cb-7d8a-406c-d39aa1d3e97a
            port: SUCCESS
          3b36050d-e58f-0edd-c593-53c62cc2ab36:
            targetId: 5fff8555-78cb-7d8a-406c-d39aa1d3e97a
            port: WARNING
    results:
      SUCCESS:
        cb6bf8d0-9ec8-b71f-6f9d-e8a5418e3718:
          x: 1000
          'y': 250
      CUSTOM:
        5fff8555-78cb-7d8a-406c-d39aa1d3e97a:
          x: 700
          'y': 375
