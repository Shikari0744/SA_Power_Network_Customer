namespace: FieldServicesAvailabilityRoster
operation:
  name: RegionalRoster
  inputs:
  - regionalRoster: C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services
      Weekly Availability Roster/Regional Availability Roster_Macro.xlsm
  sequential_action:
    gav: com.microfocus.seq:FieldServicesAvailabilityRoster.RegionalRoster:1.0.1
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
        object_path: newFile = Parameter("regionalRoster")
    - step:
        id: '2'
        action: Script
        object_path: Set xls = createObject("excel.application")
    - step:
        id: '3'
        object_path: xls
        action: visible=True
    - step:
        id: '4'
        object_path: xls
        action: DisplayAlerts
        args: = False
    - step:
        id: '5'
        object_path: xls
        action: AskToUpdateLinks
        args: = False
    - step:
        id: '6'
        action: Script
        object_path: Set workbook = xls.workbooks.open(newFile)
    - step:
        id: '7'
        action: Script
        object_path: Set sheet = workbook.worksheets("Availability - On Call")
    - step:
        id: '8'
        action: Script
        object_path: dayCheck = Weekday(Date,vbSunday)
    - step:
        id: '9'
        action: Script
        object_path: If dayCheck = 5 Then
    - step:
        id: '10'
        action: Script
        object_path: rptStartDate = Right("0" & DateValue(Date), 10)
    - step:
        id: '11'
        action: Script
        object_path: Else
    - step:
        id: '12'
        action: Script
        object_path: dayCheck = 5 - dayCheck
    - step:
        id: '13'
        action: Script
        object_path: rptStartDate = Date + dayCheck
    - step:
        id: '14'
        action: Script
        object_path: rptStartDate = Right("0" & rptStartDate, 10)
    - step:
        id: '15'
        action: Script
        object_path: End If
    - step:
        id: '16'
        object_path: sheet.cells(1,12)
        action: Value
        args: = DateValue(rptStartDate)
    - step:
        id: '17'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '18'
        action: Script
        object_path: '''Clear TaB'
    - step:
        id: '19'
        action: Script
        object_path: fn_ClearExistingRecord 5,11
    - step:
        id: '20'
        action: Script
        object_path: fn_ClearExistingRecord 13,16
    - step:
        id: '21'
        action: Script
        object_path: fn_ClearExistingRecord 21,23
    - step:
        id: '22'
        action: Script
        object_path: fn_ClearExistingRecord 27,29
    - step:
        id: '23'
        action: Script
        object_path: fn_ClearExistingRecord 35,37
    - step:
        id: '24'
        action: Script
        object_path: fn_ClearExistingRecord 44,47
    - step:
        id: '25'
        action: Script
        object_path: fn_ClearExistingRecord 51,53
    - step:
        id: '26'
        action: Script
        object_path: fn_ClearExistingRecord 57,63
    - step:
        id: '27'
        action: Script
        object_path: fn_ClearExistingRecord 65,69
    - step:
        id: '28'
        action: Script
        object_path: fn_ClearExistingRecord 74,78
    - step:
        id: '29'
        action: Script
        object_path: fn_ClearExistingRecord 80,84
    - step:
        id: '30'
        action: Script
        object_path: fn_ClearExistingRecord 87,92
    - step:
        id: '31'
        action: Script
        object_path: fn_ClearExistingRecord 96,98
    - step:
        id: '32'
        action: Script
        object_path: fn_ClearExistingRecord 105,107
    - step:
        id: '33'
        action: Script
        object_path: fn_ClearExistingRecord 111,112
    - step:
        id: '34'
        action: Script
        object_path: fn_ClearExistingRecord 118,120
    - step:
        id: '35'
        action: Script
        object_path: fn_ClearExistingRecord 126,130
    - step:
        id: '36'
        action: Script
        object_path: fn_clearTab " EXTRA THURS (PM)",1,152
    - step:
        id: '37'
        action: Script
        object_path: fn_clearTab "EXTRA FRI",1,146
    - step:
        id: '38'
        action: Script
        object_path: fn_clearTab "EXTRA SAT",1,148
    - step:
        id: '39'
        action: Script
        object_path: fn_clearTab "EXTRA SUN",1,147
    - step:
        id: '40'
        action: Script
        object_path: fn_clearTab "EXTRA MON",1,116
    - step:
        id: '41'
        action: Script
        object_path: fn_clearTab "EXTRA TUES",1,148
    - step:
        id: '42'
        action: Script
        object_path: fn_clearTab "EXTRA WED",1,155
    - step:
        id: '43'
        action: Script
        object_path: rptFromDate = Replace(Right("0" & DateValue(rptStartDate), 10),"/",".")
    - step:
        id: '44'
        action: Script
        object_path: rptToDate = Replace(Right("0" & DateValue(rptStartDate) + 7,
          10),"/",".")
    - step:
        id: '45'
        action: Script
        object_path: '''The following dictionaries will be used to hold all depos
          employees availability records'
    - step:
        id: '46'
        action: Script
        object_path: Set oDicDepoWeekDay1 = CreateObject("Scripting.Dictionary")
    - step:
        id: '47'
        action: Script
        object_path: Set oDicDepoWeekDay2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '48'
        action: Script
        object_path: Set oDicDepoWeekDay3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '49'
        action: Script
        object_path: Set oDicDepoWeekDay4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '50'
        action: Script
        object_path: Set oDicDepoWeekDay5 = CreateObject("Scripting.Dictionary")
    - step:
        id: '51'
        action: Script
        object_path: Set oDicDepoWeekDay6 = CreateObject("Scripting.Dictionary")
    - step:
        id: '52'
        action: Script
        object_path: Set oDicDepoWeekDay7 = CreateObject("Scripting.Dictionary")
    - step:
        id: '53'
        action: Script
        object_path: Set oDicDepoWeekDay8 = CreateObject("Scripting.Dictionary")
    - step:
        id: '54'
        action: Script
        object_path: '''The following dictionaries will be used to hold depo-wise
          employee availability records to update "Paid Availability - On Call" sheet'
    - step:
        id: '55'
        action: Script
        object_path: Set oDicWeekDay1 = CreateObject("Scripting.Dictionary")
    - step:
        id: '56'
        action: Script
        object_path: Set oDicWeekDay2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '57'
        action: Script
        object_path: Set oDicWeekDay3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '58'
        action: Script
        object_path: Set oDicWeekDay4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '59'
        action: Script
        object_path: Set oDicWeekDay5 = CreateObject("Scripting.Dictionary")
    - step:
        id: '60'
        action: Script
        object_path: Set oDicWeekDay6 = CreateObject("Scripting.Dictionary")
    - step:
        id: '61'
        action: Script
        object_path: Set oDicWeekDay7 = CreateObject("Scripting.Dictionary")
    - step:
        id: '62'
        action: Script
        object_path: Set oDicWeekDay8 = CreateObject("Scripting.Dictionary")
    - step:
        id: '63'
        object_path: '''SAPGuiUtil'
        action: AutoLogon
        args: '"ERP - QAS - Quality Assurance", "410", Parameter("SAP_UserID"), Parameter("SAP_Password"),
          ""'
    - step:
        id: '64'
        action: Script
        object_path: '''SAP CODING'
    - step:
        id: '65'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n/ETSA/RES_REPORT"'
    - step:
        id: '66'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '67'
        action: Script
        object_path: '''FillUp EYRE'
    - step:
        id: '68'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-PTL",rptFromDate,rptToDate
    - step:
        id: '69'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-CLV",rptFromDate,rptToDate
    - step:
        id: '70'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-CED",rptFromDate,rptToDate
    - step:
        id: '71'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"5\""
    - step:
        id: '72'
        action: Script
        object_path: '''FillUp Streaky Bay/widunna'
    - step:
        id: '73'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-STB",rptFromDate,rptToDate
    - step:
        id: '74'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-WUD",rptFromDate,rptToDate
    - step:
        id: '75'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"13\""
    - step:
        id: '76'
        action: Script
        object_path: '''WHYALLA DEPOT'
    - step:
        id: '77'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-WHY",rptFromDate,rptToDate
    - step:
        id: '78'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"21\""
    - step:
        id: '79'
        action: Script
        object_path: '''PT AUGUSTA DEPOT'
    - step:
        id: '80'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-PTA",rptFromDate,rptToDate
    - step:
        id: '81'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"27\""
    - step:
        id: '82'
        action: Script
        object_path: '''PT PIRIE DEPOT'
    - step:
        id: '83'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-PTP",rptFromDate,rptToDate
    - step:
        id: '84'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"35\""
    - step:
        id: '85'
        action: Script
        object_path: '''KADINA DEPOT'
    - step:
        id: '86'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-KAD",rptFromDate,rptToDate
    - step:
        id: '87'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"44\""
    - step:
        id: '88'
        action: Script
        object_path: '''YORKETOWN DEPOT'
    - step:
        id: '89'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-YOR",rptFromDate,rptToDate
    - step:
        id: '90'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"51\""
    - step:
        id: '91'
        action: Script
        object_path: '''CLARE DEPOT'
    - step:
        id: '92'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-CLR",rptFromDate,rptToDate
    - step:
        id: '93'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"57\""
    - step:
        id: '94'
        action: Script
        object_path: '''ANGASTON DEPOT'
    - step:
        id: '95'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-ANG",rptFromDate,rptToDate
    - step:
        id: '96'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"65\""
    - step:
        id: '97'
        action: Script
        object_path: '''BARMERA DEPOT'
    - step:
        id: '98'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-BAR",rptFromDate,rptToDate
    - step:
        id: '99'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"74\""
    - step:
        id: '100'
        action: Script
        object_path: '''MURRAY BRIDGE DEPOT'
    - step:
        id: '101'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-MBR",rptFromDate,rptToDate
    - step:
        id: '102'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"80\""
    - step:
        id: '103'
        action: Script
        object_path: '''MT BARKER DEPOT'
    - step:
        id: '104'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-MTB",rptFromDate,rptToDate
    - step:
        id: '105'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"87\""
    - step:
        id: '106'
        action: Script
        object_path: '''VICTOR HARBOR DEPOT'
    - step:
        id: '107'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-VIC",rptFromDate,rptToDate
    - step:
        id: '108'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"96\""
    - step:
        id: '109'
        action: Script
        object_path: '''KINGSCOTE (K.I.) DEPOT'
    - step:
        id: '110'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-KIS",rptFromDate,rptToDate
    - step:
        id: '111'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"105\""
    - step:
        id: '112'
        action: Script
        object_path: '''BORDERTOWN DEPOT'
    - step:
        id: '113'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-BOR",rptFromDate,rptToDate
    - step:
        id: '114'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"111\""
    - step:
        id: '115'
        action: Script
        object_path: '''NARACOORTE DEPOT'
    - step:
        id: '116'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-NAR",rptFromDate,rptToDate
    - step:
        id: '117'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"118\""
    - step:
        id: '118'
        action: Script
        object_path: '''MT GAMBIER DEPOT'
    - step:
        id: '119'
        action: Script
        object_path: fn_PaidAvailability_OnCall_Sheet "PL-MTG",rptFromDate,rptToDate
    - step:
        id: '120'
        action: Script
        object_path: "fn_Fillup_Availability_OnCall_Sheet\t\"126\""
    - step:
        id: '121'
        action: Script
        object_path: fn_TickSheet "EYRE TICK LIST "
    - step:
        id: '122'
        action: Script
        object_path: fn_TickSheet "MN&RL TICK LIST"
    - step:
        id: '123'
        action: Script
        object_path: fn_TickSheet "UN&Y TICK LIST"
    - step:
        id: '124'
        action: Script
        object_path: fn_TickSheet "ML&SE TICK LIST"
    - step:
        id: '125'
        action: Script
        object_path: fn_TickSheet " FLU TICK LIST"
    - step:
        id: '126'
        action: Script
        object_path: '''Save and Close Workbook'
    - step:
        id: '127'
        object_path: workbook
        action: Save
    - step:
        id: '128'
        object_path: workbook
        action: Close
    - step:
        id: '129'
        object_path: xls
        action: Quit
    - step:
        id: '130'
        action: Script
        object_path: '''Close SAP'
    - step:
        id: '131'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '132'
        action: Script
        object_path: ExitTest
    - step:
        id: '133'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '134'
        action: Script
        object_path: Function fn_TickSheet(SheetName)
    - step:
        id: '135'
        action: Script
        object_path: Set sheet2 = workbook.worksheets(SheetName)
    - step:
        id: '136'
        object_path: sheet2
        action: Unprotect
    - step:
        id: '137'
        action: Script
        object_path: sheet2Rows = sheet2.usedrange.rows.count
    - step:
        id: '138'
        action: Script
        object_path: For i = 1 To sheet2Rows
    - step:
        id: '139'
        action: Script
        object_path: if VarType(sheet2.Range("A" & i).Value) <> vberror Then
    - step:
        id: '140'
        action: Script
        object_path: If IsNumeric(sheet2.Range("A" & i).Value) Then
    - step:
        id: '141'
        action: Script
        object_path: If oDicDepoWeekDay1.Exists(Cstr(sheet2.Range("A" & i).Value))
          Then
    - step:
        id: '142'
        object_path: sheet2.Cells(i,9) = oDicDepoWeekDay1.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '143'
        object_path: sheet2.Cells(i,10) = oDicDepoWeekDay2.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '144'
        object_path: sheet2.Cells(i,11) = oDicDepoWeekDay3.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '145'
        object_path: sheet2.Cells(i,12) = oDicDepoWeekDay4.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '146'
        object_path: sheet2.Cells(i,13) = oDicDepoWeekDay5.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '147'
        object_path: sheet2.Cells(i,14) = oDicDepoWeekDay6.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '148'
        object_path: sheet2.Cells(i,15) = oDicDepoWeekDay7.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '149'
        object_path: sheet2.Cells(i,16) = oDicDepoWeekDay8.Item(Cstr(sheet2.Range("A"
          & i)
        action: Value))
    - step:
        id: '150'
        action: Script
        object_path: End If
    - step:
        id: '151'
        action: Script
        object_path: End If
    - step:
        id: '152'
        action: Script
        object_path: End If
    - step:
        id: '153'
        action: Script
        object_path: Next
    - step:
        id: '154'
        object_path: sheet2
        action: Protect
    - step:
        id: '155'
        action: Script
        object_path: Set sheet2 = NOTHING
    - step:
        id: '156'
        action: Script
        object_path: sheet2Rows = EMPTY
    - step:
        id: '157'
        action: Script
        object_path: End Function
    - step:
        id: '158'
        action: Script
        object_path: Function fn_PaidAvailability_OnCall_Sheet(WorkCentre,FromDate,ToDate)
    - step:
        id: '159'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("Work
          Centre")
        action: Set
        args: WorkCentre
    - step:
        id: '160'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("Date")
        action: Set
        args: FromDate
    - step:
        id: '161'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("to")
        action: Set
        args: ToDate
    - step:
        id: '162'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '163'
        action: Script
        object_path: row = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '164'
        action: Script
        object_path: For i = 1 To row
    - step:
        id: '165'
        action: Script
        object_path: EmpNum = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#1")
    - step:
        id: '166'
        action: Script
        object_path: '''Print DateValue(rptStartDate)'
    - step:
        id: '167'
        action: Script
        object_path: availWeekDay1 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#6")
    - step:
        id: '168'
        object_path: oDicWeekDay1
        action: "Add\t"
        args: EmpNum,availWeekDay1
    - step:
        id: '169'
        object_path: oDicDepoWeekDay1
        action: Add
        args: EmpNum,availWeekDay1
    - step:
        id: '170'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 1'
    - step:
        id: '171'
        action: Script
        object_path: availWeekDay2 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#7")
    - step:
        id: '172'
        object_path: oDicWeekDay2
        action: "Add\t"
        args: EmpNum,availWeekDay2
    - step:
        id: '173'
        object_path: oDicDepoWeekDay2
        action: Add
        args: EmpNum,availWeekDay2
    - step:
        id: '174'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 2'
    - step:
        id: '175'
        action: Script
        object_path: availWeekDay3 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#8")
    - step:
        id: '176'
        object_path: oDicWeekDay3
        action: "Add\t"
        args: EmpNum,availWeekDay3
    - step:
        id: '177'
        object_path: oDicDepoWeekDay3
        action: Add
        args: EmpNum,availWeekDay3
    - step:
        id: '178'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 3'
    - step:
        id: '179'
        action: Script
        object_path: availWeekDay4 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#9")
    - step:
        id: '180'
        object_path: oDicWeekDay4
        action: "Add\t"
        args: EmpNum,availWeekDay4
    - step:
        id: '181'
        object_path: oDicDepoWeekDay4
        action: Add
        args: EmpNum,availWeekDay4
    - step:
        id: '182'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 4'
    - step:
        id: '183'
        action: Script
        object_path: availWeekDay5 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#10")
    - step:
        id: '184'
        object_path: oDicWeekDay5
        action: "Add\t"
        args: EmpNum,availWeekDay5
    - step:
        id: '185'
        object_path: oDicDepoWeekDay5
        action: Add
        args: EmpNum,availWeekDay5
    - step:
        id: '186'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 5'
    - step:
        id: '187'
        action: Script
        object_path: availWeekDay6 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#11")
    - step:
        id: '188'
        object_path: oDicWeekDay6
        action: "Add\t"
        args: EmpNum,availWeekDay6
    - step:
        id: '189'
        object_path: oDicDepoWeekDay6
        action: Add
        args: EmpNum,availWeekDay6
    - step:
        id: '190'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 6'
    - step:
        id: '191'
        action: Script
        object_path: availWeekDay7 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#12")
    - step:
        id: '192'
        object_path: oDicWeekDay7
        action: "Add\t"
        args: EmpNum,availWeekDay7
    - step:
        id: '193'
        object_path: oDicDepoWeekDay7
        action: Add
        args: EmpNum,availWeekDay7
    - step:
        id: '194'
        action: Script
        object_path: '''Print DateValue(rptStartDate) + 7'
    - step:
        id: '195'
        action: Script
        object_path: availWeekDay8 = SAPGuiSession("Session").SAPGuiWindow("Resource
          Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#13")
    - step:
        id: '196'
        object_path: oDicWeekDay8
        action: "Add\t"
        args: EmpNum,availWeekDay8
    - step:
        id: '197'
        object_path: oDicDepoWeekDay8
        action: Add
        args: EmpNum,availWeekDay8
    - step:
        id: '198'
        action: Script
        object_path: Next
    - step:
        id: '199'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiButton("Back")
        action: Click
    - step:
        id: '200'
        action: Script
        object_path: End Function
    - step:
        id: '201'
        action: Script
        object_path: Function fn_Fillup_Availability_OnCall_Sheet(DepotRowStartFromAVL1)
    - step:
        id: '202'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '203'
        action: Script
        object_path: For each key in oDicWeekDay1.Keys
    - step:
        id: '204'
        action: Script
        object_path: If InStr(oDicWeekDay1.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '205'
        object_path: sheet
        action: Cells(cnt,4)
        args: = key
    - step:
        id: '206'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '207'
        action: Script
        object_path: End If
    - step:
        id: '208'
        action: Script
        object_path: Next
    - step:
        id: '209'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '210'
        action: Script
        object_path: For each key in oDicWeekDay2.Keys
    - step:
        id: '211'
        action: Script
        object_path: If InStr(oDicWeekDay2.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '212'
        object_path: sheet
        action: Cells(cnt,12)
        args: = key
    - step:
        id: '213'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '214'
        action: Script
        object_path: End If
    - step:
        id: '215'
        action: Script
        object_path: Next
    - step:
        id: '216'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '217'
        action: Script
        object_path: For each key in oDicWeekDay3.Keys
    - step:
        id: '218'
        action: Script
        object_path: If InStr(oDicWeekDay3.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '219'
        object_path: sheet
        action: Cells(cnt,20)
        args: = key
    - step:
        id: '220'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '221'
        action: Script
        object_path: End If
    - step:
        id: '222'
        action: Script
        object_path: Next
    - step:
        id: '223'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '224'
        action: Script
        object_path: For each key in oDicWeekDay4.Keys
    - step:
        id: '225'
        action: Script
        object_path: If InStr(oDicWeekDay4.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '226'
        object_path: sheet
        action: Cells(cnt,28)
        args: = key
    - step:
        id: '227'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '228'
        action: Script
        object_path: End If
    - step:
        id: '229'
        action: Script
        object_path: Next
    - step:
        id: '230'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '231'
        action: Script
        object_path: For each key in oDicWeekDay5.Keys
    - step:
        id: '232'
        action: Script
        object_path: If InStr(oDicWeekDay5.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '233'
        object_path: sheet
        action: Cells(cnt,36)
        args: = key
    - step:
        id: '234'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '235'
        action: Script
        object_path: End If
    - step:
        id: '236'
        action: Script
        object_path: Next
    - step:
        id: '237'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '238'
        action: Script
        object_path: For each key in oDicWeekDay6.Keys
    - step:
        id: '239'
        action: Script
        object_path: If InStr(oDicWeekDay6.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '240'
        object_path: sheet
        action: Cells(cnt,44)
        args: = key
    - step:
        id: '241'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '242'
        action: Script
        object_path: End If
    - step:
        id: '243'
        action: Script
        object_path: Next
    - step:
        id: '244'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '245'
        action: Script
        object_path: For each key in oDicWeekDay7.Keys
    - step:
        id: '246'
        action: Script
        object_path: If InStr(oDicWeekDay7.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '247'
        object_path: sheet
        action: Cells(cnt,52)
        args: = key
    - step:
        id: '248'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '249'
        action: Script
        object_path: End If
    - step:
        id: '250'
        action: Script
        object_path: Next
    - step:
        id: '251'
        action: Script
        object_path: cnt = DepotRowStartFromAVL1
    - step:
        id: '252'
        action: Script
        object_path: For each key in oDicWeekDay8.Keys
    - step:
        id: '253'
        action: Script
        object_path: If InStr(oDicWeekDay8.Item(key),"AVL(1)") > 0 Then
    - step:
        id: '254'
        object_path: sheet
        action: Cells(cnt,60)
        args: = key
    - step:
        id: '255'
        action: Script
        object_path: cnt = cnt +1
    - step:
        id: '256'
        action: Script
        object_path: End If
    - step:
        id: '257'
        action: Script
        object_path: Next
    - step:
        id: '258'
        object_path: oDicWeekDay1
        action: RemoveAll
    - step:
        id: '259'
        object_path: oDicWeekDay2
        action: RemoveAll
    - step:
        id: '260'
        object_path: oDicWeekDay3
        action: RemoveAll
    - step:
        id: '261'
        object_path: oDicWeekDay4
        action: RemoveAll
    - step:
        id: '262'
        object_path: oDicWeekDay5
        action: RemoveAll
    - step:
        id: '263'
        object_path: oDicWeekDay6
        action: RemoveAll
    - step:
        id: '264'
        object_path: oDicWeekDay7
        action: RemoveAll
    - step:
        id: '265'
        object_path: oDicWeekDay8
        action: RemoveAll
    - step:
        id: '266'
        action: Script
        object_path: End Function
    - step:
        id: '267'
        action: Script
        object_path: Function fn_ClearExistingRecord(fromRow,ToRow)
    - step:
        id: '268'
        action: Script
        object_path: For i = FromRow To ToRow
    - step:
        id: '269'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '270'
        object_path: sheet.Range("D" & i)
        action: Value
        args: = ""
    - step:
        id: '271'
        object_path: sheet.Range("I" & i)
        action: Value
        args: = ""
    - step:
        id: '272'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '273'
        object_path: sheet.Range("L" & i)
        action: Value
        args: = ""
    - step:
        id: '274'
        object_path: sheet.Range("Q" & i)
        action: Value
        args: = ""
    - step:
        id: '275'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '276'
        object_path: sheet.Range("T" & i)
        action: Value
        args: = ""
    - step:
        id: '277'
        object_path: sheet.Range("Y" & i)
        action: Value
        args: = ""
    - step:
        id: '278'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '279'
        object_path: sheet.Range("AB" & i)
        action: Value
        args: = ""
    - step:
        id: '280'
        object_path: sheet.Range("AG" & i)
        action: Value
        args: = ""
    - step:
        id: '281'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '282'
        object_path: sheet.Range("AJ" & i)
        action: Value
        args: = ""
    - step:
        id: '283'
        object_path: sheet.Range("AO" & i)
        action: Value
        args: = ""
    - step:
        id: '284'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '285'
        object_path: sheet.Range("AR" & i)
        action: Value
        args: = ""
    - step:
        id: '286'
        object_path: sheet.Range("AW" & i)
        action: Value
        args: = ""
    - step:
        id: '287'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '288'
        object_path: sheet.Range("AZ" & i)
        action: Value
        args: = ""
    - step:
        id: '289'
        object_path: sheet.Range("BE" & i)
        action: Value
        args: = ""
    - step:
        id: '290'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '291'
        object_path: sheet.Range("BH" & i)
        action: Value
        args: = ""
    - step:
        id: '292'
        object_path: sheet.Range("BM" & i)
        action: Value
        args: = ""
    - step:
        id: '293'
        action: Script
        object_path: Next
    - step:
        id: '294'
        action: Script
        object_path: End Function
    - step:
        id: '295'
        action: Script
        object_path: Function fn_clearTab(TabName,FromRow,ToRow)
    - step:
        id: '296'
        action: Script
        object_path: Set sheet4 = workbook.worksheets(TabName)
    - step:
        id: '297'
        object_path: sheet4
        action: Unprotect
    - step:
        id: '298'
        action: Script
        object_path: For i = FromRow To ToRow
    - step:
        id: '299'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '300'
        action: Script
        object_path: if VarType(sheet4.Range("A" & i).Value) <> vberror Then
    - step:
        id: '301'
        action: Script
        object_path: If IsNumeric(sheet4.Range("A" & i).Value) Then
    - step:
        id: '302'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '303'
        object_path: sheet4.Range("A" & i)
        action: Value
        args: = ""
    - step:
        id: '304'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '305'
        object_path: sheet4.Range("H" & i)
        action: Value
        args: = ""
    - step:
        id: '306'
        action: Script
        object_path: End If
    - step:
        id: '307'
        action: Script
        object_path: End If
    - step:
        id: '308'
        action: Script
        object_path: Next
    - step:
        id: '309'
        action: Script
        object_path: Set sheet4 = NOTHING
    - step:
        id: '310'
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
      class: Window
      name: Window
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
      last_update_time: Friday, 12 August 2022 1:20:24 PM
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
      last_update_time: Friday, 12 August 2022 1:20:24 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'Time Sheet: Initial Screen'
          properties:
          - property:
              value:
                value: CAT3
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
          last_update_time: Friday, 12 August 2022 1:20:24 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Display Times   (F6)
              properties:
              - property:
                  value:
                    value: btn[6]
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
                    value: wnd[0]/tbar[1]/btn[6]
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
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
          last_update_time: Friday, 12 August 2022 1:20:24 PM
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Resource Availability_2
          properties:
          - property:
              value:
                value: /ETSA/RES_REPORT
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
                value: /ETSA/RESOURCE_AVAILABILITY
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
          last_update_time: Friday, 12 August 2022 1:20:24 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Work Centre
              properties:
              - property:
                  value:
                    value: S_WRKCTR-LOW
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
                    value: wnd[0]/usr/ctxtS_WRKCTR-LOW
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: to
              properties:
              - property:
                  value:
                    value: S_DATE-HIGH
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
                    value: wnd[0]/usr/ctxtS_DATE-HIGH
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Date
              properties:
              - property:
                  value:
                    value: S_DATE-LOW
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
                    value: wnd[0]/usr/ctxtS_DATE-LOW
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Resource Availability
          properties:
          - property:
              value:
                value: /ETSA/RES_REPORT
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
          last_update_time: Friday, 12 August 2022 1:20:24 PM
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
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
              last_update_time: Friday, 12 August 2022 1:20:24 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
