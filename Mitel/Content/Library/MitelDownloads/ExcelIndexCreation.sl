namespace: MitelDownloads
flow:
  name: ExcelIndexCreation
  workflow:
    - CreateIndexFiles:
        do:
          MitelDownloads.CreateIndexFiles: []
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
      CreateIndexFiles:
        x: 100
        'y': 150
        navigate:
          44f2ec70-7e32-8d27-cc95-5188a455ecfb:
            targetId: c20e7bd6-2c8d-5b8e-c753-d8dbb457aeb4
            port: SUCCESS
          61b6badd-6833-599c-7865-cfc64dff11ca:
            targetId: c20e7bd6-2c8d-5b8e-c753-d8dbb457aeb4
            port: WARNING
    results:
      SUCCESS:
        c20e7bd6-2c8d-5b8e-c753-d8dbb457aeb4:
          x: 400
          'y': 150
