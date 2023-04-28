namespace: MitelDownloads
flow:
  name: E2EDownloadFlow
  inputs:
    - fileNumber
    - rowCount: '10001'
  workflow:
    - FullDownloadFlow:
        do:
          MitelDownloads.FullDownloadFlow:
            - bNumber: '${fileNumber}'
            - rowCount: '${rowCount}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      FullDownloadFlow:
        x: 100
        'y': 150
        navigate:
          48a52411-c865-e8a2-851a-68eb5a814981:
            targetId: e0d91fab-487d-c34a-4c19-155de1a3b64d
            port: SUCCESS
    results:
      SUCCESS:
        e0d91fab-487d-c34a-4c19-155de1a3b64d:
          x: 700
          'y': 150
