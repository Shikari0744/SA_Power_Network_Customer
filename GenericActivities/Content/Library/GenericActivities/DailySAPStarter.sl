namespace: GenericActivities
flow:
  name: DailySAPStarter
  inputs:
    - robot
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP_ERP
          - WARNING: OpenSAP_ERP
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP_ISU
          - WARNING: OpenSAP_ISU
          - FAILURE: on_failure
    - Kill_ProcessByName_2:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - OpenSAP_ERP:
        robot_group: '${robot}'
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprimaintUSER')}"
            - pass:
                value: "${get_sp('svcprimaintPASS')}"
                sensitive: true
            - environment: PRD
            - system: ERP
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: Kill_ProcessByName_1
    - OpenSAP_ISU:
        robot_group: '${robot}'
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svctaskclsUSER')}"
            - pass:
                value: "${get_sp('svctaskclsPASS')}"
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: Kill_ProcessByName_2
          - WARNING: Kill_ProcessByName_2
          - FAILURE: Kill_ProcessByName_2
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
      Kill_ProcessByName_2:
        x: 1300
        'y': 150
        navigate:
          14ba97f1-4a87-acdd-c3eb-2f5f39652d11:
            targetId: 79caa28f-099e-f672-079e-77e59cbee3ce
            port: SUCCESS
          c347813e-7da5-90c1-6a3b-caa05f7a1b8f:
            targetId: 79caa28f-099e-f672-079e-77e59cbee3ce
            port: WARNING
      OpenSAP_ERP:
        x: 400
        'y': 150
      OpenSAP_ISU:
        x: 1000
        'y': 150
    results:
      SUCCESS:
        79caa28f-099e-f672-079e-77e59cbee3ce:
          x: 1600
          'y': 150
