########################################################################################################################
#!!
#! @input EmployeeNumber: comma separated (eg: 11111111,22222222)
#! @input DateFrom: dd/mm/yyyy
#! @input DateTo: dd/mm/yyyy
#!!#
########################################################################################################################
namespace: PayrollTimesheetChecks
flow:
  name: RDO_TimeSheetCheck
  inputs:
    - EmployeeNumber
    - DateFrom
    - DateTo
    - SAP_Login_ID
    - SAP_Password:
        sensitive: true
    - SendEmailTo
    - SAP_Environment: PRD
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: Timesheet_Check_Employee
          - WARNING: Timesheet_Check_Employee
          - FAILURE: on_failure
    - Timesheet_Check_Employee:
        do:
          PayrollTimesheetChecks.Timesheet_Check_Employee:
            - Emp_Num: '${EmployeeNumber}'
            - DateFrom: '${DateFrom}'
            - DateTo: '${DateTo}'
            - SAP_User_Name: '${SAP_Login_ID}'
            - SAP_Password:
                value: '${SAP_Password}'
                sensitive: true
            - SendEmailTo: '${SendEmailTo}'
            - SAP_Enviro: '${SAP_Environment}'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51006'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      Timesheet_Check_Employee:
        x: 400
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 700
        'y': 150
        navigate:
          e910b4e4-3330-9c7b-82d0-a0a5de8655e0:
            targetId: 9bea98ac-7ebf-6419-2c93-97a3a3113a21
            port: SUCCESS
    results:
      SUCCESS:
        9bea98ac-7ebf-6419-2c93-97a3a3113a21:
          x: 1000
          'y': 150
