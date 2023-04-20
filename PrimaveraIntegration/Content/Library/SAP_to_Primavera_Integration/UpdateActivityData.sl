namespace: SAP_to_Primavera_Integration
operation:
  name: UpdateActivityData
  inputs:
  - activitieslocation
  - currentrow
  sequential_action:
    gav: com.microfocus.seq:SAP_to_Primavera_Integration.UpdateActivityData:1.0.0
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
        object_path: filelocation = Parameter("activitieslocation")
    - step:
        id: '2'
        action: Script
        object_path: row = Parameter("currentrow")
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(filelocation)
    - step:
        id: '6'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '7'
        object_path: objSheet.cells(row,16)
        action: value
        args: = "Updated"
    - step:
        id: '8'
        object_path: objWorkbook
        action: save
    - step:
        id: '9'
        object_path: objWorkbook
        action: close
    - step:
        id: '10'
        object_path: objExcel
        action: Quit
    - step:
        id: '11'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '12'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '13'
        action: Script
        object_path: Set objSheet = Nothing
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
