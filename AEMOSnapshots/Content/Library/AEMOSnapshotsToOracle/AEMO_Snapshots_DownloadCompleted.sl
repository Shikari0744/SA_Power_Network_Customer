namespace: AEMOSnapshotsToOracle
flow:
  name: AEMO_Snapshots_DownloadCompleted
  inputs:
    - location: 'D:/AEMO Snapshots/'
    - csvLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots Combined CSV.txt'
    - oracleLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots Oracle Results.txt'
    - toBeCompletedLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots TBC Queries/'
    - failedLog: 'D:/AEMO Snapshots/Logs/AEMO Snapshots Failed Queries.txt'
  workflow:
    - Combine_All_CSV_CMR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: Snapshot_UMPLP_CMR_20220824093822
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CND
    - Combine_All_CSV_CND:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: Snapshot_UMPLP_CND_20220824093822
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CNDS
    - Combine_All_CSV_CNDS:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: Snapshot_UMPLP_CNDS_20220824093822
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CNPR
    - Combine_All_CSV_CNPR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: Snapshot_UMPLP_CNPR_20220824093822
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CRI
    - Combine_All_CSV_CRI:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: Snapshot_UMPLP_CRI_20220824093822
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: SetUpOracleCommands
    - SetUpOracleCommands:
        do:
          AEMOSnapshotsToOracle.SetUpOracleCommands:
            - filepath: '${location}'
            - oracleLog: '${oracleLog}'
            - tbcPath: '${toBeCompletedLog}'
            - failedLog: '${failedLog}'
            - cmr: 'Snapshot_UMPLP_CMR_20220824093822|129'
            - cnd: 'Snapshot_UMPLP_CND_20220824093822|129'
            - cnds: 'Snapshot_UMPLP_CNDS_20220824093822|129'
            - cnpr: 'Snapshot_UMPLP_CNPR_20220824093822|129'
            - cri: 'Snapshot_UMPLP_CRI_20220824093822|129'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Combine_All_CSV_CMR:
        x: 100
        'y': 150
      Combine_All_CSV_CND:
        x: 400
        'y': 150
      Combine_All_CSV_CNDS:
        x: 700
        'y': 150
      Combine_All_CSV_CNPR:
        x: 1000
        'y': 150
      Combine_All_CSV_CRI:
        x: 1300
        'y': 150
      SetUpOracleCommands:
        x: 1600
        'y': 150
        navigate:
          fc917690-58c1-5e67-dbdf-7709f5b76e36:
            targetId: b303390f-d2ce-1c83-00b6-b244f4603997
            port: SUCCESS
    results:
      SUCCESS:
        b303390f-d2ce-1c83-00b6-b244f4603997:
          x: 1900
          'y': 150
