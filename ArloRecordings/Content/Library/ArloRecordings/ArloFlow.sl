namespace: ArloRecordings
flow:
  name: ArloFlow
  workflow:
    - Arlo:
        do:
          ArloRecordings.Arlo:
            - rpaAPIuser: "${get_sp('svcrpabotAPIuser')}"
            - rpaAPIpass: "${get_sp('svcrpabotAPIpass')}"
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Arlo:
        x: 100
        'y': 150
        navigate:
          c9bed7f5-6599-8e70-d538-030a6600dfec:
            targetId: 0ede13cb-12e3-7fec-df2b-1d4d50f65964
            port: SUCCESS
    results:
      SUCCESS:
        0ede13cb-12e3-7fec-df2b-1d4d50f65964:
          x: 400
          'y': 150
