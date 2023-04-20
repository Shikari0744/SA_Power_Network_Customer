namespace: SAP_to_Primavera_Integration
flow:
  name: PlannedProjectIntegration
  inputs:
    - ProjectIDs
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprimaintUSER')}"
            - pass:
                value: "${get_sp('svcprimaintPASS')}"
                sensitive: true
            - environment: PRD
            - system: ERP
        navigate:
          - SUCCESS: GetProjects
          - WARNING: GetProjects
          - FAILURE: on_failure
    - GetProjects:
        do:
          SAP_to_Primavera_Integration.GetProjects:
            - username: "${get_sp('svc-app-primaveraUSER')}"
            - password: "${get_sp('svc-app-primaveraPASS')}"
            - projectID: '${ProjectIDs}'
        publish:
          - rowcount
          - filelocation
        navigate:
          - SUCCESS: PlannedLoopIntegration
          - WARNING: PlannedLoopIntegration
          - FAILURE: on_failure
    - PlannedLoopIntegration:
        loop:
          for: row in rowcount
          do:
            SAP_to_Primavera_Integration.PlannedLoopIntegration:
              - fileLocation: '${filelocation}'
              - rowCounter: '${row}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CompletionEmail
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - CompletionEmail:
        do:
          SAP_to_Primavera_Integration.CompletionEmail:
            - dataType: planned
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
      OpenSAP:
        x: 400
        'y': 150
      GetProjects:
        x: 700
        'y': 150
      PlannedLoopIntegration:
        x: 1000
        'y': 150
      CompletionEmail:
        x: 1300
        'y': 150
      Kill_ProcessByName_1:
        x: 1600
        'y': 150
        navigate:
          02efda93-b7d5-b2d9-44ef-723651afe5be:
            targetId: 14c285ea-5d39-cb49-b197-0d5eb276a127
            port: SUCCESS
          8e725fd1-0e28-6478-c77c-10c538d52374:
            targetId: 14c285ea-5d39-cb49-b197-0d5eb276a127
            port: WARNING
    results:
      SUCCESS:
        14c285ea-5d39-cb49-b197-0d5eb276a127:
          x: 1900
          'y': 150
