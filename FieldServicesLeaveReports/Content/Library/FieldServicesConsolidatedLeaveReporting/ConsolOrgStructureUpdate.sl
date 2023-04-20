namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: ConsolOrgStructureUpdate
  inputs:
  - structureFile
  - iteration
  sequential_action:
    gav: com.microfocus.seq:FieldServicesConsolidatedLeaveReporting.ConsolOrgStructureUpdate:1.0.0
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
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '3'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("structureFile"))
    - step:
        id: '4'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Email OrgStruct")
    - step:
        id: '5'
        action: Script
        object_path: i = Parameter("iteration")
    - step:
        id: '6'
        object_path: objSheet.cells(i,5)
        action: value
        args: = "Done"
    - step:
        id: '7'
        object_path: objWorkbook
        action: save
    - step:
        id: '8'
        object_path: objWorkbook
        action: close
    - step:
        id: '9'
        object_path: objExcel
        action: Quit
    - step:
        id: '10'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '11'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '12'
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
