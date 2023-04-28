namespace: CXOne_Reporting
operation:
  name: ConvertFile
  inputs:
  - rptFileName
  sequential_action:
    gav: com.microfocus.seq:CXOne_Reporting.ConvertFile:1.0.0
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
        object_path: '''get input parameters'
    - step:
        id: '2'
        action: Script
        object_path: filename = Parameter("rptFileName")
    - step:
        id: '3'
        action: Script
        object_path: fileLocation = "C:\Users\svcrpabot\OneDrive - SA Power Networks\CXOne
          Reports\"
    - step:
        id: '4'
        action: Script
        object_path: '''build file path'
    - step:
        id: '5'
        action: Script
        object_path: reportfile = fileLocation & filename
    - step:
        id: '6'
        action: Script
        object_path: newFilename = filename&"x"
    - step:
        id: '7'
        action: Script
        object_path: newReportFile = fileLocation & newFilename
    - step:
        id: '8'
        action: Script
        object_path: '''open excel and save as xlsx'
    - step:
        id: '9'
        action: Script
        object_path: Set appExcel = CreateObject("Excel.Application")
    - step:
        id: '10'
        object_path: appExcel
        action: visible
        args: = False
    - step:
        id: '11'
        object_path: appExcel.Workbooks
        action: Open(reportfile)
    - step:
        id: '12'
        object_path: appExcel.ActiveWorkbook
        comment: ' 43 is the code for xls format'
        action: SaveAs
        args: newReportFile, 51
    - step:
        id: '13'
        object_path: appExcel.Workbooks
        action: Close
    - step:
        id: '14'
        object_path: appExcel
        action: Quit
    - step:
        id: '15'
        action: Script
        object_path: Set appExcel = Nothing
    - step:
        id: '16'
        action: Script
        object_path: '''''delete xls files'
    - step:
        id: '17'
        action: Script
        object_path: '''Const DeleteReadOnly = TRUE'
    - step:
        id: '18'
        action: Script
        object_path: '''Set fs = CreateObject("Scripting.FileSystemObject")'
    - step:
        id: '19'
        action: Script
        object_path: '''For Each File In fs.GetFolder(fileLocation).Files'
    - step:
        id: '20'
        action: Script
        object_path: "'\tIf fs.GetExtensionName(File) = \"xls\" Then"
    - step:
        id: '21'
        action: Script
        object_path: "'\t\tfs.DeleteFile File, DeleteReadOnly"
    - step:
        id: '22'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '23'
        action: Script
        object_path: '''Next'
    - step:
        id: '24'
        action: Script
        object_path: Parameter("xlsxFileName") = newFilename
  outputs:
  - xlsxFileName:
      robot: true
      value: ${xlsxFileName}
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
