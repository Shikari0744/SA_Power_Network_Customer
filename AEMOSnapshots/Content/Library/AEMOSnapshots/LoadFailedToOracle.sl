namespace: AEMOSnapshots
flow:
  name: LoadFailedToOracle
  inputs:
    - retryLocation: "D:\\AEMO Snapshots\\Retries\\"
    - iteration
  workflow:
    - GetFailedCommand:
        worker_group: B604
        do:
          AEMOSnapshots.GetFailedCommand:
            - fileLocation: '${retryLocation}'
        publish:
          - command
          - fileName
        navigate:
          - CUSTOM: SUCCESS
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
            - command: '${command}'
            - trust_all_roots: 'true'
        publish:
          - return_code
          - return_result
          - update_count
          - output_text
          - exception
        navigate:
          - SUCCESS: AddFailedResultToLog
          - FAILURE: AddFailedFailuresToLog
    - AddFailedFailuresToLog:
        worker_group: B604
        do:
          AEMOSnapshots.AddFailedFailuresToLog:
            - retryPath: '${retryLocation}'
            - command: '${command}'
        navigate:
          - SUCCESS: AddFailedResultToLog
    - AddFailedResultToLog:
        worker_group: B604
        do:
          AEMOSnapshots.AddFailedResultToLog:
            - retryPath: '${retryLocation}'
            - x: '${fileName}'
            - exception: '${exception}'
            - return_code: '${return_code}'
            - return_result: '${return_result}'
            - update_count: '${update_count}'
            - output_text: '${output_text}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      GetFailedCommand:
        x: 100
        'y': 250
        navigate:
          51017e71-49f2-3c07-4bbb-62e32a861b42:
            targetId: 080adfc0-d9fe-daf0-6b02-847a8b3f8a4a
            port: CUSTOM
      Add:
        x: 400
        'y': 250
      AddFailedFailuresToLog:
        x: 700
        'y': 375
      AddFailedResultToLog:
        x: 700
        'y': 125
        navigate:
          475dfc90-2da4-29fa-b345-50b07b0c2f0f:
            targetId: 080adfc0-d9fe-daf0-6b02-847a8b3f8a4a
            port: SUCCESS
    results:
      SUCCESS:
        080adfc0-d9fe-daf0-6b02-847a8b3f8a4a:
          x: 1000
          'y': 250
