namespace: ActionBPEMs
flow:
  name: ActionBPEMs
  inputs:
    - robot: B602
    - originalDate:
        required: false
  workflow:
    - ActionBPEMs_MI27_MI79:
        do:
          ActionBPEMs.ActionBPEMs_MI27_MI79:
            - robot: '${robot}'
            - original_date: '${originalDate}'
        publish:
          - excel
        navigate:
          - FAILURE: ActionBPEMs_MI27_MI79_ExistingExcel
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - CUSTOM: SUCCESS
    - ActionBPEMs_MI27_MI79_ExistingExcel:
        do:
          ActionBPEMs.ActionBPEMs_MI27_MI79_ExistingExcel:
            - robot: '${robot}'
            - excel: '${excel}'
            - original_date: '${originalDate}'
        navigate:
          - FAILURE: ActionBPEMs_MI27_MI79_ExistingExcel
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - CUSTOM: SUCCESS
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51013'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      ActionBPEMs_MI27_MI79:
        x: 100
        'y': 250
        navigate:
          6307dcc3-c015-5289-2457-6e177dad6e3c:
            targetId: 537e9c52-d76c-291f-eddd-998f982579d2
            port: CUSTOM
      ActionBPEMs_MI27_MI79_ExistingExcel:
        x: 400
        'y': 125
        navigate:
          7a648837-1a0d-6437-9f9d-16e9bbd9ec94:
            targetId: 537e9c52-d76c-291f-eddd-998f982579d2
            port: CUSTOM
      STATS_IncreaseRunCountInDevOps:
        x: 400
        'y': 375
        navigate:
          291c9747-1cdb-d6b6-6f84-fa557f1279f2:
            targetId: 537e9c52-d76c-291f-eddd-998f982579d2
            port: SUCCESS
    results:
      SUCCESS:
        537e9c52-d76c-291f-eddd-998f982579d2:
          x: 700
          'y': 250
