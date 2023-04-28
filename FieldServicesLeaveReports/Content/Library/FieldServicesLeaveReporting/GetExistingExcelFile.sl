namespace: FieldServicesLeaveReporting
operation:
  name: GetExistingExcelFile
  inputs:
  - orgStructureSelection
  - reportName:
      required: false
  - existingFileName
  - fileLocation
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.GetExistingExcelFile:1.0.0
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
        object_path: orgStruct = Parameter("orgStructureSelection")
    - step:
        id: '2'
        action: Script
        object_path: report = Parameter("reportName")
    - step:
        id: '3'
        action: Script
        object_path: existingFile = Parameter("existingFileName")
    - step:
        id: '4'
        action: Script
        object_path: fileLocation = Parameter("fileLocation")
    - step:
        id: '5'
        action: Script
        object_path: If report = "" Then
    - step:
        id: '6'
        action: Script
        object_path: If InStr(orgStruct,"/") > 0 Then
    - step:
        id: '7'
        action: Script
        object_path: orgStruct = Replace(orgStruct,"/"," - ")
    - step:
        id: '8'
        action: Script
        object_path: End If
    - step:
        id: '9'
        action: Script
        object_path: If InStr(orgStruct,"|") > 0 Then
    - step:
        id: '10'
        action: Script
        object_path: orgStruct = Replace(orgStruct,"|"," & ")
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: fileName = orgStruct &" "& existingFile & ".xlsx"
    - step:
        id: '13'
        action: Script
        object_path: Else
    - step:
        id: '14'
        action: Script
        object_path: fileName = report &" "& existingFile & ".xlsx"
    - step:
        id: '15'
        action: Script
        object_path: End If
    - step:
        id: '16'
        action: Script
        object_path: Parameter("fileName") = fileName
    - step:
        id: '17'
        action: Script
        object_path: filePath = fileLocation & fileName
    - step:
        id: '18'
        action: Script
        object_path: Parameter("filePath") = filePath
  outputs:
  - filePath:
      robot: true
      value: ${filePath}
  - fileName:
      robot: true
      value: ${fileName}
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
