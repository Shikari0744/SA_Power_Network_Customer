namespace: RecloserAutomation
flow:
  name: RecloserFlow_1
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
          - SUCCESS: SUCCESS
    - getAttachments:
        worker_group: B601
        do:
          RecloserAutomation.getAttachments:
            - accessToken: '${accessToken}'
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
        navigate:
          2edd64f3-335e-38b8-fbae-8277936b6349:
            targetId: a14fb474-8b07-00dd-9e0a-11e39ca5d37c
            port: SUCCESS
      getAttachments:
        x: 400
        'y': 150
    results:
      SUCCESS:
        a14fb474-8b07-00dd-9e0a-11e39ca5d37c:
          x: 1300
          'y': 150
