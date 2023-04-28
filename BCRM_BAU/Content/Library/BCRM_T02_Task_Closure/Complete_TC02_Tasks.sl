namespace: BCRM_T02_Task_Closure
operation:
  name: Complete_TC02_Tasks
  inputs:
    - user
    - pass:
        sensitive: true
  sequential_action:
    gav: 'com.microfocus.seq:BCRM_T02_Task_Closure.Complete_TC02_Tasks:1.0.0'
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
          object_path: "'########################################################################################################################################################################"
      - step:
          id: '2'
          action: Script
          object_path: "'RPA JOB: Close all TC02 Tasks in BCRM Change Tasks"
      - step:
          id: '3'
          action: Script
          object_path: "'Created:01/06/2021"
      - step:
          id: '4'
          action: Script
          object_path: "'Created By: Satya (SA Power Networks)"
      - step:
          id: '5'
          action: Script
          object_path: "'Version: 1.0 Initial version"
      - step:
          id: '6'
          action: Script
          object_path: "'########################################################################################################################################################################"
      - step:
          id: '7'
          action: Script
          object_path: "'Change Log: Record date and reason for change here."
      - step:
          id: '8'
          action: Script
          object_path: "'"
      - step:
          id: '9'
          action: Script
          object_path: "'########################################################################################################################################################################"
      - step:
          id: '10'
          action: Script
          object_path: "''''-------------------------------------------------- Writing Output ----------------------------------------------------------------------"
      - step:
          id: '11'
          action: Script
          object_path: "'Check and create Dir if not there"
      - step:
          id: '12'
          action: Script
          object_path: "TestResultPath = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\T02 Task Closure\\\""
      - step:
          id: '13'
          action: Script
          object_path: Call fn_Verify_Mkdir(TestResultPath)
      - step:
          id: '14'
          action: Script
          object_path: "'Create log file"
      - step:
          id: '15'
          action: Script
          object_path: 'testname =TestResultPath&"TC02_Task_Completion_"'
      - step:
          id: '16'
          action: Script
          object_path: xcelresultname = fn_createlogexcel(testname)
      - step:
          id: '17'
          action: Script
          object_path: "'Openlogexcel"
      - step:
          id: '18'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '19'
          object_path: "'objExcel.Application"
          action: Visible
          args: = True
      - step:
          id: '20'
          action: Script
          object_path: Set objWB = objExcel.workbooks.open(xcelresultname)
      - step:
          id: '21'
          action: Script
          object_path: "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '22'
          action: Script
          object_path: "''''----------------------------------------------Launch SAP -------------------------------------------------------------------"
      - step:
          id: '23'
          action: Script
          object_path: "'SAP - ISU - EAP - Production - SAP - ISU - EAQ"
      - step:
          id: '24'
          action: Script
          object_path: 'Call fn_LaunchSAP_SSO("SAP - ISU - EAP - Production","100",Parameter("user"),Parameter("pass"))'
      - step:
          id: '25'
          action: Script
          object_path: "''''---------------------------------------------Eneter The Tcode --------------------------------------------------------------"
      - step:
          id: '26'
          action: Script
          object_path: 'Call fn_TCode_Nav("/nIW66")'
      - step:
          id: '27'
          action: Script
          object_path: "''''--------------------------------------------fetch the records Task using tas and task Code ---------------------------------"
      - step:
          id: '28'
          action: Script
          object_path: 'Call fn_TaskCode_Nav("HP-SPCDT","TC02")'
      - step:
          id: '29'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '30'
          action: Script
          object_path: "''''--------------------------------------------Read the records and close the job ---------------------------------------------"
      - step:
          id: '31'
          action: Script
          object_path: Call fn_ReadTable_CloseJob()
      - step:
          id: '32'
          action: Script
          object_path: "''''------------------------------------------- Closing Objects ----------------------------------------------------------------"
      - step:
          id: '33'
          action: Script
          object_path: "'closing the workbook"
      - step:
          id: '34'
          object_path: objWB
          action: close
      - step:
          id: '35'
          action: Script
          object_path: "'Quit the Excel and destroying the Excel object"
      - step:
          id: '36'
          object_path: objExcel
          action: Quit
      - step:
          id: '37'
          action: Script
          object_path: Set objWB = Nothing
      - step:
          id: '38'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '39'
          action: Script
          object_path: "'Close SAP"
      - step:
          id: '40'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '41'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '42'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '43'
          action: Script
          object_path: "''''----------------------------------------------Send OutPut Email-------------------------------------------------------------"
      - step:
          id: '44'
          action: Script
          object_path: "' CApturing resuts Image to send email"
      - step:
          id: '45'
          action: Script
          object_path: "'Call fn_ExportExcelDataAsImage(xcelresultname,\"TestResult\",MailAttachment)"
      - step:
          id: '46'
          action: Script
          object_path: "'Sending Email"
      - step:
          id: '47'
          action: Script
          object_path: 'Sender = "SAPN Automation Practice <QA.Automation@sapowernetworks.com.au>"'
      - step:
          id: '48'
          action: Script
          object_path: 'Receiver = "angela.ryan@sapowernetworks.com.au, sai.chamarthi@sapowernetworks.com.au, Lindsay.Freeman@sapowernetworks.com.au"'
      - step:
          id: '49'
          action: Script
          object_path: MyTime = Now
      - step:
          id: '50'
          action: Script
          object_path: 'MessageBody = "<html>Hi All, " & "<p>Closed Task Records sheet is Attached."&"<p><b>TC02 Task Closure Job Executed sucessfully.</b>" & "<p>Generated at  " & MyTime & _'
      - step:
          id: '51'
          action: Script
          object_path: '"<p><img src="&MailAttachment&"></html><br>"'
      - step:
          id: '52'
          action: Script
          object_path: 'Call fgen_CDOSendEmailWithAttach("HP-SPCDT || TC02 || Tasks Closure", Sender, Receiver, MessageBody, xcelresultname)'
      - step:
          id: '53'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '54'
          action: Script
          object_path: "'''============================================================================================================================================="
      - step:
          id: '55'
          action: Script
          object_path: 'Function fn_LaunchSAP_SSO(ConnectionName,SysID,user,password)'
      - step:
          id: '56'
          object_path: SystemUtil
          action: 'CloseProcessByName("msedge.exe")'
      - step:
          id: '57'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '58'
          object_path: SystemUtil
          action: 'CloseProcessByName("iexplorer.exe")'
      - step:
          id: '59'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '60'
          action: Script
          object_path: On error resume next
      - step:
          id: '61'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '62'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '63'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '64'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '65'
          object_path: SAPGuiUtil
          action: AutoLogon
          args: 'ConnectionName,SysID,user,password,"EN"'
      - step:
          id: '66'
          action: Script
          object_path: On error goto 0
      - step:
          id: '67'
          action: Script
          object_path: End Function
      - step:
          id: '68'
          action: Script
          object_path: Function fn_TCode_Nav(Tcode)
      - step:
          id: '69'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '70'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")'
          action: Maximize
      - step:
          id: '71'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")'
          action: Set
          args: Tcode
      - step:
          id: '72'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")'
          action: SendKey
          args: ENTER
      - step:
          id: '73'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '74'
          action: Script
          object_path: End Function
      - step:
          id: '75'
          action: Script
          object_path: 'Function fn_TaskCode_Nav(Task,Taskcode)'
      - step:
          id: '76'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '77'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
          action: SetFocus
      - step:
          id: '78'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
          action: Set
          args: Task
      - step:
          id: '79'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '80'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task Code")'
          action: SetFocus
          highlight_id: '1'
      - step:
          id: '81'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task Code")'
          action: Set
          args: Taskcode
          highlight_id: '1'
      - step:
          id: '82'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiButton("Execute")'
          action: Click
      - step:
          id: '83'
          action: Wait
          args: '"10"'
          default_args: '"1"'
      - step:
          id: '84'
          action: Script
          object_path: End Function
      - step:
          id: '85'
          action: Script
          object_path: Function fn_createlogexcel(TestName)
      - step:
          id: '86'
          action: Script
          object_path: "'Creating the Excel Object"
      - step:
          id: '87'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '88'
          object_path: objExcel.Application
          action: Visible
          args: = True
      - step:
          id: '89'
          object_path: objExcel.Workbooks
          action: Add
      - step:
          id: '90'
          action: Script
          object_path: "'Creating the Workbooks object"
      - step:
          id: '91'
          action: Script
          object_path: Set objWS = objExcel.ActiveWorkBook.worksheets(1)
      - step:
          id: '92'
          object_path: objWS
          action: Name
          args: '= "TestResult"'
      - step:
          id: '93'
          object_path: 'objWS.Cells(1,1)'
          action: value
          args: '= "Notification"'
      - step:
          id: '94'
          object_path: 'objWS.Cells(1,1).Font'
          action: Bold
          args: = True
      - step:
          id: '95'
          object_path: 'objWS.cells(1,1).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '96'
          object_path: 'objWS.Cells(1,2)'
          action: value
          args: '= "Code Group"'
      - step:
          id: '97'
          object_path: 'objWS.Cells(1,2).Font'
          action: Bold
          args: = True
      - step:
          id: '98'
          object_path: 'objWS.cells(1,2).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '99'
          object_path: 'objWS.Cells(1,3)'
          action: value
          args: '= "Task Code"'
      - step:
          id: '100'
          object_path: 'objWS.Cells(1,3).Font'
          action: Bold
          args: = True
      - step:
          id: '101'
          object_path: 'objWS.cells(1,3).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '102'
          object_path: 'objWS.Cells(1,4)'
          action: value
          args: '= "Task Text"'
      - step:
          id: '103'
          object_path: 'objWS.Cells(1,4).Font'
          action: Bold
          args: = True
      - step:
          id: '104'
          object_path: 'objWS.cells(1,4).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '105'
          object_path: 'objWS.Cells(1,5)'
          action: value
          args: '= "Status"'
      - step:
          id: '106'
          object_path: 'objWS.Cells(1,5).Font'
          action: Bold
          args: = True
      - step:
          id: '107'
          object_path: 'objWS.cells(1,5).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '108'
          object_path: 'objWS.Cells(1,6)'
          action: value
          args: '= "Job Closure Time"'
      - step:
          id: '109'
          object_path: 'objWS.Cells(1,6).Font'
          action: Bold
          args: = True
      - step:
          id: '110'
          object_path: 'objWS.cells(1,6).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '111'
          object_path: 'objWS.Cells(1,7)'
          action: value
          args: '= "Job Description"'
      - step:
          id: '112'
          object_path: 'objWS.Cells(1,7).Font'
          action: Bold
          args: = True
      - step:
          id: '113'
          object_path: 'objWS.cells(1,7).Interior'
          action: ColorIndex
          args: = 33
      - step:
          id: '114'
          action: Script
          object_path: 'fname = TestName&Replace(Replace(Replace(Now,"/","")," ","_"),":","")&".xlsx"'
      - step:
          id: '115'
          object_path: objExcel.ActiveWorkBook
          action: SaveAs
          args: fname
      - step:
          id: '116'
          object_path: objExcel
          action: quit
      - step:
          id: '117'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '118'
          action: Script
          object_path: Set objWS = Nothing
      - step:
          id: '119'
          action: Script
          object_path: fn_createlogexcel = fname
      - step:
          id: '120'
          action: Script
          object_path: End Function
      - step:
          id: '121'
          action: Script
          object_path: 'Function WriteResulttoExcel(Notification_Num,Code_Group,Task_Code,Task_Text,Status,JobTime,JobDesc,objWB)'
      - step:
          id: '122'
          action: Script
          object_path: "'Creating the sheet object"
      - step:
          id: '123'
          action: Script
          object_path: 'set objsheet = objWB.worksheets("TestResult")'
      - step:
          id: '124'
          action: Script
          object_path: "' Write test results to excel sheet"
      - step:
          id: '125'
          action: Script
          object_path: rws=objsheet.UsedRange.Rows.count
      - step:
          id: '126'
          object_path: 'objsheet.cells(rws+1,1)'
          action: Value=
          args: Notification_Num
      - step:
          id: '127'
          object_path: 'objsheet.cells(rws+1,1).font'
          action: Bold
          args: = True
      - step:
          id: '128'
          object_path: 'objsheet.cells(rws+1,2)'
          action: Value=
          args: Code_Group
      - step:
          id: '129'
          object_path: 'objsheet.cells(rws+1,3)'
          action: Value=
          args: Task_Code
      - step:
          id: '130'
          object_path: 'objsheet.cells(rws+1,4)'
          action: Value=
          args: Task_Text
      - step:
          id: '131'
          object_path: 'objsheet.cells(rws+1,5)'
          action: Value=
          args: Status
      - step:
          id: '132'
          object_path: 'objsheet.cells(rws+1,6)'
          action: Value=
          args: JobTime
      - step:
          id: '133'
          object_path: 'objsheet.cells(rws+1,7)'
          action: Value=
          args: JobDesc
      - step:
          id: '134'
          action: Script
          object_path: for col=1 to 7
      - step:
          id: '135'
          object_path: objSheet.columns(col)
          action: AutoFit()
      - step:
          id: '136'
          action: Script
          object_path: next
      - step:
          id: '137'
          object_path: objWB
          action: save
      - step:
          id: '138'
          action: Script
          object_path: End Function
      - step:
          id: '139'
          action: Script
          object_path: Function fn_Verify_Mkdir(dirpath)
      - step:
          id: '140'
          action: Script
          object_path: 'Set FSO = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '141'
          action: Script
          object_path: If NOT (FSO.FolderExists(dirpath)) Then
      - step:
          id: '142'
          object_path: FSO
          action: CreateFolder(dirpath)
      - step:
          id: '143'
          action: Script
          object_path: End If
      - step:
          id: '144'
          action: Script
          object_path: Set FSO = nothing
      - step:
          id: '145'
          action: Script
          object_path: End Function
      - step:
          id: '146'
          action: Script
          object_path: Function fn_ReadTable_CloseJob()
      - step:
          id: '147'
          action: Script
          object_path: "'reading table"
      - step:
          id: '148'
          action: Script
          object_path: "TaskListRowCnt\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").RowCount"
      - step:
          id: '149'
          action: Script
          object_path: "'print (\"TaskListRowCnt :\" & TaskListRowCnt)"
      - step:
          id: '150'
          action: Script
          object_path: For i = 1 To TaskListRowCnt
      - step:
          id: '151'
          action: Script
          object_path: "Code_Group\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Code Group\")"
      - step:
          id: '152'
          action: Script
          object_path: "Task_Code\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Code\")"
      - step:
          id: '153'
          action: Script
          object_path: "Task_Text\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Text\")"
      - step:
          id: '154'
          action: Script
          object_path: 'If Code_Group="HP-SPCDT" and Task_Code="TC02" and Task_Text="PROCESS INSTALLER COMMENTS" Then'
      - step:
          id: '155'
          action: Script
          object_path: "Notification_Num\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Notification\")"
      - step:
          id: '156'
          action: Script
          object_path: "'\t\tprint Notification_Num &\" , \" &Code_Group &\" , \" &Task_Code &\" , \"& Task_Text"
      - step:
          id: '157'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: List of").SAPGuiGrid("GridViewCtrl")'
          action: ActivateCell
          args: 'i, "Task Text"'
      - step:
          id: '158'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '159'
          action: Script
          object_path: 'Jobdescription = SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiTextArea("TextAreaControl").GetROProperty("text")'
      - step:
          id: '160'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Complete task   (Ctrl+Shift+F1")'
          action: Click
      - step:
          id: '161'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '162'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Save")'
          action: Click
      - step:
          id: '163'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '164'
          action: Script
          object_path: 'JobCompleted = SAPGuiSession("Session").SAPGuiWindow("Change Tasks: List of").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Selected Line")'
      - step:
          id: '165'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '166'
          action: Script
          object_path: 'If JobCompleted="E" Then'
      - step:
          id: '167'
          action: Script
          object_path: 'Call WriteResulttoExcel(Notification_Num,Code_Group,Task_Code,Task_Text,"Closed Successfully",Now,Jobdescription,objWB)'
      - step:
          id: '168'
          action: Script
          object_path: Else
      - step:
          id: '169'
          action: Script
          object_path: 'Call WriteResulttoExcel(Notification_Num,Code_Group,Task_Code,Task_Text,"Error While Closing",Now,Jobdescription,objWB)'
      - step:
          id: '170'
          action: Script
          object_path: End If
      - step:
          id: '171'
          action: Script
          object_path: End If
      - step:
          id: '172'
          action: Script
          object_path: If i=100 Then
      - step:
          id: '173'
          action: Script
          object_path: Exit For
      - step:
          id: '174'
          action: Script
          object_path: End If
      - step:
          id: '175'
          action: Script
          object_path: Next
      - step:
          id: '176'
          action: Script
          object_path: End Function
      - step:
          id: '177'
          action: Script
          object_path: 'Function fn_ExportExcelDataAsImage(ByVal ExcelWorkBookName,ByVal ExcelWorkSheetName,ByVal ExportFileName)'
      - step:
          id: '178'
          action: Script
          object_path: 'Dim xlsApp,xlsWorkBook,xlsWorkSheet,xlsRange'
      - step:
          id: '179'
          action: Script
          object_path: 'Dim iUsedRowRange,iUsedColumnRange'
      - step:
          id: '180'
          action: Script
          object_path: Const xlScreen = 1
      - step:
          id: '181'
          action: Script
          object_path: Const xlBitmap = 2
      - step:
          id: '182'
          action: Script
          object_path: 'Set xlsApp = CreateObject("Excel.Application")'
      - step:
          id: '183'
          action: Script
          object_path: Set xlsWorkBook = xlsApp.Workbooks.Open(ExcelWorkBookName)
      - step:
          id: '184'
          action: Script
          object_path: Set xlsWorkSheet = xlsWorkBook.Worksheets(ExcelWorkSheetName)
      - step:
          id: '185'
          object_path: xlsApp
          action: Visible
          args: = True
      - step:
          id: '186'
          object_path: xlsWorkSheet
          action: Activate
      - step:
          id: '187'
          object_path: xlsWorkSheet.UsedRange
          action: CopyPicture
          args: 'xlScreen,xlBitmap'
      - step:
          id: '188'
          object_path: 'xlsWorkSheet.ChartObjects.Add xlsWorkSheet.UsedRange.Left, xlsWorkSheet.UsedRange.Top,xlsWorkSheet.UsedRange.Width, xlsWorkSheet.UsedRange'
          action: Height
      - step:
          id: '189'
          object_path: 'xlsApp.ActiveSheet.ChartObjects("Chart 1")'
          action: Select
      - step:
          id: '190'
          object_path: xlsApp.ActiveChart
          action: Paste
      - step:
          id: '191'
          object_path: 'xlsApp.ActiveSheet.ChartObjects("Chart 1").Chart'
          action: Export
          args: ExportFileName
      - step:
          id: '192'
          object_path: 'xlsApp.ActiveSheet.ChartObjects("Chart 1")'
          action: Delete
      - step:
          id: '193'
          object_path: xlsApp
          action: DisplayAlerts
          args: = False
      - step:
          id: '194'
          object_path: xlsApp.Workbooks
          action: Close
      - step:
          id: '195'
          object_path: xlsApp
          action: Quit
      - step:
          id: '196'
          action: Script
          object_path: Set xlsApp = Nothing
      - step:
          id: '197'
          action: Script
          object_path: End Function
      - step:
          id: '198'
          action: Script
          object_path: 'Function fgen_CDOSendEmailWithAttach(Subject, Sender, Receiver, TextBody, FileLocation)'
      - step:
          id: '199'
          action: Script
          object_path: 'Set objMessage = CreateObject("CDO.Message")'
      - step:
          id: '200'
          object_path: "'objMessage"
          action: Subject
          args: '= "Subject of Message"'
      - step:
          id: '201'
          object_path: objMessage
          action: Subject
          args: = Subject
      - step:
          id: '202'
          object_path: "'objMessage"
          action: From
          args: '= """Sender Name"" <"&Environment("UserName")&"@sapowernetworks.mail.onmicrosoft.com"&">"'
      - step:
          id: '203'
          object_path: objMessage
          action: From
          args: = Sender
      - step:
          id: '204'
          object_path: objMessage
          action: To
          args: = Receiver
      - step:
          id: '205'
          action: Script
          object_path: 'If InStr(FileLocation,",")>0 Then'
      - step:
          id: '206'
          action: Script
          object_path: 'filecount = UBound(Split(FileLocation,","))'
      - step:
          id: '207'
          action: Script
          object_path: 'FileLocation=Split(FileLocation,",")'
      - step:
          id: '208'
          action: Script
          object_path: End If
      - step:
          id: '209'
          action: Script
          object_path: 'Set objFSo = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '210'
          action: Script
          object_path: 'If filecount > 0 Then'
      - step:
          id: '211'
          action: Script
          object_path: For fl = 0 to filecount
      - step:
          id: '212'
          action: Script
          object_path: If objFSo.FileExists(FileLocation(fl)) Then
      - step:
          id: '213'
          object_path: objMessage
          action: AddAttachment
          args: FileLocation(fl)
      - step:
          id: '214'
          action: Script
          object_path: Else
      - step:
          id: '215'
          action: Script
          object_path: "TextBody = TextBody & \"( File Not Found, a file was requested to be added to this email. The file could not be found: '\" & FileLocation(fl) &  \"')\""
      - step:
          id: '216'
          action: Script
          object_path: End If
      - step:
          id: '217'
          action: Script
          object_path: Next
      - step:
          id: '218'
          action: Script
          object_path: Else
      - step:
          id: '219'
          action: Script
          object_path: If objFSo.FileExists(FileLocation) Then
      - step:
          id: '220'
          object_path: objMessage
          action: AddAttachment
          args: FileLocation
      - step:
          id: '221'
          action: Script
          object_path: else
      - step:
          id: '222'
          action: Script
          object_path: "TextBody = TextBody & \"( File Not Found, a file was requested to be added to this email. The file could not be found: '\" & FileLocation &  \"')\""
      - step:
          id: '223'
          action: Script
          object_path: End If
      - step:
          id: '224'
          action: Script
          object_path: End If
      - step:
          id: '225'
          action: Script
          object_path: 'If Instr(TextBody,"<html>") Then'
      - step:
          id: '226'
          object_path: objMessage
          action: HTMLBody
          args: = TextBody
      - step:
          id: '227'
          action: Script
          object_path: Else
      - step:
          id: '228'
          object_path: objMessage
          action: TextBody
          args: '= replace(TextBody,"~", vblf )'
      - step:
          id: '229'
          action: Script
          object_path: End If
      - step:
          id: '230'
          object_path: objMessage.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")'
          args: = 2
      - step:
          id: '231'
          action: Script
          object_path: "'Name or IP of Remote SMTP Server"
      - step:
          id: '232'
          object_path: objMessage.Configuration.Fields
          comment: ' <-- your server hostname or IP address'
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")'
          args: '= "emanager"'
      - step:
          id: '233'
          action: Script
          object_path: "'Server port (typically 25)"
      - step:
          id: '234'
          object_path: objMessage.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")'
          args: = 25
      - step:
          id: '235'
          object_path: objMessage.Configuration.Fields
          action: Update
      - step:
          id: '236'
          object_path: objMessage
          action: Send
      - step:
          id: '237'
          action: Script
          object_path: End Function
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Window_2
        child_objects: []
        properties:
          - property:
              value:
                value: TaskListThumbnailWnd
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: TaskListThumbnailWnd
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
        basic_identification:
          property_ref:
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Window
        child_objects:
          - object:
              smart_identification: ''
              name: MSTaskListWClass
              child_objects: []
              properties:
                - property:
                    value:
                      value: MSTaskListWClass
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: MSTaskListWClass
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - regexpwndclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Shell_SecondaryTrayWnd
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: Shell_SecondaryTrayWnd
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
        basic_identification:
          property_ref:
            - text
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier:
            value: 1
            type: location
    - object:
        smart_identification: ''
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: SAP Easy Access  -  User
              child_objects:
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiOKCode
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '35'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[0]/okcd'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SESSION_MANAGER
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '100'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSMTR_NAVIGATION
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: SAP
              child_objects: []
              properties:
                - property:
                    value:
                      value: S000
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '20'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSYST
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Process Task
              child_objects:
                - object:
                    smart_identification: ''
                    name: TextAreaControl
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: shell
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTextArea
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '203'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/cntlDISPLAY_LTXTMASSN/shellcont/shell'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTextArea
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Save
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[11]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[0]/btn[11]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Complete task   (Ctrl+Shift+F1
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[46]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[1]/btn[46]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: IW52
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '4100'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLIQS0
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: License Information for
              child_objects: []
              properties:
                - property:
                    value:
                      value: S000
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '500'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSYST
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[1]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'Change Tasks: Selection'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Tasks
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: MNGRP-LOW
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '32'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/ctxtMNGRP-LOW'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Task Code
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: MNCOD-LOW
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '32'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/ctxtMNCOD-LOW'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[8]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[1]/btn[8]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: IW66
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '1000'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: RIQMEL30
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'Change Tasks: List of'
              child_objects:
                - object:
                    smart_identification: ''
                    name: GridViewCtrl
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: shell
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiGrid
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '201'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/cntlGRID1/shellcont/shell'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiGrid
                    visual_relations: ''
                    last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: IW66
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '500'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSLVC_FULLSCREEN
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'ses[0]'
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiSession
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '12'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: '/app/con[0]/ses[0]'
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
        comments: ''
        custom_replay: ''
        class: SAPGuiSession
        visual_relations: ''
        last_update_time: 'Thursday, 10 March 2022 1:58:22 PM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
