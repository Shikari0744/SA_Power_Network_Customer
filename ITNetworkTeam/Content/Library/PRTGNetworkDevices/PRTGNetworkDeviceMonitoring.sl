namespace: PRTGNetworkDevices
flow:
  name: PRTGNetworkDeviceMonitoring
  workflow:
    - PRTGNetworkMonitoring:
        do:
          PRTGNetworkDevices.PRTGNetworkMonitoring:
            - username: "${get_sp('prtgDevicesUSER')}"
            - passhash: "${get_sp('prtgDevicesPASS')}"
        publish:
          - outputText
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      PRTGNetworkMonitoring:
        x: 100
        'y': 150
        navigate:
          9fc76606-1c19-1d25-29b0-597d22b65d7c:
            targetId: f13811d5-fc61-5a7d-474e-1694b179291d
            port: SUCCESS
    results:
      SUCCESS:
        f13811d5-fc61-5a7d-474e-1694b179291d:
          x: 400
          'y': 150
