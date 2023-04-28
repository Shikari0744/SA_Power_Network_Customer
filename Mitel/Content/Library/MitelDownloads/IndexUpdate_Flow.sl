namespace: MitelDownloads
flow:
  name: IndexUpdate_Flow
  workflow:
    - IndexUpdate:
        do:
          MitelDownloads.IndexUpdate: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      IndexUpdate:
        x: 100
        'y': 150
        navigate:
          8ba1d23b-0d0b-3c2d-e53d-748ce2ebb242:
            targetId: 96b22447-149b-02ca-386a-6e4bb29c5e25
            port: SUCCESS
    results:
      SUCCESS:
        96b22447-149b-02ca-386a-6e4bb29c5e25:
          x: 400
          'y': 150
