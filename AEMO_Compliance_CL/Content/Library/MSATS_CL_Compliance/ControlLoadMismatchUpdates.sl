namespace: MSATS_CL_Compliance
flow:
  name: ControlLoadMismatchUpdates
  inputs:
    - sheetname: '18_11_2022'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: CL_Compliance
          - WARNING: CL_Compliance
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - CL_Compliance:
        do:
          MSATS_CL_Compliance.CL_Compliance:
            - sheet_name: '${sheetname}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
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
      Kill_ProcessByName_1:
        x: 700
        'y': 150
        navigate:
          34499ffa-87b9-bfe6-ee7b-3dcd8443173f:
            targetId: c556831f-fc54-01b4-bb27-e4c7e997c7f4
            port: SUCCESS
          8882cc57-7903-4265-a6e4-e708522eda74:
            targetId: c556831f-fc54-01b4-bb27-e4c7e997c7f4
            port: WARNING
      CL_Compliance:
        x: 400
        'y': 150
    results:
      SUCCESS:
        c556831f-fc54-01b4-bb27-e4c7e997c7f4:
          x: 1000
          'y': 150
