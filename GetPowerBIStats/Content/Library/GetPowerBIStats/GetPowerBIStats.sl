namespace: GetPowerBIStats
flow:
  name: GetPowerBIStats
  workflow:
    - PowerBIAPICall:
        do:
          GetPowerBIStats.PowerBIAPICall: []
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
      PowerBIAPICall:
        x: 100
        'y': 150
        navigate:
          69f4fb5b-72bb-c30c-e255-7b38e8c08ffa:
            targetId: fdb674fd-9a53-f004-d814-78b73ded8c00
            port: SUCCESS
          74bd40cc-e80b-32ef-a2c3-2c3b8c03e5dc:
            targetId: fdb674fd-9a53-f004-d814-78b73ded8c00
            port: WARNING
    results:
      SUCCESS:
        fdb674fd-9a53-f004-d814-78b73ded8c00:
          x: 400
          'y': 150
