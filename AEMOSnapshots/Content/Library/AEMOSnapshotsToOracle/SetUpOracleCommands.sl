namespace: AEMOSnapshotsToOracle
flow:
  name: SetUpOracleCommands
  inputs:
    - filepath: 'D:/AEMO Snapshots/'
    - oracleLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots Oracle Results.txt'
    - tbcPath: 'D:/AEMO Snapshots/Logs/AEMO Snapshots TBC Queries/'
    - failedLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots Failed Queries.txt'
    - cmr: Snapshot_UMPLP_CMR_20220824093822.csv
    - cnd: Snapshot_UMPLP_CND_20220824093822.csv
    - cnds: Snapshot_UMPLP_CNDS_20220824093822.csv
    - cnpr: Snapshot_UMPLP_CNPR_20220824093822.csv
    - cri: Snapshot_UMPLP_CRI_20220824093822.csv
  workflow:
    - CreateLogOfCommands_CMR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cmr}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CMR
    - LoadToOracle_CMR:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - tbcPath: '${tbcPath}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CND
          - FAILURE: on_failure
    - CreateLogOfCommands_CND:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnd}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CND
    - LoadToOracle_CND:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - tbcPath: '${tbcPath}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CNDS
          - FAILURE: on_failure
    - CreateLogOfCommands_CNDS:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnds}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CNDS
    - LoadToOracle_CNDS:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - tbcPath: '${tbcPath}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CNPR
          - FAILURE: on_failure
    - CreateLogOfCommands_CNPR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnpr}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CNPR
    - LoadToOracle_CNPR:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - tbcPath: '${tbcPath}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CRI
          - FAILURE: on_failure
    - CreateLogOfCommands_CRI:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cri}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CRI
    - LoadToOracle_CRI:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - failedLog: '${failedLog}'
              - tbcPath: '${tbcPath}'
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
      CreateLogOfCommands_CND:
        x: 700
        'y': 150
      CreateLogOfCommands_CRI:
        x: 2500
        'y': 150
      CreateLogOfCommands_CNPR:
        x: 1900
        'y': 150
      LoadToOracle_CMR:
        x: 400
        'y': 150
      LoadToOracle_CNPR:
        x: 2200
        'y': 150
      CreateLogOfCommands_CMR:
        x: 100
        'y': 150
      CreateLogOfCommands_CNDS:
        x: 1300
        'y': 150
      LoadToOracle_CND:
        x: 1000
        'y': 150
      LoadToOracle_CRI:
        x: 2800
        'y': 150
        navigate:
          7fbbcc10-2404-fa43-9f76-0d4ea5976417:
            targetId: 59d89b3e-24d0-4f03-59b4-a7ed007bac7a
            port: SUCCESS
      LoadToOracle_CNDS:
        x: 1600
        'y': 150
    results:
      SUCCESS:
        59d89b3e-24d0-4f03-59b4-a7ed007bac7a:
          x: 3100
          'y': 150
