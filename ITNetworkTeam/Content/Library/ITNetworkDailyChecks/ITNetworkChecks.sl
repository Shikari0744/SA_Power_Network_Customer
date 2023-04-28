namespace: ITNetworkDailyChecks
flow:
  name: ITNetworkChecks
  workflow:
    - NetworkChecks:
        do:
          ITNetworkDailyChecks.NetworkChecks:
            - snow_user: "${get_sp('serviceNowAPIuser')}"
            - snow_pass: "${get_sp('serviceNowAPIpass')}"
            - prtg_user: "${get_sp('prtgAPIuser')}"
            - prtg_pass: "${get_sp('prtgAPIpass')}"
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '52611'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      NetworkChecks:
        x: 100
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 400
        'y': 150
        navigate:
          09f90a60-e943-601b-35cc-09f8caa798e0:
            targetId: b8d74be8-b6e5-39d0-e4e4-405b7ff24fed
            port: SUCCESS
    results:
      SUCCESS:
        b8d74be8-b6e5-39d0-e4e4-405b7ff24fed:
          x: 700
          'y': 150
