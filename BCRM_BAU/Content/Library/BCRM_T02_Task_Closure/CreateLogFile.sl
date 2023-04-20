namespace: BCRM_T02_Task_Closure
operation:
  name: CreateLogFile
  sequential_action:
    gav: com.microfocus.seq:BCRM_T02_Task_Closure.CreateLogFile:1.0.0
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
        object_path: '''''''''-------------------------------------------------- Writing
          Output ----------------------------------------------------------------------'
    - step:
        id: '2'
        action: Script
        object_path: TestResultPath = "C:\Users\svcrpabot\OneDrive - SA Power Networks\T02
          Task Closure\TC02_Task_Completion_"
    - step:
        id: '3'
        action: Script
        object_path: fname = TestResultPath&Replace(Replace(Replace(Now,"/",""),"
          ","_"),":","")&".xlsx"
    - step:
        id: '4'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '5'
        action: Script
        object_path: '''''''''----------------------------------------------Create
          Excel for Results -------------------------------------------------------------------'
    - step:
        id: '6'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '7'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '8'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Add()
    - step:
        id: '9'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '10'
        object_path: objWorksheet
        action: name
        args: = "Results"
    - step:
        id: '11'
        action: Script
        object_path: Set objWS = objWorkbook.Worksheets("Results")
    - step:
        id: '12'
        object_path: objWS.Cells(1,1)
        action: value
        args: = "Notification"
    - step:
        id: '13'
        object_path: objWS.Cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '14'
        object_path: objWS.cells(1,1).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '15'
        object_path: objWS.cells(1,1)
        action: ColumnWidth
        args: = 12
    - step:
        id: '16'
        object_path: objWS.Cells(1,2)
        action: value
        args: = "Code Group"
    - step:
        id: '17'
        object_path: objWS.Cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '18'
        object_path: objWS.cells(1,2).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '19'
        object_path: objWS.cells(1,2)
        action: ColumnWidth
        args: = 12
    - step:
        id: '20'
        object_path: objWS.Cells(1,3)
        action: value
        args: = "Task Code"
    - step:
        id: '21'
        object_path: objWS.Cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '22'
        object_path: objWS.cells(1,3).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '23'
        object_path: objWS.cells(1,3)
        action: ColumnWidth
        args: = 10
    - step:
        id: '24'
        object_path: objWS.Cells(1,4)
        action: value
        args: = "Task Text"
    - step:
        id: '25'
        object_path: objWS.Cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '26'
        object_path: objWS.cells(1,4).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '27'
        object_path: objWS.cells(1,4)
        action: ColumnWidth
        args: = 30
    - step:
        id: '28'
        object_path: objWS.Cells(1,5)
        action: value
        args: = "Status"
    - step:
        id: '29'
        object_path: objWS.Cells(1,5).Font
        action: Bold
        args: = True
    - step:
        id: '30'
        object_path: objWS.cells(1,5).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '31'
        object_path: objWS.cells(1,5)
        action: ColumnWidth
        args: = 20
    - step:
        id: '32'
        object_path: objWS.Cells(1,6)
        action: value
        args: = "Job Closure Time"
    - step:
        id: '33'
        object_path: objWS.Cells(1,6).Font
        action: Bold
        args: = True
    - step:
        id: '34'
        object_path: objWS.cells(1,6).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '35'
        object_path: objWS.cells(1,6)
        action: ColumnWidth
        args: = 16
    - step:
        id: '36'
        object_path: objWS.Cells(1,7)
        action: value
        args: = "Job Description"
    - step:
        id: '37'
        object_path: objWS.Cells(1,7).Font
        action: Bold
        args: = True
    - step:
        id: '38'
        object_path: objWS.cells(1,7).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '39'
        object_path: objWS.cells(1,7)
        action: ColumnWidth
        args: = 50
    - step:
        id: '40'
        object_path: objWorkbook
        action: SaveAs(fname)
    - step:
        id: '41'
        object_path: objWorkbook
        action: close
    - step:
        id: '42'
        object_path: objExcel
        action: Quit
    - step:
        id: '43'
        action: Script
        object_path: Parameter("excelLoc") = fname
  outputs:
  - excelLoc:
      robot: true
      value: ${excelLoc}
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
