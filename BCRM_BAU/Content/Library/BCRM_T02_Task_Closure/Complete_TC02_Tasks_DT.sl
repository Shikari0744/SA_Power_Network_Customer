namespace: BCRM_T02_Task_Closure
operation:
  name: Complete_TC02_Tasks_DT
  inputs:
  - fileName
  sequential_action:
    gav: com.microfocus.seq:BCRM_T02_Task_Closure.Complete_TC02_Tasks_DT:1.0.0
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
        object_path: fname = Parameter("fileName")
    - step:
        id: '2'
        action: Script
        object_path: completedt02 = 0
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(fname)
    - step:
        id: '6'
        action: Script
        object_path: Set objWS = objWorkbook.Worksheets("Results")
    - step:
        id: '7'
        action: Script
        object_path: '''Call fn_TCode_Nav("/nIW66")'
    - step:
        id: '8'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '9'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '10'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW66"'
    - step:
        id: '11'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '12'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '13'
        action: Script
        object_path: '''Call fn_TaskCode_Nav("HP-SPCDT","TC02")'
    - step:
        id: '14'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '15'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
        action: SetFocus
    - step:
        id: '16'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
        action: Set
        args: '"HP-SPCDT"'
    - step:
        id: '17'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '18'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task
          Code")'
        action: SetFocus
    - step:
        id: '19'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task
          Code")'
        action: Set
        args: '"TC02"'
    - step:
        id: '20'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiButton("Execute")'
        action: Click
    - step:
        id: '21'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '22'
        action: Script
        object_path: x = 2
    - step:
        id: '23'
        action: Script
        object_path: '''Call fn_ReadTable_CloseJob()'
    - step:
        id: '24'
        action: Script
        object_path: '''reading table'
    - step:
        id: '25'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Change Tasks: List
          of").SAPGuiGrid("GridViewCtrl").Exist(3) Then'
    - step:
        id: '26'
        action: Script
        object_path: "TaskListRowCnt\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").RowCount"
    - step:
        id: '27'
        action: Script
        object_path: For i = 1 To TaskListRowCnt
    - step:
        id: '28'
        action: Script
        object_path: "Code_Group\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Code Group\"\
          )"
    - step:
        id: '29'
        action: Script
        object_path: "Task_Code\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Code\"\
          )"
    - step:
        id: '30'
        action: Script
        object_path: "Task_Text\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Text\"\
          )"
    - step:
        id: '31'
        action: Script
        object_path: If Code_Group="HP-SPCDT" and Task_Code="TC02" and Task_Text="PROCESS
          INSTALLER COMMENTS" Then
    - step:
        id: '32'
        action: Script
        object_path: "Notification_Num\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"\
          Notification\")"
    - step:
        id: '33'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: List of").SAPGuiGrid("GridViewCtrl")'
        action: ActivateCell
        args: i, "Task Text"
    - step:
        id: '34'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '35'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiTextArea("TextAreaControl").Exist(1)
          Then
    - step:
        id: '36'
        action: Script
        object_path: Jobdescription = SAPGuiSession("Session").SAPGuiWindow("Process
          Task").SAPGuiTextArea("TextAreaControl").GetROProperty("text")
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Complete
          task   (Ctrl+Shift+F1")
        action: Click
    - step:
        id: '38'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '39'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Save")
        action: Click
    - step:
        id: '40'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '41'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiStatusBar("StatusBar").Exist(0)
          Then
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Cancel")
        action: Click
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Confirmat. Prompt").SAPGuiButton("No")
        action: Click
    - step:
        id: '44'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '45'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '46'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '47'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '48'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Not closed - issues with task. Investigation required"
    - step:
        id: '49'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '50'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '51'
        object_path: objWorkbook
        action: save
    - step:
        id: '52'
        action: Script
        object_path: x = x + 1
    - step:
        id: '53'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '54'
        action: Script
        object_path: Else
    - step:
        id: '55'
        action: Script
        object_path: 'JobCompleted = SAPGuiSession("Session").SAPGuiWindow("Change
          Tasks: List of").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Selected Line")'
    - step:
        id: '56'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '57'
        action: Script
        object_path: If JobCompleted="E" Then
    - step:
        id: '58'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '59'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '60'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '61'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '62'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Closed Successfully"
    - step:
        id: '63'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '64'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '65'
        object_path: objWorkbook
        action: save
    - step:
        id: '66'
        action: Script
        object_path: x = x + 1
    - step:
        id: '67'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '68'
        action: Script
        object_path: Else
    - step:
        id: '69'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '70'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '71'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '72'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '73'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Closed Successfully"
    - step:
        id: '74'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '75'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '76'
        object_path: objWorkbook
        action: save
    - step:
        id: '77'
        action: Script
        object_path: x = x + 1
    - step:
        id: '78'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '79'
        action: Script
        object_path: End If
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        action: Script
        object_path: Else
    - step:
        id: '82'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Service Notification:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '83'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '84'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '85'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '86'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '87'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Not closed - task locked. Investigation required"
    - step:
        id: '88'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '89'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '90'
        object_path: objWorkbook
        action: save
    - step:
        id: '91'
        action: Script
        object_path: x = x + 1
    - step:
        id: '92'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '93'
        action: Script
        object_path: '''Set mySendKeys = CreateObject("WScript.Shell")'
    - step:
        id: '94'
        object_path: '''mySendKeys'
        action: SendKeys
        args: '"{F3}"'
    - step:
        id: '95'
        action: Script
        object_path: '''Set mySendKeys = NOTHING'
    - step:
        id: '96'
        action: Script
        object_path: End If
    - step:
        id: '97'
        action: Script
        object_path: End If
    - step:
        id: '98'
        action: Script
        object_path: If completedt02 = 1000 Then
    - step:
        id: '99'
        action: Script
        object_path: Exit For
    - step:
        id: '100'
        action: Script
        object_path: End If
    - step:
        id: '101'
        action: Script
        object_path: Next
    - step:
        id: '102'
        action: Script
        object_path: Else
    - step:
        id: '103'
        object_path: objWS.cells(x,1)
        action: value
        args: = "No Results found"
    - step:
        id: '104'
        object_path: objWorkbook
        action: save
    - step:
        id: '105'
        action: Script
        object_path: End If
    - step:
        id: '106'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '107'
        action: Script
        object_path: Parameter("completedt02") = completedt02
    - step:
        id: '108'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '109'
        object_path: objWorkbook
        action: save
    - step:
        id: '110'
        object_path: objWorkbook
        action: close
    - step:
        id: '111'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '112'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '113'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '114'
        action: Script
        object_path: Set objWS = Nothing
    - step:
        id: '115'
        action: Script
        object_path: '''''''============================================================================================================================================='
    - step:
        id: '116'
        action: Script
        object_path: Function fn_LaunchSAP_SSO(ConnectionName,SysID,user,password)
    - step:
        id: '117'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '118'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '119'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '120'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '121'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '122'
        object_path: SystemUtil
        action: Run("saplogon.exe")
    - step:
        id: '123'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '124'
        object_path: SAPGuiUtil
        action: AutoLogon
        args: ConnectionName,SysID,user,password,"EN"
    - step:
        id: '125'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '126'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '127'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '128'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '129'
        action: Script
        object_path: On error goto 0
    - step:
        id: '130'
        action: Script
        object_path: End Function
    - step:
        id: '131'
        action: Script
        object_path: Function fn_TCode_Nav(Tcode)
    - step:
        id: '132'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '133'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '134'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: Tcode
    - step:
        id: '135'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '136'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '137'
        action: Script
        object_path: End Function
    - step:
        id: '138'
        action: Script
        object_path: Function fn_TaskCode_Nav(Task,Taskcode)
    - step:
        id: '139'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '140'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
        action: SetFocus
    - step:
        id: '141'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Tasks")'
        action: Set
        args: Task
    - step:
        id: '142'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '143'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task
          Code")'
        action: SetFocus
    - step:
        id: '144'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiEdit("Task
          Code")'
        action: Set
        args: Taskcode
    - step:
        id: '145'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: Selection").SAPGuiButton("Execute")'
        action: Click
    - step:
        id: '146'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '147'
        action: Script
        object_path: End Function
    - step:
        id: '148'
        action: Script
        object_path: Function fn_ReadTable_CloseJob()
    - step:
        id: '149'
        action: Script
        object_path: '''reading table'
    - step:
        id: '150'
        action: Script
        object_path: "TaskListRowCnt\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").RowCount"
    - step:
        id: '151'
        action: Script
        object_path: For i = 1 To TaskListRowCnt
    - step:
        id: '152'
        action: Script
        object_path: "Code_Group\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Code Group\"\
          )"
    - step:
        id: '153'
        action: Script
        object_path: "Task_Code\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Code\"\
          )"
    - step:
        id: '154'
        action: Script
        object_path: "Task_Text\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Change\
          \ Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"Task Text\"\
          )"
    - step:
        id: '155'
        action: Script
        object_path: If Code_Group="HP-SPCDT" and Task_Code="TC02" and Task_Text="PROCESS
          INSTALLER COMMENTS" Then
    - step:
        id: '156'
        action: Script
        object_path: "Notification_Num\t=\tSAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Change Tasks: List of\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i, \"\
          Notification\")"
    - step:
        id: '157'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Tasks: List of").SAPGuiGrid("GridViewCtrl")'
        action: ActivateCell
        args: i, "Task Text"
    - step:
        id: '158'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '159'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiTextArea("TextAreaControl").Exist(1)
          Then
    - step:
        id: '160'
        action: Script
        object_path: Jobdescription = SAPGuiSession("Session").SAPGuiWindow("Process
          Task").SAPGuiTextArea("TextAreaControl").GetROProperty("text")
    - step:
        id: '161'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Complete
          task   (Ctrl+Shift+F1")
        action: Click
    - step:
        id: '162'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Process Task").SAPGuiButton("Save")
        action: Click
    - step:
        id: '164'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '165'
        action: Script
        object_path: 'JobCompleted = SAPGuiSession("Session").SAPGuiWindow("Change
          Tasks: List of").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Selected Line")'
    - step:
        id: '166'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '167'
        action: Script
        object_path: If JobCompleted="E" Then
    - step:
        id: '168'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '169'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '170'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '171'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '172'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Closed Successfully"
    - step:
        id: '173'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '174'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '175'
        object_path: objWorkbook
        action: save
    - step:
        id: '176'
        action: Script
        object_path: x = x + 1
    - step:
        id: '177'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '178'
        action: Script
        object_path: Else
    - step:
        id: '179'
        object_path: objWS.cells(x,1)
        action: value
        args: = Notification_Num
    - step:
        id: '180'
        object_path: objWS.cells(x,2)
        action: value
        args: = Code_Group
    - step:
        id: '181'
        object_path: objWS.cells(x,3)
        action: value
        args: = Task_Code
    - step:
        id: '182'
        object_path: objWS.cells(x,4)
        action: value
        args: = Task_Text
    - step:
        id: '183'
        object_path: objWS.cells(x,5)
        action: value
        args: = "Closed Successfully"
    - step:
        id: '184'
        object_path: objWS.cells(x,6)
        action: value
        args: = Now
    - step:
        id: '185'
        object_path: objWS.cells(x,7)
        action: value
        args: = Jobdescription
    - step:
        id: '186'
        object_path: objWorkbook
        action: save
    - step:
        id: '187'
        action: Script
        object_path: x = x + 1
    - step:
        id: '188'
        action: Script
        object_path: completedt02 = completedt02 + 1
    - step:
        id: '189'
        action: Script
        object_path: End If
    - step:
        id: '190'
        action: Script
        object_path: Else
    - step:
        id: '191'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '192'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F3}"'
    - step:
        id: '193'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '194'
        action: Script
        object_path: End If
    - step:
        id: '195'
        action: Script
        object_path: End If
    - step:
        id: '196'
        action: Script
        object_path: If completedt02 = 1000 Then
    - step:
        id: '197'
        action: Script
        object_path: Exit For
    - step:
        id: '198'
        action: Script
        object_path: End If
    - step:
        id: '199'
        action: Script
        object_path: Next
    - step:
        id: '200'
        action: Script
        object_path: End Function
  outputs:
  - completedt02:
      robot: true
      value: ${completedt02}
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
      name: Window_2
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
      basic_identification:
        property_ref:
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: TaskListThumbnailWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 23 September 2022 1:28:37 PM
      child_objects: []
  - object:
      class: Window
      name: Window
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
      basic_identification:
        property_ref:
        - text
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier:
          value: 1
          type: location
      smart_identification: ''
      custom_replay:
        behavior:
          value: Shell_SecondaryTrayWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 23 September 2022 1:28:37 PM
      child_objects:
      - object:
          class: WinObject
          name: MSTaskListWClass
          properties:
          - property:
              value:
                value: MSTaskListWClass
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: MSTaskListWClass
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 23 September 2022 1:28:37 PM
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
            value: /app/con[0]/ses[0]
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
      last_update_time: Friday, 23 September 2022 1:28:37 PM
      child_objects:
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Logon Language
              properties:
              - property:
                  value:
                    value: RSYST-LANGU
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Client
              properties:
              - property:
                  value:
                    value: RSYST-MANDT
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: '*User'
              properties:
              - property:
                  value:
                    value: RSYST-BNAME
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: '*Password'
              properties:
              - property:
                  value:
                    value: RSYST-BCODE
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
                    value: '33'
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Process Task
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
          child_objects:
          - object:
              class: SAPGuiTextArea
              name: TextAreaControl
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
                    value: wnd[0]/usr/cntlDISPLAY_LTXTMASSN/shellcont/shell
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[11]
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Complete task   (Ctrl+Shift+F1
              properties:
              - property:
                  value:
                    value: btn[46]
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
                    value: wnd[0]/tbar[1]/btn[46]
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[12]
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: License Information for
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: Confirmat. Prompt
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              - property:
                  value:
                    value: wnd[1]/usr/btnSPOP-OPTION2
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Tasks: Selection'
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Tasks
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
                    value: wnd[0]/usr/ctxtMNGRP-LOW
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Task Code
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
                    value: wnd[0]/usr/ctxtMNCOD-LOW
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute
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
              - property:
                  value:
                    value: wnd[0]/tbar[1]/btn[8]
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Tasks: List of'
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: wnd[0]/usr/cntlGRID1/shellcont/shell
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Service Notification:'
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
                value: '100'
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
          last_update_time: Friday, 23 September 2022 1:28:37 PM
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Friday, 23 September 2022 1:28:37 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
