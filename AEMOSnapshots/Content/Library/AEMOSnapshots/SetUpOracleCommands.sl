namespace: AEMOSnapshots
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
          AEMOSnapshots.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cmr}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CMR
    - LoadToOracle_CRI:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshots.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - tbcPath: '${tbcPath}'
              - failedLog: '${failedLog}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - CreateLogOfCommands_CND:
        worker_group: B604
        do:
          AEMOSnapshots.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnd}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CND
    - CreateLogOfCommands_CNDS:
        worker_group: B604
        do:
          AEMOSnapshots.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnds}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CNDS
    - CreateLogOfCommands_CNPR:
        worker_group: B604
        do:
          AEMOSnapshots.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cnpr}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CNPR
    - CreateLogOfCommands_CRI:
        worker_group: B604
        do:
          AEMOSnapshots.CreateLogOfCommands:
            - filepath: '${filepath}'
            - tbcPath: '${tbcPath}'
            - csvFile: '${cri}'
            - loopCounter: '0'
        publish:
          - loopCount
          - lines
        navigate:
          - SUCCESS: LoadToOracle_CRI
    - LoadToOracle_CMR:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshots.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - tbcPath: '${tbcPath}'
              - failedLog: '${failedLog}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CND
          - FAILURE: on_failure
    - LoadToOracle_CND:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshots.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - tbcPath: '${tbcPath}'
              - failedLog: '${failedLog}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CNDS
          - FAILURE: on_failure
    - LoadToOracle_CNDS:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshots.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - tbcPath: '${tbcPath}'
              - failedLog: '${failedLog}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CNPR
          - FAILURE: on_failure
    - LoadToOracle_CNPR:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshots.LoadToOracle:
              - rowIteration: '${x}'
              - oracleLog: '${oracleLog}'
              - tbcPath: '${tbcPath}'
              - failedLog: '${failedLog}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: CreateLogOfCommands_CRI
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
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
          d2cc48f0-c8b0-c312-f65b-9ee88ca3ce5e:
            targetId: d6ccc5b1-f914-53d8-9b68-3b804e8de54a
            port: SUCCESS
      LoadToOracle_CNDS:
        x: 1600
        'y': 150
    results:
      SUCCESS:
        d6ccc5b1-f914-53d8-9b68-3b804e8de54a:
          x: 3100
          'y': 150
