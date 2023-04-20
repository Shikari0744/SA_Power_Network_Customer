namespace: BCRM_T02_Task_Closure
flow:
  name: T02TaskClosure
  workflow:
    - T02_Task_Closure:
        do:
          BCRM_T02_Task_Closure.T02_Task_Closure: []
        publish:
          - excel
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - FAILURE: T02_Task_Closure_ExistingExcel
          - CUSTOM: SUCCESS
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51008'
        navigate:
          - SUCCESS: SUCCESS
    - T02_Task_Closure_ExistingExcel:
        do:
          BCRM_T02_Task_Closure.T02_Task_Closure_ExistingExcel:
            - excel: '${excel}'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - FAILURE: T02_Task_Closure_ExistingExcel
          - CUSTOM: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      T02_Task_Closure:
        x: 100
        'y': 250
        navigate:
          c8d1edbc-7112-2d2d-9014-280bbf8c7a8b:
            targetId: c2cdba43-e308-59b7-27a9-1bc47f061c78
            port: CUSTOM
      STATS_IncreaseRunCountInDevOps:
        x: 400
        'y': 125
        navigate:
          b116d8d0-9bd5-64cc-c3ff-7b927264c635:
            targetId: c2cdba43-e308-59b7-27a9-1bc47f061c78
            port: SUCCESS
      T02_Task_Closure_ExistingExcel:
        x: 400
        'y': 375
        navigate:
          65c3ea4f-c5bb-3134-3540-6ebf519dae74:
            targetId: c2cdba43-e308-59b7-27a9-1bc47f061c78
            port: CUSTOM
    results:
      SUCCESS:
        c2cdba43-e308-59b7-27a9-1bc47f061c78:
          x: 700
          'y': 250
