namespace: PRTGNetworkDashboard
flow:
  name: PRTGITNetworkDashboard
  workflow:
    - PRTGDashboard:
        do:
          PRTGNetworkDashboard.PRTGDashboard:
            - username: "${get_sp('prtgDashboardUSER')}"
            - passhash: "${get_sp('prtgDashboardPASS')}"
            - svcbotUsername: "${get_sp('svcrpabotAPIuser')}"
            - svcbotPassword: "${get_sp('svcrpabotAPIpass')}"
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      PRTGDashboard:
        x: 100
        'y': 150
        navigate:
          2be09174-1517-c1d2-80c1-47dba7cc897f:
            targetId: f0acb656-8416-6728-ca2f-0055631566c6
            port: SUCCESS
    results:
      SUCCESS:
        f0acb656-8416-6728-ca2f-0055631566c6:
          x: 400
          'y': 150
