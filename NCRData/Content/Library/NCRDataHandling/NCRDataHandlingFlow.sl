namespace: NCRDataHandling
flow:
  name: NCRDataHandlingFlow
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: NCRDataHandlingActivity
          - WARNING: NCRDataHandlingActivity
          - FAILURE: on_failure
    - NCRDataHandlingActivity:
        do:
          NCRDataHandling.NCRDataHandlingActivity:
            - sap_user: "${get_sp('svcncrdataUSER')}"
            - sap_pass: "${get_sp('svcncrdataPASS')}"
        publish:
          - completedNCR
          - lastNCR
          - lastID
        navigate:
          - SUCCESS: CompletionEmail
          - WARNING: CompletionEmail
          - FAILURE: on_failure
    - CompletionEmail:
        do:
          NCRDataHandling.CompletionEmail: []
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51990'
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
      NCRDataHandlingActivity:
        x: 400
        'y': 150
      CompletionEmail:
        x: 700
        'y': 150
      Kill_ProcessByName_1:
        x: 1000
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1300
        'y': 150
        navigate:
          d9097c02-e346-f9b5-60a2-b1a7f13efe06:
            targetId: 1b04a0b6-892f-a1ae-27d6-1caac6e8d0c5
            port: SUCCESS
    results:
      SUCCESS:
        1b04a0b6-892f-a1ae-27d6-1caac6e8d0c5:
          x: 1600
          'y': 150
