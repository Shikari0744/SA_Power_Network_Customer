namespace: LSMW_FileUpload_PoC
operation:
  name: LSMW_File_Upload
  inputs:
    - Project
    - SubProject
    - Object
    - SAP_UserID
    - SAP_Password:
        sensitive: true
    - FilePath
    - BatchSize
    - email
    - SystemID: ERP - PRD - Production
  sequential_action:
    gav: 'com.microfocus.seq:LSMW_FileUpload_PoC.LSMW_File_Upload:1.0.0'
    skills:
      - Java
      - Oracle
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
          object_path: "'test"
      - step:
          id: '2'
          action: Script
          object_path: 'FilePath = Parameter.Item("FilePath")'
      - step:
          id: '3'
          action: Script
          object_path: 'BatchSize = Parameter.Item("BatchSize")'
      - step:
          id: '4'
          action: Script
          object_path: 'Set oDic = CreateObject("Scripting.Dictionary")'
      - step:
          id: '5'
          action: Script
          object_path: 'Set objFSO = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '6'
          action: Script
          object_path: "If Not objFSO.FolderExists(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\") Then"
      - step:
          id: '7'
          object_path: objFSO
          action: CreateFolder
          args: "(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\")"
      - step:
          id: '8'
          action: Script
          object_path: End If
      - step:
          id: '9'
          action: Script
          object_path: If objFSO.FileExists(FilePath) Then
      - step:
          id: '10'
          action: Script
          object_path: FileName = objFSO.GetFileName(FilePath)
      - step:
          id: '11'
          action: Script
          object_path: "If  Not objFSO.FileExists(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileName) Then"
      - step:
          id: '12'
          action: Script
          object_path: FileExtension = objFSO.GetExtensionName(FilePath)
      - step:
          id: '13'
          action: Script
          object_path: 'FileNameWithoutExtension = Replace(FileName, "." & FileExtension, "")'
      - step:
          id: '14'
          object_path: objFSO
          action: CopyFile
          args: "FilePath,\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\", True"
      - step:
          id: '15'
          action: Script
          object_path: FileExistCheck = True
      - step:
          id: '16'
          action: Script
          object_path: End If
      - step:
          id: '17'
          action: Script
          object_path: Else
      - step:
          id: '18'
          object_path: Reporter
          action: ReportEvent
          args: "micFail,\"Check File Exist or not.\",\"File doesn't exist in \" & FilePath"
      - step:
          id: '19'
          action: Script
          object_path: "'\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"SENDING EMAIL NOTIFICATION FOR THE FAILURE"
      - step:
          id: '20'
          action: Script
          object_path: 'fn_SendResultAsEmail Parameter.Item("email"),"LSMW Process Execution Failed as source file is not found.","File not found in the FilePath " & FilePath,"","",""'
      - step:
          id: '21'
          action: Script
          object_path: ExitTest
      - step:
          id: '22'
          action: Script
          object_path: End If
      - step:
          id: '23'
          object_path: DataTable
          action: ImportSheet
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\LSWM_Batch_Files.xlsx\",\"Global\",\"Global\""
      - step:
          id: '24'
          action: Script
          object_path: If FileExistCheck Then
      - step:
          id: '25'
          action: Script
          object_path: Rows = DataTable.GlobalSheet.GetRowCount
      - step:
          id: '26'
          action: Script
          object_path: 'Set objFSO = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '27'
          action: Script
          object_path: "strFile = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileName"
      - step:
          id: '28'
          action: Script
          object_path: 'Set objFile = objFSO.OpenTextFile(strFile,8,True)'
      - step:
          id: '29'
          action: Script
          object_path: NoOfLine = objFile.Line
      - step:
          id: '30'
          object_path: objFile
          action: Close
      - step:
          id: '31'
          action: Script
          object_path: 'Set objFile = objFSO.OpenTextFile(strFile,1)'
      - step:
          id: '32'
          action: Script
          object_path: HeaderLine = objFile.ReadLine
      - step:
          id: '33'
          action: Script
          object_path: "'Print HeaderLine"
      - step:
          id: '34'
          action: Script
          object_path: Set objFile = NOTHING
      - step:
          id: '35'
          action: Script
          object_path: "Set objFileToRead = CreateObject(\"Scripting.FileSystemObject\").OpenTextFile(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileName,1)"
      - step:
          id: '36'
          action: Script
          object_path: Do While Not objFileToRead.AtEndOfStream
      - step:
          id: '37'
          action: Script
          object_path: cnt = cnt + 1
      - step:
          id: '38'
          action: Script
          object_path: If cnt = 1 Then
      - step:
          id: '39'
          action: Script
          object_path: "strFile2 = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileNameWithoutExtension & \"_\" & cnt & \".txt\""
      - step:
          id: '40'
          action: Script
          object_path: 'If Rows > 2 Then'
      - step:
          id: '41'
          action: Script
          object_path: Rows = Rows + 1
      - step:
          id: '42'
          action: Script
          object_path: End If
      - step:
          id: '43'
          object_path: DataTable.GlobalSheet
          action: SetCurrentRow(Rows)
      - step:
          id: '44'
          object_path: oDic
          action: Add
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileNameWithoutExtension & \"_\" & cnt & \".txt\",Rows"
      - step:
          id: '45'
          object_path: DataTable
          action: 'Value("FileName","Global")'
          args: = FileName
      - step:
          id: '46'
          object_path: DataTable
          action: 'Value("BatchName","Global")'
          args: '= FileNameWithoutExtension & "_" & cnt & ".txt"'
      - step:
          id: '47'
          action: Script
          object_path: Set objTS = NOTHING
      - step:
          id: '48'
          action: Script
          object_path: 'Set objTS = objFSO.OpenTextFile(strFile2,8,True)'
      - step:
          id: '49'
          action: Script
          object_path: ElseIf cnt mod BatchSize = 1 Then
      - step:
          id: '50'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '51'
          object_path: objTS
          action: Close
      - step:
          id: '52'
          action: Script
          object_path: "strFile2 = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileNameWithoutExtension & \"_\" & cnt & \".txt\""
      - step:
          id: '53'
          action: Script
          object_path: Rows = Rows + 1
      - step:
          id: '54'
          object_path: DataTable.GlobalSheet
          action: SetCurrentRow(Rows)
      - step:
          id: '55'
          object_path: oDic
          action: Add
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & FileNameWithoutExtension & \"_\" & cnt & \".txt\",Rows"
      - step:
          id: '56'
          object_path: DataTable
          action: 'Value("FileName","Global")'
          args: = FileName
      - step:
          id: '57'
          object_path: DataTable
          action: 'Value("BatchName","Global")'
          args: '= FileNameWithoutExtension & "_" & cnt & ".txt"'
      - step:
          id: '58'
          action: Script
          object_path: Set objTS = NOTHING
      - step:
          id: '59'
          action: Script
          object_path: 'Set objTS = objFSO.OpenTextFile(strFile2,8,True)'
      - step:
          id: '60'
          object_path: objTS
          action: WriteLine(HeaderLine)
      - step:
          id: '61'
          action: Script
          object_path: End If
      - step:
          id: '62'
          object_path: objTS.WriteLine(objFileToRead
          action: ReadLine)
      - step:
          id: '63'
          action: Script
          object_path: Loop
      - step:
          id: '64'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '65'
          object_path: objTS
          action: Close
      - step:
          id: '66'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '67'
          object_path: objFileToRead
          action: Close
      - step:
          id: '68'
          action: Script
          object_path: Set objFileToRead = NOTHING
      - step:
          id: '69'
          action: Script
          object_path: Set objTS = NOTHING
      - step:
          id: '70'
          action: Script
          object_path: Set objFSO = NOTHING
      - step:
          id: '71'
          action: Script
          object_path: EndTime = Timer
      - step:
          id: '72'
          action: Script
          object_path: "'TimeIt = EndTime - StartTime"
      - step:
          id: '73'
          action: Script
          object_path: "'Print TimeIt & \" Secs\""
      - step:
          id: '74'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '75'
          action: Script
          object_path: End If
      - step:
          id: '76'
          action: Script
          object_path: Rows = DataTable.GlobalSheet.GetRowCount
      - step:
          id: '77'
          action: Script
          object_path: For l = 1 To Rows
      - step:
          id: '78'
          object_path: DataTable.GlobalSheet
          action: SetCurrentRow(l)
      - step:
          id: '79'
          action: Script
          object_path: 'fName = DataTable.Value("FileName","Global")'
      - step:
          id: '80'
          action: Script
          object_path: "'\tExecutedBy = DataTable.Value(\"FileName\",\"Global\")"
      - step:
          id: '81'
          action: Script
          object_path: "'\tExecutionDate = DataTable.Value(\"FileName\",\"Global\")"
      - step:
          id: '82'
          action: Script
          object_path: 'exStatus = DataTable.Value("ExecutionStatus","Global")'
      - step:
          id: '83'
          action: Script
          object_path: "'\tExecutionDuration = DataTable.Value(\"FileName\",\"Global\")"
      - step:
          id: '84'
          action: Script
          object_path: If fName = FileName And  exStatus = EMPTY Then
      - step:
          id: '85'
          action: Script
          object_path: 'bName = DataTable.Value("BatchName","Global")'
      - step:
          id: '86'
          action: Script
          object_path: Exit For
      - step:
          id: '87'
          action: Script
          object_path: End If
      - step:
          id: '88'
          action: Script
          object_path: Next
      - step:
          id: '89'
          action: Script
          object_path: 'If bName <> EMPTY Then'
      - step:
          id: '90'
          action: Script
          object_path: StartTime = Timer
      - step:
          id: '91'
          object_path: DataTable.GlobalSheet
          action: SetCurrentRow(l)
      - step:
          id: '92'
          object_path: 'DataTable.Value("ExecutedBy","Global") = Parameter'
          action: 'Item("SAP_UserID")'
      - step:
          id: '93'
          object_path: DataTable
          action: 'Value("ExecutionDate","Global")'
          args: = Now
      - step:
          id: '94'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '95'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '96'
          object_path: "'Crypt.Encrypt(Parameter"
          action: 'Item("SAP_Password"))'
      - step:
          id: '97'
          object_path: 'SAPGuiUtil.AutoLogon Parameter.Item("SystemID"),"410",Parameter.Item("SAP_UserID"),Parameter'
          action: 'Item("SAP_Password"),""'
      - step:
          id: '98'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '99'
          action: Script
          object_path: 'sapn_screenShot_done "SAP Login Screenshot"'
      - step:
          id: '100'
          action: Script
          object_path: "'---------------------------------Specify File for Upload------------------------------------------------------"
      - step:
          id: '101'
          action: Script
          object_path: 'If Not SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").Exist(0) Then'
      - step:
          id: '102'
          action: Script
          object_path: "screenShotFileLocaiton = \"C:\\Temp\\SAP_Login_Failure.png\""
      - step:
          id: '103'
          object_path: Desktop
          action: CaptureBitmap
          args: 'screenShotFileLocaiton ,true'
      - step:
          id: '104'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '105'
          action: Script
          object_path: 'Set objFSo = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '106'
          action: Wait
          args: '"0,50"'
          default_args: '"1"'
      - step:
          id: '107'
          action: Script
          object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
      - step:
          id: '108'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Step", msg, screenShotFileLocaiton'
      - step:
          id: '109'
          action: Script
          object_path: 'fn_SendResultAsEmail Parameter.Item("email"),"LSMW Process Execution - SAP Login Failed.","Unable to login to SAP. Please check the attached screen shot.",screenShotFileLocaiton,"",""'
      - step:
          id: '110'
          object_path: SystemUtil
          action: Run
          args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
      - step:
          id: '111'
          action: Script
          object_path: else
      - step:
          id: '112'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Step", msg'
      - step:
          id: '113'
          action: Script
          object_path: end if
      - step:
          id: '114'
          action: Script
          object_path: Set objFSo = NOTHING
      - step:
          id: '115'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '116'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '117'
          action: Script
          object_path: ExitTest
      - step:
          id: '118'
          action: Script
          object_path: End If
      - step:
          id: '119'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nLSMW"'
      - step:
          id: '120'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")'
          action: SendKey
          args: ENTER
      - step:
          id: '121'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '122'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiButton("Continue   (Enter)").Exist(1) Then'
      - step:
          id: '123'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '124'
          action: Script
          object_path: End If
      - step:
          id: '125'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '126'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Project").Set Parameter'
          action: 'Item("Project")'
      - step:
          id: '127'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Subproject").Set Parameter'
          action: 'Item("SubProject")'
      - step:
          id: '128'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Object").Set Parameter'
          action: 'Item("Object")'
      - step:
          id: '129'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Continue   (F8)")'
          action: Click
      - step:
          id: '130'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '131'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Specify Files")'
      - step:
          id: '132'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '133'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '134'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '135'
          object_path: "SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"\\\\utilities.etsa.net.au\\Citrix\")"
          action: SetFocus
      - step:
          id: '136'
          object_path: "SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"\\\\utilities.etsa.net.au\\Citrix\")"
          action: SetCaretPos
          args: '1'
      - step:
          id: '137'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change Entry   (Ctrl+F3)").Exist(0) Then'
      - step:
          id: '138'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change Entry   (Ctrl+F3)")'
          action: Click
      - step:
          id: '139'
          action: Script
          object_path: Else
      - step:
          id: '140'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Display <-> Change   (Ctrl+F1)")'
          action: Click
      - step:
          id: '141'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change Entry   (Ctrl+F3)")'
          action: Click
      - step:
          id: '142'
          action: Script
          object_path: End If
      - step:
          id: '143'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '144'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("File on Front End: Display").SAPGuiEdit("File")'
          action: Set
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & bName"
      - step:
          id: '145'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("File on Front End: Display").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '146'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '147'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"ETSA_PM_FLCHAR_VAL.lsmw.read\")"
          action: SetFocus
      - step:
          id: '148'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"ETSA_PM_FLCHAR_VAL.lsmw.read\")"
          action: SetCaretPos
          args: '1'
      - step:
          id: '149'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\")"
          action: SendKey
          args: F2
      - step:
          id: '150'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"Imported Data: Display\").SAPGuiButton(\"Continue   (Enter)\")"
          action: Click
      - step:
          id: '151'
          action: Script
          object_path: "'"
      - step:
          id: '152'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"ETSA_PM_FLCHAR_VAL.lsmw.conv\")"
          action: SetFocus
      - step:
          id: '153'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"ETSA_PM_FLCHAR_VAL.lsmw.conv\")"
          action: SetCaretPos
          args: '1'
      - step:
          id: '154'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\")"
          action: SendKey
          args: F2
      - step:
          id: '155'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"Converted Data: Display\").SAPGuiButton(\"Continue   (Enter)\")"
          action: Click
      - step:
          id: '156'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Save   (Ctrl+S)")'
          action: Click
      - step:
          id: '157'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiStatusBar("StatusBar")'
          action: Sync
      - step:
          id: '158'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '159'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '160'
          action: Script
          object_path: "'------------------------------------------------------------------"
      - step:
          id: '161'
          action: Script
          object_path: "''---------------------Assign Files-----------------------------"
      - step:
          id: '162'
          action: Script
          object_path: "'row = SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\").FindRowByCellContent(\"Process Step\",\"Assign Files\")"
      - step:
          id: '163'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\")"
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '164'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\")"
          action: SendKey
          args: F2
      - step:
          id: '165'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiButton(\"Display <-> Change   (Ctrl+F1)\")"
          action: Click
      - step:
          id: '166'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiButton(\"Save   (Ctrl+S)\")"
          action: Click
      - step:
          id: '167'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiButton(\"Back\")"
          action: Click
      - step:
          id: '168'
          action: Script
          object_path: "''-------------------------------------------------------------------------------------"
      - step:
          id: '169'
          action: Script
          object_path: "'---------------------Read Data-----------------------------"
      - step:
          id: '170'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Read Data")'
      - step:
          id: '171'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '172'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '173'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '174'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Import_2").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '175'
          action: Script
          object_path: 'While Not SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").Exist(0)'
      - step:
          id: '176'
          action: Script
          object_path: Wend
      - step:
          id: '177'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '178'
          action: Script
          object_path: "'\tRecordsRead = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"Records Read\").GetROProperty(\"content\"))"
      - step:
          id: '179'
          action: Script
          object_path: "'\tTransactionsWritten = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"Transactions Written\").GetROProperty(\"content\"))"
      - step:
          id: '180'
          action: Script
          object_path: "'\tRecordsWritten = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Specify\").SAPGuiLabel(\"Records Written\").GetROProperty(\"content\"))"
      - step:
          id: '181'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '182'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Import_2").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '183'
          action: Script
          object_path: "'---------------------------------------------------------------------------"
      - step:
          id: '184'
          action: Script
          object_path: "''---------------------Display Read Data-----------------------------"
      - step:
          id: '185'
          action: Script
          object_path: "'row = SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\").FindRowByCellContent(\"Process Step\",\"Display Read Data\")"
      - step:
          id: '186'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\")"
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '187'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\")"
          action: SendKey
          args: F2
      - step:
          id: '188'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"Display Read Data\").SAPGuiButton(\"Continue   (Enter)\")"
          action: Click
      - step:
          id: '189'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Imported\").SAPGuiButton(\"Back\")"
          action: Click
      - step:
          id: '190'
          action: Script
          object_path: "''----------------------------------------------------------------------------"
      - step:
          id: '191'
          action: Script
          object_path: "'---------------------Convert Data-----------------------------"
      - step:
          id: '192'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Convert Data")'
      - step:
          id: '193'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '194'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '195'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '196'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Convert").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '197'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '198'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '199'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Convert").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '200'
          action: Script
          object_path: "'----------------------------------------------------------------------------"
      - step:
          id: '201'
          action: Script
          object_path: "''---------------------Display Convert Data-----------------------------"
      - step:
          id: '202'
          action: Script
          object_path: "'row = SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\").FindRowByCellContent(\"Process Step\",\"Display Converted Data\")"
      - step:
          id: '203'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\").SAPGuiTable(\"/SAPDMC/SAPLLSMW_OBJ_000TC_STE\")"
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '204'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: ETSA, PM,\")"
          action: SendKey
          args: F2
      - step:
          id: '205'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"Display Converted Data\").SAPGuiButton(\"Continue   (Enter)\")"
          action: Click
      - step:
          id: '206'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"LSM Workbench: Imported\").SAPGuiButton(\"Back\")"
          action: Click
      - step:
          id: '207'
          action: Script
          object_path: "''----------------------------------------------------------------------------"
      - step:
          id: '208'
          action: Script
          object_path: "'---------------------Create Batch Input Session-----------------------------"
      - step:
          id: '209'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Create Batch Input Session")'
      - step:
          id: '210'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '211'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '212'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '213'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Create").SAPGuiCheckBox("Keep batch input folder(s)?")'
          action: Set
          args: '"ON"'
      - step:
          id: '214'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Create").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '215'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '216'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '217'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '218'
          action: Script
          object_path: "'-----------------------------------------------------------------------------------------"
      - step:
          id: '219'
          action: Script
          object_path: "'---------------------Run Batch Input Session-----------------------------"
      - step:
          id: '220'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Run Batch Input Session")'
      - step:
          id: '221'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '222'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '223'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '224'
          action: Script
          object_path: 'SessionName = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Session Name")'
      - step:
          id: '225'
          action: Script
          object_path: 'Status = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Status")'
      - step:
          id: '226'
          action: Script
          object_path: 'ExecDate = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Date")'
      - step:
          id: '227'
          action: Script
          object_path: 'ExecTime = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Time")'
      - step:
          id: '228'
          action: Script
          object_path: 'ExecDate = DateValue(Replace(ExecDate,".", "/"))'
      - step:
          id: '229'
          action: Script
          object_path: ExecTime = TimeValue(ExecTime)
      - step:
          id: '230'
          action: Script
          object_path: 'CurTime = TimeValue(DateAdd("n",-5,now))'
      - step:
          id: '231'
          action: Script
          object_path: 'CreatedBy = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Created By")'
      - step:
          id: '232'
          action: Script
          object_path: 'TransactionCounter = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Trans.")'
      - step:
          id: '233'
          action: Script
          object_path: 'If InStr(Parameter.Item("Object"),SessionName) > 0 And LCase(Parameter.Item("SAP_UserID")) = LCase(CreatedBy) And Status = "B_CREA" And ExecDate = Date And CurTime < ExecTime Then'
      - step:
          id: '234'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectRow
          args: '1'
      - step:
          id: '235'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectCell
          args: '1,"Session Name"'
      - step:
          id: '236'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Process")'
          action: Click
      - step:
          id: '237'
          action: Script
          object_path: "'If Parameter.Item(\"ProcessingMode\") = \"Background\" Then"
      - step:
          id: '238'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Background")'
          action: Set
      - step:
          id: '239'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Background")'
          action: SetFocus
      - step:
          id: '240'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiButton("Process")'
          action: Click
      - step:
          id: '241'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiStatusBar("StatusBar")'
          action: Sync
      - step:
          id: '242'
          action: Script
          object_path: Flag = True
      - step:
          id: '243'
          action: Script
          object_path: "'End If"
      - step:
          id: '244'
          action: Script
          object_path: Else
      - step:
          id: '245'
          object_path: Reporter
          action: ReportEvent
          args: "micFail,\"'Run Batch Input Session' screen\",\"No record found in the 'Run Batch Input Session' screen.\""
      - step:
          id: '246'
          action: Script
          object_path: "screenShotFileLocaiton = \"C:\\Temp\\Run_Batch_Input_Session_Screen.png\""
      - step:
          id: '247'
          object_path: Desktop
          action: CaptureBitmap
          args: 'screenShotFileLocaiton ,true'
      - step:
          id: '248'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '249'
          action: Script
          object_path: 'Set objFSo = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '250'
          action: Wait
          args: '"0,50"'
          default_args: '"1"'
      - step:
          id: '251'
          action: Script
          object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
      - step:
          id: '252'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Step", msg, screenShotFileLocaiton'
      - step:
          id: '253'
          action: Script
          object_path: "fn_SendResultAsEmail Parameter.Item(\"email\"),\"No record record in the 'Run Batch Input Session' screen for the batch \" & bName,\"\",screenShotFileLocaiton,\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & bName,\"\""
      - step:
          id: '254'
          object_path: SystemUtil
          action: Run
          args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
      - step:
          id: '255'
          action: Script
          object_path: else
      - step:
          id: '256'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Step", msg'
      - step:
          id: '257'
          action: Script
          object_path: end if
      - step:
          id: '258'
          action: Script
          object_path: Set objFSo = NOTHING
      - step:
          id: '259'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '260'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '261'
          action: Script
          object_path: ExitTest
      - step:
          id: '262'
          action: Script
          object_path: End If
      - step:
          id: '263'
          action: Script
          object_path: While Flag
      - step:
          id: '264'
          action: Wait
          args: '"15"'
          default_args: '"1"'
      - step:
          id: '265'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '266'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '267'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process Step","Run Batch Input Session")'
      - step:
          id: '268'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
          action: SelectCell
          args: 'row,"Process Step"'
      - step:
          id: '269'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,")'
          action: SendKey
          args: F2
      - step:
          id: '270'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '271'
          action: Script
          object_path: 'Status = SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Status")'
      - step:
          id: '272'
          action: Script
          object_path: 'If Status = "STACRI" Then'
      - step:
          id: '273'
          action: Script
          object_path: Flag = False
      - step:
          id: '274'
          object_path: DataTable
          action: 'Value("ExecutionStatus","Global")'
          args: '= "Failed"'
      - step:
          id: '275'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectRow
          args: '1'
      - step:
          id: '276'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectCell
          args: '1,"Session Name"'
      - step:
          id: '277'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Analysis")'
          action: Click
      - step:
          id: '278'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '279'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")'
          action: Maximize
      - step:
          id: '280'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '281'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")'
          action: CaptureBitmap
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\",True"
      - step:
          id: '282'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '283'
          object_path: Reporter
          action: ReportEvent
          args: "micDone, \"Step\",\"Screenshot: Analysis\", \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\""
      - step:
          id: '284'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '285'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '286'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '287'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Log")'
          action: Click
      - step:
          id: '288'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '289'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview").SAPGuiTable("RSBDC_PROTOCOLTC_PROTOCOL")'
          action: SelectRow
          args: '1'
      - step:
          id: '290'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview")'
          action: SendKey
          args: F2
      - step:
          id: '291'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '292'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session").SAPGuiButton("Print from ABAP list viewer")'
          action: Click
      - step:
          id: '293'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiButton("Spreadsheet...   (Ctrl+Shift+F")'
          action: Click
      - step:
          id: '294'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Select Spreadsheet").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '295'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_3").SAPGuiStatusBar("StatusBar")'
          action: Sync
      - step:
          id: '296'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '297'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("Directory")'
          action: Set
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\""
      - step:
          id: '298'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '299'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("Directory")'
          action: SetFocus
      - step:
          id: '300'
          action: Script
          object_path: 'fn = Replace(bName,".txt","") & ".xlsx"'
      - step:
          id: '301'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("File Name")'
          action: Set
          args: fn
      - step:
          id: '302'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '303'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiButton("Generate")'
          action: Click
      - step:
          id: '304'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiStatusBar("StatusBar")'
          action: Sync
      - step:
          id: '305'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '306'
          action: Script
          object_path: 'If Window("Excel").Dialog("Microsoft Excel").WinButton("Yes").Exist(4) Then'
      - step:
          id: '307'
          object_path: 'Window("Excel").Dialog("Microsoft Excel").WinButton("Yes")'
          action: Click
      - step:
          id: '308'
          action: Script
          object_path: End If
      - step:
          id: '309'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '310'
          object_path: 'Window("Excel")'
          action: Close
      - step:
          id: '311'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '312'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '313'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '314'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '315'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '316'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '317'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '318'
          action: Script
          object_path: "fn_SendResultAsEmail Parameter.Item(\"email\"),\"File Process Status on \" & ExecDate & \" \" & ExecTime,\"File Location: \" & Parameter.Item(\"FilePath\"),\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\",\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & bName,\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & fn"
      - step:
          id: '319'
          action: Script
          object_path: 'ElseIf Status = "STA_OK" Then'
      - step:
          id: '320'
          action: Script
          object_path: Flag = False
      - step:
          id: '321'
          object_path: DataTable
          action: 'Value("ExecutionStatus","Global")'
          args: '= "Passed"'
      - step:
          id: '322'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectRow
          args: '1'
      - step:
          id: '323'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
          action: SelectCell
          args: '1,"Session Name"'
      - step:
          id: '324'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Analysis")'
          action: Click
      - step:
          id: '325'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '326'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")'
          action: Maximize
      - step:
          id: '327'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '328'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")'
          action: CaptureBitmap
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\",True"
      - step:
          id: '329'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '330'
          object_path: Reporter
          action: ReportEvent
          args: "micDone, \"Step\",\"Screenshot: Analysis\", \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\""
      - step:
          id: '331'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '332'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '333'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '334'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session Overview").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '335'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA, PM,").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '336'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '337'
          action: Script
          object_path: "fn_SendResultAsEmail Parameter.Item(\"email\"),\"File Process Status on \" & ExecDate & \" \" & ExecTime,\"File Location: \" & Parameter.Item(\"FilePath\"),\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\Analysis.png\",\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\\" & bName,\"\""
      - step:
          id: '338'
          action: Script
          object_path: End If
      - step:
          id: '339'
          action: Script
          object_path: Wend
      - step:
          id: '340'
          action: Script
          object_path: EndTime = Timer
      - step:
          id: '341'
          action: Script
          object_path: 'TimeIt = Round((EndTime - StartTime)/60,2)'
      - step:
          id: '342'
          object_path: DataTable
          action: 'Value("ExecutionDuration","Global")'
          args: '= TimeIt & " Mins"'
      - step:
          id: '343'
          object_path: DataTable
          action: DeleteSheet
          args: '"Action1"'
      - step:
          id: '344'
          object_path: DataTable
          action: ExportSheet
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\LSWM_Batch_Files.xlsx\",\"Global\",\"Global\""
      - step:
          id: '345'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '346'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '347'
          action: Script
          object_path: fn = EMPTY
      - step:
          id: '348'
          action: Script
          object_path: row = EMPTY
      - step:
          id: '349'
          action: Script
          object_path: RecordsRead = EMPTY
      - step:
          id: '350'
          action: Script
          object_path: TransactionsWritten = EMPTY
      - step:
          id: '351'
          action: Script
          object_path: RecordsWritten = EMPTY
      - step:
          id: '352'
          action: Script
          object_path: SessionName = EMPTY
      - step:
          id: '353'
          action: Script
          object_path: Status = EMPTY
      - step:
          id: '354'
          action: Script
          object_path: ExecDate = EMPTY
      - step:
          id: '355'
          action: Script
          object_path: ExecTime = EMPTY
      - step:
          id: '356'
          action: Script
          object_path: CurTime = EMPTY
      - step:
          id: '357'
          action: Script
          object_path: CreatedBy = EMPTY
      - step:
          id: '358'
          action: Script
          object_path: TransactionCounter = EMPTY
      - step:
          id: '359'
          action: Script
          object_path: Flag = EMPTY
      - step:
          id: '360'
          action: Script
          object_path: Status = EMPTY
      - step:
          id: '361'
          action: Script
          object_path: Else
      - step:
          id: '362'
          action: Script
          object_path: "fn_SendResultAsEmail Parameter.Item(\"email\"),\"LSMW Execution Status for the File \" & Parameter.Item(\"FilePath\"),\"No batch found for execution! Suggest checking attached process execution records.\",\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\AIFW\\LSWM_Batch_Files.xlsx\",\"\",\"\""
      - step:
          id: '363'
          action: Script
          object_path: End If
      - step:
          id: '364'
          action: Script
          object_path: ExitTest
      - step:
          id: '365'
          action: Script
          object_path: 'Function fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment,Attachment2,Attachment3)'
      - step:
          id: '366'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '367'
          object_path: MyEmail
          action: Subject
          args: = Subject
      - step:
          id: '368'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '369'
          object_path: MyEmail
          action: To
          args: = EmailTo
      - step:
          id: '370'
          object_path: MyEmail
          action: TextBody
          args: = Body
      - step:
          id: '371'
          action: Script
          object_path: 'If Attachment <> EMPTY Then'
      - step:
          id: '372'
          object_path: MyEmail
          action: AddAttachment
          args: Attachment
      - step:
          id: '373'
          action: Script
          object_path: End If
      - step:
          id: '374'
          action: Script
          object_path: 'If Attachment2 <> EMPTY Then'
      - step:
          id: '375'
          object_path: MyEmail
          action: AddAttachment
          args: Attachment2
      - step:
          id: '376'
          action: Script
          object_path: End If
      - step:
          id: '377'
          action: Script
          object_path: 'If Attachment3 <> EMPTY Then'
      - step:
          id: '378'
          object_path: MyEmail
          action: AddAttachment
          args: Attachment3
      - step:
          id: '379'
          action: Script
          object_path: End If
      - step:
          id: '380'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '381'
          action: Script
          object_path: "'SMTP Server"
      - step:
          id: '382'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '383'
          action: Script
          object_path: "'SMTP Port"
      - step:
          id: '384'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '385'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '386'
          object_path: MyEmail
          action: Send
      - step:
          id: '387'
          action: Script
          object_path: Set MyEmail = NOTHING
      - step:
          id: '388'
          action: Script
          object_path: EmailTo = EMPTY
      - step:
          id: '389'
          action: Script
          object_path: Subject = EMPTY
      - step:
          id: '390'
          action: Script
          object_path: Body = EMPTY
      - step:
          id: '391'
          action: Script
          object_path: Attachment = EMPTY
      - step:
          id: '392'
          action: Script
          object_path: Attachment2 = EMPTY
      - step:
          id: '393'
          action: Script
          object_path: End Function
      - step:
          id: '394'
          action: Script
          object_path: Sub sapn_screenShot_done(msg)
      - step:
          id: '395'
          action: Script
          object_path: "screenShotFileLocaiton = \"C:\\Temp\\HP-UFT-Test.png\""
      - step:
          id: '396'
          object_path: Desktop
          action: CaptureBitmap
          args: 'screenShotFileLocaiton ,true'
      - step:
          id: '397'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '398'
          action: Script
          object_path: 'Set objFSo = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '399'
          action: Wait
          args: '"0,50"'
          default_args: '"1"'
      - step:
          id: '400'
          action: Script
          object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
      - step:
          id: '401'
          object_path: Reporter
          action: ReportEvent
          args: 'micDone, "Step", msg, screenShotFileLocaiton'
      - step:
          id: '402'
          action: Script
          object_path: "'sapn_writeLogFile msg"
      - step:
          id: '403'
          object_path: SystemUtil
          action: Run
          args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
      - step:
          id: '404'
          action: Script
          object_path: else
      - step:
          id: '405'
          object_path: Reporter
          action: ReportEvent
          args: 'micDone, "Step", msg'
      - step:
          id: '406'
          action: Script
          object_path: "'sapn_writeLogFile msg"
      - step:
          id: '407'
          action: Script
          object_path: end if
      - step:
          id: '408'
          action: Wait
          args: '"0,50"'
          default_args: '"1"'
      - step:
          id: '409'
          action: Script
          object_path: Set objFSo = Nothing
      - step:
          id: '410'
          action: Script
          object_path: End Sub
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
        name: File Explorer
        child_objects:
          - object:
              smart_identification: ''
              name: WinTreeView
              child_objects: []
              properties:
                - property:
                    value:
                      value: SysTreeView32
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: attached text
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: SysTreeView32
                  name: simclass
                  type: STRING
              class: WinTreeView
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
              basic_identification:
                property_ref:
                  - nativeclass
                  - attached text
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Edit
              child_objects: []
              properties:
                - property:
                    value:
                      value: Edit
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              class: WinEdit
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
              basic_identification:
                property_ref:
                  - nativeclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: AIFW
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: CabinetWClass
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
            value: CabinetWClass
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Excel
        child_objects:
          - object:
              smart_identification: ''
              name: Microsoft Excel
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'Yes'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '&Yes'
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Button
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: Button
                        name: simclass
                        type: STRING
                    class: WinButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - nativeclass
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: Microsoft Excel
                      regular_expression: false
                    name: text
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '#32770'
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '-1'
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
                  value: '#32770'
                  name: simclass
                  type: STRING
              class: Dialog
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
              basic_identification:
                property_ref:
                  - text
                  - nativeclass
                  - is owned window
                  - is child window
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Excel
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: XLMAIN
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
            value: XLMAIN
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: Variant Attributes
              child_objects:
                - object:
                    smart_identification: ''
                    name: Save   (Ctrl+S)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '281'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSVAR
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Session Statistics IL02_USERST
              child_objects: []
              properties:
                - property:
                    value:
                      value: SM35
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
                      value: SAPMSBDC_CC
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Select Spreadsheet
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
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
                      value: SAPLSLVC_EXPORT_XML
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '200'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: /SAPDMC/SAPMLSMW
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Process Session IL02_USERSTA
              child_objects:
                - object:
                    smart_identification: ''
                    name: Process/foreground
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Process/foreground
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: D0300-HELL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiRadioButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '41'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[1]/usr/radD0300-HELL'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Background
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Background
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: D0300-BATCH
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiRadioButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '41'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[1]/usr/radD0300-BATCH'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Process
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '300'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSBDC_CC
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Specify'
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Transactions Written
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[63,25]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[63,25]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Records Written
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[94,25]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[94,25]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Records Read
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[32,25]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[32,25]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: ETSA_PM_FLCHAR_VAL.lsmw.read
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,17]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,17]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: ETSA_PM_FLCHAR_VAL.lsmw.conv
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,21]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,21]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: "\\\\utilities.etsa.net.au\\Citrix"
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,6]'
                            regular_expression: false
                          name: relativeid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiLabel
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '30'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[43,6]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Save   (Ctrl+S)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Refresh   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[0]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: 'Display <-> Change   (Ctrl+F1)'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[25]'
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
                            value: 'wnd[0]/tbar[1]/btn[25]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Change Entry   (Ctrl+F3)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[27]'
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
                            value: 'wnd[0]/tbar[1]/btn[27]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Cancel
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[12]'
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
                            value: 'wnd[0]/tbar[0]/btn[12]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '120'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSSY0
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Imported'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Import_3'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/1CADMC/SAP_LSMW_READ_.*'
                      regular_expression: true
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
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Import_2'
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Save as Variant...   (Ctrl+S)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
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
                    custom_replay:
                      behavior: ''
                    class: SAPGuiButton
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/1CADMC/SAP_LSMW_READ_.*'
                      regular_expression: true
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
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Import'
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Save as Variant...   (Ctrl+S)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/1CADMC/SAP_LSMW_READ_.*'
                      regular_expression: true
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
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: ETSA, PM,'
              child_objects:
                - object:
                    smart_identification: ''
                    name: /SAPDMC/SAPLLSMW_OBJ_000TC_STE
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: /SAPDMC/SAPLLSMW_OBJ_000TC_STEPLIST
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTable
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '80'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tbl/SAPDMC/SAPLLSMW_OBJ_000TC_STEPLIST'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
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
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Create'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Keep batch input folder(s)?
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Keep batch input folder(s)?
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: P_KEEP
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiCheckBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '42'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/chkP_KEEP'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiCheckBox
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: /SAPDMC/SAP_LSMW_BI_RECORDING
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'LSM Workbench: Convert'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/1CADMC/SAP_LSMW_CONV_.*'
                      regular_expression: true
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
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Log Off
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'No'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SPOP-OPTION2
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
                            value: 'wnd[1]/usr/btnSPOP-OPTION2'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
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
                      value: SAPLSPO1
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Legacy System Migration
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Subproject
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: /SAPDMC/LSSCREEN-SUBPROJ
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
                            value: 'wnd[0]/usr/ctxt/SAPDMC/LSSCREEN-SUBPROJ'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Project
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: /SAPDMC/LSSCREEN-PROJECT
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
                            value: 'wnd[0]/usr/ctxt/SAPDMC/LSSCREEN-PROJECT'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Object
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: /SAPDMC/LSSCREEN-OBJECT
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
                            value: 'wnd[0]/usr/ctxt/SAPDMC/LSSCREEN-OBJECT'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Continue   (F8)
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: /SAPDMC/SAPMLSMW
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Information
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '10'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSDYP
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Imported Data: Display'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '130'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
                      regular_expression: true
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
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'File on Front End: Display'
              child_objects:
                - object:
                    smart_identification: ''
                    name: File
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: /SAPDMC/LSFSCREEN-FILENAME
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
                            value: 'wnd[1]/usr/ctxt/SAPDMC/LSFSCREEN-FILENAME'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '210'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
                      regular_expression: true
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
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Display Read Data
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
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
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
                      regular_expression: true
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
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Display Converted Data
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '300'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
                      regular_expression: true
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
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Converted Data: Display'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: LSMW
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '140'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '/SAPDMC/SAPLLSMW_OBJ_.*'
                      regular_expression: true
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
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
              comments:
                comment:
                  - value: ''
                    name: miccommentproperty
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Change Functional Location:'
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Cancel
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[12]'
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
                            value: 'wnd[0]/tbar[0]/btn[12]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: IL02
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '1110'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMILO0
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Batch Input: Transaction'
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'Yes'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ANSW_YES
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
                            value: 'wnd[0]/usr/btnANSW_YES'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: 'No'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ANSW_NO
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
                            value: 'wnd[0]/usr/btnANSW_NO'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: IL02
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSDYP
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Batch Input: Session Overview'
              child_objects:
                - object:
                    smart_identification: ''
                    name: SAPMSBDC_CCTC_APQI
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPMSBDC_CCTC_APQI
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTable
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '80'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsD1000_TABSTRIP/tabpALLE/ssubD1000_SUBSCREEN:SAPMSBDC_CC:1010/tblSAPMSBDC_CCTC_APQI'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Statistics
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[13]'
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
                            value: 'wnd[0]/tbar[1]/btn[13]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Process
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
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Log
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[7]'
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
                            value: 'wnd[0]/tbar[1]/btn[7]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Analysis
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[2]'
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
                            value: 'wnd[0]/tbar[1]/btn[2]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
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
                      value: SAPMSBDC_CC
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: 'Batch Input: Log Overview'
              child_objects:
                - object:
                    smart_identification: ''
                    name: RSBDC_PROTOCOLTC_PROTOCOL
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: RSBDC_PROTOCOLTC_PROTOCOL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTable
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '80'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_PROTOCOL/tabpALL_PROT/ssubSCR_CONTENT:RSBDC_PROTOCOL:0200/tblRSBDC_PROTOCOLTC_PROTOCOL'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
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
                      value: RSBDC_PROTOCOL
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Batch Input Log for Session_4
              child_objects:
                - object:
                    smart_identification: ''
                    name: File Name
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: DY_FILENAME
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
                            value: 'wnd[1]/usr/ctxtDY_FILENAME'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Directory
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: DY_PATH
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
                            value: 'wnd[1]/usr/ctxtDY_PATH'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Generate
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                            value: 'wnd[1]/tbar[0]/btn[0]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '200'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSFES
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Batch Input Log for Session_3
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '200'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSFES
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Batch Input Log for Session_2
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Spreadsheet...   (Ctrl+Shift+F
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[43]'
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
                            value: 'wnd[0]/tbar[1]/btn[43]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '120'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPMSSY0
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Batch Input Log for Session
              child_objects:
                - object:
                    smart_identification: ''
                    name: Print from ABAP list viewer
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[86]'
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
                            value: 'wnd[0]/tbar[0]/btn[86]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '1400'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: RSBDC_PROTOCOL
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
              name: Analysis of Session IL02_USERS
              child_objects:
                - object:
                    smart_identification: ''
                    name: TAB_DYNPRO
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TAB_DYNPRO
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTabStrip
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '90'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_DYNPRO'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTabStrip
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: RSBDC_ANALYSETC_TCODES
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: RSBDC_ANALYSETC_TCODES
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTable
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '80'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_DYNPRO/tabpTAB_TCODES/ssubSCR_DYNPRO:RSBDC_ANALYSE:0200/tblRSBDC_ANALYSETC_TCODES'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: RSBDC_ANALYSETC_PROTOCOL
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: RSBDC_ANALYSETC_PROTOCOL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTable
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '80'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_DYNPRO/tabpTAB_PROTO/ssubSCR_DYNPRO:RSBDC_ANALYSE:0400/tblRSBDC_ANALYSETC_PROTOCOL'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: With errors
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: With errors
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: RB-TCODES_ERROR
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiRadioButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '41'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/subSCR_INFO:RSBDC_ANALYSE:0201/radRB-TCODES_ERROR'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: FRM_INFO
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: FRM_INFO
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '62'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_DYNPRO/tabpTAB_TCODES/ssubSCR_DYNPRO:RSBDC_ANALYSE:0200/boxFRM_INFO'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiElement
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Created On
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: APQI-CREDATE
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
                            value: '31'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTAB_DYNPRO/tabpTAB_TCODES/ssubSCR_DYNPRO:RSBDC_ANALYSE:0200/txtAPQI-CREDATE'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                            value: 'wnd[0]/tbar[0]/btn[3]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SM35
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
                      value: RSBDC_ANALYSE
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
              last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
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
        last_update_time: 'Friday, 11 March 2022 10:28:33 AM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
