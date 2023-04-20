########################################################################################################################
#!!
#! @input projectIDs: comma separated
#!!#
########################################################################################################################
namespace: SAP_to_Primavera_Integration
flow:
  name: SelectedProjectsPlannedValues
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
    - SelectedProjectsPlannedValuesUpdate:
        do:
          SAP_to_Primavera_Integration.SelectedProjectsPlannedValuesUpdate:
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
            - system: ERP
        navigate:
          - SUCCESS: SelectedProjectsPlannedValuesUpdate
          - WARNING: SelectedProjectsPlannedValuesUpdate
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
      SelectedProjectsPlannedValuesUpdate:
        x: 700
        'y': 150
      OpenSAP:
        x: 400
        'y': 150
      Kill_ProcessByName_1:
        x: 1000
        'y': 150
        navigate:
          a8a742d7-6396-3430-3323-3dfb8d5bbe24:
            targetId: 9a3e129b-9944-8707-e2cb-755023c72d03
            port: SUCCESS
          7434fb9f-681d-4037-62ea-a2532b3455cf:
            targetId: 9a3e129b-9944-8707-e2cb-755023c72d03
            port: WARNING
    results:
      SUCCESS:
        9a3e129b-9944-8707-e2cb-755023c72d03:
          x: 1300
          'y': 150
