namespace: AssetDeletion
operation:
  name: DeleteExcel
  inputs:
    - singleAsset:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:AssetDeletion.DeleteExcel:1.0.0'
    skills:
      - ActiveX
      - Java
      - PowerBuilder
      - SAP NWBC Desktop
      - SAP
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - UI Automation
      - Visual Basic
      - Web
      - .NET
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
          object_path: 'singleAsset = Parameter("singleAsset")'
      - step:
          id: '2'
          action: Script
          object_path: 'If singleAsset = "" Then'
      - step:
          id: '3'
          action: Script
          object_path: 'Set fso = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '4'
          object_path: fso
          action: "DeleteFile(\"C:\\Users\\svcrpabot\\OneDrive"
          args: "- SA Power Networks\\ServiceNowAutomation\\AssetsToBeDeleted.xlsx\")"
      - step:
          id: '5'
          action: Script
          object_path: Set fso = Nothing
      - step:
          id: '6'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '7'
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
