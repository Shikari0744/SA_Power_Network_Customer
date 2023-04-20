########################################################################################################################
#!!
#! @input projectIDs: comma,separated
#!!#
########################################################################################################################
namespace: SAP_to_Primavera_Integration
flow:
  name: SelectedProjectsActualValues
  inputs:
    - projectIDs:
        required: false
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - SelectedProjectsActualValuesUpdate:
        do:
          SAP_to_Primavera_Integration.SelectedProjectsActualValuesUpdate:
            - projectID: '${projectIDs}'
            - prima_user: "${get_sp('svc-app-primaveraUSER')}"
            - prima_pass:
                value: "${get_sp('svc-app-primaveraPASS')}"
                sensitive: true
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprimaintUSER')}"
            - pass:
                value: "${get_sp('svcprimaintPASS')}"
                sensitive: true
            - environment: PRD
        navigate:
          - SUCCESS: SelectedProjectsActualValuesUpdate
          - WARNING: SelectedProjectsActualValuesUpdate
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      OpenSAP:
        x: 400
        'y': 150
      SelectedProjectsActualValuesUpdate:
        x: 700
        'y': 150
      Kill_ProcessByName_1:
        x: 1000
        'y': 150
        navigate:
          b894546d-4a68-bd73-12f1-044f5ae65145:
            targetId: aac3b6ac-dbef-9d42-acfc-56c17e3e7b28
            port: SUCCESS
          556e51f7-4531-891f-3510-0515dab4fdce:
            targetId: aac3b6ac-dbef-9d42-acfc-56c17e3e7b28
            port: WARNING
    results:
      SUCCESS:
        aac3b6ac-dbef-9d42-acfc-56c17e3e7b28:
          x: 1300
          'y': 150
