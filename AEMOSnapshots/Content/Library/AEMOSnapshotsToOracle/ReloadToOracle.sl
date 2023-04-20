namespace: AEMOSnapshotsToOracle
flow:
  name: ReloadToOracle
  inputs:
    - rowIteration: '0'
    - oracleLog: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots Oracle Results.txt"
    - failedLog: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots Failed Queries.txt"
    - retryPath: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots TBC Queries\\Retries\\"
    - folderNumber
  workflow:
    - GetCommand:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.GetCommand:
            - path: '${retryPath}'
            - folderNumber: '${folderNumber}'
            - x: '${rowIteration}'
        publish:
          - content
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Add
    - Add:
        worker_group: B604
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: hwqscan.utilities.etsa.net.au
            - db_type: Oracle
            - username: cih_stage
            - password:
                value: cih_stage
                sensitive: true
            - db_port: '1521'
            - database_name: cdpd.world
            - command: '${content}'
            - trust_all_roots: 'true'
        publish:
          - return_code
          - return_result
          - update_count
          - output_text
          - exception
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: AddFailuresToLog
    - AddFailuresToLog:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.AddFailuresToLog:
            - failedLog: '${failedLog}'
            - command: '${content}'
            - return_code: '${return_code}'
            - return_result: '${return_result}'
            - output_text: '${output_text}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetCommand:
        x: 100
        'y': 150
      Add:
        x: 400
        'y': 150
        navigate:
          9096ac20-b412-4556-e95e-ca860402d83c:
            targetId: 0e51180e-4dfc-f5c3-5da5-a86bec45e991
            port: SUCCESS
      AddFailuresToLog:
        x: 720
        'y': 320
        navigate:
          09608e82-08cc-4472-19df-1f4701be27a6:
            targetId: 0e51180e-4dfc-f5c3-5da5-a86bec45e991
            port: SUCCESS
    results:
      SUCCESS:
        0e51180e-4dfc-f5c3-5da5-a86bec45e991:
          x: 1000
          'y': 150
