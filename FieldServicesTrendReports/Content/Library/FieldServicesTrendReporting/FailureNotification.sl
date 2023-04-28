namespace: FieldServicesTrendReporting
flow:
  name: FailureNotification
  inputs:
    - robot
  workflow:
    - Send_Email_Failure:
        robot_group: '${robot}'
        do:
          FieldServicesTrendReporting.Send_Email_Failure: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Send_Email_Failure:
        x: 100
        'y': 150
        navigate:
          0a495c4f-9f19-5482-86cb-9b05e781314b:
            targetId: b18c0e9a-1655-6890-8d94-e3f5162cadf3
            port: SUCCESS
          8f17c280-89a5-2d1d-5d58-b01c90e4ad09:
            targetId: b18c0e9a-1655-6890-8d94-e3f5162cadf3
            port: WARNING
    results:
      SUCCESS:
        b18c0e9a-1655-6890-8d94-e3f5162cadf3:
          x: 400
          'y': 150
