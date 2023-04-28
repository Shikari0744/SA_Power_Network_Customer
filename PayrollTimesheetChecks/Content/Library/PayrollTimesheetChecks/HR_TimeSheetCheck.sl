namespace: PayrollTimesheetChecks
flow:
  name: HR_TimeSheetCheck
  inputs:
    - EmployeeNumber
    - DateFrom
    - DateTo
    - SAP_Login_ID
    - SAP_Password:
        sensitive: true
    - SendEmailTo
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: HRTimeSheetCheck
          - WARNING: HRTimeSheetCheck
          - FAILURE: on_failure
    - HRTimeSheetCheck:
        do:
          PayrollTimesheetChecks.HRTimeSheetCheck:
            - Emp_Num: '${EmployeeNumber}'
            - DateFrom: '${DateFrom}'
            - DateTo: '${DateTo}'
            - SAP_User_Name: '${SAP_Login_ID}'
            - SAP_Password:
                value: '${SAP_Password}'
                sensitive: true
            - SendEmailTo: '${SendEmailTo}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      HRTimeSheetCheck:
        x: 400
        'y': 150
        navigate:
          273931ed-6ffa-35bb-7871-d27d698bcf13:
            targetId: 0a87d151-b1e9-ebb0-41f5-b9bd4f6e662f
            port: SUCCESS
          34a1d9f0-e7ca-92d8-161d-948c81c962b2:
            targetId: 0a87d151-b1e9-ebb0-41f5-b9bd4f6e662f
            port: WARNING
    results:
      SUCCESS:
        0a87d151-b1e9-ebb0-41f5-b9bd4f6e662f:
          x: 700
          'y': 150
