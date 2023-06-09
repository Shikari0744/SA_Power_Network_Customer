namespace: FieldServicesLeaveReporting
operation:
  name: OrgStructureExtract
  inputs:
  - structureFile
  - iteration
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.OrgStructureExtract:1.0.0
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
        action: Script
        object_path: check = objSheet.cells(i,5).value
    - step:
        id: '7'
        action: Script
        object_path: If check = "" Then
    - step:
        id: '8'
        action: Script
        object_path: orgStructure = objSheet.cells(i,1).value
    - step:
        id: '9'
        action: Script
        object_path: orgStructureSelection = objSheet.cells(i,2).value
    - step:
        id: '10'
        action: Script
        object_path: orgStructureValue = objSheet.cells(i,3).value
    - step:
        id: '11'
        action: Script
        object_path: reportName = objSheet.cells(i,6).value
    - step:
        id: '12'
        action: Script
        object_path: folder = objSheet.cells(i,7).value
    - step:
        id: '13'
        action: Script
        object_path: Else
    - step:
        id: '14'
        action: Script
        object_path: orgStructure = "Report completed"
    - step:
        id: '15'
        action: Script
        object_path: orgStructureSelection = "Report completed"
    - step:
        id: '16'
        action: Script
        object_path: orgStructureValue = "Report completed"
    - step:
        id: '17'
        action: Script
        object_path: reportName = "Report completed"
    - step:
        id: '18'
        action: Script
        object_path: folder = "Report completed"
    - step:
        id: '19'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Report completed", "Report completed"
    - step:
        id: '20'
        action: Script
        object_path: End If
    - step:
        id: '21'
        object_path: objWorkbook
        action: save
    - step:
        id: '22'
        object_path: objWorkbook
        action: close
    - step:
        id: '23'
        object_path: objExcel
        action: Quit
    - step:
        id: '24'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '25'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '26'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '27'
        action: Script
        object_path: Parameter("orgStructure") = orgStructure
    - step:
        id: '28'
        action: Script
        object_path: Parameter("orgStructureSelection") = orgStructureSelection
    - step:
        id: '29'
        action: Script
        object_path: Parameter("orgStructureValue") = orgStructureValue
    - step:
        id: '30'
        action: Script
        object_path: Parameter("reportName") = reportName
    - step:
        id: '31'
        action: Script
        object_path: Parameter("folder") = folder
  outputs:
  - orgStructure:
      robot: true
      value: ${orgStructure}
  - orgStructureSelection:
      robot: true
      value: ${orgStructureSelection}
  - orgStructureValue:
      robot: true
      value: ${orgStructureValue}
  - reportName:
      robot: true
      value: ${reportName}
  - folder:
      robot: true
      value: ${folder}
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
