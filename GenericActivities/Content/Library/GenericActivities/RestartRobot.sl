namespace: GenericActivities
flow:
  name: RestartRobot
  inputs:
    - robot
  workflow:
    - RestartRobotCommand:
        robot_group: '${robot}'
        do:
          GenericActivities.RestartRobotCommand: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      RestartRobotCommand:
        x: 100
        'y': 150
        navigate:
          dc17c671-4369-ffee-9a77-b76f438d0165:
            targetId: d974fd0d-1458-a13e-4928-aba01e9bb231
            port: SUCCESS
          8ecf19ad-dc7d-67b3-ec9a-8d08b5d07d12:
            targetId: d974fd0d-1458-a13e-4928-aba01e9bb231
            port: WARNING
          0572364b-352d-5020-d247-14eb1fe286a1:
            targetId: d974fd0d-1458-a13e-4928-aba01e9bb231
            port: FAILURE
    results:
      SUCCESS:
        d974fd0d-1458-a13e-4928-aba01e9bb231:
          x: 400
          'y': 150
