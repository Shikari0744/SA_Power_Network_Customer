namespace: BCRM_T02_Task_Closure
operation:
  name: CloseExcelObjects
  sequential_action:
    gav: 'com.microfocus.seq:BCRM_T02_Task_Closure.CloseExcelObjects:1.0.0'
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
          object_path: On Error Resume Next
      - step:
          id: '2'
          action: Script
          object_path: Do Until status = 429
      - step:
          id: '3'
          action: Script
          object_path: 'Set xl = GetObject(, "Excel.Application")'
      - step:
          id: '4'
          action: Script
          object_path: status = Err.Number
      - step:
          id: '5'
          action: Script
          object_path: If status = 0 Then
      - step:
          id: '6'
          action: Script
          object_path: print Ubound(xl.Workbooks)
      - step:
          id: '7'
          action: Script
          object_path: For Each wb in xl.Workbooks
      - step:
          id: '8'
          object_path: wb
          action: Close
          args: 'True'
      - step:
          id: '9'
          action: Script
          object_path: excelClosed = 1
      - step:
          id: '10'
          action: Script
          object_path: Next
      - step:
          id: '11'
          object_path: xl
          action: Quit
      - step:
          id: '12'
          action: Script
          object_path: If excelClosed = 1 Then
      - step:
          id: '13'
          action: Script
          object_path: Exit Do
      - step:
          id: '14'
          action: Script
          object_path: End If
      - step:
          id: '15'
          action: Script
          object_path: 'ElseIf status <> 429 Then'
      - step:
          id: '16'
          object_path: 'WScript.Echo Err.Number & ": " & Err'
          action: Description
      - step:
          id: '17'
          object_path: WScript
          action: Quit
          args: '1'
      - step:
          id: '18'
          action: Script
          object_path: End If
      - step:
          id: '19'
          action: Script
          object_path: Loop
      - step:
          id: '20'
          action: Script
          object_path: On Error Goto 0
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
