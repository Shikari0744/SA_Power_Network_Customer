namespace: PayrollTimesheetChecks
operation:
  name: Timesheet_Check_Employee
  inputs:
  - Emp_Num
  - DateFrom
  - DateTo
  - SAP_User_Name
  - SAP_Password:
      sensitive: true
      default: '{OBFUSCATED}tFQ2pnWYKQCGLnn/5LPzoA=='
  - SendEmailTo
  - SAP_Enviro: PRD
  sequential_action:
    gav: com.microfocus.seq:PayrollTimesheetChecks.Timesheet_Check_Employee:1.0.0
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
        active: true
      web:
        active: false
        address: http://advantageonlineshopping.com
        browser: IE
        close_on_exit: true
    steps:
    - step:
        id: '1'
        action: Script
        object_path: '''###################################################################################################################'
    - step:
        id: '2'
        action: Script
        object_path: '''Test Name: TEST_ID XXX - "SAP RPA"'
    - step:
        id: '3'
        action: Script
        object_path: '''Test Case ID:'
    - step:
        id: '4'
        action: Script
        object_path: '''Created: 21/09/2020'
    - step:
        id: '5'
        action: Script
        object_path: '''Created By: Mohammed Ripon'
    - step:
        id: '6'
        action: Script
        object_path: '''Version: 1.0 Initial version'
    - step:
        id: '7'
        action: Script
        object_path: '''########################################"###########################################################################'
    - step:
        id: '8'
        action: Script
        object_path: '''Change Log: Record date and reason for change here.'
    - step:
        id: '9'
        action: Script
        object_path: '''Jasmin Haas - 15/07/2022 - Added in QAS option for SAP'
    - step:
        id: '10'
        action: Script
        object_path: '''###################################################################################################################'
    - step:
        id: '11'
        action: Script
        object_path: EmployeeNumber = Parameter("Emp_Num")
    - step:
        id: '12'
        action: Script
        object_path: DateFrom = Parameter("DateFrom")
    - step:
        id: '13'
        action: Script
        object_path: DateTo = Parameter("DateTo")
    - step:
        id: '14'
        action: Script
        object_path: SAPUser = Parameter("SAP_User_Name")
    - step:
        id: '15'
        action: Script
        object_path: 'SAPPassword = Parameter("SAP_Password") '
        comment: Crypt.Encrypt(Parameter("SAP_Password"))
    - step:
        id: '16'
        action: Script
        object_path: SapEnviro = Parameter("SAP_Enviro")
    - step:
        id: '17'
        action: Script
        object_path: EmailTo = Parameter("SendEmailTo")
    - step:
        id: '18'
        object_path: DataTable
        action: AddSheet
        args: '"Result"'
    - step:
        id: '19'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"EmployeeNumber",""'
    - step:
        id: '20'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"WarningType",""'
    - step:
        id: '21'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"AsOf",""'
    - step:
        id: '22'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"AllocatedTime",""'
    - step:
        id: '23'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"SubmittedTime",""'
    - step:
        id: '24'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"RDO",""'
    - step:
        id: '25'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"HoursWithinAllocation",""'
    - step:
        id: '26'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"HoursOutsideAllocation",""'
    - step:
        id: '27'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"Remark",""'
    - step:
        id: '28'
        object_path: DataTable.GetSheet("Result")
        action: AddParameter
        args: '"StandDownStatus",""'
    - step:
        id: '29'
        action: Script
        object_path: '''EmployeeNumber = "1003262"'
    - step:
        id: '30'
        action: Script
        object_path: '''DateFrom = "01/02/2021"'
    - step:
        id: '31'
        action: Script
        object_path: '''DateTo = "20/02/2021"'
    - step:
        id: '32'
        action: Script
        object_path: '''SAPUser = "svcrobotest"'
    - step:
        id: '33'
        action: Script
        object_path: '''SAPPassword = Crypt.Encrypt("$Welcome456")'
    - step:
        id: '34'
        action: Script
        object_path: '''EmailTo = "mohammed.ripon@sapowernetworks.com.au"'
    - step:
        id: '35'
        action: Script
        object_path: '''SAP Login'
    - step:
        id: '36'
        action: Script
        object_path: '''LOOP START HERE'
    - step:
        id: '37'
        action: Script
        object_path: '''EmployeeNumber = "1003006,1003262"'
    - step:
        id: '38'
        action: Script
        object_path: If SapEnviro = "PRD" Then
    - step:
        id: '39'
        action: Script
        object_path: sapSystem = "ERP - PRD - Production"
    - step:
        id: '40'
        action: Script
        object_path: ElseIf SapEnviro = "QAS" Then
    - step:
        id: '41'
        action: Script
        object_path: sapSystem = "ERP - CAQ - Quality Assurance"
    - step:
        id: '42'
        action: Script
        object_path: End If
    - step:
        id: '43'
        action: Script
        object_path: EmployeeNumberArray = split(EmployeeNumber, ",")
    - step:
        id: '44'
        action: Script
        object_path: For Each employee in EmployeeNumberArray
    - step:
        id: '45'
        object_path: '''SAPGuiUtil'
        action: CloseConnections
    - step:
        id: '46'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '47'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '48'
        action: Script
        object_path: EmployeeNumber = employee
    - step:
        id: '49'
        action: Script
        object_path: fgen_SapLogin sapSystem,SAPUser,SAPPassword
    - step:
        id: '50'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '51'
        action: Script
        object_path: If Not SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode").Exist(1)
          Then
    - step:
        id: '52'
        action: Script
        object_path: '''fn_gen_loginToSap "ERP - QAS - Quality Assurance",SAPUser,SAPPassword'
    - step:
        id: '53'
        action: Script
        object_path: '''fn_gen_loginToSap "ERP - PRD - Production",SAPUser'
    - step:
        id: '54'
        action: Script
        object_path: screenShotFileLocation = "C:\Temp\SAP_Login_Failed.png"
    - step:
        id: '55'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocation ,true
    - step:
        id: '56'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Step", "Unable to login to SAP.", screenShotFileLocation
    - step:
        id: '57'
        action: Script
        object_path: fn_SendResultAsEmail EmailTo, "Failed to login to SAP.", "Failed
          to login to SAP. Process execution aborted!", screenShotFileLocation
    - step:
        id: '58'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '59'
        action: Script
        object_path: ExitTest
    - step:
        id: '60'
        action: Script
        object_path: End If
    - step:
        id: '61'
        action: Script
        object_path: '''"ERP - QAS - Quality Assurance"'
    - step:
        id: '62'
        action: Script
        object_path: ''' "ERP - PRD - Production"'
    - step:
        id: '63'
        action: Script
        object_path: '''Load Roster'
    - step:
        id: '64'
        action: Script
        object_path: '''Importing Roster spreadsheet to script data table'
    - step:
        id: '65'
        action: Script
        object_path: '''Path = "C:\ETSAData\Roster.xlsx"'
    - step:
        id: '66'
        action: Script
        object_path: '''SheetName = "Roster"'
    - step:
        id: '67'
        action: Script
        object_path: '''ImportSheetTo = "Global"'
    - step:
        id: '68'
        object_path: '''DataTable'
        action: ImportSheet
        args: Path,SheetName,ImportSheetTo
    - step:
        id: '69'
        args: '"1"'
        object_path: '''Wait 1'
        action: Script
    - step:
        id: '70'
        action: Script
        object_path: '''Rows = DataTable.GlobalSheet.GetRowCount'
    - step:
        id: '71'
        action: Script
        object_path: '''Create Result Sheet'
    - step:
        id: '72'
        action: Script
        object_path: '''''Looping Roster Sheet'
    - step:
        id: '73'
        action: Script
        object_path: '''For GetRow = 1 To Rows'
    - step:
        id: '74'
        action: Script
        object_path: "'\tDataTable.GlobalSheet.SetCurrentRow(GetRow)"
    - step:
        id: '75'
        action: Script
        object_path: "'\tEmployeeNumber = DataTable.Value(\"EmployeeNumber\",\"Global\"\
          )"
    - step:
        id: '76'
        action: Script
        object_path: "'\tDateFrom = DataTable.Value(\"DateFrom\",\"Global\")"
    - step:
        id: '77'
        action: Script
        object_path: "'\tDateTo = DataTable.Value(\"DateTo\",\"Global\")"
    - step:
        id: '78'
        action: Script
        object_path: DateFrom = fn_FormatDate(DateFrom,".")
    - step:
        id: '79'
        action: Script
        object_path: DateTo = fn_FormatDate(DateTo,"/")
    - step:
        id: '80'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")
        action: Set
        args: '"CAT2"'
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '82'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Data
          Entry Profile")'
        action: Set
        args: '"MWD_SAPR"'
    - step:
        id: '83'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Personnel
          Number")'
        action: Set
        args: EmployeeNumber
    - step:
        id: '84'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter   (Enter)")'
        action: Click
    - step:
        id: '85'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key
          date")'
        action: Set
        args: DateFrom
    - step:
        id: '86'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter
          Times   (F5)")'
        action: Click
    - step:
        id: '87'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").Exist(1)
          Then '
        comment: If no record is there for the employee then skip the whole code block
    - step:
        id: '88'
        action: Script
        object_path: 'FromDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
    - step:
        id: '89'
        action: Script
        object_path: 'ToDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiEdit("-").GetROProperty("value")'
    - step:
        id: '90'
        action: Script
        object_path: FromDate = fn_FormatDate(FromDate,"/")
    - step:
        id: '91'
        action: Script
        object_path: Do
    - step:
        id: '92'
        action: Script
        object_path: FromDate = EMPTY
    - step:
        id: '93'
        action: Script
        object_path: ToDate = EMPTY
    - step:
        id: '94'
        action: Script
        object_path: 'FromDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
    - step:
        id: '95'
        action: Script
        object_path: 'ToDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiEdit("-").GetROProperty("value")'
    - step:
        id: '96'
        action: Script
        object_path: FromDate = fn_FormatDate(FromDate,"/")
    - step:
        id: '97'
        action: Script
        object_path: If DateValue(FromDate) <= DateValue(DateTo) Then
    - step:
        id: '98'
        action: Script
        object_path: 'FromDate2 = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
    - step:
        id: '99'
        action: Script
        object_path: Day1 = "SA" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,0)
    - step:
        id: '100'
        action: Script
        object_path: Day2 = "SU" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,1)
    - step:
        id: '101'
        action: Script
        object_path: Day3 = "MO" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,2)
    - step:
        id: '102'
        action: Script
        object_path: Day4 = "TU" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,3)
    - step:
        id: '103'
        action: Script
        object_path: Day5 = "WE" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,4)
    - step:
        id: '104'
        action: Script
        object_path: Day6 = "TH" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,5)
    - step:
        id: '105'
        action: Script
        object_path: Day7 = "FR" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,6)
    - step:
        id: '106'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '107'
        action: Script
        object_path: Set oDic2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '108'
        action: Script
        object_path: Set oDic3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '109'
        action: Script
        object_path: Set oDic4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '110'
        object_path: oDic3
        action: Add
        args: '"SA",DateValue(Replace(FromDate2,".","/"))'
    - step:
        id: '111'
        object_path: oDic3
        action: Add
        args: '"SU",DateValue(Replace(FromDate2,".","/")) + 1'
    - step:
        id: '112'
        object_path: oDic3
        action: Add
        args: '"MO",DateValue(Replace(FromDate2,".","/")) + 2'
    - step:
        id: '113'
        object_path: oDic3
        action: Add
        args: '"TU",DateValue(Replace(FromDate2,".","/")) + 3'
    - step:
        id: '114'
        object_path: oDic3
        action: Add
        args: '"WE",DateValue(Replace(FromDate2,".","/")) + 4'
    - step:
        id: '115'
        object_path: oDic3
        action: Add
        args: '"TH",DateValue(Replace(FromDate2,".","/")) + 5'
    - step:
        id: '116'
        object_path: oDic3
        action: Add
        args: '"FR",DateValue(Replace(FromDate2,".","/")) + 6'
    - step:
        id: '117'
        action: Script
        object_path: 'Entry = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data
          Entry").SAPGuiEdit("Entry").GetROProperty("value")'
    - step:
        id: '118'
        action: Script
        object_path: ValidRows = fn_FindValidRowEntry(Entry)
    - step:
        id: '119'
        action: Script
        object_path: 'MonHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#21")'
    - step:
        id: '120'
        action: Script
        object_path: 'MonStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#22")'
    - step:
        id: '121'
        action: Script
        object_path: 'MonEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#23")'
    - step:
        id: '122'
        action: Script
        object_path: 'TuesHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#24")'
    - step:
        id: '123'
        action: Script
        object_path: 'TuesStartTime = SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#25")'
    - step:
        id: '124'
        action: Script
        object_path: 'TuesEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#26")'
    - step:
        id: '125'
        action: Script
        object_path: 'WedHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#27")'
    - step:
        id: '126'
        action: Script
        object_path: 'WedStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#28")'
    - step:
        id: '127'
        action: Script
        object_path: 'WedEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#29")'
    - step:
        id: '128'
        action: Script
        object_path: 'ThursHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#30")'
    - step:
        id: '129'
        action: Script
        object_path: 'ThursStartTime = SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#31")'
    - step:
        id: '130'
        action: Script
        object_path: 'ThursEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#32")'
    - step:
        id: '131'
        action: Script
        object_path: 'FriHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#33")'
    - step:
        id: '132'
        action: Script
        object_path: 'FriStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#34")'
    - step:
        id: '133'
        action: Script
        object_path: 'FriEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#35")'
    - step:
        id: '134'
        action: Script
        object_path: For i = 3 To ValidRows
    - step:
        id: '135'
        action: Script
        object_path: 'DWS = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data
          Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"DWS")'
    - step:
        id: '136'
        action: Script
        object_path: 'WageType = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Wage Type")'
    - step:
        id: '137'
        action: Script
        object_path: If DWS = "RDO" Then
    - step:
        id: '138'
        object_path: oDic
        action: Add
        args: i,"RDO"
    - step:
        id: '139'
        action: Script
        object_path: End If
    - step:
        id: '140'
        action: Script
        object_path: '''============The following code snippet to capture criteria
          to check the condition of 2AVL and 2SUB======='
    - step:
        id: '141'
        action: Script
        object_path: '''============If 2AVL is there but 2SUB is absent in that week
          then raise a flag as it is not normal======='
    - step:
        id: '142'
        action: Script
        object_path: If WageType = "2AVL" Then
    - step:
        id: '143'
        action: Script
        object_path: 'TotalHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Total")'
    - step:
        id: '144'
        action: Script
        object_path: If oDic4.Exists("2AVL") Then
    - step:
        id: '145'
        object_path: oDic4.Item("2AVL") = cdbl(oDic4
        action: Item("2AVL"))
        args: + cdbl(TotalHours)
    - step:
        id: '146'
        action: Script
        object_path: Else
    - step:
        id: '147'
        object_path: oDic4
        action: Add
        args: '"2AVL",cdbl(TotalHours)'
    - step:
        id: '148'
        action: Script
        object_path: End If
    - step:
        id: '149'
        action: Script
        object_path: ElseIf WageType = "2SUB" Then
    - step:
        id: '150'
        action: Script
        object_path: 'TotalHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Total")'
    - step:
        id: '151'
        action: Script
        object_path: If oDic4.Exists("2SUB") Then
    - step:
        id: '152'
        object_path: oDic4.Item("2SUB") = cdbl(oDic4
        action: Item("2SUB"))
        args: + cdbl(TotalHours)
    - step:
        id: '153'
        action: Script
        object_path: Else
    - step:
        id: '154'
        object_path: oDic4
        action: Add
        args: '"2SUB",cdbl(TotalHours)'
    - step:
        id: '155'
        action: Script
        object_path: End If
    - step:
        id: '156'
        action: Script
        object_path: End If
    - step:
        id: '157'
        action: Script
        object_path: TotalHours = EMPTY
    - step:
        id: '158'
        action: Script
        object_path: '''============================================================================================================='
    - step:
        id: '159'
        action: Script
        object_path: If i = ValidRows And oDic.Count = 0 Then
    - step:
        id: '160'
        action: Script
        object_path: i = 0
    - step:
        id: '161'
        action: Script
        object_path: End If
    - step:
        id: '162'
        action: Script
        object_path: 'MonRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#21"))'
    - step:
        id: '163'
        action: Script
        object_path: 'MonRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#22"))'
    - step:
        id: '164'
        action: Script
        object_path: 'MonRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#23"))'
    - step:
        id: '165'
        action: Script
        object_path: If MonRowHours <> EMPTY And MonRowStartTime <> EMPTY And MonRowEndTime
          <> EMPTY Then
    - step:
        id: '166'
        action: Script
        object_path: If MonHours = "0.00" And MonStartTime = "00:00" And MonEndTime
          = "00:00" Then
    - step:
        id: '167'
        action: Script
        object_path: MonHoursOutside = Round(MonHoursOutside + cdbl(MonRowHours),2)
    - step:
        id: '168'
        action: Script
        object_path: ElseIf TimeValue(MonStartTime) <= TimeValue(MonRowStartTime)
          And TimeValue(MonEndTime) >= TimeValue(MonRowEndTime)_
    - step:
        id: '169'
        action: Script
        object_path: And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime))
          Then
    - step:
        id: '170'
        action: Script
        object_path: MonHoursWithin = MonHoursWithin + cdbl(MonRowHours)
    - step:
        id: '171'
        action: Script
        object_path: ElseIf TimeValue(MonRowEndTime) < TimeValue(MonStartTime)_
    - step:
        id: '172'
        action: Script
        object_path: And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime))
          Then
    - step:
        id: '173'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
    - step:
        id: '174'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) > TimeValue(MonEndTime)_
    - step:
        id: '175'
        action: Script
        object_path: And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime))
          Then
    - step:
        id: '176'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
    - step:
        id: '177'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) > TimeValue(MonEndTime) And
          TimeValue(MonRowEndTime) < TimeValue(MonStartTime) Then
    - step:
        id: '178'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
    - step:
        id: '179'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) > TimeValue(MonStartTime)_
    - step:
        id: '180'
        action: Script
        object_path: And TimeValue(MonRowStartTime) < TimeValue(MonEndTime)_
    - step:
        id: '181'
        action: Script
        object_path: And TimeValue(MonRowEndTime) > TimeValue(MonEndTime)_
    - step:
        id: '182'
        action: Script
        object_path: And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime))
          Then
    - step:
        id: '183'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(MonEndTime),
          TimeValue(MonRowEndTime))/60))
    - step:
        id: '184'
        action: Script
        object_path: MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonRowStartTime),
          TimeValue(MonEndTime))/60))
    - step:
        id: '185'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) < TimeValue(MonStartTime)_
    - step:
        id: '186'
        action: Script
        object_path: And TimeValue(MonRowEndTime) < TimeValue(MonEndTime)_
    - step:
        id: '187'
        action: Script
        object_path: And TimeValue(MonRowEndTime) > TimeValue(MonStartTime)_
    - step:
        id: '188'
        action: Script
        object_path: And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime))
          Then
    - step:
        id: '189'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(MonStartTime),
          TimeValue(MonRowStartTime))/60))
    - step:
        id: '190'
        action: Script
        object_path: MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonRowEndTime),
          TimeValue(MonStartTime))/60))
    - step:
        id: '191'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) > TimeValue(MonStartTime)_
    - step:
        id: '192'
        action: Script
        object_path: And TimeValue(MonRowStartTime) < TimeValue(MonEndTime)_
    - step:
        id: '193'
        action: Script
        object_path: And TimeValue(MonRowEndTime) < TimeValue(MonEndTime)_
    - step:
        id: '194'
        action: Script
        object_path: And TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime) Then
    - step:
        id: '195'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"),
          TimeValue(MonEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(MonRowEndTime),
          TimeValue("00:00"))/60))
    - step:
        id: '196'
        action: Script
        object_path: MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonEndTime),
          TimeValue(MonRowStartTime))/60))
    - step:
        id: '197'
        action: Script
        object_path: ElseIf TimeValue(MonRowStartTime) < TimeValue(MonStartTime)_
    - step:
        id: '198'
        action: Script
        object_path: And TimeValue(MonRowEndTime) > TimeValue(MonEndTime)_
    - step:
        id: '199'
        action: Script
        object_path: And TimeValue(MonStartTime) < TimeValue(MonEndTime)_
    - step:
        id: '200'
        action: Script
        object_path: And TimeValue(MonRowEndTime) > TimeValue(MonRowStartTime) Then
    - step:
        id: '201'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(MonStartTime), TimeValue(MonRowStartTime))/60)),2)
    - step:
        id: '202'
        action: Script
        object_path: MonHoursWithin = MonHoursWithin + Round(Abs(cdbl(DateDiff("n",
          TimeValue(MonEndTime), TimeValue(MonStartTime))/60)) - 0.5,2)
    - step:
        id: '203'
        action: Script
        object_path: MonHoursOutside = MonHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(MonEndTime), TimeValue(MonRowEndTime))/60)),2)
    - step:
        id: '204'
        action: Script
        object_path: End If
    - step:
        id: '205'
        action: Script
        object_path: End If
    - step:
        id: '206'
        action: Script
        object_path: 'TuesRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#24"))'
    - step:
        id: '207'
        action: Script
        object_path: 'TuesRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#25"))'
    - step:
        id: '208'
        action: Script
        object_path: 'TuesRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#26"))'
    - step:
        id: '209'
        action: Script
        object_path: If TuesRowHours <> EMPTY And TuesRowStartTime <> EMPTY And TuesRowEndTime
          <> EMPTY Then
    - step:
        id: '210'
        action: Script
        object_path: If TuesHours = "0.00" And TuesStartTime = "00:00" And TuesEndTime
          = "00:00" Then
    - step:
        id: '211'
        action: Script
        object_path: TuesHoursOutside = Round(TuesHoursOutside + cdbl(TuesRowHours),2)
    - step:
        id: '212'
        action: Script
        object_path: ElseIf TimeValue(TuesStartTime) <= TimeValue(TuesRowStartTime)
          And TimeValue(TuesEndTime) >= TimeValue(TuesRowEndTime)_
    - step:
        id: '213'
        action: Script
        object_path: And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime))
          Then
    - step:
        id: '214'
        action: Script
        object_path: TuesHoursWithin = TuesHoursWithin + cdbl(TuesRowHours)
    - step:
        id: '215'
        action: Script
        object_path: ElseIf TimeValue(TuesRowEndTime) < TimeValue(TuesStartTime)_
    - step:
        id: '216'
        action: Script
        object_path: And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime))
          Then
    - step:
        id: '217'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
    - step:
        id: '218'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesEndTime)_
    - step:
        id: '219'
        action: Script
        object_path: And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime))
          Then
    - step:
        id: '220'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
    - step:
        id: '221'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesEndTime) And
          TimeValue(TuesRowEndTime) < TimeValue(TuesStartTime) Then
    - step:
        id: '222'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
    - step:
        id: '223'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesStartTime)_
    - step:
        id: '224'
        action: Script
        object_path: And TimeValue(TuesRowStartTime) < TimeValue(TuesEndTime)_
    - step:
        id: '225'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) > TimeValue(TuesEndTime)_
    - step:
        id: '226'
        action: Script
        object_path: And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime))
          Then
    - step:
        id: '227'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue(TuesEndTime), TimeValue(TuesRowEndTime))/60))
    - step:
        id: '228'
        action: Script
        object_path: TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesRowStartTime),
          TimeValue(TuesEndTime))/60))
    - step:
        id: '229'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) < TimeValue(TuesStartTime)_
    - step:
        id: '230'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) < TimeValue(TuesEndTime)_
    - step:
        id: '231'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) > TimeValue(TuesStartTime)_
    - step:
        id: '232'
        action: Script
        object_path: And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime))
          Then
    - step:
        id: '233'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue(TuesRowStartTime), TimeValue(TuesStartTime))/60))
    - step:
        id: '234'
        action: Script
        object_path: TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesStartTime),
          TimeValue(TuesRowEndTime))/60))
    - step:
        id: '235'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesStartTime)_
    - step:
        id: '236'
        action: Script
        object_path: And TimeValue(TuesRowStartTime) < TimeValue(TuesEndTime)_
    - step:
        id: '237'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) < TimeValue(TuesEndTime)_
    - step:
        id: '238'
        action: Script
        object_path: And TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime) Then
    - step:
        id: '239'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue("23:59"), TimeValue(TuesEndTime))/60)) + Abs(cdbl(DateDiff("n",
          TimeValue(TuesRowEndTime), TimeValue("00:00"))/60))
    - step:
        id: '240'
        action: Script
        object_path: TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesEndTime),
          TimeValue(TuesRowStartTime))/60))
    - step:
        id: '241'
        action: Script
        object_path: ElseIf TimeValue(TuesRowStartTime) < TimeValue(TuesStartTime)_
    - step:
        id: '242'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) > TimeValue(TuesEndTime)_
    - step:
        id: '243'
        action: Script
        object_path: And TimeValue(TuesStartTime) < TimeValue(TuesEndTime)_
    - step:
        id: '244'
        action: Script
        object_path: And TimeValue(TuesRowEndTime) > TimeValue(TuesRowStartTime) Then
    - step:
        id: '245'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(TuesStartTime), TimeValue(TuesRowStartTime))/60)),2)
    - step:
        id: '246'
        action: Script
        object_path: TuesHoursWithin = TuesHoursWithin + Round(Abs(cdbl(DateDiff("n",
          TimeValue(TuesEndTime), TimeValue(TuesStartTime))/60)) - 0.5,2)
    - step:
        id: '247'
        action: Script
        object_path: TuesHoursOutside = TuesHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(TuesEndTime), TimeValue(TuesRowEndTime))/60)),2)
    - step:
        id: '248'
        action: Script
        object_path: End If
    - step:
        id: '249'
        action: Script
        object_path: End If
    - step:
        id: '250'
        action: Script
        object_path: 'WedRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#27"))'
    - step:
        id: '251'
        action: Script
        object_path: 'WedRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#28"))'
    - step:
        id: '252'
        action: Script
        object_path: 'WedRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#29"))'
    - step:
        id: '253'
        action: Script
        object_path: If WedRowHours <> EMPTY And WedRowStartTime <> EMPTY And WedRowEndTime
          <> EMPTY Then
    - step:
        id: '254'
        action: Script
        object_path: If WedHours = "0.00" And WedStartTime = "00:00" And WedEndTime
          = "00:00" Then
    - step:
        id: '255'
        action: Script
        object_path: WedHoursOutside = Round(WedHoursOutside + cdbl(WedRowHours),2)
    - step:
        id: '256'
        action: Script
        object_path: ElseIf TimeValue(WedStartTime) <= TimeValue(WedRowStartTime)
          And TimeValue(WedEndTime) >= TimeValue(WedRowEndTime)_
    - step:
        id: '257'
        action: Script
        object_path: And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime))
          Then
    - step:
        id: '258'
        action: Script
        object_path: WedHoursWithin = WedHoursWithin + cdbl(WedRowHours)
    - step:
        id: '259'
        action: Script
        object_path: ElseIf TimeValue(WedRowEndTime) < TimeValue(WedStartTime)_
    - step:
        id: '260'
        action: Script
        object_path: And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime))
          Then
    - step:
        id: '261'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
    - step:
        id: '262'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) > TimeValue(WedEndTime)_
    - step:
        id: '263'
        action: Script
        object_path: And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime))
          Then
    - step:
        id: '264'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
    - step:
        id: '265'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) > TimeValue(WedEndTime) And
          TimeValue(WedRowEndTime) < TimeValue(WedStartTime) Then
    - step:
        id: '266'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
    - step:
        id: '267'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) > TimeValue(WedStartTime)_
    - step:
        id: '268'
        action: Script
        object_path: And TimeValue(WedRowStartTime) < TimeValue(WedEndTime)_
    - step:
        id: '269'
        action: Script
        object_path: And TimeValue(WedRowEndTime) > TimeValue(WedEndTime)_
    - step:
        id: '270'
        action: Script
        object_path: And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime))
          Then
    - step:
        id: '271'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(WedEndTime),
          TimeValue(WedRowEndTime))/60))
    - step:
        id: '272'
        action: Script
        object_path: WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedRowStartTime),
          TimeValue(WedEndTime))/60))
    - step:
        id: '273'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) < TimeValue(WedStartTime)_
    - step:
        id: '274'
        action: Script
        object_path: And TimeValue(WedRowEndTime) < TimeValue(WedEndTime)_
    - step:
        id: '275'
        action: Script
        object_path: And TimeValue(WedRowEndTime) > TimeValue(WedStartTime)_
    - step:
        id: '276'
        action: Script
        object_path: And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime))
          Then
    - step:
        id: '277'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(WedStartTime),
          TimeValue(WedRowStartTime))/60))
    - step:
        id: '278'
        action: Script
        object_path: WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedRowEndTime),
          TimeValue(WedStartTime))/60))
    - step:
        id: '279'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) > TimeValue(WedStartTime)_
    - step:
        id: '280'
        action: Script
        object_path: And TimeValue(WedRowStartTime) < TimeValue(WedEndTime)_
    - step:
        id: '281'
        action: Script
        object_path: And TimeValue(WedRowEndTime) < TimeValue(WedEndTime)_
    - step:
        id: '282'
        action: Script
        object_path: And TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime) Then
    - step:
        id: '283'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"),
          TimeValue(WedEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(WedRowEndTime),
          TimeValue("00:00"))/60))
    - step:
        id: '284'
        action: Script
        object_path: WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedEndTime),
          TimeValue(WedRowStartTime))/60))
    - step:
        id: '285'
        action: Script
        object_path: ElseIf TimeValue(WedRowStartTime) < TimeValue(WedStartTime)_
    - step:
        id: '286'
        action: Script
        object_path: And TimeValue(WedRowEndTime) > TimeValue(WedEndTime)_
    - step:
        id: '287'
        action: Script
        object_path: And TimeValue(WedStartTime) < TimeValue(WedEndTime)_
    - step:
        id: '288'
        action: Script
        object_path: And TimeValue(WedRowEndTime) > TimeValue(WedRowStartTime) Then
    - step:
        id: '289'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(WedStartTime), TimeValue(WedRowStartTime))/60)),2)
    - step:
        id: '290'
        action: Script
        object_path: WedHoursWithin = WedHoursWithin + Round(Abs(cdbl(DateDiff("n",
          TimeValue(WedEndTime), TimeValue(WedStartTime))/60)) - 0.5,2)
    - step:
        id: '291'
        action: Script
        object_path: WedHoursOutside = WedHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(WedEndTime), TimeValue(WedRowEndTime))/60)),2)
    - step:
        id: '292'
        action: Script
        object_path: End If
    - step:
        id: '293'
        action: Script
        object_path: End If
    - step:
        id: '294'
        action: Script
        object_path: 'ThursRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#30"))'
    - step:
        id: '295'
        action: Script
        object_path: 'ThursRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#31"))'
    - step:
        id: '296'
        action: Script
        object_path: 'ThursRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#32"))'
    - step:
        id: '297'
        action: Script
        object_path: If ThursRowHours <> EMPTY And ThursRowStartTime <> EMPTY And
          ThursRowEndTime <> EMPTY Then
    - step:
        id: '298'
        action: Script
        object_path: If ThursHours = "0.00" And ThursStartTime = "00:00" And ThursEndTime
          = "00:00" Then
    - step:
        id: '299'
        action: Script
        object_path: ThursHoursOutside = Round(ThursHoursOutside + cdbl(ThursRowHours),2)
    - step:
        id: '300'
        action: Script
        object_path: ElseIf TimeValue(ThursStartTime) <= TimeValue(ThursRowStartTime)
          And TimeValue(ThursEndTime) >= TimeValue(ThursRowEndTime)_
    - step:
        id: '301'
        action: Script
        object_path: And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime))
          Then
    - step:
        id: '302'
        action: Script
        object_path: ThursHoursWithin = ThursHoursWithin + cdbl(ThursRowHours)
    - step:
        id: '303'
        action: Script
        object_path: ElseIf TimeValue(ThursRowEndTime) < TimeValue(ThursStartTime)_
    - step:
        id: '304'
        action: Script
        object_path: And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime))
          Then
    - step:
        id: '305'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
    - step:
        id: '306'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursEndTime)_
    - step:
        id: '307'
        action: Script
        object_path: And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime))
          Then
    - step:
        id: '308'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
    - step:
        id: '309'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursEndTime)
          And TimeValue(ThursRowEndTime) < TimeValue(ThursStartTime) Then
    - step:
        id: '310'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
    - step:
        id: '311'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursStartTime)_
    - step:
        id: '312'
        action: Script
        object_path: And TimeValue(ThursRowStartTime) < TimeValue(ThursEndTime)_
    - step:
        id: '313'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) > TimeValue(ThursEndTime)_
    - step:
        id: '314'
        action: Script
        object_path: And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime))
          Then
    - step:
        id: '315'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue(ThursEndTime), TimeValue(ThursRowEndTime))/60))
    - step:
        id: '316'
        action: Script
        object_path: ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n",
          TimeValue(ThursRowStartTime), TimeValue(ThursEndTime))/60))
    - step:
        id: '317'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) < TimeValue(ThursStartTime)_
    - step:
        id: '318'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) < TimeValue(ThursEndTime)_
    - step:
        id: '319'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) > TimeValue(ThursStartTime)_
    - step:
        id: '320'
        action: Script
        object_path: And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime))
          Then
    - step:
        id: '321'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue(ThursStartTime), TimeValue(ThursRowStartTime))/60))
    - step:
        id: '322'
        action: Script
        object_path: ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n",
          TimeValue(ThursRowEndTime), TimeValue(ThursStartTime))/60))
    - step:
        id: '323'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursStartTime)_
    - step:
        id: '324'
        action: Script
        object_path: And TimeValue(ThursRowStartTime) < TimeValue(ThursEndTime)_
    - step:
        id: '325'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) < TimeValue(ThursEndTime)_
    - step:
        id: '326'
        action: Script
        object_path: And TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)
          Then
    - step:
        id: '327'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n",
          TimeValue("23:59"), TimeValue(ThursEndTime))/60)) + Abs(cdbl(DateDiff("n",
          TimeValue(ThursRowEndTime), TimeValue("00:00"))/60))
    - step:
        id: '328'
        action: Script
        object_path: ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n",
          TimeValue(ThursEndTime), TimeValue(ThursRowStartTime))/60))
    - step:
        id: '329'
        action: Script
        object_path: ElseIf TimeValue(ThursRowStartTime) < TimeValue(ThursStartTime)_
    - step:
        id: '330'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) > TimeValue(ThursEndTime)_
    - step:
        id: '331'
        action: Script
        object_path: And TimeValue(ThursStartTime) < TimeValue(ThursEndTime)_
    - step:
        id: '332'
        action: Script
        object_path: And TimeValue(ThursRowEndTime) > TimeValue(ThursRowStartTime)
          Then
    - step:
        id: '333'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(ThursStartTime), TimeValue(ThursRowStartTime))/60)),2)
    - step:
        id: '334'
        action: Script
        object_path: ThursHoursWithin = ThursHoursWithin + Round(Abs(cdbl(DateDiff("n",
          TimeValue(ThursEndTime), TimeValue(ThursStartTime))/60)) - 0.5,2)
    - step:
        id: '335'
        action: Script
        object_path: ThursHoursOutside = ThursHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(ThursEndTime), TimeValue(ThursRowEndTime))/60)),2)
    - step:
        id: '336'
        action: Script
        object_path: End If
    - step:
        id: '337'
        action: Script
        object_path: End If
    - step:
        id: '338'
        action: Script
        object_path: 'FriRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#33"))'
    - step:
        id: '339'
        action: Script
        object_path: 'FriRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#34"))'
    - step:
        id: '340'
        action: Script
        object_path: 'FriRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#35"))'
    - step:
        id: '341'
        action: Script
        object_path: If FriRowHours <> EMPTY And FriRowStartTime <> EMPTY And FriRowEndTime
          <> EMPTY Then
    - step:
        id: '342'
        action: Script
        object_path: If FriHours = "0.00" And FriStartTime = "00:00" And FriEndTime
          = "00:00" Then
    - step:
        id: '343'
        action: Script
        object_path: FriHoursOutside = Round(FriHoursOutside + cdbl(FriRowHours),2)
    - step:
        id: '344'
        action: Script
        object_path: ElseIf TimeValue(FriStartTime) <= TimeValue(FriRowStartTime)
          And TimeValue(FriEndTime) >= TimeValue(FriRowEndTime)_
    - step:
        id: '345'
        action: Script
        object_path: And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))
          Then
    - step:
        id: '346'
        action: Script
        object_path: FriHoursWithin = FriHoursWithin + cdbl(FriRowHours)
    - step:
        id: '347'
        action: Script
        object_path: ElseIf TimeValue(FriRowEndTime) < TimeValue(FriStartTime)_
    - step:
        id: '348'
        action: Script
        object_path: And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))
          Then
    - step:
        id: '349'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
    - step:
        id: '350'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime)_
    - step:
        id: '351'
        action: Script
        object_path: And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))
          Then
    - step:
        id: '352'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
    - step:
        id: '353'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime) And
          TimeValue(FriRowEndTime) < TimeValue(FriStartTime) Then
    - step:
        id: '354'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
    - step:
        id: '355'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_
    - step:
        id: '356'
        action: Script
        object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
    - step:
        id: '357'
        action: Script
        object_path: And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_
    - step:
        id: '358'
        action: Script
        object_path: And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))
          Then
    - step:
        id: '359'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime),
          TimeValue(FriRowEndTime))/60))
    - step:
        id: '360'
        action: Script
        object_path: FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime),
          TimeValue(FriEndTime))/60))
    - step:
        id: '361'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
    - step:
        id: '362'
        action: Script
        object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
    - step:
        id: '363'
        action: Script
        object_path: And TimeValue(FriRowEndTime) > TimeValue(FriStartTime)_
    - step:
        id: '364'
        action: Script
        object_path: And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))
          Then
    - step:
        id: '365'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriStartTime),
          TimeValue(FriRowStartTime))/60))
    - step:
        id: '366'
        action: Script
        object_path: FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowEndTime),
          TimeValue(FriStartTime))/60))
    - step:
        id: '367'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_
    - step:
        id: '368'
        action: Script
        object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
    - step:
        id: '369'
        action: Script
        object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
    - step:
        id: '370'
        action: Script
        object_path: And TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime) Then
    - step:
        id: '371'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime),
          TimeValue("23:59"))/60)) + Abs(cdbl(DateDiff("n", TimeValue("00:00"), TimeValue(FriRowEndTime))/60))
    - step:
        id: '372'
        action: Script
        object_path: FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime),
          TimeValue(FriEndTime))/60))
    - step:
        id: '373'
        action: Script
        object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
    - step:
        id: '374'
        action: Script
        object_path: And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_
    - step:
        id: '375'
        action: Script
        object_path: And TimeValue(FriStartTime) < TimeValue(FriEndTime)_
    - step:
        id: '376'
        action: Script
        object_path: And TimeValue(FriRowEndTime) > TimeValue(FriRowStartTime) Then
    - step:
        id: '377'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60)),2)
    - step:
        id: '378'
        action: Script
        object_path: FriHoursWithin = FriHoursWithin + Round(Abs(cdbl(DateDiff("n",
          TimeValue(FriEndTime), TimeValue(FriStartTime))/60)) - 0.5,2)
    - step:
        id: '379'
        action: Script
        object_path: FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n",
          TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60)),2)
    - step:
        id: '380'
        action: Script
        object_path: End If
    - step:
        id: '381'
        action: Script
        object_path: End If
    - step:
        id: '382'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '383'
        action: Script
        object_path: MonRowHours = EMPTY
    - step:
        id: '384'
        action: Script
        object_path: MonRowStartTime = EMPTY
    - step:
        id: '385'
        action: Script
        object_path: MonRowEndTime = EMPTY
    - step:
        id: '386'
        action: Script
        object_path: TuesRowHours = EMPTY
    - step:
        id: '387'
        action: Script
        object_path: TuesRowStartTime = EMPTY
    - step:
        id: '388'
        action: Script
        object_path: TuesRowEndTime = EMPTY
    - step:
        id: '389'
        action: Script
        object_path: WedRowHours = EMPTY
    - step:
        id: '390'
        action: Script
        object_path: WedRowStartTime = EMPTY
    - step:
        id: '391'
        action: Script
        object_path: WedRowEndTime = EMPTY
    - step:
        id: '392'
        action: Script
        object_path: ThursRowHours = EMPTY
    - step:
        id: '393'
        action: Script
        object_path: ThursRowStartTime = EMPTY
    - step:
        id: '394'
        action: Script
        object_path: ThursRowEndTime = EMPTY
    - step:
        id: '395'
        action: Script
        object_path: FriRowHours = EMPTY
    - step:
        id: '396'
        action: Script
        object_path: FriRowStartTime = EMPTY
    - step:
        id: '397'
        action: Script
        object_path: FriRowEndTime = EMPTY
    - step:
        id: '398'
        action: Script
        object_path: Next
    - step:
        id: '399'
        action: Script
        object_path: 'Total = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data
          Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"Total")'
    - step:
        id: '400'
        action: Script
        object_path: 'SumTotal = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,"Total")'
    - step:
        id: '401'
        action: Script
        object_path: 'Total_SA = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day1)'
    - step:
        id: '402'
        action: Script
        object_path: 'Sum_SA = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day1)'
    - step:
        id: '403'
        action: Script
        object_path: 'Total_SU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day2)'
    - step:
        id: '404'
        action: Script
        object_path: 'Sum_SU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day2)'
    - step:
        id: '405'
        action: Script
        object_path: 'Total_MO = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day3)'
    - step:
        id: '406'
        action: Script
        object_path: 'Sum_MO = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day3)'
    - step:
        id: '407'
        action: Script
        object_path: 'Total_TU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day4)'
    - step:
        id: '408'
        action: Script
        object_path: 'Sum_TU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day4)'
    - step:
        id: '409'
        action: Script
        object_path: 'Total_WE = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day5)'
    - step:
        id: '410'
        action: Script
        object_path: 'Sum_WE = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day5)'
    - step:
        id: '411'
        action: Script
        object_path: 'Total_TH = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day6)'
    - step:
        id: '412'
        action: Script
        object_path: 'Sum_TH = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day6)'
    - step:
        id: '413'
        action: Script
        object_path: 'Total_FR = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day7)'
    - step:
        id: '414'
        action: Script
        object_path: 'Sum_FR = SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day7)'
    - step:
        id: '415'
        action: Script
        object_path: If oDic.Count > 0 Then
    - step:
        id: '416'
        action: Script
        object_path: For each key in oDic.Keys
    - step:
        id: '417'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data
          Entry Area").GetCellData(key,Day3) <> EMPTY Then'
    - step:
        id: '418'
        object_path: 'oDic2.Add Day3,SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area")'
        action: GetCellData(key,Day3)
    - step:
        id: '419'
        action: Script
        object_path: End If
    - step:
        id: '420'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data
          Entry Area").GetCellData(key,Day4) <> EMPTY Then'
    - step:
        id: '421'
        object_path: 'oDic2.Add Day4,SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area")'
        action: GetCellData(key,Day4)
    - step:
        id: '422'
        action: Script
        object_path: End If
    - step:
        id: '423'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data
          Entry Area").GetCellData(key,Day5) <> EMPTY Then'
    - step:
        id: '424'
        object_path: 'oDic2.Add Day5,SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area")'
        action: GetCellData(key,Day5)
    - step:
        id: '425'
        action: Script
        object_path: End If
    - step:
        id: '426'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data
          Entry Area").GetCellData(key,Day6) <> EMPTY Then'
    - step:
        id: '427'
        object_path: 'oDic2.Add Day6,SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area")'
        action: GetCellData(key,Day6)
    - step:
        id: '428'
        action: Script
        object_path: End If
    - step:
        id: '429'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data
          Entry Area").GetCellData(key,Day7) <> EMPTY Then'
    - step:
        id: '430'
        object_path: 'oDic2.Add Day7,SAPGuiSession("Session").SAPGuiWindow("Time Sheet:
          Data Entry").SAPGuiTable("Data Entry Area")'
        action: GetCellData(key,Day7)
    - step:
        id: '431'
        action: Script
        object_path: End If
    - step:
        id: '432'
        action: Script
        object_path: Next
    - step:
        id: '433'
        action: Script
        object_path: End If
    - step:
        id: '434'
        action: Script
        object_path: If oDic2.Count > 0 Then
    - step:
        id: '435'
        action: Script
        object_path: For each key in oDic2.Keys
    - step:
        id: '436'
        action: Script
        object_path: ShortDay = Mid(key,1,2)
    - step:
        id: '437'
        action: Script
        object_path: Select Case ShortDay
    - step:
        id: '438'
        action: Script
        object_path: Case "MO"
    - step:
        id: '439'
        action: Script
        object_path: If cdbl(Sum_MO) > 0 Or cdbl(Total_MO) > 0 Then
    - step:
        id: '440'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("MO"),Total_MO,Sum_MO,oDic2.Item(key)
    - step:
        id: '441'
        action: Script
        object_path: End If
    - step:
        id: '442'
        action: Script
        object_path: Case "TU"
    - step:
        id: '443'
        action: Script
        object_path: If cdbl(Sum_TU) > 0 Or cdbl(Total_TU) > 0 Then
    - step:
        id: '444'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("TU"),Total_TU,Sum_TU,oDic2.Item(key)
    - step:
        id: '445'
        action: Script
        object_path: End If
    - step:
        id: '446'
        action: Script
        object_path: Case "WE"
    - step:
        id: '447'
        action: Script
        object_path: If cdbl(Sum_WE) > 0 Or cdbl(Total_WE) > 0 Then
    - step:
        id: '448'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("WE"),Total_WE,Sum_WE,oDic2.Item(key)
    - step:
        id: '449'
        action: Script
        object_path: End If
    - step:
        id: '450'
        action: Script
        object_path: Case "TH"
    - step:
        id: '451'
        action: Script
        object_path: If cdbl(Sum_TH) > 0 Or cdbl(Total_TH) > 0 Then
    - step:
        id: '452'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("TH"),Total_TH,Sum_TH,oDic2.Item(key)
    - step:
        id: '453'
        action: Script
        object_path: End If
    - step:
        id: '454'
        action: Script
        object_path: Case "FR"
    - step:
        id: '455'
        action: Script
        object_path: If cdbl(Sum_FR) > 0 Or cdbl(Total_FR) > 0 Then
    - step:
        id: '456'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("FR"),Total_FR,Sum_FR,oDic2.Item(key)
    - step:
        id: '457'
        action: Script
        object_path: End If
    - step:
        id: '458'
        action: Script
        object_path: End Select
    - step:
        id: '459'
        action: Script
        object_path: Next
    - step:
        id: '460'
        action: Script
        object_path: End If
    - step:
        id: '461'
        action: Script
        object_path: "'\t\tPrint Total_SA"
    - step:
        id: '462'
        action: Script
        object_path: "'\t\tPrint Sum_SA"
    - step:
        id: '463'
        action: Script
        object_path: "'\t\tPrint Total_SU"
    - step:
        id: '464'
        action: Script
        object_path: "'\t\tPrint Sum_SU"
    - step:
        id: '465'
        action: Script
        object_path: "'\t\tPrint Total_MO"
    - step:
        id: '466'
        action: Script
        object_path: "'\t\tPrint Sum_MO"
    - step:
        id: '467'
        action: Script
        object_path: "'\t\tPrint Total_TU"
    - step:
        id: '468'
        action: Script
        object_path: "'\t\tPrint Sum_TU"
    - step:
        id: '469'
        action: Script
        object_path: "'\t\tPrint Total_WE"
    - step:
        id: '470'
        action: Script
        object_path: "'\t\tPrint Sum_WE"
    - step:
        id: '471'
        action: Script
        object_path: "'\t\tPrint Total_TH"
    - step:
        id: '472'
        action: Script
        object_path: "'\t\tPrint Sum_TH"
    - step:
        id: '473'
        action: Script
        object_path: "'\t\tPrint Total_FR"
    - step:
        id: '474'
        action: Script
        object_path: "'\t\tPrint Sum_FR"
    - step:
        id: '475'
        action: Script
        object_path: If cdbl(Total_SA) > 0 And cdbl(Sum_SA) = 0 Then
    - step:
        id: '476'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("SA"),Total_SA,Sum_SA,""
    - step:
        id: '477'
        action: Script
        object_path: End If
    - step:
        id: '478'
        action: Script
        object_path: If cdbl(Total_SU) > 0 And cdbl(Sum_SU) = 0 Then
    - step:
        id: '479'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("SU"),Total_SU,Sum_SU,""
    - step:
        id: '480'
        action: Script
        object_path: End If
    - step:
        id: '481'
        action: Script
        object_path: If cdbl(Total_MO) > 0 And cdbl(Sum_MO) = 0 Then
    - step:
        id: '482'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("MO"),Total_MO,Sum_MO,""
    - step:
        id: '483'
        action: Script
        object_path: End If
    - step:
        id: '484'
        action: Script
        object_path: If cdbl(Total_TU) > 0 And cdbl(Sum_TU) = 0 Then
    - step:
        id: '485'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("TU"),Total_TU,Sum_TU,""
    - step:
        id: '486'
        action: Script
        object_path: End If
    - step:
        id: '487'
        action: Script
        object_path: If cdbl(Total_WE) > 0 And cdbl(Sum_WE) = 0 Then
    - step:
        id: '488'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("WE"),Total_WE,Sum_WE,""
    - step:
        id: '489'
        action: Script
        object_path: End If
    - step:
        id: '490'
        action: Script
        object_path: If cdbl(Total_TH) > 0 And cdbl(Sum_TH) = 0 Then
    - step:
        id: '491'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("TH"),Total_TH,Sum_TH,""
    - step:
        id: '492'
        action: Script
        object_path: End If
    - step:
        id: '493'
        action: Script
        object_path: If cdbl(Total_FR) > 0 And cdbl(Sum_FR) = 0 Then
    - step:
        id: '494'
        action: Script
        object_path: fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated
          day",oDic3.Item("FR"),Total_FR,Sum_FR,""
    - step:
        id: '495'
        action: Script
        object_path: End If
    - step:
        id: '496'
        action: Script
        object_path: "'\t\t'============The following condition check the condition\
          \ of 2AVL and 2SUB (If 2AVL is present but 2SUB is absent then it is not\
          \ normal)"
    - step:
        id: '497'
        action: Script
        object_path: "'\t\tIf oDic4.Exists(\"2AVL\") And Not oDic4.Exists(\"2SUB\"\
          ) Then"
    - step:
        id: '498'
        action: Script
        object_path: "'\t\t\tfn_UpdateResultSheet EmployeeNumber,\"2AVL is present\
          \ but 2SUB is absent\",oDic3.Item(\"MO\"),\"\",\"\",\"\""
    - step:
        id: '499'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '500'
        action: Script
        object_path: '''============The following Code Snippet checks Outside submitted
          hours and reports========================================'
    - step:
        id: '501'
        action: Script
        object_path: If MonHoursWithin = EMPTY Then
    - step:
        id: '502'
        action: Script
        object_path: MonHoursWithin = 0
    - step:
        id: '503'
        action: Script
        object_path: End If
    - step:
        id: '504'
        action: Script
        object_path: If MonHoursOutside = EMPTY Then
    - step:
        id: '505'
        action: Script
        object_path: MonHoursOutside = 0
    - step:
        id: '506'
        action: Script
        object_path: End If
    - step:
        id: '507'
        action: Script
        object_path: MonWorkedHours = cdbl(MonHoursWithin) + cdbl(MonHoursOutside)
    - step:
        id: '508'
        action: Script
        object_path: If MonWorkedHours <> 0 Then
    - step:
        id: '509'
        action: Script
        object_path: MonHoursOutsidePercentage = FormatNumber(cdbl(MonHoursOutside)/cdbl(MonWorkedHours),2)
    - step:
        id: '510'
        action: Script
        object_path: Else
    - step:
        id: '511'
        action: Script
        object_path: MonHoursOutsidePercentage = 0
    - step:
        id: '512'
        action: Script
        object_path: End If
    - step:
        id: '513'
        action: Script
        object_path: If MonHoursOutsidePercentage > 0.5 Then
    - step:
        id: '514'
        action: Script
        object_path: fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted
          Time is outside of planned hours.",oDic3.Item("MO"),"","","",MonHoursWithin,MonHoursOutside,FormatNumber(MonHoursOutsidePercentage*100,2)
    - step:
        id: '515'
        action: Script
        object_path: End If
    - step:
        id: '516'
        action: Script
        object_path: If TuesHoursWithin = EMPTY Then
    - step:
        id: '517'
        action: Script
        object_path: TuesHoursWithin = 0
    - step:
        id: '518'
        action: Script
        object_path: End If
    - step:
        id: '519'
        action: Script
        object_path: If TuesHoursOutside = EMPTY Then
    - step:
        id: '520'
        action: Script
        object_path: TuesHoursOutside = 0
    - step:
        id: '521'
        action: Script
        object_path: End If
    - step:
        id: '522'
        action: Script
        object_path: TuesWorkedHours = cdbl(TuesHoursWithin) + cdbl(TuesHoursOutside)
    - step:
        id: '523'
        action: Script
        object_path: If TuesWorkedHours <> 0 Then
    - step:
        id: '524'
        action: Script
        object_path: TuesHoursOutsidePercentage = FormatNumber(cdbl(TuesHoursOutside)/cdbl(TuesWorkedHours),2)
    - step:
        id: '525'
        action: Script
        object_path: Else
    - step:
        id: '526'
        action: Script
        object_path: TuesHoursOutsidePercentage = 0
    - step:
        id: '527'
        action: Script
        object_path: End If
    - step:
        id: '528'
        action: Script
        object_path: If TuesHoursOutsidePercentage > 0.5 Then
    - step:
        id: '529'
        action: Script
        object_path: fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted
          Time is outside of planned hours.",oDic3.Item("TU"),"","","",TuesHoursWithin,TuesHoursOutside,FormatNumber(TuesHoursOutsidePercentage*100,2)
    - step:
        id: '530'
        action: Script
        object_path: End If
    - step:
        id: '531'
        action: Script
        object_path: If WedHoursWithin = EMPTY Then
    - step:
        id: '532'
        action: Script
        object_path: WedHoursWithin = 0
    - step:
        id: '533'
        action: Script
        object_path: End If
    - step:
        id: '534'
        action: Script
        object_path: If WedHoursOutside = EMPTY Then
    - step:
        id: '535'
        action: Script
        object_path: WedHoursOutside = 0
    - step:
        id: '536'
        action: Script
        object_path: End If
    - step:
        id: '537'
        action: Script
        object_path: WedWorkedHours = FormatNumber(cdbl(WedHoursWithin) + cdbl(WedHoursOutside),2)
    - step:
        id: '538'
        action: Script
        object_path: If WedWorkedHours <> 0 Then
    - step:
        id: '539'
        action: Script
        object_path: WedHoursOutsidePercentage = cdbl(WedHoursOutside)/cdbl(WedWorkedHours)
    - step:
        id: '540'
        action: Script
        object_path: Else
    - step:
        id: '541'
        action: Script
        object_path: WedHoursOutsidePercentage = 0
    - step:
        id: '542'
        action: Script
        object_path: End If
    - step:
        id: '543'
        action: Script
        object_path: If WedHoursOutsidePercentage > 0.5 Then
    - step:
        id: '544'
        action: Script
        object_path: fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted
          Time is outside of planned hours.",oDic3.Item("WE"),"","","",WedHoursWithin,WedHoursOutside,FormatNumber(WedHoursOutsidePercentage*100,2)
    - step:
        id: '545'
        action: Script
        object_path: End If
    - step:
        id: '546'
        action: Script
        object_path: If ThursHoursWithin = EMPTY Then
    - step:
        id: '547'
        action: Script
        object_path: ThursHoursWithin = 0
    - step:
        id: '548'
        action: Script
        object_path: End If
    - step:
        id: '549'
        action: Script
        object_path: If ThursHoursOutside = EMPTY Then
    - step:
        id: '550'
        action: Script
        object_path: ThursHoursOutside = 0
    - step:
        id: '551'
        action: Script
        object_path: End If
    - step:
        id: '552'
        action: Script
        object_path: ThursWorkedHours = FormatNumber(cdbl(ThursHoursWithin) + cdbl(ThursHoursOutside),2)
    - step:
        id: '553'
        action: Script
        object_path: If ThursWorkedHours <> 0 Then
    - step:
        id: '554'
        action: Script
        object_path: ThursHoursOutsidePercentage = cdbl(ThursHoursOutside)/cdbl(ThursWorkedHours)
    - step:
        id: '555'
        action: Script
        object_path: Else
    - step:
        id: '556'
        action: Script
        object_path: ThursHoursOutsidePercentage = 0
    - step:
        id: '557'
        action: Script
        object_path: End If
    - step:
        id: '558'
        action: Script
        object_path: If ThursHoursOutsidePercentage > 0.5 Then
    - step:
        id: '559'
        action: Script
        object_path: fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted
          Time is outside of planned hours.",oDic3.Item("TH"),"","","",ThursHoursWithin,ThursHoursOutside,FormatNumber(ThursHoursOutsidePercentage*100,2)
    - step:
        id: '560'
        action: Script
        object_path: End If
    - step:
        id: '561'
        action: Script
        object_path: If FriHoursWithin = EMPTY Then
    - step:
        id: '562'
        action: Script
        object_path: FriHoursWithin = 0
    - step:
        id: '563'
        action: Script
        object_path: End If
    - step:
        id: '564'
        action: Script
        object_path: If FriHoursOutside = EMPTY Then
    - step:
        id: '565'
        action: Script
        object_path: FriHoursOutside = 0
    - step:
        id: '566'
        action: Script
        object_path: End If
    - step:
        id: '567'
        action: Script
        object_path: FriWorkedHours = FormatNumber(cdbl(FriHoursWithin) + cdbl(FriHoursOutside),2)
    - step:
        id: '568'
        action: Script
        object_path: If FriWorkedHours <> 0 Then
    - step:
        id: '569'
        action: Script
        object_path: FriHoursOutsidePercentage = cdbl(FriHoursOutside)/cdbl(FriWorkedHours)
    - step:
        id: '570'
        action: Script
        object_path: Else
    - step:
        id: '571'
        action: Script
        object_path: FriHoursOutsidePercentage = 0
    - step:
        id: '572'
        action: Script
        object_path: End If
    - step:
        id: '573'
        action: Script
        object_path: If FriHoursOutsidePercentage > 0.5 Then
    - step:
        id: '574'
        action: Script
        object_path: fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted
          Time is outside of planned hours.",oDic3.Item("FR"),"","","",FriHoursWithin,FriHoursOutside,FormatNumber(FriHoursOutsidePercentage*100,2)
    - step:
        id: '575'
        action: Script
        object_path: End If
    - step:
        id: '576'
        action: Script
        object_path: '''=================================End of Code Snippet====================================================================='
    - step:
        id: '577'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Next
          Screen")'
        action: Click
    - step:
        id: '578'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(0)
          Then
    - step:
        id: '579'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '580'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '581'
        action: Script
        object_path: setDate = DateValue(fn_FormatDate(ToDate,"/")) + 1
    - step:
        id: '582'
        action: Script
        object_path: setDate = fn_FormatDate(setDate,".")
    - step:
        id: '583'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key
          date")'
        action: Set
        args: setDate
    - step:
        id: '584'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter
          Times   (F5)")'
        action: Click
    - step:
        id: '585'
        action: Script
        object_path: ElseIf SAPGuiSession("Session").SAPGuiWindow("Display Messages").Exist(0)
          Then
    - step:
        id: '586'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Messages").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '587'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '588'
        action: Script
        object_path: End if
    - step:
        id: '589'
        action: Script
        object_path: End If
    - step:
        id: '590'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '591'
        action: Script
        object_path: FromDate2 = EMPTY
    - step:
        id: '592'
        action: Script
        object_path: Day1 = EMPTY
    - step:
        id: '593'
        action: Script
        object_path: Day2 = EMPTY
    - step:
        id: '594'
        action: Script
        object_path: Day3 = EMPTY
    - step:
        id: '595'
        action: Script
        object_path: Day4 = EMPTY
    - step:
        id: '596'
        action: Script
        object_path: Day5 = EMPTY
    - step:
        id: '597'
        action: Script
        object_path: Day6 = EMPTY
    - step:
        id: '598'
        action: Script
        object_path: Day7 = EMPTY
    - step:
        id: '599'
        action: Script
        object_path: Set oDic = NOTHING
    - step:
        id: '600'
        action: Script
        object_path: Set oDic2 = NOTHING
    - step:
        id: '601'
        action: Script
        object_path: Set oDic3 = NOTHING
    - step:
        id: '602'
        action: Script
        object_path: Entry = EMPTY
    - step:
        id: '603'
        action: Script
        object_path: ValidRows = EMPTY
    - step:
        id: '604'
        action: Script
        object_path: i = EMPTY
    - step:
        id: '605'
        action: Script
        object_path: DWS = EMPTY
    - step:
        id: '606'
        action: Script
        object_path: Total = EMPTY
    - step:
        id: '607'
        action: Script
        object_path: SumTotal = EMPTY
    - step:
        id: '608'
        action: Script
        object_path: Total_SA = EMPTY
    - step:
        id: '609'
        action: Script
        object_path: Sum_SA = EMPTY
    - step:
        id: '610'
        action: Script
        object_path: Total_SU = EMPTY
    - step:
        id: '611'
        action: Script
        object_path: Sum_SU = EMPTY
    - step:
        id: '612'
        action: Script
        object_path: Total_MO = EMPTY
    - step:
        id: '613'
        action: Script
        object_path: Sum_MO = EMPTY
    - step:
        id: '614'
        action: Script
        object_path: Total_TU = EMPTY
    - step:
        id: '615'
        action: Script
        object_path: Sum_TU = EMPTY
    - step:
        id: '616'
        action: Script
        object_path: Total_WE = EMPTY
    - step:
        id: '617'
        action: Script
        object_path: Sum_WE = EMPTY
    - step:
        id: '618'
        action: Script
        object_path: Total_TH = EMPTY
    - step:
        id: '619'
        action: Script
        object_path: Sum_TH = EMPTY
    - step:
        id: '620'
        action: Script
        object_path: Total_FR = EMPTY
    - step:
        id: '621'
        action: Script
        object_path: Sum_FR = EMPTY
    - step:
        id: '622'
        action: Script
        object_path: ShortDay = EMPTY
    - step:
        id: '623'
        action: Script
        object_path: setDate = EMPTY
    - step:
        id: '624'
        action: Script
        object_path: WageType = EMPTY
    - step:
        id: '625'
        action: Script
        object_path: TotalHours = EMPTY
    - step:
        id: '626'
        action: Script
        object_path: MonRowHours = EMPTY
    - step:
        id: '627'
        action: Script
        object_path: MonRowStartTime = EMPTY
    - step:
        id: '628'
        action: Script
        object_path: MonRowEndTime = EMPTY
    - step:
        id: '629'
        action: Script
        object_path: MonHoursWithin = EMPTY
    - step:
        id: '630'
        action: Script
        object_path: MonHoursOutside = EMPTY
    - step:
        id: '631'
        action: Script
        object_path: TuesRowHours = EMPTY
    - step:
        id: '632'
        action: Script
        object_path: TuesRowStartTime = EMPTY
    - step:
        id: '633'
        action: Script
        object_path: TuesRowEndTime = EMPTY
    - step:
        id: '634'
        action: Script
        object_path: TuesHoursWithin = EMPTY
    - step:
        id: '635'
        action: Script
        object_path: TuesHoursOutside = EMPTY
    - step:
        id: '636'
        action: Script
        object_path: WedRowHours = EMPTY
    - step:
        id: '637'
        action: Script
        object_path: WedRowStartTime = EMPTY
    - step:
        id: '638'
        action: Script
        object_path: WedRowEndTime = EMPTY
    - step:
        id: '639'
        action: Script
        object_path: WedHoursWithin = EMPTY
    - step:
        id: '640'
        action: Script
        object_path: WedHoursOutside = EMPTY
    - step:
        id: '641'
        action: Script
        object_path: ThursRowHours = EMPTY
    - step:
        id: '642'
        action: Script
        object_path: ThursRowStartTime = EMPTY
    - step:
        id: '643'
        action: Script
        object_path: ThursRowEndTime = EMPTY
    - step:
        id: '644'
        action: Script
        object_path: ThursHoursWithin = EMPTY
    - step:
        id: '645'
        action: Script
        object_path: ThursHoursOutside = EMPTY
    - step:
        id: '646'
        action: Script
        object_path: FriRowHours = EMPTY
    - step:
        id: '647'
        action: Script
        object_path: FriRowStartTime = EMPTY
    - step:
        id: '648'
        action: Script
        object_path: FriRowEndTime = EMPTY
    - step:
        id: '649'
        action: Script
        object_path: FriHoursWithin = EMPTY
    - step:
        id: '650'
        action: Script
        object_path: FriHoursOutside = EMPTY
    - step:
        id: '651'
        action: Script
        object_path: ShortDay = EMPTY
    - step:
        id: '652'
        action: Script
        object_path: Set oDic4 = NOTHING
    - step:
        id: '653'
        action: Script
        object_path: MonWorkedHours = EMPTY
    - step:
        id: '654'
        action: Script
        object_path: MonHoursOutsidePercentage = EMPTY
    - step:
        id: '655'
        action: Script
        object_path: TuesWorkedHours = EMPTY
    - step:
        id: '656'
        action: Script
        object_path: TuesHoursOutsidePercentage = EMPTY
    - step:
        id: '657'
        action: Script
        object_path: WedWorkedHours = EMPTY
    - step:
        id: '658'
        action: Script
        object_path: WedHoursOutsidePercentage = EMPTY
    - step:
        id: '659'
        action: Script
        object_path: ThursWorkedHours = EMPTY
    - step:
        id: '660'
        action: Script
        object_path: ThursHoursOutsidePercentage = EMPTY
    - step:
        id: '661'
        action: Script
        object_path: FriWorkedHours = EMPTY
    - step:
        id: '662'
        action: Script
        object_path: FriHoursOutsidePercentage = EMPTY
    - step:
        id: '663'
        action: Script
        object_path: Loop Until DateValue(DateTo) < DateValue(FromDate)
    - step:
        id: '664'
        action: Script
        object_path: Else
    - step:
        id: '665'
        action: Script
        object_path: screenShotFileLocation = "C:\Temp\SAP_CAT2_EmployeeRecordNotAvailable.png"
    - step:
        id: '666'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocation ,true
    - step:
        id: '667'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Step", "No Employee Record in CAT2. Employee# " & EmployeeNumber,
          screenShotFileLocation
    - step:
        id: '668'
        action: Script
        object_path: fn_SendResultAsEmail EmailTo, "No Employee Record in CAT2 for
          the Employee# " & EmployeeNumber, "No Employee Record in CAT2 for the Employee#
          " & EmployeeNumber, screenShotFileLocation
    - step:
        id: '669'
        action: Script
        object_path: 'End If '
        comment: If no record is there for the employee then skip the whole code block
    - step:
        id: '670'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Exit").Exist(0)
          Then'
    - step:
        id: '671'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Exit")'
        action: Click
    - step:
        id: '672'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '673'
        action: Script
        object_path: End If
    - step:
        id: '674'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial
          Screen").Exist(0) Then'
    - step:
        id: '675'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Exit")'
        action: Click
    - step:
        id: '676'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '677'
        action: Script
        object_path: End If
    - step:
        id: '678'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '679'
        action: Script
        object_path: FromDate = EMPTY
    - step:
        id: '680'
        action: Script
        object_path: ToDate = EMPTY
    - step:
        id: '681'
        action: Script
        object_path: MonHours = EMPTY
    - step:
        id: '682'
        action: Script
        object_path: MonStartTime = EMPTY
    - step:
        id: '683'
        action: Script
        object_path: MonEndTime = EMPTY
    - step:
        id: '684'
        action: Script
        object_path: TuesHours = EMPTY
    - step:
        id: '685'
        action: Script
        object_path: TuesStartTime = EMPTY
    - step:
        id: '686'
        action: Script
        object_path: TuesEndTime = EMPTY
    - step:
        id: '687'
        action: Script
        object_path: WedHours = EMPTY
    - step:
        id: '688'
        action: Script
        object_path: WedStartTime = EMPTY
    - step:
        id: '689'
        action: Script
        object_path: WedEndTime = EMPTY
    - step:
        id: '690'
        action: Script
        object_path: ThursHours = EMPTY
    - step:
        id: '691'
        action: Script
        object_path: ThursStartTime = EMPTY
    - step:
        id: '692'
        action: Script
        object_path: ThursEndTime = EMPTY
    - step:
        id: '693'
        action: Script
        object_path: FriHours = EMPTY
    - step:
        id: '694'
        action: Script
        object_path: FriStartTime = EMPTY
    - step:
        id: '695'
        action: Script
        object_path: FriEndTime = EMPTY
    - step:
        id: '696'
        action: Script
        object_path: Next
    - step:
        id: '697'
        action: Script
        object_path: '''================Code Block for verifying Stand Down========================================================='
    - step:
        id: '698'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nse16n"'
    - step:
        id: '699'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
        action: SendKey
        args: ENTER
    - step:
        id: '700'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiEdit("Table")'
        action: Set
        args: '"/ETSA/CATS_STNDN"'
    - step:
        id: '701'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Enter   (Enter)")'
        action: Click
    - step:
        id: '702'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '703'
        action: Script
        object_path: Rows = DataTable.GetSheet("Result").GetRowCount
    - step:
        id: '704'
        action: Script
        object_path: For cntRow = 2 To Rows
    - step:
        id: '705'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nse16n"'
    - step:
        id: '706'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '707'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiEdit("Table")
        action: Set
        args: '"/ETSA/CATS_STNDN"'
    - step:
        id: '708'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Enter   (Enter)")
        action: Click
    - step:
        id: '709'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '710'
        action: Script
        object_path: '''Rows = DataTable.GetSheet("Result").GetRowCount'
    - step:
        id: '711'
        object_path: DataTable.GetSheet("Result")
        action: SetCurrentRow(cntRow)
    - step:
        id: '712'
        action: Script
        object_path: ENO = DataTable.Value("EmployeeNumber","Result")
    - step:
        id: '713'
        action: Script
        object_path: WTYPE = DataTable.Value("WarningType","Result")
    - step:
        id: '714'
        action: Script
        object_path: ASOF = fn_FormatDate(DateValue(DataTable.Value("AsOf","Result")),".")
    - step:
        id: '715'
        action: Script
        object_path: If WTYPE = "No time submitted on allocated day" Or WTYPE = "Submitted
          Time is outside of planned hours." Then
    - step:
        id: '716'
        action: Script
        object_path: '''If WTYPE = "No time submitted on allocated day" Then'
    - step:
        id: '717'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 2,"Fr.Value",ENO
    - step:
        id: '718'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 3,"Fr.Value",ASOF
    - step:
        id: '719'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Online   (F8)")
        action: Click
    - step:
        id: '720'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '721'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiStatusBar("StatusBar").Exist(0)
          Then
    - step:
        id: '722'
        action: Script
        object_path: status = Trim(SAPGuiSession("Session").SAPGuiWindow("General
          Table Display").SAPGuiStatusBar("StatusBar").GetROProperty("text"))
    - step:
        id: '723'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Enter   (Enter)")
        action: Click
    - step:
        id: '724'
        action: Script
        object_path: If status = "No values found" Then
    - step:
        id: '725'
        object_path: DataTable
        action: Value("StandDownStatus","Result")
        args: = "Warning! System generated Stand Down date NOT FOUND!!"
    - step:
        id: '726'
        action: Script
        object_path: End If
    - step:
        id: '727'
        action: Script
        object_path: ELse
    - step:
        id: '728'
        action: Script
        object_path: 'RowCheck = SAPGuiSession("Session").SAPGuiWindow("/ETSA/CATS_STNDN:
          Display").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Personnel Number",ENO)'
    - step:
        id: '729'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("/ETSA/CATS_STNDN: Display").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '730'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '731'
        action: Script
        object_path: If RowCheck > 0 Then
    - step:
        id: '732'
        object_path: DataTable
        action: Value("StandDownStatus","Result")
        args: = "FOUND System generated Stand Down date."
    - step:
        id: '733'
        action: Script
        object_path: End If
    - step:
        id: '734'
        action: Script
        object_path: End If
    - step:
        id: '735'
        action: Script
        object_path: End If
    - step:
        id: '736'
        action: Script
        object_path: '''clear variables'
    - step:
        id: '737'
        action: Script
        object_path: ENO = EMPTY
    - step:
        id: '738'
        action: Script
        object_path: WTYPE = EMPTY
    - step:
        id: '739'
        action: Script
        object_path: ASOF = EMPTY
    - step:
        id: '740'
        action: Script
        object_path: status = EMPTY
    - step:
        id: '741'
        action: Script
        object_path: RowCheck = EMPTY
    - step:
        id: '742'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Back")
        action: Click
    - step:
        id: '743'
        action: Script
        object_path: Next
    - step:
        id: '744'
        action: Script
        object_path: '''==========================End of Code Block=========================================================================='
    - step:
        id: '745'
        action: Script
        object_path: '''Export Results'
    - step:
        id: '746'
        object_path: DataTable
        action: DeleteSheet
        args: '"Action1"'
    - step:
        id: '747'
        object_path: DataTable
        action: DeleteSheet
        args: '"Global"'
    - step:
        id: '748'
        action: Script
        object_path: FileName = "C:\ETSAData\" & Replace(Replace(Replace(Now,"/",""),":",""),"
          ","") & ".xlsx"
    - step:
        id: '749'
        object_path: DataTable
        action: Export
        args: FileName
    - step:
        id: '750'
        action: Script
        object_path: '''Send Result as Email'
    - step:
        id: '751'
        action: Script
        object_path: fn_SendResultAsEmail EmailTo,"CAT2 Check Results as of " & Date
          & " for the employee " & EmployeeNumber,"CAT2 Check Results as of " & Date,FileName
    - step:
        id: '752'
        action: Script
        object_path: '''Delete File'
    - step:
        id: '753'
        action: Script
        object_path: Set obj = createobject("Scripting.FileSystemObject")
    - step:
        id: '754'
        object_path: obj
        action: DeleteFile
        args: FileName
    - step:
        id: '755'
        action: Script
        object_path: Set obj=Nothing
    - step:
        id: '756'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '757'
        action: Script
        object_path: EmployeeNumber = EMPTY
    - step:
        id: '758'
        action: Script
        object_path: cntRow = EMPTY
    - step:
        id: '759'
        action: Script
        object_path: Path = EMPTY
    - step:
        id: '760'
        action: Script
        object_path: SheetName = EMPTY
    - step:
        id: '761'
        action: Script
        object_path: ImportSheetTo = EMPTY
    - step:
        id: '762'
        action: Script
        object_path: Rows = EMPTY
    - step:
        id: '763'
        action: Script
        object_path: GetRow = EMPTY
    - step:
        id: '764'
        action: Script
        object_path: EmailTo = EMPTY
    - step:
        id: '765'
        action: Script
        object_path: FileName = EMPTY
    - step:
        id: '766'
        action: Script
        object_path: DateFrom = EMPTY
    - step:
        id: '767'
        action: Script
        object_path: DateTo = EMPTY
    - step:
        id: '768'
        action: Script
        object_path: '''Close SAP'
    - step:
        id: '769'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '770'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '771'
        action: Script
        object_path: ExitTest
    - step:
        id: '772'
        action: Script
        object_path: '''==============================================DEBUGGING=========================================================================='
    - step:
        id: '773'
        action: Script
        object_path: '''''''''FriRowHours = EMPTY'
    - step:
        id: '774'
        action: Script
        object_path: '''''''''FriRowStartTime = EMPTY'
    - step:
        id: '775'
        action: Script
        object_path: '''''''''FriRowEndTime = EMPTY'
    - step:
        id: '776'
        action: Script
        object_path: '''''''''FriRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#33"))'
    - step:
        id: '777'
        action: Script
        object_path: '''''''''FriRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#34"))'
    - step:
        id: '778'
        action: Script
        object_path: '''''''''FriRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time
          Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#35"))'
    - step:
        id: '779'
        action: Script
        object_path: '''''''''If FriRowHours <> EMPTY And FriRowStartTime <> EMPTY
          And FriRowEndTime <> EMPTY Then'
    - step:
        id: '780'
        action: Script
        object_path: '''''''''If FriRowHours = "0.00" And FriRowStartTime = "00:00"
          And FriRowEndTime = "00:00" Then'
    - step:
        id: '781'
        action: Script
        object_path: "''''\tFriHoursOutside = Round(FriHoursOutside + cdbl(FriRowHours),2)"
    - step:
        id: '782'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriStartTime) <= TimeValue(FriRowStartTime)
          And TimeValue(FriEndTime) >= TimeValue(FriRowEndTime)_'
    - step:
        id: '783'
        action: Script
        object_path: "''''\tAnd Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))\
          \ Then"
    - step:
        id: '784'
        action: Script
        object_path: "''''\tFriHoursWithin = FriHoursWithin + cdbl(FriRowHours)"
    - step:
        id: '785'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowEndTime) < TimeValue(FriStartTime)_'
    - step:
        id: '786'
        action: Script
        object_path: "''''\tAnd Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))\
          \ Then"
    - step:
        id: '787'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + cdbl(FriRowHours)"
    - step:
        id: '788'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime)_'
    - step:
        id: '789'
        action: Script
        object_path: "''''\tAnd Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))\
          \ Then"
    - step:
        id: '790'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + cdbl(FriRowHours)"
    - step:
        id: '791'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime)
          And TimeValue(FriRowEndTime) < TimeValue(FriStartTime) Then'
    - step:
        id: '792'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + cdbl(FriRowHours)"
    - step:
        id: '793'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
    - step:
        id: '794'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_"
    - step:
        id: '795'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_"
    - step:
        id: '796'
        action: Script
        object_path: "''''\tAnd Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))\
          \ Then"
    - step:
        id: '797'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60))"
    - step:
        id: '798'
        action: Script
        object_path: "''''\tFriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))"
    - step:
        id: '799'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_'
    - step:
        id: '800'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_"
    - step:
        id: '801'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) > TimeValue(FriStartTime)_"
    - step:
        id: '802'
        action: Script
        object_path: "''''\tAnd Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime))\
          \ Then"
    - step:
        id: '803'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60))"
    - step:
        id: '804'
        action: Script
        object_path: "''''\tFriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriRowEndTime), TimeValue(FriStartTime))/60))"
    - step:
        id: '805'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
    - step:
        id: '806'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_"
    - step:
        id: '807'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_"
    - step:
        id: '808'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)\
          \ Then"
    - step:
        id: '809'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriEndTime), TimeValue(\"23:59\"))/60)) + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(\"00:00\"), TimeValue(FriRowEndTime))/60))"
    - step:
        id: '810'
        action: Script
        object_path: "''''\tFriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))"
    - step:
        id: '811'
        action: Script
        object_path: '''''''''ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_'
    - step:
        id: '812'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_"
    - step:
        id: '813'
        action: Script
        object_path: "''''\tAnd TimeValue(FriStartTime) < TimeValue(FriEndTime)_"
    - step:
        id: '814'
        action: Script
        object_path: "''''\tAnd TimeValue(FriRowEndTime) > TimeValue(FriRowStartTime)\
          \ Then"
    - step:
        id: '815'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60)),2)"
    - step:
        id: '816'
        action: Script
        object_path: "''''\tFriHoursWithin = FriHoursWithin + Round(Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriEndTime), TimeValue(FriStartTime))/60)) - 0.5,2)"
    - step:
        id: '817'
        action: Script
        object_path: "''''\tFriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff(\"\
          n\", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60)),2)"
    - step:
        id: '818'
        action: Script
        object_path: '''''''''End If'
    - step:
        id: '819'
        action: Script
        object_path: '''''''''End If'
    - step:
        id: '820'
        action: Script
        object_path: '''''''''ExitTest'
    - step:
        id: '821'
        action: Script
        object_path: '''==================================================================================================='
    - step:
        id: '822'
        action: Script
        object_path: '''==========================FUNCTION LIBRARY========================================================='
    - step:
        id: '823'
        action: Script
        object_path: '''==================================================================================================='
    - step:
        id: '824'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '825'
        action: Script
        object_path: '''Function name -  fn_MakeDataEntryColumnHeaderForDay(FromDate,AddDays)'
    - step:
        id: '826'
        action: Script
        object_path: '''Description - This function returns the date in order to make
          days column header'
    - step:
        id: '827'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '828'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '829'
        action: Script
        object_path: '''Creation Date - 23/09/2020'
    - step:
        id: '830'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '831'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '832'
        action: Script
        object_path: Function fn_MakeDataEntryColumnHeaderForDay(FromDate,AddDays)
    - step:
        id: '833'
        action: Script
        object_path: BaseDate = FromDate
    - step:
        id: '834'
        action: Script
        object_path: BaseDate = DateValue(Replace(BaseDate,".","/")) + AddDays
    - step:
        id: '835'
        action: Script
        object_path: If Len(BaseDate) = 9 Then
    - step:
        id: '836'
        action: Script
        object_path: BaseDate = "0" & BaseDate
    - step:
        id: '837'
        action: Script
        object_path: End If
    - step:
        id: '838'
        action: Script
        object_path: BaseDate = Replace(BaseDate,"/",".")
    - step:
        id: '839'
        action: Script
        object_path: fn_MakeDataEntryColumnHeaderForDay = Mid(BaseDate,1,5)
    - step:
        id: '840'
        action: Script
        object_path: BaseDate = EMPTY
    - step:
        id: '841'
        action: Script
        object_path: End Function
    - step:
        id: '842'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '843'
        action: Script
        object_path: '''Function name -  fgen_SapLogin'
    - step:
        id: '844'
        action: Script
        object_path: '''Description - Its a general function to login to SAP using
          Service Account'
    - step:
        id: '845'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '846'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '847'
        action: Script
        object_path: '''Creation Date - 26/02/2019'
    - step:
        id: '848'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '849'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '850'
        action: Script
        object_path: Function fgen_SapLogin(SystemID,UserName,Password)
    - step:
        id: '851'
        object_path: SAPGuiUtil
        action: CloseConnections
    - step:
        id: '852'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '853'
        action: Script
        object_path: '''''Adding a temporary data sheet'
    - step:
        id: '854'
        object_path: '''DataTable'
        action: AddSheet
        args: '"tmpDataSheet"'
    - step:
        id: '855'
        action: Script
        object_path: '''''Importing SapLogin Test Resource to script data table'
    - step:
        id: '856'
        action: Script
        object_path: '''Path = "C:\ETSAData\Roster.xlsx"'
    - step:
        id: '857'
        action: Script
        object_path: '''SheetName = "SapLogin"'
    - step:
        id: '858'
        action: Script
        object_path: '''ImportSheetTo = "tmpDataSheet"'
    - step:
        id: '859'
        object_path: '''DataTable'
        action: ImportSheet
        args: Path,SheetName,ImportSheetTo
    - step:
        id: '860'
        args: '"1"'
        object_path: '''Wait 1'
        action: Script
    - step:
        id: '861'
        action: Script
        object_path: '''''Retrieving Login Credentials'
    - step:
        id: '862'
        action: Script
        object_path: '''UserName = DataTable.Value("UserName","tmpDataSheet")'
    - step:
        id: '863'
        action: Script
        object_path: '''Password = DataTable.Value("Password","tmpDataSheet")'
    - step:
        id: '864'
        action: Script
        object_path: '''SystemID = DataTable.Value("SystemID","tmpDataSheet")'
    - step:
        id: '865'
        action: Script
        object_path: '''SendMailTo = DataTable.Value("SendMailTo","tmpDataSheet")'
    - step:
        id: '866'
        action: Script
        object_path: '''''Delete Temporary Data Sheet'
    - step:
        id: '867'
        object_path: '''DataTable'
        action: DeleteSheet("tmpDataSheet")
    - step:
        id: '868'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '869'
        object_path: SAPGuiUtil
        action: AutoLogon
        args: SystemID, "410", UserName, Password, ""
    - step:
        id: '870'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '871'
        action: Script
        object_path: '''fgen_SapLogin = SendMailTo'
    - step:
        id: '872'
        action: Script
        object_path: End Function
    - step:
        id: '873'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '874'
        action: Script
        object_path: '''Function name -  fn_FindValidRowEntry(Entry)'
    - step:
        id: '875'
        action: Script
        object_path: '''Description - This function retrieves the number of valid
          rows from the Caption'
    - step:
        id: '876'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '877'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '878'
        action: Script
        object_path: '''Creation Date - 22/09/2020'
    - step:
        id: '879'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '880'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '881'
        action: Script
        object_path: Function fn_FindValidRowEntry(Entry)
    - step:
        id: '882'
        action: Script
        object_path: Set regex = New regExp
    - step:
        id: '883'
        object_path: regex
        action: Pattern
        args: = "\d+"
    - step:
        id: '884'
        object_path: regex
        action: Global
        args: = True
    - step:
        id: '885'
        action: Script
        object_path: Set Matches = regex.Execute(Entry)
    - step:
        id: '886'
        action: Script
        object_path: fn_FindValidRowEntry = Matches(1)
    - step:
        id: '887'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '888'
        action: Script
        object_path: Set Matches = NOTHING
    - step:
        id: '889'
        action: Script
        object_path: End Function
    - step:
        id: '890'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '891'
        action: Script
        object_path: '''Function name -  fn_FormatDate(strDate,Separator)'
    - step:
        id: '892'
        action: Script
        object_path: '''Description - This function formats date as dd/mm/yyyy and
          also place separator as needed'
    - step:
        id: '893'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '894'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '895'
        action: Script
        object_path: '''Creation Date - 24/09/2020'
    - step:
        id: '896'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '897'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '898'
        action: Script
        object_path: Function fn_FormatDate(strDate,Separator)
    - step:
        id: '899'
        action: Script
        object_path: tmpDate = strDate
    - step:
        id: '900'
        action: Script
        object_path: Set regex = New regExp
    - step:
        id: '901'
        object_path: regex
        action: Pattern
        args: = "\d+"
    - step:
        id: '902'
        object_path: regex
        action: Global
        args: = True
    - step:
        id: '903'
        action: Script
        object_path: Set Matches = regex.Execute(tmpDate)
    - step:
        id: '904'
        action: Script
        object_path: dd = Matches(0)
    - step:
        id: '905'
        action: Script
        object_path: mm = Matches(1)
    - step:
        id: '906'
        action: Script
        object_path: yyyy = Matches(2)
    - step:
        id: '907'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '908'
        action: Script
        object_path: Set Matches = NOTHING
    - step:
        id: '909'
        action: Script
        object_path: If Len(dd) = 1 Then
    - step:
        id: '910'
        action: Script
        object_path: dd = "0" & dd
    - step:
        id: '911'
        action: Script
        object_path: End If
    - step:
        id: '912'
        action: Script
        object_path: If Len(mm) = 1 Then
    - step:
        id: '913'
        action: Script
        object_path: mm = "0" & mm
    - step:
        id: '914'
        action: Script
        object_path: End If
    - step:
        id: '915'
        action: Script
        object_path: If Separator = "." Then
    - step:
        id: '916'
        action: Script
        object_path: fn_FormatDate = dd & "." & mm & "." & yyyy
    - step:
        id: '917'
        action: Script
        object_path: ElseIf Separator = "/" Then
    - step:
        id: '918'
        action: Script
        object_path: fn_FormatDate = dd & "/" & mm & "/" & yyyy
    - step:
        id: '919'
        action: Script
        object_path: End If
    - step:
        id: '920'
        action: Script
        object_path: tmpDate = EMPTY
    - step:
        id: '921'
        action: Script
        object_path: dd = EMPTY
    - step:
        id: '922'
        action: Script
        object_path: mm = EMPTY
    - step:
        id: '923'
        action: Script
        object_path: yyyy = EMPTY
    - step:
        id: '924'
        action: Script
        object_path: Separator = EMPTY
    - step:
        id: '925'
        action: Script
        object_path: End Function
    - step:
        id: '926'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '927'
        action: Script
        object_path: '''Function name -  fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)'
    - step:
        id: '928'
        action: Script
        object_path: '''Description - This function writes result in the result data
          sheet'
    - step:
        id: '929'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '930'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '931'
        action: Script
        object_path: '''Creation Date - 24/09/2020'
    - step:
        id: '932'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '933'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '934'
        action: Script
        object_path: Function fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)
    - step:
        id: '935'
        action: Script
        object_path: Row = DataTable.GetSheet("Result").GetRowCount
    - step:
        id: '936'
        object_path: DataTable.GetSheet("Result")
        action: SetCurrentRow(Row
        args: + 1)
    - step:
        id: '937'
        object_path: DataTable
        action: Value("EmployeeNumber","Result")
        args: = E_No
    - step:
        id: '938'
        object_path: DataTable
        comment: '"Time submitted on RDO Day"'
        action: Value("WarningType","Result")
        args: = W_Type
    - step:
        id: '939'
        object_path: DataTable
        comment: AsOfDate'Mid(Key,6)
        action: Value("AsOf","Result")
        args: = "'" & CStr(DateValue(AsOfDate))
    - step:
        id: '940'
        object_path: DataTable
        comment: Total_FR
        action: Value("AllocatedTime","Result")
        args: = A_Time
    - step:
        id: '941'
        object_path: DataTable
        comment: Sum_FR
        action: Value("SubmittedTime","Result")
        args: = S_Time
    - step:
        id: '942'
        object_path: DataTable
        comment: oDic2.Item(key)
        action: Value("RDO","Result")
        args: = RDO_Time
    - step:
        id: '943'
        action: Script
        object_path: End Function
    - step:
        id: '944'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '945'
        action: Script
        object_path: '''Function name -  fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment)'
    - step:
        id: '946'
        action: Script
        object_path: '''Description - This function sends email with attachment'
    - step:
        id: '947'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '948'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '949'
        action: Script
        object_path: '''Creation Date - 24/09/2020'
    - step:
        id: '950'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '951'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '952'
        action: Script
        object_path: Function fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment)
    - step:
        id: '953'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '954'
        object_path: MyEmail
        action: Subject
        args: = Subject
    - step:
        id: '955'
        object_path: MyEmail
        action: From
        args: = "Test_Automation@sapowernetworks.com.au"
    - step:
        id: '956'
        object_path: MyEmail
        action: To
        args: = EmailTo
    - step:
        id: '957'
        object_path: MyEmail
        action: TextBody
        args: = Body
    - step:
        id: '958'
        object_path: MyEmail
        action: AddAttachment
        args: Attachment
    - step:
        id: '959'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '960'
        action: Script
        object_path: '''SMTP Server'
    - step:
        id: '961'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '962'
        action: Script
        object_path: '''SMTP Port'
    - step:
        id: '963'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '964'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '965'
        object_path: MyEmail
        action: Send
    - step:
        id: '966'
        action: Script
        object_path: Set MyEmail = NOTHING
    - step:
        id: '967'
        action: Script
        object_path: End Function
    - step:
        id: '968'
        action: Script
        object_path: Function fn_CheckAndReturnTwentyFourHours(getTime)
    - step:
        id: '969'
        action: Script
        object_path: If getTime <> EMPTY Then
    - step:
        id: '970'
        action: Script
        object_path: If getTime = "24:00" Then
    - step:
        id: '971'
        action: Script
        object_path: fn_CheckAndReturnTwentyFourHours = "00:00"
    - step:
        id: '972'
        action: Script
        object_path: Else
    - step:
        id: '973'
        action: Script
        object_path: fn_CheckAndReturnTwentyFourHours = getTime
    - step:
        id: '974'
        action: Script
        object_path: End If
    - step:
        id: '975'
        action: Script
        object_path: End If
    - step:
        id: '976'
        action: Script
        object_path: End Function
    - step:
        id: '977'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '978'
        action: Script
        object_path: '''Function name -  fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)'
    - step:
        id: '979'
        action: Script
        object_path: '''Description - This function writes result in the result data
          sheet'
    - step:
        id: '980'
        action: Script
        object_path: '''Pre-requisite -'
    - step:
        id: '981'
        action: Script
        object_path: '''Author - Mohammed Ripon (Modis)'
    - step:
        id: '982'
        action: Script
        object_path: '''Creation Date - 24/09/2020'
    - step:
        id: '983'
        action: Script
        object_path: '''Change Log:'
    - step:
        id: '984'
        action: Script
        object_path: '''================================================================================'
    - step:
        id: '985'
        action: Script
        object_path: Function fn_UpdateResultSheetForOutsideHours(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time,HoursWithin,HoursOutside,Remark)
    - step:
        id: '986'
        action: Script
        object_path: Row = DataTable.GetSheet("Result").GetRowCount
    - step:
        id: '987'
        object_path: DataTable.GetSheet("Result")
        action: SetCurrentRow(Row
        args: + 1)
    - step:
        id: '988'
        object_path: DataTable
        action: Value("EmployeeNumber","Result")
        args: = E_No
    - step:
        id: '989'
        object_path: DataTable
        comment: '"Time submitted on RDO Day"'
        action: Value("WarningType","Result")
        args: = W_Type
    - step:
        id: '990'
        object_path: DataTable
        comment: Mid(Key,6)
        action: Value("AsOf","Result")
        args: ="'" & CStr(DateValue(AsOfDate))
    - step:
        id: '991'
        object_path: DataTable
        comment: Total_FR
        action: Value("AllocatedTime","Result")
        args: = A_Time
    - step:
        id: '992'
        object_path: DataTable
        comment: Sum_FR
        action: Value("SubmittedTime","Result")
        args: = S_Time
    - step:
        id: '993'
        object_path: DataTable
        comment: oDic2.Item(key)
        action: Value("RDO","Result")
        args: = RDO_Time
    - step:
        id: '994'
        object_path: DataTable
        action: Value("HoursWithinAllocation","Result")
        args: = FormatNumber(HoursWithin,2)
    - step:
        id: '995'
        object_path: DataTable
        action: Value("HoursOutsideAllocation","Result")
        args: = FormatNumber(HoursOutside,2)
    - step:
        id: '996'
        object_path: DataTable
        action: Value("Remark","Result")
        args: = "Submitted hours outside of planned hours is " & Remark & "% of total
          hours."
    - step:
        id: '997'
        action: Script
        object_path: End Function
    - step:
        id: '998'
        action: Script
        object_path: Function fn_gen_loginToSap(SystemID,UID)
    - step:
        id: '999'
        action: Script
        object_path: '''''''SystemUtil.Run "msedge.exe","www.google.com"'
    - step:
        id: '1000'
        action: Script
        object_path: '''''''Wait(5)'
    - step:
        id: '1001'
        action: Script
        object_path: '''''''Browser("Google").Page("Google").WebEdit("Search").Set
          ""'
    - step:
        id: '1002'
        action: Script
        object_path: '''''''Wait(4)'
    - step:
        id: '1003'
        action: Script
        object_path: '''''''Print Browser("Google").Page("Google").WebEdit("Search").GetROProperty("value")'
    - step:
        id: '1004'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '1005'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1006'
        object_path: SystemUtil
        action: Run
        args: '"C:\Program Files (x86)\SAP\FrontEnd\SapGui\saplogon.exe"'
    - step:
        id: '1007'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '1008'
        object_path: Dialog("SAP Logon 760").WinComboBox("ComboBox")
        action: Select
        args: '"List View"'
    - step:
        id: '1009'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1010'
        object_path: Dialog("SAP Logon 760").WinEdit("Connections")
        comment: '"ERP - QAS - Quality Assurance" ''"ERP - PRD - Production"'
        action: Set
        args: SystemID
    - step:
        id: '1011'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1012'
        object_path: Dialog("SAP Logon 760").WinButton("Log On")
        action: Click
    - step:
        id: '1013'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '1014'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("User")
        action: Set
        args: UID
    - step:
        id: '1015'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1016'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("Password")
        action: SetSecure
        args: Parameter("SAP_Password")
    - step:
        id: '1017'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '1018'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("Password")
        action: SetFocus
    - step:
        id: '1019'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1020'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP")
        action: SendKey
        args: ENTER
    - step:
        id: '1021'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1022'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("License Information
          for").SAPGuiRadioButton("Continue with this logon").Exist(1) Then
    - step:
        id: '1023'
        object_path: SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiRadioButton("Continue
          with this logon")
        action: Set
    - step:
        id: '1024'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1025'
        object_path: SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiButton("Confirm
          Selection   (Enter)")
        action: Click
    - step:
        id: '1026'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1027'
        action: Script
        object_path: End  If
    - step:
        id: '1028'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information_2").Exist(1)
          Then
        highlight_id: '1'
    - step:
        id: '1029'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information_2").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '1030'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1031'
        action: Script
        object_path: End If
    - step:
        id: '1032'
        action: Script
        object_path: End Function
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
      last_update_time: Friday, 15 July 2022 10:38:33 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'Time Sheet: Initial Screen'
          properties:
          - property:
              value:
                value: CAT2
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
                value: SAPLCATS
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Personnel Number
              properties:
              - property:
                  value:
                    value: CATSFIELDS-PERNR
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
                    value: wnd[0]/usr/ctxtCATSFIELDS-PERNR
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Key date
              properties:
              - property:
                  value:
                    value: CATSFIELDS-INPUTDATE
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
                    value: wnd[0]/usr/ctxtCATSFIELDS-INPUTDATE
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Data Entry Profile
              properties:
              - property:
                  value:
                    value: TCATST-VARIANT
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
                    value: wnd[0]/usr/ctxtTCATST-VARIANT
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
                    value: wnd[0]/tbar[0]/btn[15]
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter Times   (F5)
              properties:
              - property:
                  value:
                    value: btn[5]
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
                    value: wnd[0]/tbar[1]/btn[5]
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter   (Enter)
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Time Sheet: Data Entry'
          properties:
          - property:
              value:
                value: CAT2
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '2020'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCATS
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Data Entry Area
              properties:
              - property:
                  value:
                    value: SAPLCATSTC_CATSD
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
                    value: wnd[0]/usr/subCATS002:SAPLCATS:2200/tblSAPLCATSTC_CATSD
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Entry
              properties:
              - property:
                  value:
                    value: POSITION_INFO
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
                    value: wnd[0]/usr/subCATS004:SAPLCATS:2400/txtPOSITION_INFO
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Data Entry Period
              properties:
              - property:
                  value:
                    value: CATSFIELDS-DATEFROM
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
                    value: wnd[0]/usr/subCATS003:SAPLCATS:2300/ctxtCATSFIELDS-DATEFROM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: '-'
              properties:
              - property:
                  value:
                    value: CATSFIELDS-DATETO
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
                    value: wnd[0]/usr/subCATS003:SAPLCATS:2300/ctxtCATSFIELDS-DATETO
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Next Screen
              properties:
              - property:
                  value:
                    value: NEXT_OBJECT
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
                    value: wnd[0]/usr/subCATS003:SAPLCATS:2300/btnNEXT_OBJECT
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
                    value: wnd[0]/tbar[0]/btn[15]
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: User
              properties:
              - property:
                  value:
                    value: GuiTextField
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
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
              - property:
                  value:
                    value: wnd[0]/usr/txtRSYST-BNAME
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - type
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Password
              properties:
              - property:
                  value:
                    value: GuiPasswordField
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
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
              - property:
                  value:
                    value: wnd[0]/usr/pwdRSYST-BCODE
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - type
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
                value: License Information for Multiple Logons
                regular_expression: false
              name: text
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
            - text
            - program
            - name
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: Continue with this logon,
              properties:
              - property:
                  value:
                    value: Continue with this logon, without ending any other logons
                      in the system.
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: MULTI_LOGON_OPT2
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
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Continue with this logon
              properties:
              - property:
                  value:
                    value: .*Continue with this logon and end any other logons in
                      the system..*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: MULTI_LOGON_OPT1
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
                    value: wnd[1]/usr/radMULTI_LOGON_OPT1
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Confirm Selection   (Enter)
              properties:
              - property:
                  value:
                    value: Confirm Selection   (Enter)
                    regular_expression: false
                  name: tooltip
                  hidden: false
                  read_only: false
                  type: STRING
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
                - tooltip
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
                value: Information
                regular_expression: false
              name: text
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
            - text
            - program
            - name
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: Continue   (Enter)
                    regular_expression: false
                  name: tooltip
                  hidden: false
                  read_only: false
                  type: STRING
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
                - tooltip
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: CAT2
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: General Table Display
          properties:
          - property:
              value:
                value: SE16N
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
                value: SAPLSE16N
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Selection Criteria
              properties:
              - property:
                  value:
                    value: SAPLSE16NSELFIELDS_TC
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
                    value: wnd[0]/usr/tblSAPLSE16NSELFIELDS_TC
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Table
              properties:
              - property:
                  value:
                    value: GD-TAB
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
                    value: wnd[0]/usr/ctxtGD-TAB
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Online   (F8)
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter   (Enter)
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Messages
          properties:
          - property:
              value:
                value: CAT2
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: .*Display Messages.*
                regular_expression: true
              name: text
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
            - text
            - program
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: Continue   (Enter)
                    regular_expression: false
                  name: tooltip
                  hidden: false
                  read_only: false
                  type: STRING
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
                - tooltip
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: '/ETSA/CATS_STNDN: Display'
          properties:
          - property:
              value:
                value: SE16N
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
                value: SAPLSE16N
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
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
                    value: wnd[0]/usr/cntlRESULT_LIST/shellcont/shell
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
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
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
  - object:
      class: Dialog
      name: SAP Logon 760
      properties:
      - property:
          value:
            value: SAP Logon [0-9]+
            regular_expression: true
          name: text
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: SAP Logon [0-9]+
            regular_expression: true
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: \#[0-9]+
            regular_expression: true
          name: nativeclass
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
        - regexpwndtitle
        - nativeclass
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: '#32770'
          name: simclass
          type: STRING
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations:
        visual_relation: []
      last_update_time: Friday, 15 July 2022 10:38:33 AM
      child_objects:
      - object:
          class: WinEdit
          name: Connections
          properties:
          - property:
              value:
                value: Edit
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Connections
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
              value: Edit
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects: []
      - object:
          class: WinComboBox
          name: ComboBox
          properties:
          - property:
              value:
                value: ComboBox
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
              value: ComboBox
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects: []
      - object:
          class: WinButton
          name: Log On
          properties:
          - property:
              value:
                value: '&Log On'
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
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects: []
  - object:
      class: Browser
      name: Google
      properties:
      - property:
          value:
            value: Google
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://www.google.com/?gws_rd=ssl
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Google
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Google
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 1
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 15 July 2022 10:38:33 AM
      child_objects:
      - object:
          class: Page
          name: Google
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://www.google.com/
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://www.google.com/?gws_rd=ssl
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Google
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10199'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 15 July 2022 10:38:33 AM
          child_objects:
          - object:
              class: WebElement
              name: .vcVZ7d{text-align:center}
              properties:
              - property:
                  value:
                    value: '1680'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: '391'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .vcVZ7d{text-align:center}
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '246'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: o3j99 qarstb
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '494'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: //DIV[1]/DIV[4]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/FORM[@role="search"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[@role="combobox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '438'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '262'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '596'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: q
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '2048'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '34'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: gLFyf gsfi
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '365'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '596'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 15 July 2022 10:38:33 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
