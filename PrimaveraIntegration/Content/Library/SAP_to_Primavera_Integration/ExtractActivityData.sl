namespace: SAP_to_Primavera_Integration
operation:
  name: ExtractActivityData
  inputs:
  - activitieslocation
  - currentrow
  sequential_action:
    gav: com.microfocus.seq:SAP_to_Primavera_Integration.ExtractActivityData:1.0.0
    skills:
    - Java
    - SAP NWBC Desktop
    - SAP
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Terminal Emulators
    - UI Automation
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
      terminal_settings:
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
        action: Script
        object_path: orderNumber = objSheet.cells(row,9).value
    - step:
        id: '8'
        action: Script
        object_path: projectNumber = objSheet.cells(row,10).value
    - step:
        id: '9'
        object_path: objWorkbook
        action: save
    - step:
        id: '10'
        object_path: objWorkbook
        action: close
    - step:
        id: '11'
        object_path: objExcel
        action: Quit
    - step:
        id: '12'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '13'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '14'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '15'
        action: Script
        object_path: Parameter("orderNumber") = orderNumber
    - step:
        id: '16'
        action: Script
        object_path: Parameter("projectNumber") = projectNumber
  outputs:
  - orderNumber:
      robot: true
      value: ${orderNumber}
  - projectNumber:
      robot: true
      value: ${projectNumber}
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
