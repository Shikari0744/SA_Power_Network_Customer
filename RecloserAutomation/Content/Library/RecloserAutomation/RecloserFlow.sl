namespace: RecloserAutomation
flow:
  name: RecloserFlow
  inputs:
    - runDate:
        required: false
  workflow:
    - GetAccessToken_HTTP:
        do:
          GenericActivities.GetAccessToken_HTTP:
            - username: "${get_sp('svcrpabotAPIuser')}"
            - password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: getAttachments
    - getValidRecloses:
        worker_group: B601
        do:
          RecloserAutomation.getValidRecloses:
            - rundate: '${runDate}'
        navigate:
          - SUCCESS: getIfPatrolRequired
    - getIfPatrolRequired:
        worker_group: B601
        do:
          RecloserAutomation.getIfPatrolRequired:
            - runD: '${runDate}'
        navigate:
          - SUCCESS: sendEmail
    - sendEmail:
        worker_group: B601
        do:
          RecloserAutomation.sendEmail:
            - rundate: '${runDate}'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '52162'
        navigate:
          - SUCCESS: SUCCESS
    - getAttachments:
        worker_group: B601
        do:
          RecloserAutomation.getAttachments:
            - accessToken: '${accessToken}'
            - rundate: '${runDate}'
        publish:
          - result
        navigate:
          - SUCCESS: getValidRecloses
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_HTTP:
        x: 100
        'y': 150
      getValidRecloses:
        x: 700
        'y': 150
      getIfPatrolRequired:
        x: 1000
        'y': 150
      sendEmail:
        x: 1300
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1600
        'y': 150
        navigate:
          250015df-2ff0-cf0a-8507-73d718da3aeb:
            targetId: 7eae6af9-a3b2-6e83-0019-8b82e436c635
            port: SUCCESS
      getAttachments:
        x: 400
        'y': 150
    results:
      SUCCESS:
        7eae6af9-a3b2-6e83-0019-8b82e436c635:
          x: 1900
          'y': 150
