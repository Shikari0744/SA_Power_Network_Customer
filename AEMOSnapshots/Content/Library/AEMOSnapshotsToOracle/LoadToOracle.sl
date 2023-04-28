namespace: AEMOSnapshotsToOracle
flow:
  name: LoadToOracle
  inputs:
    - rowIteration: '0'
    - oracleLog: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots Oracle Results.txt"
    - failedLog: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots Failed Queries.txt"
    - tbcPath: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots TBC Queries\\"
  workflow:
    - GetCommand:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.GetCommand:
            - path: '${tbcPath}'
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
          - FAILURE: RetryFailedQueries
    - RetryFailedQueries:
        do:
          AEMOSnapshotsToOracle.RetryFailedQueries:
            - failedQueries: '${content}'
            - oracleLog: '${oracleLog}'
            - tbcPath: '${tbcPath}'
            - failedLog: '${failedLog}'
        navigate:
          - FAILURE: on_failure
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
          4b09c215-b78d-5ff8-13e8-9d53d6ce940b:
            targetId: cea7cc58-590f-61d9-7a74-b9a16f96aaaf
            port: SUCCESS
      RetryFailedQueries:
        x: 720
        'y': 360
        navigate:
          7b5fdcc5-4917-352b-add2-93de55135ded:
            targetId: cea7cc58-590f-61d9-7a74-b9a16f96aaaf
            port: SUCCESS
    results:
      SUCCESS:
        cea7cc58-590f-61d9-7a74-b9a16f96aaaf:
          x: 1000
          'y': 150
