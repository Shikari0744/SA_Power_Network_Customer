namespace: NCRDataHandling
operation:
  name: UpdateCheck
  inputs:
    - completedNCRs
  sequential_action:
    gav: 'com.microfocus.seq:NCRDataHandling.UpdateCheck:1.0.0'
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
          action: Script
          object_path: 'completedNCR = Parameter("completedNCRs")'
      - step:
          id: '2'
          action: Script
          object_path: 'If completedNCR > 0 Then'
      - step:
          id: '3'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '4'
          action: Script
          object_path: Else
      - step:
          id: '5'
          object_path: Reporter
          action: ReportEvent
          args: "micFail, \"No NCR's updated\", \"No NCR's updated\""
      - step:
          id: '6'
          object_path: Reporter
          action: ReportEvent
          args: "micWarning, \"No NCR's updated\", \"No NCR's updated\""
      - step:
          id: '7'
          action: Script
          object_path: ExitTest
      - step:
          id: '8'
          action: Script
          object_path: End If
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
