namespace: PayrollTimesheetChecks
operation:
  name: HRTimeSheetCheck
  inputs:
    - Emp_Num
    - DateFrom
    - DateTo
    - SAP_User_Name
    - SAP_Password:
        sensitive: true
    - SendEmailTo
  sequential_action:
    gav: 'com.microfocus.seq:PayrollTimesheetChecks.HRTimeSheetCheck:1.0.0'
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
          object_path: "'###################################################################################################################"
      - step:
          id: '2'
          action: Script
          object_path: "'Test Name: TEST_ID XXX - \"SAP RPA\""
      - step:
          id: '3'
          action: Script
          object_path: "'Test Case ID:"
      - step:
          id: '4'
          action: Script
          object_path: "'Created: 21/09/2020"
      - step:
          id: '5'
          action: Script
          object_path: "'Created By: Mohammed Ripon"
      - step:
          id: '6'
          action: Script
          object_path: "'Version: 1.0 Initial version"
      - step:
          id: '7'
          action: Script
          object_path: "'########################################\"###########################################################################"
      - step:
          id: '8'
          action: Script
          object_path: "'Change Log: Record date and reason for change here."
      - step:
          id: '9'
          action: Script
          object_path: "'"
      - step:
          id: '10'
          action: Script
          object_path: "'###################################################################################################################"
      - step:
          id: '11'
          action: Script
          object_path: 'EmployeeNumber = Parameter("Emp_Num")'
      - step:
          id: '12'
          action: Script
          object_path: 'DateFrom = Parameter("DateFrom")'
      - step:
          id: '13'
          action: Script
          object_path: 'DateTo = Parameter("DateTo")'
      - step:
          id: '14'
          action: Script
          object_path: 'SAPUser =Parameter("SAP_User_Name")'
      - step:
          id: '15'
          action: Script
          object_path: 'SAPPassword = Parameter("SAP_Password") '
          comment: 'Crypt.Encrypt(Parameter("SAP_Password"))'
      - step:
          id: '16'
          action: Script
          object_path: 'EmailTo = Parameter("SendEmailTo")'
      - step:
          id: '17'
          object_path: DataTable
          action: AddSheet
          args: '"Result"'
      - step:
          id: '18'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"EmployeeNumber",""'
      - step:
          id: '19'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"WarningType",""'
      - step:
          id: '20'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"AsOf",""'
      - step:
          id: '21'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"AllocatedTime",""'
      - step:
          id: '22'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"SubmittedTime",""'
      - step:
          id: '23'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"RDO",""'
      - step:
          id: '24'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"HoursWithinAllocation",""'
      - step:
          id: '25'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"HoursOutsideAllocation",""'
      - step:
          id: '26'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"Remark",""'
      - step:
          id: '27'
          object_path: 'DataTable.GetSheet("Result")'
          action: AddParameter
          args: '"StandDownStatus",""'
      - step:
          id: '28'
          action: Script
          object_path: "'EmployeeNumber = \"945595\""
      - step:
          id: '29'
          action: Script
          object_path: "'DateFrom = \"01/11/2019\""
      - step:
          id: '30'
          action: Script
          object_path: "'DateTo = \"01/11/2019\""
      - step:
          id: '31'
          action: Script
          object_path: "'SAPUser = \"svcrobotest\""
      - step:
          id: '32'
          action: Script
          object_path: "'SAPPassword = Crypt.Encrypt(\"$Welcome456\")"
      - step:
          id: '33'
          action: Script
          object_path: "'EmailTo = \"mohammed.ripon@sapowernetworks.com.au\""
      - step:
          id: '34'
          action: Script
          object_path: "'SAP Login"
      - step:
          id: '35'
          action: Script
          object_path: "'LOOP START HERE"
      - step:
          id: '36'
          action: Script
          object_path: "'EmployeeNumber = \"1003006,1003262\""
      - step:
          id: '37'
          action: Script
          object_path: 'EmployeeNumberArray = split(EmployeeNumber, ",")'
      - step:
          id: '38'
          action: Script
          object_path: For Each employee in EmployeeNumberArray
      - step:
          id: '39'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '40'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '41'
          action: Script
          object_path: EmployeeNumber = employee
      - step:
          id: '42'
          action: Script
          object_path: 'fgen_SapLogin "ERP - QAS - Quality Assurance",SAPUser,SAPPassword'
      - step:
          id: '43'
          action: Script
          object_path: "'Load Roster"
      - step:
          id: '44'
          action: Script
          object_path: "'Importing Roster spreadsheet to script data table"
      - step:
          id: '45'
          action: Script
          object_path: "'Path = \"C:\\ETSAData\\Roster.xlsx\""
      - step:
          id: '46'
          action: Script
          object_path: "'SheetName = \"Roster\""
      - step:
          id: '47'
          action: Script
          object_path: "'ImportSheetTo = \"Global\""
      - step:
          id: '48'
          object_path: "'DataTable"
          action: ImportSheet
          args: 'Path,SheetName,ImportSheetTo'
      - step:
          id: '49'
          args: '"1"'
          object_path: "'Wait 1"
          action: Script
      - step:
          id: '50'
          action: Script
          object_path: "'Rows = DataTable.GlobalSheet.GetRowCount"
      - step:
          id: '51'
          action: Script
          object_path: "'Create Result Sheet"
      - step:
          id: '52'
          action: Script
          object_path: "''Looping Roster Sheet"
      - step:
          id: '53'
          action: Script
          object_path: "'For GetRow = 1 To Rows"
      - step:
          id: '54'
          action: Script
          object_path: "'\tDataTable.GlobalSheet.SetCurrentRow(GetRow)"
      - step:
          id: '55'
          action: Script
          object_path: "'\tEmployeeNumber = DataTable.Value(\"EmployeeNumber\",\"Global\")"
      - step:
          id: '56'
          action: Script
          object_path: "'\tDateFrom = DataTable.Value(\"DateFrom\",\"Global\")"
      - step:
          id: '57'
          action: Script
          object_path: "'\tDateTo = DataTable.Value(\"DateTo\",\"Global\")"
      - step:
          id: '58'
          action: Script
          object_path: 'DateFrom = fn_FormatDate(DateFrom,".")'
      - step:
          id: '59'
          action: Script
          object_path: 'DateTo = fn_FormatDate(DateTo,"/")'
      - step:
          id: '60'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"CAT2"'
      - step:
          id: '61'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: SendKey
          args: ENTER
      - step:
          id: '62'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Data Entry Profile")'
          action: Set
          args: '"MWD_SAPR"'
      - step:
          id: '63'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Personnel Number")'
          action: Set
          args: EmployeeNumber
      - step:
          id: '64'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter   (Enter)")'
          action: Click
      - step:
          id: '65'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key date")'
          action: Set
          args: DateFrom
      - step:
          id: '66'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter Times   (F5)")'
          action: Click
      - step:
          id: '67'
          action: Script
          object_path: 'FromDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
      - step:
          id: '68'
          action: Script
          object_path: 'ToDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("-").GetROProperty("value")'
      - step:
          id: '69'
          action: Script
          object_path: 'FromDate = fn_FormatDate(FromDate,"/")'
      - step:
          id: '70'
          action: Script
          object_path: Do
      - step:
          id: '71'
          action: Script
          object_path: FromDate = EMPTY
      - step:
          id: '72'
          action: Script
          object_path: ToDate = EMPTY
      - step:
          id: '73'
          action: Script
          object_path: 'FromDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
      - step:
          id: '74'
          action: Script
          object_path: 'ToDate = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("-").GetROProperty("value")'
      - step:
          id: '75'
          action: Script
          object_path: 'FromDate = fn_FormatDate(FromDate,"/")'
      - step:
          id: '76'
          action: Script
          object_path: If DateValue(FromDate) <= DateValue(DateTo) Then
      - step:
          id: '77'
          action: Script
          object_path: 'FromDate2 = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Data Entry Period").GetROProperty("value")'
      - step:
          id: '78'
          action: Script
          object_path: 'Day1 = "SA" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,0)'
      - step:
          id: '79'
          action: Script
          object_path: 'Day2 = "SU" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,1)'
      - step:
          id: '80'
          action: Script
          object_path: 'Day3 = "MO" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,2)'
      - step:
          id: '81'
          action: Script
          object_path: 'Day4 = "TU" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,3)'
      - step:
          id: '82'
          action: Script
          object_path: 'Day5 = "WE" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,4)'
      - step:
          id: '83'
          action: Script
          object_path: 'Day6 = "TH" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,5)'
      - step:
          id: '84'
          action: Script
          object_path: 'Day7 = "FR" & "   " & fn_MakeDataEntryColumnHeaderForDay(FromDate2,6)'
      - step:
          id: '85'
          action: Script
          object_path: 'Set oDic = CreateObject("Scripting.Dictionary")'
      - step:
          id: '86'
          action: Script
          object_path: 'Set oDic2 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '87'
          action: Script
          object_path: 'Set oDic3 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '88'
          action: Script
          object_path: 'Set oDic4 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '89'
          object_path: oDic3
          action: Add
          args: '"SA",DateValue(Replace(FromDate2,".","/"))'
      - step:
          id: '90'
          object_path: oDic3
          action: Add
          args: '"SU",DateValue(Replace(FromDate2,".","/")) + 1'
      - step:
          id: '91'
          object_path: oDic3
          action: Add
          args: '"MO",DateValue(Replace(FromDate2,".","/")) + 2'
      - step:
          id: '92'
          object_path: oDic3
          action: Add
          args: '"TU",DateValue(Replace(FromDate2,".","/")) + 3'
      - step:
          id: '93'
          object_path: oDic3
          action: Add
          args: '"WE",DateValue(Replace(FromDate2,".","/")) + 4'
      - step:
          id: '94'
          object_path: oDic3
          action: Add
          args: '"TH",DateValue(Replace(FromDate2,".","/")) + 5'
      - step:
          id: '95'
          object_path: oDic3
          action: Add
          args: '"FR",DateValue(Replace(FromDate2,".","/")) + 6'
      - step:
          id: '96'
          action: Script
          object_path: 'Entry = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Entry").GetROProperty("value")'
      - step:
          id: '97'
          action: Script
          object_path: ValidRows = fn_FindValidRowEntry(Entry)
      - step:
          id: '98'
          action: Script
          object_path: 'MonHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#21")'
      - step:
          id: '99'
          action: Script
          object_path: 'MonStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#22")'
      - step:
          id: '100'
          action: Script
          object_path: 'MonEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#23")'
      - step:
          id: '101'
          action: Script
          object_path: 'TuesHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#24")'
      - step:
          id: '102'
          action: Script
          object_path: 'TuesStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#25")'
      - step:
          id: '103'
          action: Script
          object_path: 'TuesEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#26")'
      - step:
          id: '104'
          action: Script
          object_path: 'WedHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#27")'
      - step:
          id: '105'
          action: Script
          object_path: 'WedStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#28")'
      - step:
          id: '106'
          action: Script
          object_path: 'WedEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#29")'
      - step:
          id: '107'
          action: Script
          object_path: 'ThursHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#30")'
      - step:
          id: '108'
          action: Script
          object_path: 'ThursStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#31")'
      - step:
          id: '109'
          action: Script
          object_path: 'ThursEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#32")'
      - step:
          id: '110'
          action: Script
          object_path: 'FriHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#33")'
      - step:
          id: '111'
          action: Script
          object_path: 'FriStartTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#34")'
      - step:
          id: '112'
          action: Script
          object_path: 'FriEndTime = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#35")'
      - step:
          id: '113'
          action: Script
          object_path: For i = 3 To ValidRows
      - step:
          id: '114'
          action: Script
          object_path: 'DWS = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"DWS")'
      - step:
          id: '115'
          action: Script
          object_path: 'WageType = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Wage Type")'
      - step:
          id: '116'
          action: Script
          object_path: 'If DWS = "RDO" Then'
      - step:
          id: '117'
          object_path: oDic
          action: Add
          args: 'i,"RDO"'
      - step:
          id: '118'
          action: Script
          object_path: End If
      - step:
          id: '119'
          action: Script
          object_path: "'============The following code snippet to capture criteria to check the condition of 2AVL and 2SUB======="
      - step:
          id: '120'
          action: Script
          object_path: "'============If 2AVL is there but 2SUB is absent in that week then raise a flag as it is not normal======="
      - step:
          id: '121'
          action: Script
          object_path: 'If WageType = "2AVL" Then'
      - step:
          id: '122'
          action: Script
          object_path: 'TotalHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Total")'
      - step:
          id: '123'
          action: Script
          object_path: 'If oDic4.Exists("2AVL") Then'
      - step:
          id: '124'
          object_path: 'oDic4.Item("2AVL") = cdbl(oDic4'
          action: 'Item("2AVL"))'
          args: + cdbl(TotalHours)
      - step:
          id: '125'
          action: Script
          object_path: Else
      - step:
          id: '126'
          object_path: oDic4
          action: Add
          args: '"2AVL",cdbl(TotalHours)'
      - step:
          id: '127'
          action: Script
          object_path: End If
      - step:
          id: '128'
          action: Script
          object_path: 'ElseIf WageType = "2SUB" Then'
      - step:
          id: '129'
          action: Script
          object_path: 'TotalHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Total")'
      - step:
          id: '130'
          action: Script
          object_path: 'If oDic4.Exists("2SUB") Then'
      - step:
          id: '131'
          object_path: 'oDic4.Item("2SUB") = cdbl(oDic4'
          action: 'Item("2SUB"))'
          args: + cdbl(TotalHours)
      - step:
          id: '132'
          action: Script
          object_path: Else
      - step:
          id: '133'
          object_path: oDic4
          action: Add
          args: '"2SUB",cdbl(TotalHours)'
      - step:
          id: '134'
          action: Script
          object_path: End If
      - step:
          id: '135'
          action: Script
          object_path: End If
      - step:
          id: '136'
          action: Script
          object_path: TotalHours = EMPTY
      - step:
          id: '137'
          action: Script
          object_path: "'============================================================================================================="
      - step:
          id: '138'
          action: Script
          object_path: If i = ValidRows And oDic.Count = 0 Then
      - step:
          id: '139'
          action: Script
          object_path: i = 0
      - step:
          id: '140'
          action: Script
          object_path: End If
      - step:
          id: '141'
          action: Script
          object_path: 'MonRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#21"))'
      - step:
          id: '142'
          action: Script
          object_path: 'MonRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#22"))'
      - step:
          id: '143'
          action: Script
          object_path: 'MonRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#23"))'
      - step:
          id: '144'
          action: Script
          object_path: 'If MonRowHours <> EMPTY And MonRowStartTime <> EMPTY And MonRowEndTime <> EMPTY Then'
      - step:
          id: '145'
          action: Script
          object_path: 'If MonHours = "0.00" And MonStartTime = "00:00" And MonEndTime = "00:00" Then'
      - step:
          id: '146'
          action: Script
          object_path: 'MonHoursOutside = Round(MonHoursOutside + cdbl(MonRowHours),2)'
      - step:
          id: '147'
          action: Script
          object_path: 'ElseIf TimeValue(MonStartTime) <= TimeValue(MonRowStartTime) And TimeValue(MonEndTime) >= TimeValue(MonRowEndTime)_'
      - step:
          id: '148'
          action: Script
          object_path: 'And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime)) Then'
      - step:
          id: '149'
          action: Script
          object_path: MonHoursWithin = MonHoursWithin + cdbl(MonRowHours)
      - step:
          id: '150'
          action: Script
          object_path: ElseIf TimeValue(MonRowEndTime) < TimeValue(MonStartTime)_
      - step:
          id: '151'
          action: Script
          object_path: 'And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime)) Then'
      - step:
          id: '152'
          action: Script
          object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
      - step:
          id: '153'
          action: Script
          object_path: 'ElseIf TimeValue(MonRowStartTime) > TimeValue(MonEndTime)_'
      - step:
          id: '154'
          action: Script
          object_path: 'And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime)) Then'
      - step:
          id: '155'
          action: Script
          object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
      - step:
          id: '156'
          action: Script
          object_path: 'ElseIf TimeValue(MonRowStartTime) > TimeValue(MonEndTime) And TimeValue(MonRowEndTime) < TimeValue(MonStartTime) Then'
      - step:
          id: '157'
          action: Script
          object_path: MonHoursOutside = MonHoursOutside + cdbl(MonRowHours)
      - step:
          id: '158'
          action: Script
          object_path: 'ElseIf TimeValue(MonRowStartTime) > TimeValue(MonStartTime)_'
      - step:
          id: '159'
          action: Script
          object_path: And TimeValue(MonRowStartTime) < TimeValue(MonEndTime)_
      - step:
          id: '160'
          action: Script
          object_path: 'And TimeValue(MonRowEndTime) > TimeValue(MonEndTime)_'
      - step:
          id: '161'
          action: Script
          object_path: 'And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime)) Then'
      - step:
          id: '162'
          action: Script
          object_path: 'MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(MonEndTime), TimeValue(MonRowEndTime))/60))'
      - step:
          id: '163'
          action: Script
          object_path: 'MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonRowStartTime), TimeValue(MonEndTime))/60))'
      - step:
          id: '164'
          action: Script
          object_path: ElseIf TimeValue(MonRowStartTime) < TimeValue(MonStartTime)_
      - step:
          id: '165'
          action: Script
          object_path: And TimeValue(MonRowEndTime) < TimeValue(MonEndTime)_
      - step:
          id: '166'
          action: Script
          object_path: 'And TimeValue(MonRowEndTime) > TimeValue(MonStartTime)_'
      - step:
          id: '167'
          action: Script
          object_path: 'And Not (TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime)) Then'
      - step:
          id: '168'
          action: Script
          object_path: 'MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(MonStartTime), TimeValue(MonRowStartTime))/60))'
      - step:
          id: '169'
          action: Script
          object_path: 'MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonRowEndTime), TimeValue(MonStartTime))/60))'
      - step:
          id: '170'
          action: Script
          object_path: 'ElseIf TimeValue(MonRowStartTime) > TimeValue(MonStartTime)_'
      - step:
          id: '171'
          action: Script
          object_path: And TimeValue(MonRowStartTime) < TimeValue(MonEndTime)_
      - step:
          id: '172'
          action: Script
          object_path: And TimeValue(MonRowEndTime) < TimeValue(MonEndTime)_
      - step:
          id: '173'
          action: Script
          object_path: 'And TimeValue(MonRowStartTime) > TimeValue(MonRowEndTime) Then'
      - step:
          id: '174'
          action: Script
          object_path: 'MonHoursOutside = MonHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"), TimeValue(MonEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(MonRowEndTime), TimeValue("00:00"))/60))'
      - step:
          id: '175'
          action: Script
          object_path: 'MonHoursWithin = MonHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(MonEndTime), TimeValue(MonRowStartTime))/60))'
      - step:
          id: '176'
          action: Script
          object_path: ElseIf TimeValue(MonRowStartTime) < TimeValue(MonStartTime)_
      - step:
          id: '177'
          action: Script
          object_path: 'And TimeValue(MonRowEndTime) > TimeValue(MonEndTime)_'
      - step:
          id: '178'
          action: Script
          object_path: And TimeValue(MonStartTime) < TimeValue(MonEndTime)_
      - step:
          id: '179'
          action: Script
          object_path: 'And TimeValue(MonRowEndTime) > TimeValue(MonRowStartTime) Then'
      - step:
          id: '180'
          action: Script
          object_path: 'MonHoursOutside = MonHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(MonStartTime), TimeValue(MonRowStartTime))/60)),2)'
      - step:
          id: '181'
          action: Script
          object_path: 'MonHoursWithin = MonHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(MonEndTime), TimeValue(MonStartTime))/60)) - 0.5,2)'
      - step:
          id: '182'
          action: Script
          object_path: 'MonHoursOutside = MonHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(MonEndTime), TimeValue(MonRowEndTime))/60)),2)'
      - step:
          id: '183'
          action: Script
          object_path: End If
      - step:
          id: '184'
          action: Script
          object_path: End If
      - step:
          id: '185'
          action: Script
          object_path: 'TuesRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#24"))'
      - step:
          id: '186'
          action: Script
          object_path: 'TuesRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#25"))'
      - step:
          id: '187'
          action: Script
          object_path: 'TuesRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#26"))'
      - step:
          id: '188'
          action: Script
          object_path: 'If TuesRowHours <> EMPTY And TuesRowStartTime <> EMPTY And TuesRowEndTime <> EMPTY Then'
      - step:
          id: '189'
          action: Script
          object_path: 'If TuesHours = "0.00" And TuesStartTime = "00:00" And TuesEndTime = "00:00" Then'
      - step:
          id: '190'
          action: Script
          object_path: 'TuesHoursOutside = Round(TuesHoursOutside + cdbl(TuesRowHours),2)'
      - step:
          id: '191'
          action: Script
          object_path: 'ElseIf TimeValue(TuesStartTime) <= TimeValue(TuesRowStartTime) And TimeValue(TuesEndTime) >= TimeValue(TuesRowEndTime)_'
      - step:
          id: '192'
          action: Script
          object_path: 'And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime)) Then'
      - step:
          id: '193'
          action: Script
          object_path: TuesHoursWithin = TuesHoursWithin + cdbl(TuesRowHours)
      - step:
          id: '194'
          action: Script
          object_path: ElseIf TimeValue(TuesRowEndTime) < TimeValue(TuesStartTime)_
      - step:
          id: '195'
          action: Script
          object_path: 'And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime)) Then'
      - step:
          id: '196'
          action: Script
          object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
      - step:
          id: '197'
          action: Script
          object_path: 'ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesEndTime)_'
      - step:
          id: '198'
          action: Script
          object_path: 'And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime)) Then'
      - step:
          id: '199'
          action: Script
          object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
      - step:
          id: '200'
          action: Script
          object_path: 'ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesEndTime) And TimeValue(TuesRowEndTime) < TimeValue(TuesStartTime) Then'
      - step:
          id: '201'
          action: Script
          object_path: TuesHoursOutside = TuesHoursOutside + cdbl(TuesRowHours)
      - step:
          id: '202'
          action: Script
          object_path: 'ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesStartTime)_'
      - step:
          id: '203'
          action: Script
          object_path: And TimeValue(TuesRowStartTime) < TimeValue(TuesEndTime)_
      - step:
          id: '204'
          action: Script
          object_path: 'And TimeValue(TuesRowEndTime) > TimeValue(TuesEndTime)_'
      - step:
          id: '205'
          action: Script
          object_path: 'And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime)) Then'
      - step:
          id: '206'
          action: Script
          object_path: 'TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(TuesEndTime), TimeValue(TuesRowEndTime))/60))'
      - step:
          id: '207'
          action: Script
          object_path: 'TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesRowStartTime), TimeValue(TuesEndTime))/60))'
      - step:
          id: '208'
          action: Script
          object_path: ElseIf TimeValue(TuesRowStartTime) < TimeValue(TuesStartTime)_
      - step:
          id: '209'
          action: Script
          object_path: And TimeValue(TuesRowEndTime) < TimeValue(TuesEndTime)_
      - step:
          id: '210'
          action: Script
          object_path: 'And TimeValue(TuesRowEndTime) > TimeValue(TuesStartTime)_'
      - step:
          id: '211'
          action: Script
          object_path: 'And Not (TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime)) Then'
      - step:
          id: '212'
          action: Script
          object_path: 'TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(TuesRowStartTime), TimeValue(TuesStartTime))/60))'
      - step:
          id: '213'
          action: Script
          object_path: 'TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesStartTime), TimeValue(TuesRowEndTime))/60))'
      - step:
          id: '214'
          action: Script
          object_path: 'ElseIf TimeValue(TuesRowStartTime) > TimeValue(TuesStartTime)_'
      - step:
          id: '215'
          action: Script
          object_path: And TimeValue(TuesRowStartTime) < TimeValue(TuesEndTime)_
      - step:
          id: '216'
          action: Script
          object_path: And TimeValue(TuesRowEndTime) < TimeValue(TuesEndTime)_
      - step:
          id: '217'
          action: Script
          object_path: 'And TimeValue(TuesRowStartTime) > TimeValue(TuesRowEndTime) Then'
      - step:
          id: '218'
          action: Script
          object_path: 'TuesHoursOutside = TuesHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"), TimeValue(TuesEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(TuesRowEndTime), TimeValue("00:00"))/60))'
      - step:
          id: '219'
          action: Script
          object_path: 'TuesHoursWithin = TuesHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(TuesEndTime), TimeValue(TuesRowStartTime))/60))'
      - step:
          id: '220'
          action: Script
          object_path: ElseIf TimeValue(TuesRowStartTime) < TimeValue(TuesStartTime)_
      - step:
          id: '221'
          action: Script
          object_path: 'And TimeValue(TuesRowEndTime) > TimeValue(TuesEndTime)_'
      - step:
          id: '222'
          action: Script
          object_path: And TimeValue(TuesStartTime) < TimeValue(TuesEndTime)_
      - step:
          id: '223'
          action: Script
          object_path: 'And TimeValue(TuesRowEndTime) > TimeValue(TuesRowStartTime) Then'
      - step:
          id: '224'
          action: Script
          object_path: 'TuesHoursOutside = TuesHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(TuesStartTime), TimeValue(TuesRowStartTime))/60)),2)'
      - step:
          id: '225'
          action: Script
          object_path: 'TuesHoursWithin = TuesHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(TuesEndTime), TimeValue(TuesStartTime))/60)) - 0.5,2)'
      - step:
          id: '226'
          action: Script
          object_path: 'TuesHoursOutside = TuesHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(TuesEndTime), TimeValue(TuesRowEndTime))/60)),2)'
      - step:
          id: '227'
          action: Script
          object_path: End If
      - step:
          id: '228'
          action: Script
          object_path: End If
      - step:
          id: '229'
          action: Script
          object_path: 'WedRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#27"))'
      - step:
          id: '230'
          action: Script
          object_path: 'WedRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#28"))'
      - step:
          id: '231'
          action: Script
          object_path: 'WedRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#29"))'
      - step:
          id: '232'
          action: Script
          object_path: 'If WedRowHours <> EMPTY And WedRowStartTime <> EMPTY And WedRowEndTime <> EMPTY Then'
      - step:
          id: '233'
          action: Script
          object_path: 'If WedHours = "0.00" And WedStartTime = "00:00" And WedEndTime = "00:00" Then'
      - step:
          id: '234'
          action: Script
          object_path: 'WedHoursOutside = Round(WedHoursOutside + cdbl(WedRowHours),2)'
      - step:
          id: '235'
          action: Script
          object_path: 'ElseIf TimeValue(WedStartTime) <= TimeValue(WedRowStartTime) And TimeValue(WedEndTime) >= TimeValue(WedRowEndTime)_'
      - step:
          id: '236'
          action: Script
          object_path: 'And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime)) Then'
      - step:
          id: '237'
          action: Script
          object_path: WedHoursWithin = WedHoursWithin + cdbl(WedRowHours)
      - step:
          id: '238'
          action: Script
          object_path: ElseIf TimeValue(WedRowEndTime) < TimeValue(WedStartTime)_
      - step:
          id: '239'
          action: Script
          object_path: 'And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime)) Then'
      - step:
          id: '240'
          action: Script
          object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
      - step:
          id: '241'
          action: Script
          object_path: 'ElseIf TimeValue(WedRowStartTime) > TimeValue(WedEndTime)_'
      - step:
          id: '242'
          action: Script
          object_path: 'And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime)) Then'
      - step:
          id: '243'
          action: Script
          object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
      - step:
          id: '244'
          action: Script
          object_path: 'ElseIf TimeValue(WedRowStartTime) > TimeValue(WedEndTime) And TimeValue(WedRowEndTime) < TimeValue(WedStartTime) Then'
      - step:
          id: '245'
          action: Script
          object_path: WedHoursOutside = WedHoursOutside + cdbl(WedRowHours)
      - step:
          id: '246'
          action: Script
          object_path: 'ElseIf TimeValue(WedRowStartTime) > TimeValue(WedStartTime)_'
      - step:
          id: '247'
          action: Script
          object_path: And TimeValue(WedRowStartTime) < TimeValue(WedEndTime)_
      - step:
          id: '248'
          action: Script
          object_path: 'And TimeValue(WedRowEndTime) > TimeValue(WedEndTime)_'
      - step:
          id: '249'
          action: Script
          object_path: 'And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime)) Then'
      - step:
          id: '250'
          action: Script
          object_path: 'WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(WedEndTime), TimeValue(WedRowEndTime))/60))'
      - step:
          id: '251'
          action: Script
          object_path: 'WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedRowStartTime), TimeValue(WedEndTime))/60))'
      - step:
          id: '252'
          action: Script
          object_path: ElseIf TimeValue(WedRowStartTime) < TimeValue(WedStartTime)_
      - step:
          id: '253'
          action: Script
          object_path: And TimeValue(WedRowEndTime) < TimeValue(WedEndTime)_
      - step:
          id: '254'
          action: Script
          object_path: 'And TimeValue(WedRowEndTime) > TimeValue(WedStartTime)_'
      - step:
          id: '255'
          action: Script
          object_path: 'And Not (TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime)) Then'
      - step:
          id: '256'
          action: Script
          object_path: 'WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(WedStartTime), TimeValue(WedRowStartTime))/60))'
      - step:
          id: '257'
          action: Script
          object_path: 'WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedRowEndTime), TimeValue(WedStartTime))/60))'
      - step:
          id: '258'
          action: Script
          object_path: 'ElseIf TimeValue(WedRowStartTime) > TimeValue(WedStartTime)_'
      - step:
          id: '259'
          action: Script
          object_path: And TimeValue(WedRowStartTime) < TimeValue(WedEndTime)_
      - step:
          id: '260'
          action: Script
          object_path: And TimeValue(WedRowEndTime) < TimeValue(WedEndTime)_
      - step:
          id: '261'
          action: Script
          object_path: 'And TimeValue(WedRowStartTime) > TimeValue(WedRowEndTime) Then'
      - step:
          id: '262'
          action: Script
          object_path: 'WedHoursOutside = WedHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"), TimeValue(WedEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(WedRowEndTime), TimeValue("00:00"))/60))'
      - step:
          id: '263'
          action: Script
          object_path: 'WedHoursWithin = WedHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(WedEndTime), TimeValue(WedRowStartTime))/60))'
      - step:
          id: '264'
          action: Script
          object_path: ElseIf TimeValue(WedRowStartTime) < TimeValue(WedStartTime)_
      - step:
          id: '265'
          action: Script
          object_path: 'And TimeValue(WedRowEndTime) > TimeValue(WedEndTime)_'
      - step:
          id: '266'
          action: Script
          object_path: And TimeValue(WedStartTime) < TimeValue(WedEndTime)_
      - step:
          id: '267'
          action: Script
          object_path: 'And TimeValue(WedRowEndTime) > TimeValue(WedRowStartTime) Then'
      - step:
          id: '268'
          action: Script
          object_path: 'WedHoursOutside = WedHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(WedStartTime), TimeValue(WedRowStartTime))/60)),2)'
      - step:
          id: '269'
          action: Script
          object_path: 'WedHoursWithin = WedHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(WedEndTime), TimeValue(WedStartTime))/60)) - 0.5,2)'
      - step:
          id: '270'
          action: Script
          object_path: 'WedHoursOutside = WedHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(WedEndTime), TimeValue(WedRowEndTime))/60)),2)'
      - step:
          id: '271'
          action: Script
          object_path: End If
      - step:
          id: '272'
          action: Script
          object_path: End If
      - step:
          id: '273'
          action: Script
          object_path: 'ThursRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#30"))'
      - step:
          id: '274'
          action: Script
          object_path: 'ThursRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#31"))'
      - step:
          id: '275'
          action: Script
          object_path: 'ThursRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#32"))'
      - step:
          id: '276'
          action: Script
          object_path: 'If ThursRowHours <> EMPTY And ThursRowStartTime <> EMPTY And ThursRowEndTime <> EMPTY Then'
      - step:
          id: '277'
          action: Script
          object_path: 'If ThursHours = "0.00" And ThursStartTime = "00:00" And ThursEndTime = "00:00" Then'
      - step:
          id: '278'
          action: Script
          object_path: 'ThursHoursOutside = Round(ThursHoursOutside + cdbl(ThursRowHours),2)'
      - step:
          id: '279'
          action: Script
          object_path: 'ElseIf TimeValue(ThursStartTime) <= TimeValue(ThursRowStartTime) And TimeValue(ThursEndTime) >= TimeValue(ThursRowEndTime)_'
      - step:
          id: '280'
          action: Script
          object_path: 'And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)) Then'
      - step:
          id: '281'
          action: Script
          object_path: ThursHoursWithin = ThursHoursWithin + cdbl(ThursRowHours)
      - step:
          id: '282'
          action: Script
          object_path: ElseIf TimeValue(ThursRowEndTime) < TimeValue(ThursStartTime)_
      - step:
          id: '283'
          action: Script
          object_path: 'And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)) Then'
      - step:
          id: '284'
          action: Script
          object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
      - step:
          id: '285'
          action: Script
          object_path: 'ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursEndTime)_'
      - step:
          id: '286'
          action: Script
          object_path: 'And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)) Then'
      - step:
          id: '287'
          action: Script
          object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
      - step:
          id: '288'
          action: Script
          object_path: 'ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursEndTime) And TimeValue(ThursRowEndTime) < TimeValue(ThursStartTime) Then'
      - step:
          id: '289'
          action: Script
          object_path: ThursHoursOutside = ThursHoursOutside + cdbl(ThursRowHours)
      - step:
          id: '290'
          action: Script
          object_path: 'ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursStartTime)_'
      - step:
          id: '291'
          action: Script
          object_path: And TimeValue(ThursRowStartTime) < TimeValue(ThursEndTime)_
      - step:
          id: '292'
          action: Script
          object_path: 'And TimeValue(ThursRowEndTime) > TimeValue(ThursEndTime)_'
      - step:
          id: '293'
          action: Script
          object_path: 'And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)) Then'
      - step:
          id: '294'
          action: Script
          object_path: 'ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(ThursEndTime), TimeValue(ThursRowEndTime))/60))'
      - step:
          id: '295'
          action: Script
          object_path: 'ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(ThursRowStartTime), TimeValue(ThursEndTime))/60))'
      - step:
          id: '296'
          action: Script
          object_path: ElseIf TimeValue(ThursRowStartTime) < TimeValue(ThursStartTime)_
      - step:
          id: '297'
          action: Script
          object_path: And TimeValue(ThursRowEndTime) < TimeValue(ThursEndTime)_
      - step:
          id: '298'
          action: Script
          object_path: 'And TimeValue(ThursRowEndTime) > TimeValue(ThursStartTime)_'
      - step:
          id: '299'
          action: Script
          object_path: 'And Not (TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime)) Then'
      - step:
          id: '300'
          action: Script
          object_path: 'ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(ThursStartTime), TimeValue(ThursRowStartTime))/60))'
      - step:
          id: '301'
          action: Script
          object_path: 'ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(ThursRowEndTime), TimeValue(ThursStartTime))/60))'
      - step:
          id: '302'
          action: Script
          object_path: 'ElseIf TimeValue(ThursRowStartTime) > TimeValue(ThursStartTime)_'
      - step:
          id: '303'
          action: Script
          object_path: And TimeValue(ThursRowStartTime) < TimeValue(ThursEndTime)_
      - step:
          id: '304'
          action: Script
          object_path: And TimeValue(ThursRowEndTime) < TimeValue(ThursEndTime)_
      - step:
          id: '305'
          action: Script
          object_path: 'And TimeValue(ThursRowStartTime) > TimeValue(ThursRowEndTime) Then'
      - step:
          id: '306'
          action: Script
          object_path: 'ThursHoursOutside = ThursHoursOutside + Abs(cdbl(DateDiff("n", TimeValue("23:59"), TimeValue(ThursEndTime))/60)) + Abs(cdbl(DateDiff("n", TimeValue(ThursRowEndTime), TimeValue("00:00"))/60))'
      - step:
          id: '307'
          action: Script
          object_path: 'ThursHoursWithin = ThursHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(ThursEndTime), TimeValue(ThursRowStartTime))/60))'
      - step:
          id: '308'
          action: Script
          object_path: ElseIf TimeValue(ThursRowStartTime) < TimeValue(ThursStartTime)_
      - step:
          id: '309'
          action: Script
          object_path: 'And TimeValue(ThursRowEndTime) > TimeValue(ThursEndTime)_'
      - step:
          id: '310'
          action: Script
          object_path: And TimeValue(ThursStartTime) < TimeValue(ThursEndTime)_
      - step:
          id: '311'
          action: Script
          object_path: 'And TimeValue(ThursRowEndTime) > TimeValue(ThursRowStartTime) Then'
      - step:
          id: '312'
          action: Script
          object_path: 'ThursHoursOutside = ThursHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(ThursStartTime), TimeValue(ThursRowStartTime))/60)),2)'
      - step:
          id: '313'
          action: Script
          object_path: 'ThursHoursWithin = ThursHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(ThursEndTime), TimeValue(ThursStartTime))/60)) - 0.5,2)'
      - step:
          id: '314'
          action: Script
          object_path: 'ThursHoursOutside = ThursHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(ThursEndTime), TimeValue(ThursRowEndTime))/60)),2)'
      - step:
          id: '315'
          action: Script
          object_path: End If
      - step:
          id: '316'
          action: Script
          object_path: End If
      - step:
          id: '317'
          action: Script
          object_path: 'FriRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#33"))'
      - step:
          id: '318'
          action: Script
          object_path: 'FriRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#34"))'
      - step:
          id: '319'
          action: Script
          object_path: 'FriRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#35"))'
      - step:
          id: '320'
          action: Script
          object_path: 'If FriRowHours <> EMPTY And FriRowStartTime <> EMPTY And FriRowEndTime <> EMPTY Then'
      - step:
          id: '321'
          action: Script
          object_path: 'If FriHours = "0.00" And FriStartTime = "00:00" And FriEndTime = "00:00" Then'
      - step:
          id: '322'
          action: Script
          object_path: 'FriHoursOutside = Round(FriHoursOutside + cdbl(FriRowHours),2)'
      - step:
          id: '323'
          action: Script
          object_path: 'ElseIf TimeValue(FriStartTime) <= TimeValue(FriRowStartTime) And TimeValue(FriEndTime) >= TimeValue(FriRowEndTime)_'
      - step:
          id: '324'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '325'
          action: Script
          object_path: FriHoursWithin = FriHoursWithin + cdbl(FriRowHours)
      - step:
          id: '326'
          action: Script
          object_path: ElseIf TimeValue(FriRowEndTime) < TimeValue(FriStartTime)_
      - step:
          id: '327'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '328'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '329'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime)_'
      - step:
          id: '330'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '331'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '332'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime) And TimeValue(FriRowEndTime) < TimeValue(FriStartTime) Then'
      - step:
          id: '333'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '334'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
      - step:
          id: '335'
          action: Script
          object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '336'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_'
      - step:
          id: '337'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '338'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60))'
      - step:
          id: '339'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))'
      - step:
          id: '340'
          action: Script
          object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
      - step:
          id: '341'
          action: Script
          object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
      - step:
          id: '342'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriStartTime)_'
      - step:
          id: '343'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '344'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60))'
      - step:
          id: '345'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowEndTime), TimeValue(FriStartTime))/60))'
      - step:
          id: '346'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
      - step:
          id: '347'
          action: Script
          object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '348'
          action: Script
          object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
      - step:
          id: '349'
          action: Script
          object_path: 'And TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime) Then'
      - step:
          id: '350'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue("23:59"))/60)) + Abs(cdbl(DateDiff("n", TimeValue("00:00"), TimeValue(FriRowEndTime))/60))'
      - step:
          id: '351'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))'
      - step:
          id: '352'
          action: Script
          object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
      - step:
          id: '353'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_'
      - step:
          id: '354'
          action: Script
          object_path: And TimeValue(FriStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '355'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriRowStartTime) Then'
      - step:
          id: '356'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60)),2)'
      - step:
          id: '357'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriStartTime))/60)) - 0.5,2)'
      - step:
          id: '358'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60)),2)'
      - step:
          id: '359'
          action: Script
          object_path: End If
      - step:
          id: '360'
          action: Script
          object_path: End If
      - step:
          id: '361'
          action: Script
          object_path: "'Clear Variables"
      - step:
          id: '362'
          action: Script
          object_path: MonRowHours = EMPTY
      - step:
          id: '363'
          action: Script
          object_path: MonRowStartTime = EMPTY
      - step:
          id: '364'
          action: Script
          object_path: MonRowEndTime = EMPTY
      - step:
          id: '365'
          action: Script
          object_path: TuesRowHours = EMPTY
      - step:
          id: '366'
          action: Script
          object_path: TuesRowStartTime = EMPTY
      - step:
          id: '367'
          action: Script
          object_path: TuesRowEndTime = EMPTY
      - step:
          id: '368'
          action: Script
          object_path: WedRowHours = EMPTY
      - step:
          id: '369'
          action: Script
          object_path: WedRowStartTime = EMPTY
      - step:
          id: '370'
          action: Script
          object_path: WedRowEndTime = EMPTY
      - step:
          id: '371'
          action: Script
          object_path: ThursRowHours = EMPTY
      - step:
          id: '372'
          action: Script
          object_path: ThursRowStartTime = EMPTY
      - step:
          id: '373'
          action: Script
          object_path: ThursRowEndTime = EMPTY
      - step:
          id: '374'
          action: Script
          object_path: FriRowHours = EMPTY
      - step:
          id: '375'
          action: Script
          object_path: FriRowStartTime = EMPTY
      - step:
          id: '376'
          action: Script
          object_path: FriRowEndTime = EMPTY
      - step:
          id: '377'
          action: Script
          object_path: Next
      - step:
          id: '378'
          action: Script
          object_path: 'Total = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"Total")'
      - step:
          id: '379'
          action: Script
          object_path: 'SumTotal = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,"Total")'
      - step:
          id: '380'
          action: Script
          object_path: 'Total_SA = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day1)'
      - step:
          id: '381'
          action: Script
          object_path: 'Sum_SA = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day1)'
      - step:
          id: '382'
          action: Script
          object_path: 'Total_SU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day2)'
      - step:
          id: '383'
          action: Script
          object_path: 'Sum_SU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day2)'
      - step:
          id: '384'
          action: Script
          object_path: 'Total_MO = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day3)'
      - step:
          id: '385'
          action: Script
          object_path: 'Sum_MO = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day3)'
      - step:
          id: '386'
          action: Script
          object_path: 'Total_TU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day4)'
      - step:
          id: '387'
          action: Script
          object_path: 'Sum_TU = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day4)'
      - step:
          id: '388'
          action: Script
          object_path: 'Total_WE = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day5)'
      - step:
          id: '389'
          action: Script
          object_path: 'Sum_WE = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day5)'
      - step:
          id: '390'
          action: Script
          object_path: 'Total_TH = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day6)'
      - step:
          id: '391'
          action: Script
          object_path: 'Sum_TH = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day6)'
      - step:
          id: '392'
          action: Script
          object_path: 'Total_FR = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,Day7)'
      - step:
          id: '393'
          action: Script
          object_path: 'Sum_FR = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(2,Day7)'
      - step:
          id: '394'
          action: Script
          object_path: 'If oDic.Count > 0 Then'
      - step:
          id: '395'
          action: Script
          object_path: For each key in oDic.Keys
      - step:
          id: '396'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(key,Day3) <> EMPTY Then'
      - step:
          id: '397'
          object_path: 'oDic2.Add Day3,SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area")'
          action: 'GetCellData(key,Day3)'
      - step:
          id: '398'
          action: Script
          object_path: End If
      - step:
          id: '399'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(key,Day4) <> EMPTY Then'
      - step:
          id: '400'
          object_path: 'oDic2.Add Day4,SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area")'
          action: 'GetCellData(key,Day4)'
      - step:
          id: '401'
          action: Script
          object_path: End If
      - step:
          id: '402'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(key,Day5) <> EMPTY Then'
      - step:
          id: '403'
          object_path: 'oDic2.Add Day5,SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area")'
          action: 'GetCellData(key,Day5)'
      - step:
          id: '404'
          action: Script
          object_path: End If
      - step:
          id: '405'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(key,Day6) <> EMPTY Then'
      - step:
          id: '406'
          object_path: 'oDic2.Add Day6,SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area")'
          action: 'GetCellData(key,Day6)'
      - step:
          id: '407'
          action: Script
          object_path: End If
      - step:
          id: '408'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(key,Day7) <> EMPTY Then'
      - step:
          id: '409'
          object_path: 'oDic2.Add Day7,SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area")'
          action: 'GetCellData(key,Day7)'
      - step:
          id: '410'
          action: Script
          object_path: End If
      - step:
          id: '411'
          action: Script
          object_path: Next
      - step:
          id: '412'
          action: Script
          object_path: End If
      - step:
          id: '413'
          action: Script
          object_path: 'If oDic2.Count > 0 Then'
      - step:
          id: '414'
          action: Script
          object_path: For each key in oDic2.Keys
      - step:
          id: '415'
          action: Script
          object_path: 'ShortDay = Mid(key,1,2)'
      - step:
          id: '416'
          action: Script
          object_path: Select Case ShortDay
      - step:
          id: '417'
          action: Script
          object_path: 'Case "MO"'
      - step:
          id: '418'
          action: Script
          object_path: 'If cdbl(Sum_MO) > 0 Or cdbl(Total_MO) > 0 Then'
      - step:
          id: '419'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("MO"),Total_MO,Sum_MO,oDic2.Item(key)'
      - step:
          id: '420'
          action: Script
          object_path: End If
      - step:
          id: '421'
          action: Script
          object_path: 'Case "TU"'
      - step:
          id: '422'
          action: Script
          object_path: 'If cdbl(Sum_TU) > 0 Or cdbl(Total_TU) > 0 Then'
      - step:
          id: '423'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("TU"),Total_TU,Sum_TU,oDic2.Item(key)'
      - step:
          id: '424'
          action: Script
          object_path: End If
      - step:
          id: '425'
          action: Script
          object_path: 'Case "WE"'
      - step:
          id: '426'
          action: Script
          object_path: 'If cdbl(Sum_WE) > 0 Or cdbl(Total_WE) > 0 Then'
      - step:
          id: '427'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("WE"),Total_WE,Sum_WE,oDic2.Item(key)'
      - step:
          id: '428'
          action: Script
          object_path: End If
      - step:
          id: '429'
          action: Script
          object_path: 'Case "TH"'
      - step:
          id: '430'
          action: Script
          object_path: 'If cdbl(Sum_TH) > 0 Or cdbl(Total_TH) > 0 Then'
      - step:
          id: '431'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("TH"),Total_TH,Sum_TH,oDic2.Item(key)'
      - step:
          id: '432'
          action: Script
          object_path: End If
      - step:
          id: '433'
          action: Script
          object_path: 'Case "FR"'
      - step:
          id: '434'
          action: Script
          object_path: 'If cdbl(Sum_FR) > 0 Or cdbl(Total_FR) > 0 Then'
      - step:
          id: '435'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"Time submitted on RDO Day",oDic3.Item("FR"),Total_FR,Sum_FR,oDic2.Item(key)'
      - step:
          id: '436'
          action: Script
          object_path: End If
      - step:
          id: '437'
          action: Script
          object_path: End Select
      - step:
          id: '438'
          action: Script
          object_path: Next
      - step:
          id: '439'
          action: Script
          object_path: End If
      - step:
          id: '440'
          action: Script
          object_path: "'\t\tPrint Total_SA"
      - step:
          id: '441'
          action: Script
          object_path: "'\t\tPrint Sum_SA"
      - step:
          id: '442'
          action: Script
          object_path: "'\t\tPrint Total_SU"
      - step:
          id: '443'
          action: Script
          object_path: "'\t\tPrint Sum_SU"
      - step:
          id: '444'
          action: Script
          object_path: "'\t\tPrint Total_MO"
      - step:
          id: '445'
          action: Script
          object_path: "'\t\tPrint Sum_MO"
      - step:
          id: '446'
          action: Script
          object_path: "'\t\tPrint Total_TU"
      - step:
          id: '447'
          action: Script
          object_path: "'\t\tPrint Sum_TU"
      - step:
          id: '448'
          action: Script
          object_path: "'\t\tPrint Total_WE"
      - step:
          id: '449'
          action: Script
          object_path: "'\t\tPrint Sum_WE"
      - step:
          id: '450'
          action: Script
          object_path: "'\t\tPrint Total_TH"
      - step:
          id: '451'
          action: Script
          object_path: "'\t\tPrint Sum_TH"
      - step:
          id: '452'
          action: Script
          object_path: "'\t\tPrint Total_FR"
      - step:
          id: '453'
          action: Script
          object_path: "'\t\tPrint Sum_FR"
      - step:
          id: '454'
          action: Script
          object_path: 'If cdbl(Total_SA) > 0 And cdbl(Sum_SA) = 0 Then'
      - step:
          id: '455'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("SA"),Total_SA,Sum_SA,""'
      - step:
          id: '456'
          action: Script
          object_path: End If
      - step:
          id: '457'
          action: Script
          object_path: 'If cdbl(Total_SU) > 0 And cdbl(Sum_SU) = 0 Then'
      - step:
          id: '458'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("SU"),Total_SU,Sum_SU,""'
      - step:
          id: '459'
          action: Script
          object_path: End If
      - step:
          id: '460'
          action: Script
          object_path: 'If cdbl(Total_MO) > 0 And cdbl(Sum_MO) = 0 Then'
      - step:
          id: '461'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("MO"),Total_MO,Sum_MO,""'
      - step:
          id: '462'
          action: Script
          object_path: End If
      - step:
          id: '463'
          action: Script
          object_path: 'If cdbl(Total_TU) > 0 And cdbl(Sum_TU) = 0 Then'
      - step:
          id: '464'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("TU"),Total_TU,Sum_TU,""'
      - step:
          id: '465'
          action: Script
          object_path: End If
      - step:
          id: '466'
          action: Script
          object_path: 'If cdbl(Total_WE) > 0 And cdbl(Sum_WE) = 0 Then'
      - step:
          id: '467'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("WE"),Total_WE,Sum_WE,""'
      - step:
          id: '468'
          action: Script
          object_path: End If
      - step:
          id: '469'
          action: Script
          object_path: 'If cdbl(Total_TH) > 0 And cdbl(Sum_TH) = 0 Then'
      - step:
          id: '470'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("TH"),Total_TH,Sum_TH,""'
      - step:
          id: '471'
          action: Script
          object_path: End If
      - step:
          id: '472'
          action: Script
          object_path: 'If cdbl(Total_FR) > 0 And cdbl(Sum_FR) = 0 Then'
      - step:
          id: '473'
          action: Script
          object_path: 'fn_UpdateResultSheet EmployeeNumber,"No time submitted on allocated day",oDic3.Item("FR"),Total_FR,Sum_FR,""'
      - step:
          id: '474'
          action: Script
          object_path: End If
      - step:
          id: '475'
          action: Script
          object_path: "'\t\t'============The following condition check the condition of 2AVL and 2SUB (If 2AVL is present but 2SUB is absent then it is not normal)"
      - step:
          id: '476'
          action: Script
          object_path: "'\t\tIf oDic4.Exists(\"2AVL\") And Not oDic4.Exists(\"2SUB\") Then"
      - step:
          id: '477'
          action: Script
          object_path: "'\t\t\tfn_UpdateResultSheet EmployeeNumber,\"2AVL is present but 2SUB is absent\",oDic3.Item(\"MO\"),\"\",\"\",\"\""
      - step:
          id: '478'
          action: Script
          object_path: "'\t\tEnd If"
      - step:
          id: '479'
          action: Script
          object_path: "'============The following Code Snippet checks Outside submitted hours and reports========================================"
      - step:
          id: '480'
          action: Script
          object_path: If MonHoursWithin = EMPTY Then
      - step:
          id: '481'
          action: Script
          object_path: MonHoursWithin = 0
      - step:
          id: '482'
          action: Script
          object_path: End If
      - step:
          id: '483'
          action: Script
          object_path: If MonHoursOutside = EMPTY Then
      - step:
          id: '484'
          action: Script
          object_path: MonHoursOutside = 0
      - step:
          id: '485'
          action: Script
          object_path: End If
      - step:
          id: '486'
          action: Script
          object_path: MonWorkedHours = cdbl(MonHoursWithin) + cdbl(MonHoursOutside)
      - step:
          id: '487'
          action: Script
          object_path: 'If MonWorkedHours <> 0 Then'
      - step:
          id: '488'
          action: Script
          object_path: 'MonHoursOutsidePercentage = FormatNumber(cdbl(MonHoursOutside)/cdbl(MonWorkedHours),2)'
      - step:
          id: '489'
          action: Script
          object_path: Else
      - step:
          id: '490'
          action: Script
          object_path: MonHoursOutsidePercentage = 0
      - step:
          id: '491'
          action: Script
          object_path: End If
      - step:
          id: '492'
          action: Script
          object_path: 'If MonHoursOutsidePercentage > 0.5 Then'
      - step:
          id: '493'
          action: Script
          object_path: 'fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted Time is outside of planned hours.",oDic3.Item("MO"),"","","",MonHoursWithin,MonHoursOutside,FormatNumber(MonHoursOutsidePercentage*100,2)'
      - step:
          id: '494'
          action: Script
          object_path: End If
      - step:
          id: '495'
          action: Script
          object_path: If TuesHoursWithin = EMPTY Then
      - step:
          id: '496'
          action: Script
          object_path: TuesHoursWithin = 0
      - step:
          id: '497'
          action: Script
          object_path: End If
      - step:
          id: '498'
          action: Script
          object_path: If TuesHoursOutside = EMPTY Then
      - step:
          id: '499'
          action: Script
          object_path: TuesHoursOutside = 0
      - step:
          id: '500'
          action: Script
          object_path: End If
      - step:
          id: '501'
          action: Script
          object_path: TuesWorkedHours = cdbl(TuesHoursWithin) + cdbl(TuesHoursOutside)
      - step:
          id: '502'
          action: Script
          object_path: 'If TuesWorkedHours <> 0 Then'
      - step:
          id: '503'
          action: Script
          object_path: 'TuesHoursOutsidePercentage = FormatNumber(cdbl(TuesHoursOutside)/cdbl(TuesWorkedHours),2)'
      - step:
          id: '504'
          action: Script
          object_path: Else
      - step:
          id: '505'
          action: Script
          object_path: TuesHoursOutsidePercentage = 0
      - step:
          id: '506'
          action: Script
          object_path: End If
      - step:
          id: '507'
          action: Script
          object_path: 'If TuesHoursOutsidePercentage > 0.5 Then'
      - step:
          id: '508'
          action: Script
          object_path: 'fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted Time is outside of planned hours.",oDic3.Item("TU"),"","","",TuesHoursWithin,TuesHoursOutside,FormatNumber(TuesHoursOutsidePercentage*100,2)'
      - step:
          id: '509'
          action: Script
          object_path: End If
      - step:
          id: '510'
          action: Script
          object_path: If WedHoursWithin = EMPTY Then
      - step:
          id: '511'
          action: Script
          object_path: WedHoursWithin = 0
      - step:
          id: '512'
          action: Script
          object_path: End If
      - step:
          id: '513'
          action: Script
          object_path: If WedHoursOutside = EMPTY Then
      - step:
          id: '514'
          action: Script
          object_path: WedHoursOutside = 0
      - step:
          id: '515'
          action: Script
          object_path: End If
      - step:
          id: '516'
          action: Script
          object_path: 'WedWorkedHours = FormatNumber(cdbl(WedHoursWithin) + cdbl(WedHoursOutside),2)'
      - step:
          id: '517'
          action: Script
          object_path: 'If WedWorkedHours <> 0 Then'
      - step:
          id: '518'
          action: Script
          object_path: WedHoursOutsidePercentage = cdbl(WedHoursOutside)/cdbl(WedWorkedHours)
      - step:
          id: '519'
          action: Script
          object_path: Else
      - step:
          id: '520'
          action: Script
          object_path: WedHoursOutsidePercentage = 0
      - step:
          id: '521'
          action: Script
          object_path: End If
      - step:
          id: '522'
          action: Script
          object_path: 'If WedHoursOutsidePercentage > 0.5 Then'
      - step:
          id: '523'
          action: Script
          object_path: 'fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted Time is outside of planned hours.",oDic3.Item("WE"),"","","",WedHoursWithin,WedHoursOutside,FormatNumber(WedHoursOutsidePercentage*100,2)'
      - step:
          id: '524'
          action: Script
          object_path: End If
      - step:
          id: '525'
          action: Script
          object_path: If ThursHoursWithin = EMPTY Then
      - step:
          id: '526'
          action: Script
          object_path: ThursHoursWithin = 0
      - step:
          id: '527'
          action: Script
          object_path: End If
      - step:
          id: '528'
          action: Script
          object_path: If ThursHoursOutside = EMPTY Then
      - step:
          id: '529'
          action: Script
          object_path: ThursHoursOutside = 0
      - step:
          id: '530'
          action: Script
          object_path: End If
      - step:
          id: '531'
          action: Script
          object_path: 'ThursWorkedHours = FormatNumber(cdbl(ThursHoursWithin) + cdbl(ThursHoursOutside),2)'
      - step:
          id: '532'
          action: Script
          object_path: 'If ThursWorkedHours <> 0 Then'
      - step:
          id: '533'
          action: Script
          object_path: ThursHoursOutsidePercentage = cdbl(ThursHoursOutside)/cdbl(ThursWorkedHours)
      - step:
          id: '534'
          action: Script
          object_path: Else
      - step:
          id: '535'
          action: Script
          object_path: ThursHoursOutsidePercentage = 0
      - step:
          id: '536'
          action: Script
          object_path: End If
      - step:
          id: '537'
          action: Script
          object_path: 'If ThursHoursOutsidePercentage > 0.5 Then'
      - step:
          id: '538'
          action: Script
          object_path: 'fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted Time is outside of planned hours.",oDic3.Item("TH"),"","","",ThursHoursWithin,ThursHoursOutside,FormatNumber(ThursHoursOutsidePercentage*100,2)'
      - step:
          id: '539'
          action: Script
          object_path: End If
      - step:
          id: '540'
          action: Script
          object_path: If FriHoursWithin = EMPTY Then
      - step:
          id: '541'
          action: Script
          object_path: FriHoursWithin = 0
      - step:
          id: '542'
          action: Script
          object_path: End If
      - step:
          id: '543'
          action: Script
          object_path: If FriHoursOutside = EMPTY Then
      - step:
          id: '544'
          action: Script
          object_path: FriHoursOutside = 0
      - step:
          id: '545'
          action: Script
          object_path: End If
      - step:
          id: '546'
          action: Script
          object_path: 'FriWorkedHours = FormatNumber(cdbl(FriHoursWithin) + cdbl(FriHoursOutside),2)'
      - step:
          id: '547'
          action: Script
          object_path: 'If FriWorkedHours <> 0 Then'
      - step:
          id: '548'
          action: Script
          object_path: FriHoursOutsidePercentage = cdbl(FriHoursOutside)/cdbl(FriWorkedHours)
      - step:
          id: '549'
          action: Script
          object_path: Else
      - step:
          id: '550'
          action: Script
          object_path: FriHoursOutsidePercentage = 0
      - step:
          id: '551'
          action: Script
          object_path: End If
      - step:
          id: '552'
          action: Script
          object_path: 'If FriHoursOutsidePercentage > 0.5 Then'
      - step:
          id: '553'
          action: Script
          object_path: 'fn_UpdateResultSheetForOutsideHours EmployeeNumber,"Submitted Time is outside of planned hours.",oDic3.Item("FR"),"","","",FriHoursWithin,FriHoursOutside,FormatNumber(FriHoursOutsidePercentage*100,2)'
      - step:
          id: '554'
          action: Script
          object_path: End If
      - step:
          id: '555'
          action: Script
          object_path: "'=================================End of Code Snippet====================================================================="
      - step:
          id: '556'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Next Screen")'
          action: Click
      - step:
          id: '557'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(0) Then'
      - step:
          id: '558'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '559'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '560'
          action: Script
          object_path: 'setDate = DateValue(fn_FormatDate(ToDate,"/")) + 1'
      - step:
          id: '561'
          action: Script
          object_path: 'setDate = fn_FormatDate(setDate,".")'
      - step:
          id: '562'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key date")'
          action: Set
          args: setDate
      - step:
          id: '563'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter Times   (F5)")'
          action: Click
      - step:
          id: '564'
          action: Script
          object_path: End If
      - step:
          id: '565'
          action: Script
          object_path: End If
      - step:
          id: '566'
          action: Script
          object_path: "'Clear Variables"
      - step:
          id: '567'
          action: Script
          object_path: FromDate2 = EMPTY
      - step:
          id: '568'
          action: Script
          object_path: Day1 = EMPTY
      - step:
          id: '569'
          action: Script
          object_path: Day2 = EMPTY
      - step:
          id: '570'
          action: Script
          object_path: Day3 = EMPTY
      - step:
          id: '571'
          action: Script
          object_path: Day4 = EMPTY
      - step:
          id: '572'
          action: Script
          object_path: Day5 = EMPTY
      - step:
          id: '573'
          action: Script
          object_path: Day6 = EMPTY
      - step:
          id: '574'
          action: Script
          object_path: Day7 = EMPTY
      - step:
          id: '575'
          action: Script
          object_path: Set oDic = NOTHING
      - step:
          id: '576'
          action: Script
          object_path: Set oDic2 = NOTHING
      - step:
          id: '577'
          action: Script
          object_path: Set oDic3 = NOTHING
      - step:
          id: '578'
          action: Script
          object_path: Entry = EMPTY
      - step:
          id: '579'
          action: Script
          object_path: ValidRows = EMPTY
      - step:
          id: '580'
          action: Script
          object_path: i = EMPTY
      - step:
          id: '581'
          action: Script
          object_path: DWS = EMPTY
      - step:
          id: '582'
          action: Script
          object_path: Total = EMPTY
      - step:
          id: '583'
          action: Script
          object_path: SumTotal = EMPTY
      - step:
          id: '584'
          action: Script
          object_path: Total_SA = EMPTY
      - step:
          id: '585'
          action: Script
          object_path: Sum_SA = EMPTY
      - step:
          id: '586'
          action: Script
          object_path: Total_SU = EMPTY
      - step:
          id: '587'
          action: Script
          object_path: Sum_SU = EMPTY
      - step:
          id: '588'
          action: Script
          object_path: Total_MO = EMPTY
      - step:
          id: '589'
          action: Script
          object_path: Sum_MO = EMPTY
      - step:
          id: '590'
          action: Script
          object_path: Total_TU = EMPTY
      - step:
          id: '591'
          action: Script
          object_path: Sum_TU = EMPTY
      - step:
          id: '592'
          action: Script
          object_path: Total_WE = EMPTY
      - step:
          id: '593'
          action: Script
          object_path: Sum_WE = EMPTY
      - step:
          id: '594'
          action: Script
          object_path: Total_TH = EMPTY
      - step:
          id: '595'
          action: Script
          object_path: Sum_TH = EMPTY
      - step:
          id: '596'
          action: Script
          object_path: Total_FR = EMPTY
      - step:
          id: '597'
          action: Script
          object_path: Sum_FR = EMPTY
      - step:
          id: '598'
          action: Script
          object_path: ShortDay = EMPTY
      - step:
          id: '599'
          action: Script
          object_path: setDate = EMPTY
      - step:
          id: '600'
          action: Script
          object_path: WageType = EMPTY
      - step:
          id: '601'
          action: Script
          object_path: TotalHours = EMPTY
      - step:
          id: '602'
          action: Script
          object_path: MonRowHours = EMPTY
      - step:
          id: '603'
          action: Script
          object_path: MonRowStartTime = EMPTY
      - step:
          id: '604'
          action: Script
          object_path: MonRowEndTime = EMPTY
      - step:
          id: '605'
          action: Script
          object_path: MonHoursWithin = EMPTY
      - step:
          id: '606'
          action: Script
          object_path: MonHoursOutside = EMPTY
      - step:
          id: '607'
          action: Script
          object_path: TuesRowHours = EMPTY
      - step:
          id: '608'
          action: Script
          object_path: TuesRowStartTime = EMPTY
      - step:
          id: '609'
          action: Script
          object_path: TuesRowEndTime = EMPTY
      - step:
          id: '610'
          action: Script
          object_path: TuesHoursWithin = EMPTY
      - step:
          id: '611'
          action: Script
          object_path: TuesHoursOutside = EMPTY
      - step:
          id: '612'
          action: Script
          object_path: WedRowHours = EMPTY
      - step:
          id: '613'
          action: Script
          object_path: WedRowStartTime = EMPTY
      - step:
          id: '614'
          action: Script
          object_path: WedRowEndTime = EMPTY
      - step:
          id: '615'
          action: Script
          object_path: WedHoursWithin = EMPTY
      - step:
          id: '616'
          action: Script
          object_path: WedHoursOutside = EMPTY
      - step:
          id: '617'
          action: Script
          object_path: ThursRowHours = EMPTY
      - step:
          id: '618'
          action: Script
          object_path: ThursRowStartTime = EMPTY
      - step:
          id: '619'
          action: Script
          object_path: ThursRowEndTime = EMPTY
      - step:
          id: '620'
          action: Script
          object_path: ThursHoursWithin = EMPTY
      - step:
          id: '621'
          action: Script
          object_path: ThursHoursOutside = EMPTY
      - step:
          id: '622'
          action: Script
          object_path: FriRowHours = EMPTY
      - step:
          id: '623'
          action: Script
          object_path: FriRowStartTime = EMPTY
      - step:
          id: '624'
          action: Script
          object_path: FriRowEndTime = EMPTY
      - step:
          id: '625'
          action: Script
          object_path: FriHoursWithin = EMPTY
      - step:
          id: '626'
          action: Script
          object_path: FriHoursOutside = EMPTY
      - step:
          id: '627'
          action: Script
          object_path: ShortDay = EMPTY
      - step:
          id: '628'
          action: Script
          object_path: Set oDic4 = NOTHING
      - step:
          id: '629'
          action: Script
          object_path: MonWorkedHours = EMPTY
      - step:
          id: '630'
          action: Script
          object_path: MonHoursOutsidePercentage = EMPTY
      - step:
          id: '631'
          action: Script
          object_path: TuesWorkedHours = EMPTY
      - step:
          id: '632'
          action: Script
          object_path: TuesHoursOutsidePercentage = EMPTY
      - step:
          id: '633'
          action: Script
          object_path: WedWorkedHours = EMPTY
      - step:
          id: '634'
          action: Script
          object_path: WedHoursOutsidePercentage = EMPTY
      - step:
          id: '635'
          action: Script
          object_path: ThursWorkedHours = EMPTY
      - step:
          id: '636'
          action: Script
          object_path: ThursHoursOutsidePercentage = EMPTY
      - step:
          id: '637'
          action: Script
          object_path: FriWorkedHours = EMPTY
      - step:
          id: '638'
          action: Script
          object_path: FriHoursOutsidePercentage = EMPTY
      - step:
          id: '639'
          action: Script
          object_path: Loop Until DateValue(DateTo) < DateValue(FromDate)
      - step:
          id: '640'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Exit").Exist(0) Then'
      - step:
          id: '641'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Exit")'
          action: Click
      - step:
          id: '642'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '643'
          action: Script
          object_path: End If
      - step:
          id: '644'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").Exist(0) Then'
      - step:
          id: '645'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Exit")'
          action: Click
      - step:
          id: '646'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '647'
          action: Script
          object_path: End If
      - step:
          id: '648'
          action: Script
          object_path: "'Clear Variables"
      - step:
          id: '649'
          action: Script
          object_path: FromDate = EMPTY
      - step:
          id: '650'
          action: Script
          object_path: ToDate = EMPTY
      - step:
          id: '651'
          action: Script
          object_path: MonHours = EMPTY
      - step:
          id: '652'
          action: Script
          object_path: MonStartTime = EMPTY
      - step:
          id: '653'
          action: Script
          object_path: MonEndTime = EMPTY
      - step:
          id: '654'
          action: Script
          object_path: TuesHours = EMPTY
      - step:
          id: '655'
          action: Script
          object_path: TuesStartTime = EMPTY
      - step:
          id: '656'
          action: Script
          object_path: TuesEndTime = EMPTY
      - step:
          id: '657'
          action: Script
          object_path: WedHours = EMPTY
      - step:
          id: '658'
          action: Script
          object_path: WedStartTime = EMPTY
      - step:
          id: '659'
          action: Script
          object_path: WedEndTime = EMPTY
      - step:
          id: '660'
          action: Script
          object_path: ThursHours = EMPTY
      - step:
          id: '661'
          action: Script
          object_path: ThursStartTime = EMPTY
      - step:
          id: '662'
          action: Script
          object_path: ThursEndTime = EMPTY
      - step:
          id: '663'
          action: Script
          object_path: FriHours = EMPTY
      - step:
          id: '664'
          action: Script
          object_path: FriStartTime = EMPTY
      - step:
          id: '665'
          action: Script
          object_path: FriEndTime = EMPTY
      - step:
          id: '666'
          action: Script
          object_path: Next
      - step:
          id: '667'
          action: Script
          object_path: "'================Code Block for verifying Stand Down========================================================="
      - step:
          id: '668'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"SAP Easy Access\").SAPGuiOKCode(\"OKCode\")"
          action: Set
          args: '"/nse16n"'
      - step:
          id: '669'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"SAP Easy Access\")"
          action: SendKey
          args: ENTER
      - step:
          id: '670'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"General Table Display\").SAPGuiEdit(\"Table\")"
          action: Set
          args: '"/ETSA/CATS_STNDN"'
      - step:
          id: '671'
          object_path: "'SAPGuiSession(\"Session\").SAPGuiWindow(\"General Table Display\").SAPGuiButton(\"Enter   (Enter)\")"
          action: Click
      - step:
          id: '672'
          args: '"2"'
          object_path: "'Wait 2"
          action: Script
      - step:
          id: '673'
          action: Script
          object_path: 'Rows = DataTable.GetSheet("Result").GetRowCount'
      - step:
          id: '674'
          action: Script
          object_path: For cntRow = 2 To Rows
      - step:
          id: '675'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nse16n"'
      - step:
          id: '676'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: SendKey
          args: ENTER
      - step:
          id: '677'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiEdit("Table")'
          action: Set
          args: '"/ETSA/CATS_STNDN"'
      - step:
          id: '678'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Enter   (Enter)")'
          action: Click
      - step:
          id: '679'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '680'
          action: Script
          object_path: "'Rows = DataTable.GetSheet(\"Result\").GetRowCount"
      - step:
          id: '681'
          object_path: 'DataTable.GetSheet("Result")'
          action: SetCurrentRow(cntRow)
      - step:
          id: '682'
          action: Script
          object_path: 'ENO = DataTable.Value("EmployeeNumber","Result")'
      - step:
          id: '683'
          action: Script
          object_path: 'WTYPE = DataTable.Value("WarningType","Result")'
      - step:
          id: '684'
          action: Script
          object_path: 'ASOF = fn_FormatDate(DateValue(DataTable.Value("AsOf","Result")),".")'
      - step:
          id: '685'
          action: Script
          object_path: 'If WTYPE = "No time submitted on allocated day" Or WTYPE = "Submitted Time is outside of planned hours." Then'
      - step:
          id: '686'
          action: Script
          object_path: "'If WTYPE = \"No time submitted on allocated day\" Then"
      - step:
          id: '687'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection Criteria")'
          action: SetCellData
          args: '2,"Fr.Value",ENO'
      - step:
          id: '688'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection Criteria")'
          action: SetCellData
          args: '3,"Fr.Value",ASOF'
      - step:
          id: '689'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Online   (F8)")'
          action: Click
      - step:
          id: '690'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '691'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiStatusBar("StatusBar").Exist(0) Then'
      - step:
          id: '692'
          action: Script
          object_path: 'status = Trim(SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiStatusBar("StatusBar").GetROProperty("text"))'
      - step:
          id: '693'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Enter   (Enter)")'
          action: Click
      - step:
          id: '694'
          action: Script
          object_path: 'If status = "No values found" Then'
      - step:
          id: '695'
          object_path: DataTable
          action: 'Value("StandDownStatus","Result")'
          args: '= "Warning! System generated Stand Down date NOT FOUND!!"'
      - step:
          id: '696'
          action: Script
          object_path: End If
      - step:
          id: '697'
          action: Script
          object_path: ELse
      - step:
          id: '698'
          action: Script
          object_path: 'RowCheck = SAPGuiSession("Session").SAPGuiWindow("/ETSA/CATS_STNDN: Display").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Personnel Number",ENO)'
      - step:
          id: '699'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("/ETSA/CATS_STNDN: Display").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '700'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '701'
          action: Script
          object_path: 'If RowCheck > 0 Then'
      - step:
          id: '702'
          object_path: DataTable
          action: 'Value("StandDownStatus","Result")'
          args: '= "FOUND System generated Stand Down date."'
      - step:
          id: '703'
          action: Script
          object_path: End If
      - step:
          id: '704'
          action: Script
          object_path: End If
      - step:
          id: '705'
          action: Script
          object_path: End If
      - step:
          id: '706'
          action: Script
          object_path: "'clear variables"
      - step:
          id: '707'
          action: Script
          object_path: ENO = EMPTY
      - step:
          id: '708'
          action: Script
          object_path: WTYPE = EMPTY
      - step:
          id: '709'
          action: Script
          object_path: ASOF = EMPTY
      - step:
          id: '710'
          action: Script
          object_path: status = EMPTY
      - step:
          id: '711'
          action: Script
          object_path: RowCheck = EMPTY
      - step:
          id: '712'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '713'
          action: Script
          object_path: Next
      - step:
          id: '714'
          action: Script
          object_path: "'==========================End of Code Block=========================================================================="
      - step:
          id: '715'
          action: Script
          object_path: "'Export Results"
      - step:
          id: '716'
          object_path: DataTable
          action: DeleteSheet
          args: '"Action1"'
      - step:
          id: '717'
          object_path: DataTable
          action: DeleteSheet
          args: '"Global"'
      - step:
          id: '718'
          action: Script
          object_path: "FileName = \"C:\\ETSAData\\\" & Replace(Replace(Replace(Now,\"/\",\"\"),\":\",\"\"),\" \",\"\") & \".xlsx\""
      - step:
          id: '719'
          object_path: DataTable
          action: Export
          args: FileName
      - step:
          id: '720'
          action: Script
          object_path: "'Send Result as Email"
      - step:
          id: '721'
          action: Script
          object_path: 'fn_SendResultAsEmail EmailTo,"CAT2 Check Results as of " & Date & " for the employee " & EmployeeNumber,"CAT2 Check Results as of " & Date,FileName'
      - step:
          id: '722'
          action: Script
          object_path: "'Delete File"
      - step:
          id: '723'
          action: Script
          object_path: 'Set obj = createobject("Scripting.FileSystemObject")'
      - step:
          id: '724'
          object_path: obj
          action: DeleteFile
          args: FileName
      - step:
          id: '725'
          action: Script
          object_path: Set obj=Nothing
      - step:
          id: '726'
          action: Script
          object_path: "'Clear Variables"
      - step:
          id: '727'
          action: Script
          object_path: EmployeeNumber = EMPTY
      - step:
          id: '728'
          action: Script
          object_path: cntRow = EMPTY
      - step:
          id: '729'
          action: Script
          object_path: Path = EMPTY
      - step:
          id: '730'
          action: Script
          object_path: SheetName = EMPTY
      - step:
          id: '731'
          action: Script
          object_path: ImportSheetTo = EMPTY
      - step:
          id: '732'
          action: Script
          object_path: Rows = EMPTY
      - step:
          id: '733'
          action: Script
          object_path: GetRow = EMPTY
      - step:
          id: '734'
          action: Script
          object_path: EmailTo = EMPTY
      - step:
          id: '735'
          action: Script
          object_path: FileName = EMPTY
      - step:
          id: '736'
          action: Script
          object_path: DateFrom = EMPTY
      - step:
          id: '737'
          action: Script
          object_path: DateTo = EMPTY
      - step:
          id: '738'
          action: Script
          object_path: "'Close SAP"
      - step:
          id: '739'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '740'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '741'
          action: Script
          object_path: ExitTest
      - step:
          id: '742'
          action: Script
          object_path: FriRowHours = EMPTY
      - step:
          id: '743'
          action: Script
          object_path: FriRowStartTime = EMPTY
      - step:
          id: '744'
          action: Script
          object_path: FriRowEndTime = EMPTY
      - step:
          id: '745'
          action: Script
          object_path: 'FriRowHours = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#33"))'
      - step:
          id: '746'
          action: Script
          object_path: 'FriRowStartTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#34"))'
      - step:
          id: '747'
          action: Script
          object_path: 'FriRowEndTime = fn_CheckAndReturnTwentyFourHours(SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(1,"#35"))'
      - step:
          id: '748'
          action: Script
          object_path: 'If FriRowHours <> EMPTY And FriRowStartTime <> EMPTY And FriRowEndTime <> EMPTY Then'
      - step:
          id: '749'
          action: Script
          object_path: 'If FriRowHours = "0.00" And FriRowStartTime = "00:00" And FriRowEndTime = "00:00" Then'
      - step:
          id: '750'
          action: Script
          object_path: 'FriHoursOutside = Round(FriHoursOutside + cdbl(FriRowHours),2)'
      - step:
          id: '751'
          action: Script
          object_path: 'ElseIf TimeValue(FriStartTime) <= TimeValue(FriRowStartTime) And TimeValue(FriEndTime) >= TimeValue(FriRowEndTime)_'
      - step:
          id: '752'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '753'
          action: Script
          object_path: FriHoursWithin = FriHoursWithin + cdbl(FriRowHours)
      - step:
          id: '754'
          action: Script
          object_path: ElseIf TimeValue(FriRowEndTime) < TimeValue(FriStartTime)_
      - step:
          id: '755'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '756'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '757'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime)_'
      - step:
          id: '758'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '759'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '760'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriEndTime) And TimeValue(FriRowEndTime) < TimeValue(FriStartTime) Then'
      - step:
          id: '761'
          action: Script
          object_path: FriHoursOutside = FriHoursOutside + cdbl(FriRowHours)
      - step:
          id: '762'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
      - step:
          id: '763'
          action: Script
          object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '764'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_'
      - step:
          id: '765'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '766'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60))'
      - step:
          id: '767'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))'
      - step:
          id: '768'
          action: Script
          object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
      - step:
          id: '769'
          action: Script
          object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
      - step:
          id: '770'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriStartTime)_'
      - step:
          id: '771'
          action: Script
          object_path: 'And Not (TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime)) Then'
      - step:
          id: '772'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60))'
      - step:
          id: '773'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowEndTime), TimeValue(FriStartTime))/60))'
      - step:
          id: '774'
          action: Script
          object_path: 'ElseIf TimeValue(FriRowStartTime) > TimeValue(FriStartTime)_'
      - step:
          id: '775'
          action: Script
          object_path: And TimeValue(FriRowStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '776'
          action: Script
          object_path: And TimeValue(FriRowEndTime) < TimeValue(FriEndTime)_
      - step:
          id: '777'
          action: Script
          object_path: 'And TimeValue(FriRowStartTime) > TimeValue(FriRowEndTime) Then'
      - step:
          id: '778'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue("23:59"))/60)) + Abs(cdbl(DateDiff("n", TimeValue("00:00"), TimeValue(FriRowEndTime))/60))'
      - step:
          id: '779'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Abs(cdbl(DateDiff("n", TimeValue(FriRowStartTime), TimeValue(FriEndTime))/60))'
      - step:
          id: '780'
          action: Script
          object_path: ElseIf TimeValue(FriRowStartTime) < TimeValue(FriStartTime)_
      - step:
          id: '781'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriEndTime)_'
      - step:
          id: '782'
          action: Script
          object_path: And TimeValue(FriStartTime) < TimeValue(FriEndTime)_
      - step:
          id: '783'
          action: Script
          object_path: 'And TimeValue(FriRowEndTime) > TimeValue(FriRowStartTime) Then'
      - step:
          id: '784'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(FriStartTime), TimeValue(FriRowStartTime))/60)),2)'
      - step:
          id: '785'
          action: Script
          object_path: 'FriHoursWithin = FriHoursWithin + Round(Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriStartTime))/60)) - 0.5,2)'
      - step:
          id: '786'
          action: Script
          object_path: 'FriHoursOutside = FriHoursOutside + Round(Abs(cdbl(DateDiff("n", TimeValue(FriEndTime), TimeValue(FriRowEndTime))/60)),2)'
      - step:
          id: '787'
          action: Script
          object_path: End If
      - step:
          id: '788'
          action: Script
          object_path: End If
      - step:
          id: '789'
          action: Script
          object_path: ExitTest
      - step:
          id: '790'
          action: Script
          object_path: "'==================================================================================================="
      - step:
          id: '791'
          action: Script
          object_path: "'==========================FUNCTION LIBRARY========================================================="
      - step:
          id: '792'
          action: Script
          object_path: "'==================================================================================================="
      - step:
          id: '793'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '794'
          action: Script
          object_path: "'Function name -  fn_MakeDataEntryColumnHeaderForDay(FromDate,AddDays)"
      - step:
          id: '795'
          action: Script
          object_path: "'Description - This function returns the date in order to make days column header"
      - step:
          id: '796'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '797'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '798'
          action: Script
          object_path: "'Creation Date - 23/09/2020"
      - step:
          id: '799'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '800'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '801'
          action: Script
          object_path: 'Function fn_MakeDataEntryColumnHeaderForDay(FromDate,AddDays)'
      - step:
          id: '802'
          action: Script
          object_path: BaseDate = FromDate
      - step:
          id: '803'
          action: Script
          object_path: 'BaseDate = DateValue(Replace(BaseDate,".","/")) + AddDays'
      - step:
          id: '804'
          action: Script
          object_path: If Len(BaseDate) = 9 Then
      - step:
          id: '805'
          action: Script
          object_path: 'BaseDate = "0" & BaseDate'
      - step:
          id: '806'
          action: Script
          object_path: End If
      - step:
          id: '807'
          action: Script
          object_path: 'BaseDate = Replace(BaseDate,"/",".")'
      - step:
          id: '808'
          action: Script
          object_path: 'fn_MakeDataEntryColumnHeaderForDay = Mid(BaseDate,1,5)'
      - step:
          id: '809'
          action: Script
          object_path: BaseDate = EMPTY
      - step:
          id: '810'
          action: Script
          object_path: End Function
      - step:
          id: '811'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '812'
          action: Script
          object_path: "'Function name -  fgen_SapLogin"
      - step:
          id: '813'
          action: Script
          object_path: "'Description - Its a general function to login to SAP using Service Account"
      - step:
          id: '814'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '815'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '816'
          action: Script
          object_path: "'Creation Date - 26/02/2019"
      - step:
          id: '817'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '818'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '819'
          action: Script
          object_path: 'Function fgen_SapLogin(SystemID,UserName,Password)'
      - step:
          id: '820'
          object_path: SAPGuiUtil
          action: CloseConnections
      - step:
          id: '821'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '822'
          action: Script
          object_path: "''Adding a temporary data sheet"
      - step:
          id: '823'
          object_path: "'DataTable"
          action: AddSheet
          args: '"tmpDataSheet"'
      - step:
          id: '824'
          action: Script
          object_path: "''Importing SapLogin Test Resource to script data table"
      - step:
          id: '825'
          action: Script
          object_path: "'Path = \"C:\\ETSAData\\Roster.xlsx\""
      - step:
          id: '826'
          action: Script
          object_path: "'SheetName = \"SapLogin\""
      - step:
          id: '827'
          action: Script
          object_path: "'ImportSheetTo = \"tmpDataSheet\""
      - step:
          id: '828'
          object_path: "'DataTable"
          action: ImportSheet
          args: 'Path,SheetName,ImportSheetTo'
      - step:
          id: '829'
          args: '"1"'
          object_path: "'Wait 1"
          action: Script
      - step:
          id: '830'
          action: Script
          object_path: "''Retrieving Login Credentials"
      - step:
          id: '831'
          action: Script
          object_path: "'UserName = DataTable.Value(\"UserName\",\"tmpDataSheet\")"
      - step:
          id: '832'
          action: Script
          object_path: "'Password = DataTable.Value(\"Password\",\"tmpDataSheet\")"
      - step:
          id: '833'
          action: Script
          object_path: "'SystemID = DataTable.Value(\"SystemID\",\"tmpDataSheet\")"
      - step:
          id: '834'
          action: Script
          object_path: "'SendMailTo = DataTable.Value(\"SendMailTo\",\"tmpDataSheet\")"
      - step:
          id: '835'
          action: Script
          object_path: "''Delete Temporary Data Sheet"
      - step:
          id: '836'
          object_path: "'DataTable"
          action: 'DeleteSheet("tmpDataSheet")'
      - step:
          id: '837'
          object_path: SAPGuiUtil
          action: AutoLogon
          args: 'SystemID, "410", UserName, Password, ""'
      - step:
          id: '838'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '839'
          action: Script
          object_path: "'fgen_SapLogin = SendMailTo"
      - step:
          id: '840'
          action: Script
          object_path: End Function
      - step:
          id: '841'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '842'
          action: Script
          object_path: "'Function name -  fn_FindValidRowEntry(Entry)"
      - step:
          id: '843'
          action: Script
          object_path: "'Description - This function retrieves the number of valid rows from the Caption"
      - step:
          id: '844'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '845'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '846'
          action: Script
          object_path: "'Creation Date - 22/09/2020"
      - step:
          id: '847'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '848'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '849'
          action: Script
          object_path: Function fn_FindValidRowEntry(Entry)
      - step:
          id: '850'
          action: Script
          object_path: Set regex = New regExp
      - step:
          id: '851'
          object_path: regex
          action: Pattern
          args: "= \"\\d+\""
      - step:
          id: '852'
          object_path: regex
          action: Global
          args: = True
      - step:
          id: '853'
          action: Script
          object_path: Set Matches = regex.Execute(Entry)
      - step:
          id: '854'
          action: Script
          object_path: fn_FindValidRowEntry = Matches(1)
      - step:
          id: '855'
          action: Script
          object_path: Set regex = NOTHING
      - step:
          id: '856'
          action: Script
          object_path: Set Matches = NOTHING
      - step:
          id: '857'
          action: Script
          object_path: End Function
      - step:
          id: '858'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '859'
          action: Script
          object_path: "'Function name -  fn_FormatDate(strDate,Separator)"
      - step:
          id: '860'
          action: Script
          object_path: "'Description - This function formats date as dd/mm/yyyy and also place separator as needed"
      - step:
          id: '861'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '862'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '863'
          action: Script
          object_path: "'Creation Date - 24/09/2020"
      - step:
          id: '864'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '865'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '866'
          action: Script
          object_path: 'Function fn_FormatDate(strDate,Separator)'
      - step:
          id: '867'
          action: Script
          object_path: tmpDate = strDate
      - step:
          id: '868'
          action: Script
          object_path: Set regex = New regExp
      - step:
          id: '869'
          object_path: regex
          action: Pattern
          args: "= \"\\d+\""
      - step:
          id: '870'
          object_path: regex
          action: Global
          args: = True
      - step:
          id: '871'
          action: Script
          object_path: Set Matches = regex.Execute(tmpDate)
      - step:
          id: '872'
          action: Script
          object_path: dd = Matches(0)
      - step:
          id: '873'
          action: Script
          object_path: mm = Matches(1)
      - step:
          id: '874'
          action: Script
          object_path: yyyy = Matches(2)
      - step:
          id: '875'
          action: Script
          object_path: Set regex = NOTHING
      - step:
          id: '876'
          action: Script
          object_path: Set Matches = NOTHING
      - step:
          id: '877'
          action: Script
          object_path: If Len(dd) = 1 Then
      - step:
          id: '878'
          action: Script
          object_path: 'dd = "0" & dd'
      - step:
          id: '879'
          action: Script
          object_path: End If
      - step:
          id: '880'
          action: Script
          object_path: If Len(mm) = 1 Then
      - step:
          id: '881'
          action: Script
          object_path: 'mm = "0" & mm'
      - step:
          id: '882'
          action: Script
          object_path: End If
      - step:
          id: '883'
          action: Script
          object_path: 'If Separator = "." Then'
      - step:
          id: '884'
          action: Script
          object_path: 'fn_FormatDate = dd & "." & mm & "." & yyyy'
      - step:
          id: '885'
          action: Script
          object_path: 'ElseIf Separator = "/" Then'
      - step:
          id: '886'
          action: Script
          object_path: 'fn_FormatDate = dd & "/" & mm & "/" & yyyy'
      - step:
          id: '887'
          action: Script
          object_path: End If
      - step:
          id: '888'
          action: Script
          object_path: tmpDate = EMPTY
      - step:
          id: '889'
          action: Script
          object_path: dd = EMPTY
      - step:
          id: '890'
          action: Script
          object_path: mm = EMPTY
      - step:
          id: '891'
          action: Script
          object_path: yyyy = EMPTY
      - step:
          id: '892'
          action: Script
          object_path: Separator = EMPTY
      - step:
          id: '893'
          action: Script
          object_path: End Function
      - step:
          id: '894'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '895'
          action: Script
          object_path: "'Function name -  fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)"
      - step:
          id: '896'
          action: Script
          object_path: "'Description - This function writes result in the result data sheet"
      - step:
          id: '897'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '898'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '899'
          action: Script
          object_path: "'Creation Date - 24/09/2020"
      - step:
          id: '900'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '901'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '902'
          action: Script
          object_path: 'Function fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)'
      - step:
          id: '903'
          action: Script
          object_path: 'Row = DataTable.GetSheet("Result").GetRowCount'
      - step:
          id: '904'
          object_path: 'DataTable.GetSheet("Result")'
          action: SetCurrentRow(Row
          args: + 1)
      - step:
          id: '905'
          object_path: DataTable
          action: 'Value("EmployeeNumber","Result")'
          args: = E_No
      - step:
          id: '906'
          object_path: DataTable
          comment: '"Time submitted on RDO Day"'
          action: 'Value("WarningType","Result")'
          args: = W_Type
      - step:
          id: '907'
          object_path: DataTable
          comment: 'Mid(Key,6)'
          action: 'Value("AsOf","Result")'
          args: = AsOfDate
      - step:
          id: '908'
          object_path: DataTable
          comment: Total_FR
          action: 'Value("AllocatedTime","Result")'
          args: = A_Time
      - step:
          id: '909'
          object_path: DataTable
          comment: Sum_FR
          action: 'Value("SubmittedTime","Result")'
          args: = S_Time
      - step:
          id: '910'
          object_path: DataTable
          comment: oDic2.Item(key)
          action: 'Value("RDO","Result")'
          args: = RDO_Time
      - step:
          id: '911'
          action: Script
          object_path: End Function
      - step:
          id: '912'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '913'
          action: Script
          object_path: "'Function name -  fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment)"
      - step:
          id: '914'
          action: Script
          object_path: "'Description - This function sends email with attachment"
      - step:
          id: '915'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '916'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '917'
          action: Script
          object_path: "'Creation Date - 24/09/2020"
      - step:
          id: '918'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '919'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '920'
          action: Script
          object_path: 'Function fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment)'
      - step:
          id: '921'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '922'
          object_path: MyEmail
          action: Subject
          args: = Subject
      - step:
          id: '923'
          object_path: MyEmail
          action: From
          args: '= "Test_Automation@sapowernetworks.com.au"'
      - step:
          id: '924'
          object_path: MyEmail
          action: To
          args: = EmailTo
      - step:
          id: '925'
          object_path: MyEmail
          action: TextBody
          args: = Body
      - step:
          id: '926'
          object_path: MyEmail
          action: AddAttachment
          args: Attachment
      - step:
          id: '927'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '928'
          action: Script
          object_path: "'SMTP Server"
      - step:
          id: '929'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '930'
          action: Script
          object_path: "'SMTP Port"
      - step:
          id: '931'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '932'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '933'
          object_path: MyEmail
          action: Send
      - step:
          id: '934'
          action: Script
          object_path: Set MyEmail = NOTHING
      - step:
          id: '935'
          action: Script
          object_path: End Function
      - step:
          id: '936'
          action: Script
          object_path: Function fn_CheckAndReturnTwentyFourHours(getTime)
      - step:
          id: '937'
          action: Script
          object_path: 'If getTime <> EMPTY Then'
      - step:
          id: '938'
          action: Script
          object_path: 'If getTime = "24:00" Then'
      - step:
          id: '939'
          action: Script
          object_path: 'fn_CheckAndReturnTwentyFourHours = "00:00"'
      - step:
          id: '940'
          action: Script
          object_path: Else
      - step:
          id: '941'
          action: Script
          object_path: fn_CheckAndReturnTwentyFourHours = getTime
      - step:
          id: '942'
          action: Script
          object_path: End If
      - step:
          id: '943'
          action: Script
          object_path: End If
      - step:
          id: '944'
          action: Script
          object_path: End Function
      - step:
          id: '945'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '946'
          action: Script
          object_path: "'Function name -  fn_UpdateResultSheet(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time)"
      - step:
          id: '947'
          action: Script
          object_path: "'Description - This function writes result in the result data sheet"
      - step:
          id: '948'
          action: Script
          object_path: "'Pre-requisite -"
      - step:
          id: '949'
          action: Script
          object_path: "'Author - Mohammed Ripon (Modis)"
      - step:
          id: '950'
          action: Script
          object_path: "'Creation Date - 24/09/2020"
      - step:
          id: '951'
          action: Script
          object_path: "'Change Log:"
      - step:
          id: '952'
          action: Script
          object_path: "'================================================================================"
      - step:
          id: '953'
          action: Script
          object_path: 'Function fn_UpdateResultSheetForOutsideHours(E_No,W_Type,AsOfDate,A_Time,S_Time,RDO_Time,HoursWithin,HoursOutside,Remark)'
      - step:
          id: '954'
          action: Script
          object_path: 'Row = DataTable.GetSheet("Result").GetRowCount'
      - step:
          id: '955'
          object_path: 'DataTable.GetSheet("Result")'
          action: SetCurrentRow(Row
          args: + 1)
      - step:
          id: '956'
          object_path: DataTable
          action: 'Value("EmployeeNumber","Result")'
          args: = E_No
      - step:
          id: '957'
          object_path: DataTable
          comment: '"Time submitted on RDO Day"'
          action: 'Value("WarningType","Result")'
          args: = W_Type
      - step:
          id: '958'
          object_path: DataTable
          comment: 'Mid(Key,6)'
          action: 'Value("AsOf","Result")'
          args: = AsOfDate
      - step:
          id: '959'
          object_path: DataTable
          comment: Total_FR
          action: 'Value("AllocatedTime","Result")'
          args: = A_Time
      - step:
          id: '960'
          object_path: DataTable
          comment: Sum_FR
          action: 'Value("SubmittedTime","Result")'
          args: = S_Time
      - step:
          id: '961'
          object_path: DataTable
          comment: oDic2.Item(key)
          action: 'Value("RDO","Result")'
          args: = RDO_Time
      - step:
          id: '962'
          object_path: DataTable
          action: 'Value("HoursWithinAllocation","Result")'
          args: '= FormatNumber(HoursWithin,2)'
      - step:
          id: '963'
          object_path: DataTable
          action: 'Value("HoursOutsideAllocation","Result")'
          args: '= FormatNumber(HoursOutside,2)'
      - step:
          id: '964'
          object_path: DataTable
          action: 'Value("Remark","Result")'
          args: '= "Submitted hours outside of planned hours is " & Remark & "% of total hours."'
      - step:
          id: '965'
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
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: 'Time Sheet: Initial Screen'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Personnel Number
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Key date
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Data Entry Profile
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Exit
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[15]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Enter Times   (F5)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[5]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Enter   (Enter)
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
              name: 'Time Sheet: Data Entry'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Data Entry Area
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Entry
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Data Entry Period
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: '-'
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Next Screen
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Exit
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[15]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
              name: SAP Easy Access
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
              name: General Table Display
              child_objects:
                - object:
                    smart_identification: ''
                    name: Selection Criteria
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Table
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Online   (F8)
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Enter   (Enter)
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
              name: '/ETSA/CATS_STNDN: Display'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiGrid
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
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
        comments: ''
        custom_replay: ''
        class: SAPGuiSession
        visual_relations: ''
        last_update_time: 'Friday, 18 March 2022 8:17:14 AM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
