namespace: GenericActivities
operation:
  name: Kill_ProcessByName
  sequential_action:
    gav: com.microfocus.seq:GenericActivities.Kill_ProcessByName:1.0.0
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
        id: '1'
        object_path: '''SystemUtil'
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '2'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '3'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '4'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '5'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '6'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '7'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '8'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '9'
        object_path: SystemUtil
        action: CloseProcessByName("winword.exe")
    - step:
        id: '10'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '11'
        object_path: SystemUtil
        action: CloseProcessByName("iexplore.exe")
    - step:
        id: '12'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '13'
        object_path: SystemUtil
        action: CloseProcessByName("chrome.exe")
    - step:
        id: '14'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '15'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '16'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '17'
        object_path: SystemUtil
        action: CloseProcessByName("i_view64.exe")
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
