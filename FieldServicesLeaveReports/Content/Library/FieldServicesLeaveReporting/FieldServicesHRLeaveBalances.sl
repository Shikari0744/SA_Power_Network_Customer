namespace: FieldServicesLeaveReporting
flow:
  name: FieldServicesHRLeaveBalances
  inputs:
    - date:
        required: false
    - report: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/Reports/'
    - structure: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Leave Reports/SAP Organisational Structures.xlsx'
    - robot: B603
  workflow:
    - FieldServicesLeaveBalances:
        do:
          FieldServicesLeaveReporting.FieldServicesLeaveBalances:
            - date: '${date}'
            - reportLocation: '${report}'
            - structureLocation: '${structure}'
            - robot: '${robot}'
        navigate:
          - FAILURE: FieldServicesLeaveBalances
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      FieldServicesLeaveBalances:
        x: 100
        'y': 150
        navigate:
          8305b623-1e98-c792-1a0a-e97217496f40:
            targetId: b7ebbeab-8456-2a50-fb44-9917cfa17350
            port: SUCCESS
    results:
      SUCCESS:
        b7ebbeab-8456-2a50-fb44-9917cfa17350:
          x: 400
          'y': 150
