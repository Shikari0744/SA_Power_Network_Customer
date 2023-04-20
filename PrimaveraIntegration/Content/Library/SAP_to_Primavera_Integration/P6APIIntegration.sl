namespace: SAP_to_Primavera_Integration
flow:
  name: P6APIIntegration
  workflow:
    - P6ExtractionAPI:
        do:
          SAP_to_Primavera_Integration.P6ExtractionAPI:
            - PrimaveraUsername:
                value: svcrobotest
                sensitive: true
            - PrimaveraPassword:
                value: 9CjQeHBgpXtp2ig63uLA
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      P6ExtractionAPI:
        x: 440
        'y': 160
        navigate:
          2d04446d-2471-4424-5aeb-0ccd4fb0bdd1:
            targetId: b3b3525e-df48-1fe2-6248-1388b2b9bf07
            port: SUCCESS
    results:
      SUCCESS:
        b3b3525e-df48-1fe2-6248-1388b2b9bf07:
          x: 720
          'y': 160
