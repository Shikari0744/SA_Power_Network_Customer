namespace: GenericActivities
operation:
  name: Screenshot
  inputs:
  - screenShotFileLocation: C:\Temp\Screenshot.png
  sequential_action:
    gav: com.microfocus.seq:GenericActivities.Screenshot:1.0.0
    skills:
    - SAP
    - Web
    - WPF
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
        id: '1'
        action: Script
        object_path: screenShotFileLocation = Parameter("screenShotFileLocation")
    - step:
        id: '2'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocation,true
    - step:
        id: '3'
        action: Wait
        args: '"1"'
        default_args: '"1"'
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
