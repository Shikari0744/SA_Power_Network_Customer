namespace: LSMW_FileUpload_PoC
operation:
  name: LSMW_File_Upload_Error_Display
  inputs:
  - Project
  - SubProject
  - Object
  - SAP_UserID
  - SAP_Password
  - FilePath
  - BatchSize
  - email
  - SystemID: ERP - QAS - Quality Assurance
  sequential_action:
    gav: com.microfocus.seq:LSMW_FileUpload_PoC.LSMW_File_Upload_Error_Display:1.0.0
    skills:
    - SAP
    - SAPUI5
    - SAPWDJ
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
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
    - step:
        id: '1'
        action: Script
        object_path: processingmode = "Background"
    - step:
        id: '2'
        action: Script
        object_path: FilePath = Parameter.Item("FilePath")
    - step:
        id: '3'
        action: Script
        object_path: BatchSize = Parameter.Item("BatchSize")
    - step:
        id: '4'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '5'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '6'
        action: Script
        object_path: If Not objFSO.FolderExists("C:\Users\svcrpabot\OneDrive - SA
          Power Networks\AIFW\") Then
    - step:
        id: '7'
        object_path: objFSO
        action: CreateFolder
        args: ("C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\")
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
        object_path: If  Not objFSO.FileExists("C:\Users\svcrpabot\OneDrive - SA Power
          Networks\AIFW\" & FileName) Then
    - step:
        id: '12'
        action: Script
        object_path: FileExtension = objFSO.GetExtensionName(FilePath)
    - step:
        id: '13'
        action: Script
        object_path: FileNameWithoutExtension = Replace(FileName, "." & FileExtension,
          "")
    - step:
        id: '14'
        object_path: objFSO
        action: CopyFile
        args: FilePath,"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\", True
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
        args: micFail,"Check File Exist or not.","File doesn't exist in " & FilePath
    - step:
        id: '19'
        action: Script
        object_path: '''""""""""""""""""""""""""""SENDING EMAIL NOTIFICATION FOR THE
          FAILURE'
    - step:
        id: '20'
        action: Script
        object_path: fn_SendResultAsEmail Parameter.Item("email"),"LSMW Process Execution
          Failed as source file is not found.","File not found in the FilePath " &
          FilePath,"","",""
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
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\LSWM_Batch_Files.xlsx","Global","Global"'
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
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '27'
        action: Script
        object_path: strFile = "C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\"
          & FileName
    - step:
        id: '28'
        action: Script
        object_path: Set objFile = objFSO.OpenTextFile(strFile,8,True)
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
        object_path: Set objFile = objFSO.OpenTextFile(strFile,1)
    - step:
        id: '32'
        action: Script
        object_path: HeaderLine = objFile.ReadLine
    - step:
        id: '33'
        action: Script
        object_path: '''Print HeaderLine'
    - step:
        id: '34'
        action: Script
        object_path: Set objFile = NOTHING
    - step:
        id: '35'
        action: Script
        object_path: Set objFileToRead = CreateObject("Scripting.FileSystemObject").OpenTextFile("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\AIFW\" & FileName,1)
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
        object_path: strFile2 = "C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\"
          & FileNameWithoutExtension & "_" & cnt & ".txt"
    - step:
        id: '40'
        action: Script
        object_path: If Rows > 2 Then
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
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\" & FileNameWithoutExtension
          & "_" & cnt & ".txt",Rows'
    - step:
        id: '45'
        object_path: DataTable
        action: Value("FileName","Global")
        args: = FileName
    - step:
        id: '46'
        object_path: DataTable
        action: Value("BatchName","Global")
        args: = FileNameWithoutExtension & "_" & cnt & ".txt"
    - step:
        id: '47'
        action: Script
        object_path: Set objTS = NOTHING
    - step:
        id: '48'
        action: Script
        object_path: Set objTS = objFSO.OpenTextFile(strFile2,8,True)
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
        object_path: strFile2 = "C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\"
          & FileNameWithoutExtension & "_" & cnt & ".txt"
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
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\" & FileNameWithoutExtension
          & "_" & cnt & ".txt",Rows'
    - step:
        id: '56'
        object_path: DataTable
        action: Value("FileName","Global")
        args: = FileName
    - step:
        id: '57'
        object_path: DataTable
        action: Value("BatchName","Global")
        args: = FileNameWithoutExtension & "_" & cnt & ".txt"
    - step:
        id: '58'
        action: Script
        object_path: Set objTS = NOTHING
    - step:
        id: '59'
        action: Script
        object_path: Set objTS = objFSO.OpenTextFile(strFile2,8,True)
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
        object_path: '''TimeIt = EndTime - StartTime'
    - step:
        id: '73'
        action: Script
        object_path: '''Print TimeIt & " Secs"'
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
        object_path: fName = DataTable.Value("FileName","Global")
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
        object_path: exStatus = DataTable.Value("ExecutionStatus","Global")
    - step:
        id: '83'
        action: Script
        object_path: "'\tExecutionDuration = DataTable.Value(\"FileName\",\"Global\"\
          )"
    - step:
        id: '84'
        action: Script
        object_path: If fName = FileName And  exStatus = EMPTY Then
    - step:
        id: '85'
        action: Script
        object_path: bName = DataTable.Value("BatchName","Global")
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
        object_path: If bName <> EMPTY Then
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
        object_path: DataTable.Value("ExecutedBy","Global") = Parameter
        action: Item("SAP_UserID")
    - step:
        id: '93'
        object_path: DataTable
        action: Value("ExecutionDate","Global")
        args: = Now
    - step:
        id: '94'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '95'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '96'
        object_path: SAPGuiUtil.AutoLogon Parameter.Item("SystemID"),"410",Parameter.Item("SAP_UserID"),Crypt.Encrypt(Parameter
        action: Item("SAP_Password")),""
    - step:
        id: '97'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '98'
        action: Script
        object_path: sapn_screenShot_done "SAP Login Screenshot"
    - step:
        id: '99'
        action: Script
        object_path: '''---------------------------------Specify File for Upload------------------------------------------------------'
    - step:
        id: '100'
        action: Script
        object_path: If Not SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").Exist(0)
          Then
    - step:
        id: '101'
        action: Script
        object_path: screenShotFileLocaiton = "C:\Temp\SAP_Login_Failure.png"
    - step:
        id: '102'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton ,true
    - step:
        id: '103'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '104'
        action: Script
        object_path: Set objFSo = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '105'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '106'
        action: Script
        object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
    - step:
        id: '107'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Step", msg, screenShotFileLocaiton
    - step:
        id: '108'
        action: Script
        object_path: fn_SendResultAsEmail Parameter.Item("email"),"LSMW Process Execution
          - SAP Login Failed.","Unable to login to SAP. Please check the attached
          screen shot.",screenShotFileLocaiton,"",""
    - step:
        id: '109'
        object_path: SystemUtil
        action: Run
        args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
    - step:
        id: '110'
        action: Script
        object_path: else
    - step:
        id: '111'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Step", msg
    - step:
        id: '112'
        action: Script
        object_path: end if
    - step:
        id: '113'
        action: Script
        object_path: Set objFSo = NOTHING
    - step:
        id: '114'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '115'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '116'
        action: Script
        object_path: ExitTest
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nLSMW"'
    - step:
        id: '119'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '120'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '121'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiButton("Continue   (Enter)").Exist(1)
          Then
    - step:
        id: '122'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '123'
        action: Script
        object_path: End If
    - step:
        id: '124'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '125'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Project").Set
          Parameter
        action: Item("Project")
    - step:
        id: '126'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Subproject").Set
          Parameter
        action: Item("SubProject")
    - step:
        id: '127'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiEdit("Object").Set
          Parameter
        action: Item("Object")
    - step:
        id: '128'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Continue   (F8)")
        action: Click
    - step:
        id: '129'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '130'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Specify Files")'
    - step:
        id: '131'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '132'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '133'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '134'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("\\utilities.etsa.net.au\Citrix")'
        action: SetFocus
    - step:
        id: '135'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("\\utilities.etsa.net.au\Citrix")'
        action: SetCaretPos
        args: '1'
    - step:
        id: '136'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change
          Entry   (Ctrl+F3)").Exist(0) Then'
    - step:
        id: '137'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change
          Entry   (Ctrl+F3)")'
        action: Click
    - step:
        id: '138'
        action: Script
        object_path: Else
    - step:
        id: '139'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Display
          <-> Change   (Ctrl+F1)")'
        action: Click
    - step:
        id: '140'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Change
          Entry   (Ctrl+F3)")'
        action: Click
    - step:
        id: '141'
        action: Script
        object_path: End If
    - step:
        id: '142'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '143'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("File on Front End: Display").SAPGuiEdit("File")'
        action: Set
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\" & bName'
    - step:
        id: '144'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("File on Front End: Display").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '145'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '146'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("ETSA_PM_FLCHAR_VAL.lsmw.read")'
        action: SetFocus
    - step:
        id: '147'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("ETSA_PM_FLCHAR_VAL.lsmw.read")'
        action: SetCaretPos
        args: '1'
    - step:
        id: '148'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify")'
        action: SendKey
        args: F2
    - step:
        id: '149'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Imported Data: Display").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '150'
        action: Script
        object_path: ''''
    - step:
        id: '151'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("ETSA_PM_FLCHAR_VAL.lsmw.conv")'
        action: SetFocus
    - step:
        id: '152'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiLabel("ETSA_PM_FLCHAR_VAL.lsmw.conv")'
        action: SetCaretPos
        args: '1'
    - step:
        id: '153'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify")'
        action: SendKey
        args: F2
    - step:
        id: '154'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Converted Data: Display").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '155'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Save   (Ctrl+S)")'
        action: Click
    - step:
        id: '156'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiStatusBar("StatusBar")'
        action: Sync
    - step:
        id: '157'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '158'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '159'
        action: Script
        object_path: '''------------------------------------------------------------------'
    - step:
        id: '160'
        action: Script
        object_path: '''''---------------------Assign Files-----------------------------'
    - step:
        id: '161'
        action: Script
        object_path: '''row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Assign Files")'
    - step:
        id: '162'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '163'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '164'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Display
          <-> Change   (Ctrl+F1)")'
        action: Click
    - step:
        id: '165'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Save   (Ctrl+S)")'
        action: Click
    - step:
        id: '166'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '167'
        action: Script
        object_path: '''''-------------------------------------------------------------------------------------'
    - step:
        id: '168'
        action: Script
        object_path: '''---------------------Read Data-----------------------------'
    - step:
        id: '169'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Read Data")'
    - step:
        id: '170'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '171'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '172'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '173'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Import_2").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '174'
        action: Script
        object_path: 'While Not SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          Specify").Exist(0)'
    - step:
        id: '175'
        action: Script
        object_path: Wend
    - step:
        id: '176'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '177'
        action: Script
        object_path: "'\tRecordsRead = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          LSM Workbench: Specify\").SAPGuiLabel(\"Records Read\").GetROProperty(\"\
          content\"))"
    - step:
        id: '178'
        action: Script
        object_path: "'\tTransactionsWritten = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          LSM Workbench: Specify\").SAPGuiLabel(\"Transactions Written\").GetROProperty(\"\
          content\"))"
    - step:
        id: '179'
        action: Script
        object_path: "'\tRecordsWritten = Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          LSM Workbench: Specify\").SAPGuiLabel(\"Records Written\").GetROProperty(\"\
          content\"))"
    - step:
        id: '180'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '181'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Import_2").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '182'
        action: Script
        object_path: '''---------------------------------------------------------------------------'
    - step:
        id: '183'
        action: Script
        object_path: '''''---------------------Display Read Data-----------------------------'
    - step:
        id: '184'
        action: Script
        object_path: '''row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Display Read Data")'
    - step:
        id: '185'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '186'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '187'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Display Read Data").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '188'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Imported").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '189'
        action: Script
        object_path: '''''----------------------------------------------------------------------------'
    - step:
        id: '190'
        action: Script
        object_path: '''---------------------Convert Data-----------------------------'
    - step:
        id: '191'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Convert Data")'
    - step:
        id: '192'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '193'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '194'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '195'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Convert").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '196'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '197'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Specify").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '198'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Convert").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '199'
        action: Script
        object_path: '''----------------------------------------------------------------------------'
    - step:
        id: '200'
        action: Script
        object_path: '''''---------------------Display Convert Data-----------------------------'
    - step:
        id: '201'
        action: Script
        object_path: '''row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Display Converted Data")'
    - step:
        id: '202'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '203'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '204'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Display Converted Data").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '205'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Imported").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '206'
        action: Script
        object_path: '''''----------------------------------------------------------------------------'
    - step:
        id: '207'
        action: Script
        object_path: '''---------------------Create Batch Input Session-----------------------------'
    - step:
        id: '208'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Create Batch Input Session")'
    - step:
        id: '209'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '210'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '211'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '212'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Create").SAPGuiCheckBox("Keep
          batch input folder(s)?")'
        action: Set
        args: '"ON"'
    - step:
        id: '213'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: Create").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '214'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '215'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '216'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '217'
        action: Script
        object_path: '''-----------------------------------------------------------------------------------------'
    - step:
        id: '218'
        action: Script
        object_path: '''---------------------Run Batch Input Session-----------------------------'
    - step:
        id: '219'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Run Batch Input Session")'
    - step:
        id: '220'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '221'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '222'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '223'
        action: Script
        object_path: 'SessionName = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Session
          Name")'
    - step:
        id: '224'
        action: Script
        object_path: 'Status = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Status")'
    - step:
        id: '225'
        action: Script
        object_path: 'ExecDate = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Date")'
    - step:
        id: '226'
        action: Script
        object_path: 'ExecTime = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Time")'
    - step:
        id: '227'
        action: Script
        object_path: ExecDate = DateValue(Replace(ExecDate,".", "/"))
    - step:
        id: '228'
        action: Script
        object_path: ExecTime = TimeValue(ExecTime)
    - step:
        id: '229'
        action: Script
        object_path: CurTime = TimeValue(DateAdd("n",-5,now))
    - step:
        id: '230'
        action: Script
        object_path: 'CreatedBy = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Created
          By")'
    - step:
        id: '231'
        action: Script
        object_path: 'TransactionCounter = SAPGuiSession("Session").SAPGuiWindow("Batch
          Input: Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Trans.")'
    - step:
        id: '232'
        action: Script
        object_path: If InStr(Parameter.Item("Object"),SessionName) > 0 And LCase(Parameter.Item("SAP_UserID"))
          = LCase(CreatedBy) And Status = "B_CREA" And ExecDate = Date And CurTime
          < ExecTime Then
    - step:
        id: '233'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectRow
        args: '1'
    - step:
        id: '234'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectCell
        args: 1,"Session Name"
    - step:
        id: '235'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Process")'
        action: Click
    - step:
        id: '236'
        action: Script
        object_path: '''If LCase(Parameter.Item("ProcessingMode")) = "background"
          Then'
    - step:
        id: '237'
        action: Script
        object_path: If InStr(LCase(processingmode),"display") > 0 Then
    - step:
        id: '238'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Display
          errors only")
        action: Set
    - step:
        id: '239'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Display
          errors only")
        action: SetFocus
    - step:
        id: '240'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiButton("Process")
        action: Click
    - step:
        id: '241'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '242'
        action: Script
        object_path: Chk = True
    - step:
        id: '243'
        action: Script
        object_path: While Chk
    - step:
        id: '244'
        action: Script
        object_path: counter = counter + 1
    - step:
        id: '245'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Register").SAPGuiButton("Continue   (Enter)").Exist(0)
          Then
    - step:
        id: '246'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Register").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '247'
        action: Script
        object_path: End  If
    - step:
        id: '248'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information_2").SAPGuiButton("Session
          overview").Exist(0) Then
    - step:
        id: '249'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information_2").SAPGuiButton("Session
          overview")
        action: Click
    - step:
        id: '250'
        action: Script
        object_path: Chk = False
    - step:
        id: '251'
        action: Script
        object_path: End If
    - step:
        id: '252'
        action: Script
        object_path: If counter = 2 * BatchSize Then
    - step:
        id: '253'
        action: Script
        object_path: Chk = False
    - step:
        id: '254'
        action: Script
        object_path: End If
    - step:
        id: '255'
        action: Script
        object_path: Wend
    - step:
        id: '256'
        action: Script
        object_path: Flag = True
    - step:
        id: '257'
        action: Script
        object_path: Else
    - step:
        id: '258'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Background")
        action: Set
    - step:
        id: '259'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiRadioButton("Background")
        action: SetFocus
    - step:
        id: '260'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Session IL02_USERSTA").SAPGuiButton("Process")
        action: Click
    - step:
        id: '261'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiStatusBar("StatusBar")'
        action: Sync
    - step:
        id: '262'
        action: Script
        object_path: Flag = True
    - step:
        id: '263'
        action: Script
        object_path: '''ElseIf LCase(Parameter.Item("ProcessingMode")) = "display"
          Then'
    - step:
        id: '264'
        action: Script
        object_path: End If
    - step:
        id: '265'
        action: Script
        object_path: Else
    - step:
        id: '266'
        object_path: Reporter
        action: ReportEvent
        args: micFail,"'Run Batch Input Session' screen","No record found in the 'Run
          Batch Input Session' screen."
    - step:
        id: '267'
        action: Script
        object_path: screenShotFileLocaiton = "C:\Temp\Run_Batch_Input_Session_Screen.png"
    - step:
        id: '268'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton ,true
    - step:
        id: '269'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '270'
        action: Script
        object_path: Set objFSo = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '271'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '272'
        action: Script
        object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
    - step:
        id: '273'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Step", msg, screenShotFileLocaiton
    - step:
        id: '274'
        action: Script
        object_path: fn_SendResultAsEmail Parameter.Item("email"),"No record record
          in the 'Run Batch Input Session' screen for the batch " & bName,"",screenShotFileLocaiton,"C:\Users\svcrpabot\OneDrive
          - SA Power Networks\AIFW\" & bName,""
    - step:
        id: '275'
        object_path: SystemUtil
        action: Run
        args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
    - step:
        id: '276'
        action: Script
        object_path: else
    - step:
        id: '277'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Step", msg
    - step:
        id: '278'
        action: Script
        object_path: end if
    - step:
        id: '279'
        action: Script
        object_path: Set objFSo = NOTHING
    - step:
        id: '280'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '281'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '282'
        action: Script
        object_path: ExitTest
    - step:
        id: '283'
        action: Script
        object_path: End If
    - step:
        id: '284'
        action: Script
        object_path: While Flag
    - step:
        id: '285'
        action: Script
        object_path: If Not InStr(LCase(processingmode),"display") > 0 Then
    - step:
        id: '286'
        action: Wait
        args: '"15"'
        default_args: '"1"'
    - step:
        id: '287'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '288'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '289'
        action: Script
        object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("LSM Workbench:
          ETSA, PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE").FindRowByCellContent("Process
          Step","Run Batch Input Session")'
    - step:
        id: '290'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiTable("/SAPDMC/SAPLLSMW_OBJ_000TC_STE")'
        action: SelectCell
        args: row,"Process Step"
    - step:
        id: '291'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,")'
        action: SendKey
        args: F2
    - step:
        id: '292'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '293'
        action: Script
        object_path: End If
    - step:
        id: '294'
        action: Script
        object_path: 'Status = SAPGuiSession("Session").SAPGuiWindow("Batch Input:
          Session Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI").GetCellData(1,"Status")'
    - step:
        id: '295'
        action: Script
        object_path: If Status = "STACRI" Then
    - step:
        id: '296'
        action: Script
        object_path: Flag = False
    - step:
        id: '297'
        object_path: DataTable
        action: Value("ExecutionStatus","Global")
        args: = "Failed"
    - step:
        id: '298'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectRow
        args: '1'
    - step:
        id: '299'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectCell
        args: 1,"Session Name"
    - step:
        id: '300'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Analysis")'
        action: Click
    - step:
        id: '301'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '302'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")
        action: CaptureBitmap
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\Analysis.png",True'
    - step:
        id: '303'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '304'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS").SAPGuiButton("Back")
        action: Click
    - step:
        id: '305'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '306'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Log")'
        action: Click
    - step:
        id: '307'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '308'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview").SAPGuiTable("RSBDC_PROTOCOLTC_PROTOCOL")'
        action: SelectRow
        args: '1'
    - step:
        id: '309'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview")'
        action: SendKey
        args: F2
    - step:
        id: '310'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '311'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session").SAPGuiButton("Print
          from ABAP list viewer")
        action: Click
    - step:
        id: '312'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiButton("Spreadsheet...   (Ctrl+Shift+F")
        action: Click
    - step:
        id: '313'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Select Spreadsheet").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '314'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_3").SAPGuiStatusBar("StatusBar")
        action: Sync
    - step:
        id: '315'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '316'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("Directory")
        action: Set
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW"'
    - step:
        id: '317'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '318'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("Directory")
        action: SetFocus
    - step:
        id: '319'
        action: Script
        object_path: fn = Replace(bName,".txt","") & ".xlsx"
    - step:
        id: '320'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiEdit("File
          Name")
        action: Set
        args: fn
    - step:
        id: '321'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '322'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_4").SAPGuiButton("Generate")
        action: Click
    - step:
        id: '323'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiStatusBar("StatusBar")
        action: Sync
    - step:
        id: '324'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '325'
        action: Script
        object_path: If Window("Excel").Dialog("Microsoft Excel").WinButton("Yes").Exist(4)
          Then
    - step:
        id: '326'
        object_path: Window("Excel").Dialog("Microsoft Excel").WinButton("Yes")
        action: Click
    - step:
        id: '327'
        action: Script
        object_path: End If
    - step:
        id: '328'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '329'
        object_path: Window("Excel")
        action: Close
    - step:
        id: '330'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '331'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session_2").SAPGuiButton("Back")
        action: Click
    - step:
        id: '332'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Batch Input Log for Session").SAPGuiButton("Back")
        action: Click
    - step:
        id: '333'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Log Overview").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '334'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '335'
        action: Script
        object_path: If Not InStr(LCase(processingmode),"display") > 0 Then
    - step:
        id: '336'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '337'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Back")
        action: Click
    - step:
        id: '338'
        action: Script
        object_path: End If
    - step:
        id: '339'
        action: Script
        object_path: 'fn_SendResultAsEmail Parameter.Item("email"),"File Process Status
          on " & ExecDate & " " & ExecTime,"File Location: " & Parameter.Item("FilePath"),"C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Analysis.png","C:\Users\svcrpabot\OneDrive - SA Power
          Networks\AIFW\" & bName,"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\"
          & fn'
    - step:
        id: '340'
        action: Script
        object_path: ElseIf Status = "STA_OK" Then
    - step:
        id: '341'
        action: Script
        object_path: Flag = False
    - step:
        id: '342'
        object_path: DataTable
        action: Value("ExecutionStatus","Global")
        args: = "Passed"
    - step:
        id: '343'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectRow
        args: '1'
    - step:
        id: '344'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiTable("SAPMSBDC_CCTC_APQI")'
        action: SelectCell
        args: 1,"Session Name"
    - step:
        id: '345'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Analysis")'
        action: Click
    - step:
        id: '346'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '347'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS")
        action: CaptureBitmap
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\Analysis.png",True'
    - step:
        id: '348'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Analysis of Session IL02_USERS").SAPGuiButton("Back")
        action: Click
    - step:
        id: '349'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '350'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Batch Input: Session
          Overview").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '351'
        action: Script
        object_path: If Not InStr(LCase(processingmode),"display") > 0 Then
    - step:
        id: '352'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("LSM Workbench: ETSA,
          PM,").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '353'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Legacy System Migration").SAPGuiButton("Back")
        action: Click
    - step:
        id: '354'
        action: Script
        object_path: End If
    - step:
        id: '355'
        action: Script
        object_path: 'fn_SendResultAsEmail Parameter.Item("email"),"File Process Status
          on " & ExecDate & " " & ExecTime,"File Location: " & Parameter.Item("FilePath"),"C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Analysis.png","C:\Users\svcrpabot\OneDrive - SA Power
          Networks\AIFW\" & bName,""'
    - step:
        id: '356'
        action: Script
        object_path: End If
    - step:
        id: '357'
        action: Script
        object_path: Wend
    - step:
        id: '358'
        action: Script
        object_path: "''''\tIf InStr(Parameter.Item(\"Object\"),SessionName) > 0 And\
          \ LCase(Parameter.Item(\"SAP_UserID\")) = LCase(CreatedBy) And Status =\
          \ \"B_CREA\" And ExecDate = Date And CurTime < ExecTime Then"
    - step:
        id: '359'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectRow 1"
    - step:
        id: '360'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectCell 1,\"\
          Session Name\""
    - step:
        id: '361'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Process\").Click"
    - step:
        id: '362'
        action: Script
        object_path: "''''\t\t' Execute \"Display Error Only\" Mode"
    - step:
        id: '363'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Process Session\
          \ IL02_USERSTA\").SAPGuiRadioButton(\"Display errors only\").Set"
    - step:
        id: '364'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Process Session\
          \ IL02_USERSTA\").SAPGuiRadioButton(\"Display errors only\").SetFocus"
    - step:
        id: '365'
        action: Script
        object_path: "''''\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Process Session\
          \ IL02_USERSTA\").SAPGuiButton(\"Process\").Click"
    - step:
        id: '366'
        action: Script
        object_path: "''''\t\tWait 4"
    - step:
        id: '367'
        action: Script
        object_path: "''''\t\tChk = True"
    - step:
        id: '368'
        action: Script
        object_path: "''''\t\tWhile Chk"
    - step:
        id: '369'
        action: Script
        object_path: "''''\t\t\tIf SAPGuiSession(\"Session\").SAPGuiWindow(\"Register\"\
          ).SAPGuiButton(\"Continue   (Enter)\").Exist(0) Then"
    - step:
        id: '370'
        action: Script
        object_path: "''''\t\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Register\"\
          ).SAPGuiButton(\"Continue   (Enter)\").Click"
    - step:
        id: '371'
        action: Script
        object_path: "''''\t\t\tEnd  If"
    - step:
        id: '372'
        action: Script
        object_path: "''''\t\t\tIf SAPGuiSession(\"Session\").SAPGuiWindow(\"Information_2\"\
          ).SAPGuiButton(\"Session overview\").Exist(0) Then"
    - step:
        id: '373'
        action: Script
        object_path: "''''\t\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Information_2\"\
          ).SAPGuiButton(\"Session overview\").Click"
    - step:
        id: '374'
        action: Script
        object_path: "''''\t\t\t\tChk = False"
    - step:
        id: '375'
        action: Script
        object_path: "''''\t\t\tEnd If"
    - step:
        id: '376'
        action: Script
        object_path: "''''\t\t\tIf SAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Functional Location:_3\").SAPGuiStatusBar(\"StatusBar\").Exist(0) Then"
    - step:
        id: '377'
        action: Script
        object_path: "''''\t\t\t\tIf Trim(SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Change Functional Location:_3\").SAPGuiStatusBar(\"StatusBar\").GetROProperty(\"\
          text\")) = \"Field ITOB-INBDT. is not an input field\" Then"
    - step:
        id: '378'
        action: Script
        object_path: "''''\t\t\t\t\tsapn_screenShot_done  \"Field ITOB-INBDT. is not\
          \ an input field\""
    - step:
        id: '379'
        action: Script
        object_path: "''''\t\t\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Functional Location:_3\").SAPGuiOKCode(\"OKCode\").Set \"=BU\""
    - step:
        id: '380'
        action: Script
        object_path: "''''\t\t\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Functional Location:_3\").SendKey ENTER"
    - step:
        id: '381'
        action: Script
        object_path: "''''\t\t\t\tEnd If"
    - step:
        id: '382'
        action: Script
        object_path: "''''\t\t\tEnd If"
    - step:
        id: '383'
        action: Script
        object_path: "''''\t\tWend"
    - step:
        id: '384'
        action: Script
        object_path: "''''\t\tFlag = True"
    - step:
        id: '385'
        action: Script
        object_path: "''''\tElse"
    - step:
        id: '386'
        action: Script
        object_path: "''''\t\tReporter.ReportEvent micFail,\"'Run Batch Input Session'\
          \ screen\",\"No record found in the 'Run Batch Input Session' screen.\""
    - step:
        id: '387'
        action: Script
        object_path: "''''\t\tscreenShotFileLocaiton = \"C:\\Temp\\Run_Batch_Input_Session_Screen.png\""
    - step:
        id: '388'
        action: Script
        object_path: "''''\t\tDesktop.CaptureBitmap screenShotFileLocaiton ,true"
    - step:
        id: '389'
        action: Script
        object_path: "''''\t\tWait 2"
    - step:
        id: '390'
        action: Script
        object_path: "''''\t\tSet objFSo = CreateObject(\"Scripting.FileSystemObject\"\
          )"
    - step:
        id: '391'
        action: Script
        object_path: "''''\t\tWait 0,50"
    - step:
        id: '392'
        action: Script
        object_path: "''''\t\tIf objFSo.FileExists(screenShotFileLocaiton) Then"
    - step:
        id: '393'
        action: Script
        object_path: "''''\t\t\tReporter.ReportEvent micFail, \"Step\", msg, screenShotFileLocaiton"
    - step:
        id: '394'
        action: Script
        object_path: "''''\t\t\tfn_SendResultAsEmail Parameter.Item(\"email\"),\"\
          No record record in the 'Run Batch Input Session' screen for the batch \"\
          \ & bName,\"\",screenShotFileLocaiton,\"C:\\Users\\svcrpabot\\OneDrive -\
          \ SA Power Networks\\AIFW\\\" & bName,\"\""
    - step:
        id: '395'
        action: Script
        object_path: "''''\t\t\tSystemUtil.Run \"cmd.exe\", \"/c del \" & screenShotFileLocaiton"
    - step:
        id: '396'
        action: Script
        object_path: "''''\t\telse"
    - step:
        id: '397'
        action: Script
        object_path: "''''\t\t\tReporter.ReportEvent micFail, \"Step\", msg"
    - step:
        id: '398'
        action: Script
        object_path: "''''\t\tend if"
    - step:
        id: '399'
        action: Script
        object_path: "''''\t\tSet objFSo = NOTHING"
    - step:
        id: '400'
        action: Script
        object_path: "''''\t\tSAPGuiUtil.CloseConnections"
    - step:
        id: '401'
        action: Script
        object_path: "''''\t\tSystemUtil.CloseProcessByName(\"saplogon.exe\")"
    - step:
        id: '402'
        action: Script
        object_path: "''''\t\tExitTest"
    - step:
        id: '403'
        action: Script
        object_path: "''''\tEnd If"
    - step:
        id: '404'
        action: Script
        object_path: "''''\tWhile Flag"
    - step:
        id: '405'
        action: Script
        object_path: "''''\t\tStatus = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Batch Input: Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").GetCellData(1,\"\
          Status\")"
    - step:
        id: '406'
        action: Script
        object_path: "''''\t\tIf Status = \"STACRI\" Then"
    - step:
        id: '407'
        action: Script
        object_path: "''''\t\t\tFlag = False"
    - step:
        id: '408'
        action: Script
        object_path: "''''\t\t\tDataTable.Value(\"ExecutionStatus\",\"Global\") =\
          \ \"Failed\""
    - step:
        id: '409'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectRow 1"
    - step:
        id: '410'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectCell 1,\"\
          Session Name\""
    - step:
        id: '411'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Analysis\").Click"
    - step:
        id: '412'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '413'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Analysis\
          \ of Session IL02_USERS\").CaptureBitmap \"C:\\Users\\svcrpabot\\OneDrive\
          \ - SA Power Networks\\Analysis.png\",True"
    - step:
        id: '414'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '415'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Analysis\
          \ of Session IL02_USERS\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '416'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '417'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Log\").Click"
    - step:
        id: '418'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '419'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Log Overview\").SAPGuiTable(\"RSBDC_PROTOCOLTC_PROTOCOL\").SelectRow 1"
    - step:
        id: '420'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Log Overview\").SendKey F2"
    - step:
        id: '421'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '422'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session\").SAPGuiButton(\"Print from ABAP list viewer\").Click"
    - step:
        id: '423'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_2\").SAPGuiButton(\"Spreadsheet...   (Ctrl+Shift+F\").Click"
    - step:
        id: '424'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Select Spreadsheet\"\
          ).SAPGuiButton(\"Continue   (Enter)\").Click"
    - step:
        id: '425'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_3\").SAPGuiStatusBar(\"StatusBar\").Sync"
    - step:
        id: '426'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '427'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_4\").SAPGuiEdit(\"Directory\").Set \"C:\\Users\\svcrpabot\\\
          OneDrive - SA Power Networks\\AIFW\""
    - step:
        id: '428'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '429'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_4\").SAPGuiEdit(\"Directory\").SetFocus"
    - step:
        id: '430'
        action: Script
        object_path: "''''\t\t\tfn = Replace(bName,\".txt\",\"\") & \".xlsx\""
    - step:
        id: '431'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_4\").SAPGuiEdit(\"File Name\").Set fn"
    - step:
        id: '432'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '433'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_4\").SAPGuiButton(\"Generate\").Click"
    - step:
        id: '434'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_2\").SAPGuiStatusBar(\"StatusBar\").Sync"
    - step:
        id: '435'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '436'
        action: Script
        object_path: "''''\t\t\tIf Window(\"Excel\").Dialog(\"Microsoft Excel\").WinButton(\"\
          Yes\").Exist(4) Then"
    - step:
        id: '437'
        action: Script
        object_path: "''''\t\t\t\tWindow(\"Excel\").Dialog(\"Microsoft Excel\").WinButton(\"\
          Yes\").Click"
    - step:
        id: '438'
        action: Script
        object_path: "''''\t\t\tEnd If"
    - step:
        id: '439'
        action: Script
        object_path: "''''\t\t\tWait 2"
    - step:
        id: '440'
        action: Script
        object_path: "''''\t\t\tWindow(\"Excel\").Close"
    - step:
        id: '441'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '442'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session_2\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '443'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input\
          \ Log for Session\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '444'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Log Overview\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '445'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '446'
        action: Script
        object_path: "''''\t\t\tfn_SendResultAsEmail Parameter.Item(\"email\"),\"\
          File Process Status on \" & ExecDate & \" \" & ExecTime,\"File Location:\
          \ \" & Parameter.Item(\"FilePath\"),\"C:\\Users\\svcrpabot\\OneDrive - SA\
          \ Power Networks\\Analysis.png\",\"C:\\Users\\svcrpabot\\OneDrive - SA Power\
          \ Networks\\AIFW\\\" & bName,\"C:\\Users\\svcrpabot\\OneDrive - SA Power\
          \ Networks\\AIFW\\\" & fn"
    - step:
        id: '447'
        action: Script
        object_path: "''''\t\tElseIf Status = \"STA_OK\" Then"
    - step:
        id: '448'
        action: Script
        object_path: "''''\t\t\tFlag = False"
    - step:
        id: '449'
        action: Script
        object_path: "''''\t\t\tDataTable.Value(\"ExecutionStatus\",\"Global\") =\
          \ \"Passed\""
    - step:
        id: '450'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectRow 1"
    - step:
        id: '451'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiTable(\"SAPMSBDC_CCTC_APQI\").SelectCell 1,\"\
          Session Name\""
    - step:
        id: '452'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Analysis\").Click"
    - step:
        id: '453'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '454'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Analysis\
          \ of Session IL02_USERS\").CaptureBitmap \"C:\\Users\\svcrpabot\\OneDrive\
          \ - SA Power Networks\\Analysis.png\",True"
    - step:
        id: '455'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Analysis\
          \ of Session IL02_USERS\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '456'
        action: Script
        object_path: "''''\t\t\tWait 1"
    - step:
        id: '457'
        action: Script
        object_path: "''''\t\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Batch Input:\
          \ Session Overview\").SAPGuiButton(\"Back\").Click"
    - step:
        id: '458'
        action: Script
        object_path: "''''\t\t\tfn_SendResultAsEmail Parameter.Item(\"email\"),\"\
          File Process Status on \" & ExecDate & \" \" & ExecTime,\"File Location:\
          \ \" & Parameter.Item(\"FilePath\"),\"C:\\Users\\svcrpabot\\OneDrive - SA\
          \ Power Networks\\Analysis.png\",\"C:\\Users\\svcrpabot\\OneDrive - SA Power\
          \ Networks\\AIFW\\\" & bName,\"\""
    - step:
        id: '459'
        action: Script
        object_path: "''''\t\tEnd If"
    - step:
        id: '460'
        action: Script
        object_path: "''''\tWend"
    - step:
        id: '461'
        action: Script
        object_path: EndTime = Timer
    - step:
        id: '462'
        action: Script
        object_path: TimeIt = Round((EndTime - StartTime)/60,2)
    - step:
        id: '463'
        object_path: DataTable
        action: Value("ExecutionDuration","Global")
        args: = TimeIt & " Mins"
    - step:
        id: '464'
        object_path: DataTable
        action: DeleteSheet
        args: '"Action1"'
    - step:
        id: '465'
        object_path: DataTable
        action: ExportSheet
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\AIFW\LSWM_Batch_Files.xlsx","Global","Global"'
    - step:
        id: '466'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '467'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '468'
        action: Script
        object_path: fn = EMPTY
    - step:
        id: '469'
        action: Script
        object_path: row = EMPTY
    - step:
        id: '470'
        action: Script
        object_path: RecordsRead = EMPTY
    - step:
        id: '471'
        action: Script
        object_path: TransactionsWritten = EMPTY
    - step:
        id: '472'
        action: Script
        object_path: RecordsWritten = EMPTY
    - step:
        id: '473'
        action: Script
        object_path: SessionName = EMPTY
    - step:
        id: '474'
        action: Script
        object_path: Status = EMPTY
    - step:
        id: '475'
        action: Script
        object_path: ExecDate = EMPTY
    - step:
        id: '476'
        action: Script
        object_path: ExecTime = EMPTY
    - step:
        id: '477'
        action: Script
        object_path: CurTime = EMPTY
    - step:
        id: '478'
        action: Script
        object_path: CreatedBy = EMPTY
    - step:
        id: '479'
        action: Script
        object_path: TransactionCounter = EMPTY
    - step:
        id: '480'
        action: Script
        object_path: Flag = EMPTY
    - step:
        id: '481'
        action: Script
        object_path: Status = EMPTY
    - step:
        id: '482'
        action: Script
        object_path: Else
    - step:
        id: '483'
        action: Script
        object_path: fn_SendResultAsEmail Parameter.Item("email"),"LSMW Execution
          Status for the File " & Parameter.Item("FilePath"),"No batch found for execution!
          Suggest checking attached process execution records.","C:\Users\svcrpabot\OneDrive
          - SA Power Networks\AIFW\LSWM_Batch_Files.xlsx","",""
    - step:
        id: '484'
        action: Script
        object_path: '''fn_SendResultAsEmail "mohammed.ripon@sapowernetworks.com.au","LSMW
          Execution Status for the File " & Parameter.Item("FilePath"),"No batch found
          for execution! Suggest checking attached process execution records.","C:\Users\svcrpabot\OneDrive
          - SA Power Networks\AIFW\LSWM_Batch_Files.xlsx","",""'
    - step:
        id: '485'
        action: Script
        object_path: End If
    - step:
        id: '486'
        action: Script
        object_path: ExitTest
    - step:
        id: '487'
        action: Script
        object_path: Function fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment,Attachment2,Attachment3)
    - step:
        id: '488'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '489'
        object_path: MyEmail
        action: Subject
        args: = Subject
    - step:
        id: '490'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '491'
        object_path: MyEmail
        action: To
        args: = EmailTo
    - step:
        id: '492'
        object_path: MyEmail
        action: TextBody
        args: = Body
    - step:
        id: '493'
        action: Script
        object_path: If Attachment <> EMPTY Then
    - step:
        id: '494'
        object_path: MyEmail
        action: AddAttachment
        args: Attachment
    - step:
        id: '495'
        action: Script
        object_path: End If
    - step:
        id: '496'
        action: Script
        object_path: If Attachment2 <> EMPTY Then
    - step:
        id: '497'
        object_path: MyEmail
        action: AddAttachment
        args: Attachment2
    - step:
        id: '498'
        action: Script
        object_path: End If
    - step:
        id: '499'
        action: Script
        object_path: If Attachment3 <> EMPTY Then
    - step:
        id: '500'
        object_path: MyEmail
        action: AddAttachment
        args: Attachment3
    - step:
        id: '501'
        action: Script
        object_path: End If
    - step:
        id: '502'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '503'
        action: Script
        object_path: '''SMTP Server'
    - step:
        id: '504'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '505'
        action: Script
        object_path: '''SMTP Port'
    - step:
        id: '506'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '507'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '508'
        object_path: MyEmail
        action: Send
    - step:
        id: '509'
        action: Script
        object_path: Set MyEmail = NOTHING
    - step:
        id: '510'
        action: Script
        object_path: EmailTo = EMPTY
    - step:
        id: '511'
        action: Script
        object_path: Subject = EMPTY
    - step:
        id: '512'
        action: Script
        object_path: Body = EMPTY
    - step:
        id: '513'
        action: Script
        object_path: Attachment = EMPTY
    - step:
        id: '514'
        action: Script
        object_path: Attachment2 = EMPTY
    - step:
        id: '515'
        action: Script
        object_path: End Function
    - step:
        id: '516'
        action: Script
        object_path: Sub sapn_screenShot_done(msg)
    - step:
        id: '517'
        action: Script
        object_path: screenShotFileLocaiton = "C:\Temp\HP-UFT-Test.png"
    - step:
        id: '518'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton ,true
    - step:
        id: '519'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '520'
        action: Script
        object_path: Set objFSo = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '521'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '522'
        action: Script
        object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
    - step:
        id: '523'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg, screenShotFileLocaiton
    - step:
        id: '524'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '525'
        object_path: SystemUtil
        action: Run
        args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
    - step:
        id: '526'
        action: Script
        object_path: else
    - step:
        id: '527'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg
    - step:
        id: '528'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '529'
        action: Script
        object_path: end if
    - step:
        id: '530'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '531'
        action: Script
        object_path: Set objFSo = Nothing
    - step:
        id: '532'
        action: Script
        object_path: End Sub
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: File Explorer
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
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: CabinetWClass
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 10 March 2022 1:56:51 PM
      child_objects:
      - object:
          class: WinTreeView
          name: WinTreeView
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
          basic_identification:
            property_ref:
            - nativeclass
            - attached text
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: SysTreeView32
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects: []
      - object:
          class: WinEdit
          name: Edit
          properties:
          - property:
              value:
                value: Edit
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Edit
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects: []
  - object:
      class: Window
      name: Excel
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
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 10 March 2022 1:56:51 PM
      child_objects:
      - object:
          class: Dialog
          name: Microsoft Excel
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
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: WinButton
              name: 'Yes'
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
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
  - object:
      class: Window
      name: 'Change Functional Location:'
      properties:
      - property:
          value:
            value: 'Change Functional Location: Master Data'
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: SAP_FRONTEND_SESSION
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
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 10 March 2022 1:56:51 PM
      child_objects:
      - object:
          class: WinObject
          name: Afx:79AE0000:1008
          properties:
          - property:
              value:
                value: '100'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: 'Afx:'
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - regexpwndclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects: []
  - object:
      class: SAPGuiSession
      name: Session
      properties:
      - property:
          value:
            value: ses[0]
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
      basic_identification:
        property_ref:
        - name
        - micclass
        - guicomponenttype
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 10 March 2022 1:56:51 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Variant Attributes
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Save   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Session Statistics IL02_USERST
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: Select Spreadsheet
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access  -  User
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiOKCode
              name: OKCode
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Register
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
                value: wnd[1]
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
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
                    value: wnd[1]/tbar[0]/btn[0]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Process Session IL02_USERSTA
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: Process/foreground
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
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Display errors only
              properties:
              - property:
                  value:
                    value: Display errors only
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: D0300-ERROR
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
                    value: wnd[1]/usr/radD0300-ERROR
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Background
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
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Process
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Specify'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Transactions Written
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[63,25]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Records Written
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[94,25]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Records Read
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[32,25]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: ETSA_PM_FLCHAR_VAL.lsmw.read
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[43,17]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: ETSA_PM_FLCHAR_VAL.lsmw.conv
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[43,21]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: \\utilities.etsa.net.au\Citrix
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[43,6]
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
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Refresh   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Display <-> Change   (Ctrl+F1)
              properties:
              - property:
                  value:
                    value: btn[25]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Change Entry   (Ctrl+F3)
              properties:
              - property:
                  value:
                    value: btn[27]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: btn[12]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Imported'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Import_3'
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
                value: /1CADMC/SAP_LSMW_READ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Import_2'
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
                value: /1CADMC/SAP_LSMW_READ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save as Variant...   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior: ''
              comments: ''
              visual_relations:
                visual_relation: []
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Import'
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
                value: /1CADMC/SAP_LSMW_READ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save as Variant...   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: ETSA, PM,'
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: /SAPDMC/SAPLLSMW_OBJ_000TC_STE
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Create'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiCheckBox
              name: Keep batch input folder(s)?
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
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'LSM Workbench: Convert'
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
                value: /1CADMC/SAP_LSMW_CONV_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Log Off
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'No'
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Legacy System Migration
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Subproject
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Object
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information_2
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
                value: wnd[1]
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
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Information Message
              properties:
              - property:
                  value:
                    value: MESSTXT1
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
                    value: wnd[1]/usr/txtMESSTXT1
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Session overview
              properties:
              - property:
                  value:
                    value: btn[0]
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
                    value: wnd[1]/tbar[0]/btn[0]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit batch input
              properties:
              - property:
                  value:
                    value: btn[12]
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
                    value: wnd[1]/tbar[0]/btn[12]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Imported Data: Display'
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'File on Front End: Display'
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: File
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Read Data
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Converted Data
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Converted Data: Display'
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
                value: /SAPDMC/SAPLLSMW_OBJ_.*
                regular_expression: true
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Functional Location:_3
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
                value: '2100'
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
                value: wnd[0]
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
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
                    value: wnd[0]/sbar
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: OKCode
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
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Functional Location:_2
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
                value: wnd[0]
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
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
                    value: wnd[0]/sbar
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Functional Location:'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: OKCode
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: btn[12]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Batch Input: Transaction'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: 'No'
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Batch Input: Session Overview'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPMSBDC_CCTC_APQI
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Statistics
              properties:
              - property:
                  value:
                    value: btn[13]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Process
              properties:
              - property:
                  value:
                    value: btn[8]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Log
              properties:
              - property:
                  value:
                    value: btn[7]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Analysis
              properties:
              - property:
                  value:
                    value: btn[2]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Batch Input: Log Overview'
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: RSBDC_PROTOCOLTC_PROTOCOL
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Batch Input Log for Session_4
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
                value: wnd[1]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: File Name
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Directory
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Generate
              properties:
              - property:
                  value:
                    value: btn[0]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Batch Input Log for Session_3
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Batch Input Log for Session_2
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Spreadsheet...   (Ctrl+Shift+F
              properties:
              - property:
                  value:
                    value: btn[43]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Batch Input Log for Session
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Print from ABAP list viewer
              properties:
              - property:
                  value:
                    value: btn[86]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Analysis of Session IL02_USERS
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
                value: wnd[0]
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
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 10 March 2022 1:56:51 PM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TAB_DYNPRO
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: RSBDC_ANALYSETC_TCODES
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: RSBDC_ANALYSETC_PROTOCOL
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: With errors
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
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiElement
              name: FRM_INFO
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Created On
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 10 March 2022 1:56:51 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
