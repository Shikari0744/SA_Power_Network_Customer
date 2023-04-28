namespace: AFL_flow
flow:
  name: get_req
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: 'https://www.google.co.in/'
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      http_client_get:
        x: 320
        'y': 160
        navigate:
          139569b8-065c-e8fe-dafc-bfe25397edf8:
            targetId: f2d90c73-f262-b4c0-e489-034307f8f221
            port: SUCCESS
    results:
      SUCCESS:
        f2d90c73-f262-b4c0-e489-034307f8f221:
          x: 520
          'y': 200
