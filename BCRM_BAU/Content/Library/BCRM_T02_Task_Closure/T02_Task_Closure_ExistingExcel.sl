namespace: BCRM_T02_Task_Closure
flow:
  name: T02_Task_Closure_ExistingExcel
  inputs:
    - excel
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - Complete_TC02_Tasks_DT:
        do:
          BCRM_T02_Task_Closure.Complete_TC02_Tasks_DT:
            - user: "${get_sp('svctaskclsUSER')}"
            - pass1: "${get_sp('svctaskclsPASS')}"
            - fileName: '${excel}'
        publish: []
        navigate:
          - SUCCESS: Email_Success
          - WARNING: Email_Success
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - Email_Success:
        do:
          BCRM_T02_Task_Closure.Email_Success:
            - location: '${excel}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svctaskclsUSER')}"
            - pass:
                value: "${get_sp('svctaskclsPASS')}"
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: Complete_TC02_Tasks_DT
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\T02 Task Closure\\"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
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
      OpenSAP:
        x: 400
        'y': 250
        navigate:
          48ae5d48-8ed9-51eb-44c7-2b19fd3efd04:
            targetId: 5754bf64-647a-df08-db31-2b42945bcac9
            port: WARNING
      Complete_TC02_Tasks_DT:
        x: 700
        'y': 125
      Email_Success:
        x: 1000
        'y': 250
      DeleteOldFiles:
        x: 1300
        'y': 250
      Kill_ProcessByName_1:
        x: 1600
        'y': 250
        navigate:
          c1c93025-c8d1-98f6-2f31-c2800d69c4d0:
            targetId: 45209ace-5442-dd1e-665b-e93943f8ca5c
            port: SUCCESS
          c57cb33e-8285-2a19-a57a-5a18cc24ee59:
            targetId: 45209ace-5442-dd1e-665b-e93943f8ca5c
            port: WARNING
    results:
      CUSTOM:
        5754bf64-647a-df08-db31-2b42945bcac9:
          x: 700
          'y': 375
      SUCCESS:
        45209ace-5442-dd1e-665b-e93943f8ca5c:
          x: 1900
          'y': 250
