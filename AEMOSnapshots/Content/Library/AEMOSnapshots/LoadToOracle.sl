namespace: AEMOSnapshots
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
          AEMOSnapshots.GetCommand:
            - path: '${tbcPath}'
            - row: '${rowIteration}'
        publish:
          - content
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Add
    - AddResultToLog:
        worker_group: B604
        do:
          AEMOSnapshots.AddResultToLog:
            - oracleLog: '${oracleLog}'
            - x: '${rowIteration}'
            - exception: '${exception}'
            - return_code: '${return_code}'
            - return_result: '${return_result}'
            - update_count: '${update_count}'
            - output_text: '${output_text}'
        navigate:
          - SUCCESS: SUCCESS
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
          - SUCCESS: AddResultToLog
          - FAILURE: AddFailuresToLog
    - AddFailuresToLog:
        worker_group: B604
        do:
          AEMOSnapshots.AddFailuresToLog:
            - failedLog: '${failedLog}'
            - command: '${content}'
        navigate:
          - SUCCESS: AddResultToLog
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetCommand:
        x: 100
        'y': 250
      AddResultToLog:
        x: 700
        'y': 125
        navigate:
          ee3d15b1-d848-6a03-0801-3c7c1aeccd0e:
            targetId: f9b767f0-5dc4-66e2-d6b0-d8ad9ea3a57b
            port: SUCCESS
      Add:
        x: 400
        'y': 250
      AddFailuresToLog:
        x: 700
        'y': 375
    results:
      SUCCESS:
        f9b767f0-5dc4-66e2-d6b0-d8ad9ea3a57b:
          x: 1000
          'y': 250
