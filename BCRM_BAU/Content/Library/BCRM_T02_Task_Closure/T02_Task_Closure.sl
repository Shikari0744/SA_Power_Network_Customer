namespace: BCRM_T02_Task_Closure
flow:
  name: T02_Task_Closure
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
            - fileName: '${excelLoc}'
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
    - CreateLogFile:
        do:
          BCRM_T02_Task_Closure.CreateLogFile: []
        publish:
          - excelLoc
        navigate:
          - SUCCESS: Complete_TC02_Tasks_DT
          - WARNING: Complete_TC02_Tasks_DT
          - FAILURE: on_failure
    - Email_Success:
        do:
          BCRM_T02_Task_Closure.Email_Success:
            - location: '${excelLoc}'
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
          - SUCCESS: CreateLogFile
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\T02 Task Closure\\"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
  outputs:
    - excel: '${excelLoc}'
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
          b1a929d5-0c42-93e9-8c9c-fd56f2eee703:
            targetId: f5187ec8-fae1-08dc-7430-7543efed86c5
            port: WARNING
      CreateLogFile:
        x: 700
        'y': 125
      Complete_TC02_Tasks_DT:
        x: 1000
        'y': 250
      Email_Success:
        x: 1300
        'y': 250
      DeleteOldFiles:
        x: 1600
        'y': 250
      Kill_ProcessByName_1:
        x: 1900
        'y': 250
        navigate:
          d1a94966-b3a1-f541-78df-1d31b76696a2:
            targetId: 67d0d43c-d4b2-f94a-4c82-39da9f724582
            port: SUCCESS
          bd951f0e-4bc3-bc2d-814c-f12068ccbfa9:
            targetId: 67d0d43c-d4b2-f94a-4c82-39da9f724582
            port: WARNING
    results:
      CUSTOM:
        f5187ec8-fae1-08dc-7430-7543efed86c5:
          x: 700
          'y': 375
      SUCCESS:
        67d0d43c-d4b2-f94a-4c82-39da9f724582:
          x: 2200
          'y': 250
