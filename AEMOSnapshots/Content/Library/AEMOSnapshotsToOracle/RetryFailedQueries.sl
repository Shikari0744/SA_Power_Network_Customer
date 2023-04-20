namespace: AEMOSnapshotsToOracle
flow:
  name: RetryFailedQueries
  inputs:
    - failedQueries
    - oracleLog
    - tbcPath
    - failedLog
  workflow:
    - SplitFailedQueries:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.SplitFailedQueries:
            - fileLocation: '${tbcPath}'
            - failedQuery: '${failedQueries}'
        publish:
          - retryLocation
          - folderLocation
          - loopCount
        navigate:
          - SUCCESS: ReloadToOracle
    - ReloadToOracle:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.ReloadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - retryPath: '${retryLocation}'
              - folderNumber: '${folderLocation}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      SplitFailedQueries:
        x: 100
        'y': 150
      ReloadToOracle:
        x: 400
        'y': 150
        navigate:
          2e45b0c5-7b58-9008-dc4f-45c4d317c677:
            targetId: 3fa89c54-c5f3-f572-beba-4d7e467df1e8
            port: SUCCESS
    results:
      SUCCESS:
        3fa89c54-c5f3-f572-beba-4d7e467df1e8:
          x: 700
          'y': 150
