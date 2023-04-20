namespace: ActionBPEMs
operation:
  name: CreateLogFile
  sequential_action:
    gav: com.microfocus.seq:ActionBPEMs.CreateLogFile:1.0.0
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
        object_path: ReportLocation = "C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Action
          BPEMs"
    - step:
        id: '2'
        action: Script
        object_path: rptname = ReportLocation&"\Actioned_MI27_MI79_BPEM_"
    - step:
        id: '3'
        action: Script
        object_path: fname = rptname&Replace(Replace(Replace(Now,"/","")," ","_"),":","")&".xlsx"
    - step:
        id: '4'
        action: Script
        object_path: '''Create excel document'
    - step:
        id: '5'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '6'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '7'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Add()
    - step:
        id: '8'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '9'
        object_path: objSheet.cells(1,1)
        action: value
        args: = "Case ID"
    - step:
        id: '10'
        object_path: objSheet.cells(1,1).Interior
        action: ColorIndex
        args: = 41
    - step:
        id: '11'
        object_path: objSheet.cells(1,1).Font
        action: Bold
        args: = true
    - step:
        id: '12'
        object_path: objSheet.cells(1,1).Borders
        action: ColorIndex
        args: = 1
    - step:
        id: '13'
        object_path: objSheet.cells(1,1)
        action: ColumnWidth
        args: = 15
    - step:
        id: '14'
        object_path: objSheet.cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '15'
        object_path: objSheet.cells(1,2)
        action: value
        args: = "NMI"
    - step:
        id: '16'
        object_path: objSheet.cells(1,2).Interior
        action: ColorIndex
        args: = 41
    - step:
        id: '17'
        object_path: objSheet.cells(1,2).Font
        action: Bold
        args: = true
    - step:
        id: '18'
        object_path: objSheet.cells(1,2).Borders
        action: ColorIndex
        args: = 1
    - step:
        id: '19'
        object_path: objSheet.cells(1,2)
        action: ColumnWidth
        args: = 15
    - step:
        id: '20'
        object_path: objSheet.cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '21'
        object_path: objSheet.cells(1,3)
        action: value
        args: = "Customer Name"
    - step:
        id: '22'
        object_path: objSheet.cells(1,3).Interior
        action: ColorIndex
        args: = 41
    - step:
        id: '23'
        object_path: objSheet.cells(1,3).Font
        action: Bold
        args: = true
    - step:
        id: '24'
        object_path: objSheet.cells(1,3).Borders
        action: ColorIndex
        args: = 1
    - step:
        id: '25'
        object_path: objSheet.cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '26'
        object_path: objSheet.cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '27'
        object_path: objSheet.cells(1,4)
        action: value
        args: = "Status"
    - step:
        id: '28'
        object_path: objSheet.cells(1,4).Interior
        action: ColorIndex
        args: = 41
    - step:
        id: '29'
        object_path: objSheet.cells(1,4).Font
        action: Bold
        args: = true
    - step:
        id: '30'
        object_path: objSheet.cells(1,4).Borders
        action: ColorIndex
        args: = 1
    - step:
        id: '31'
        object_path: objSheet.cells(1,4)
        action: ColumnWidth
        args: = 75
    - step:
        id: '32'
        object_path: objSheet.cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '33'
        object_path: objWorkbook
        action: SaveAs(fname)
    - step:
        id: '34'
        object_path: objWorkbook
        action: close
    - step:
        id: '35'
        object_path: objExcel
        action: Quit
    - step:
        id: '36'
        action: Script
        object_path: Parameter("excelFile") = fname
  outputs:
  - excelFile:
      robot: true
      value: ${excelFile}
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
