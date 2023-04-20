namespace: SAP_to_Primavera_Integration
flow:
  name: PlannedLoopIntegration
  inputs:
    - fileLocation
    - rowCounter
  workflow:
    - ExtractActivityData:
        do:
          SAP_to_Primavera_Integration.ExtractActivityData:
            - activitieslocation: '${fileLocation}'
            - currentrow: '${rowCounter}'
        publish:
          - orderNumber
          - projectNumber
        navigate:
          - SUCCESS: PlannedSAPExtraction
          - WARNING: PlannedSAPExtraction
          - FAILURE: on_failure
    - PlannedSAPExtraction:
        do:
          SAP_to_Primavera_Integration.PlannedSAPExtraction:
            - projectNumber: '${projectNumber}'
            - orderNumber: '${orderNumber}'
        publish:
          - plannedProjectBudget
          - emailContent
          - labourPlannedBudget
          - materialPlannedbudget
          - servicesPlannedbudget
          - labourPlannedHRS
        navigate:
          - SUCCESS: UpdateActivityData
          - WARNING: UpdateActivityData
          - FAILURE: on_failure
    - UpdateActivityData:
        do:
          SAP_to_Primavera_Integration.UpdateActivityData:
            - activitieslocation: '${fileLocation}'
            - currentrow: '${rowCounter}'
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
      ExtractActivityData:
        x: 100
        'y': 150
      PlannedSAPExtraction:
        x: 400
        'y': 150
      UpdateActivityData:
        x: 700
        'y': 150
        navigate:
          e6b57b61-3010-ac6c-e272-778677382b80:
            targetId: 11333904-f5c3-b8f3-ef53-e22dcecff44e
            port: SUCCESS
          5c68cf3b-14ef-8d85-b1ab-519da4552072:
            targetId: 11333904-f5c3-b8f3-ef53-e22dcecff44e
            port: WARNING
    results:
      SUCCESS:
        11333904-f5c3-b8f3-ef53-e22dcecff44e:
          x: 1000
          'y': 150
