namespace: GenericActivities
operation:
  name: RestartRobotCommand
  sequential_action:
    gav: 'com.microfocus.seq:GenericActivities.RestartRobotCommand:1.0.0'
    skills:
      - SAP
      - Web
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
      - step:
          id: '3'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '4'
          object_path: mySendKeys
          action: Run
          args: '"shutdown /r /t 0"'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
