namespace: FieldServicesAvailabilityRoster
operation:
  name: MetroRoster
  inputs:
    - metroRoster
    - employeeList
  sequential_action:
    gav: 'com.microfocus.seq:FieldServicesAvailabilityRoster.MetroRoster:1.0.1'
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
          object_path: DataTable
          action: ImportSheet
          args: 'Parameter("employeeList"), "ENERVEN", "Global"'
      - step:
          id: '2'
          object_path: DataTable
          action: ImportSheet
          args: 'Parameter("employeeList"), "CRANE", "Action1"'
      - step:
          id: '3'
          action: Script
          object_path: 'rowCnt = DataTable.GetSheet("Global").GetRowCount'
      - step:
          id: '4'
          action: Script
          object_path: 'Set oDicEMPListEnerven = CreateObject("Scripting.Dictionary")'
      - step:
          id: '5'
          action: Script
          object_path: 'Set oDicEMPListEnervenFridayNight = CreateObject("Scripting.Dictionary")'
      - step:
          id: '6'
          action: Script
          object_path: For i = 1 To rowCnt
      - step:
          id: '7'
          object_path: 'DataTable.GetSheet("Global")'
          action: SetCurrentRow(i)
      - step:
          id: '8'
          action: Script
          object_path: 'EN = DataTable.Value("EmployeeNumber","Global")'
      - step:
          id: '9'
          action: Script
          object_path: 'Name = DataTable.Value("Name","Global")'
      - step:
          id: '10'
          object_path: oDicEMPListEnerven
          action: Add
          args: 'EN,Name'
      - step:
          id: '11'
          action: Script
          object_path: EN = EMPTY
      - step:
          id: '12'
          action: Script
          object_path: Name = EMPTY
      - step:
          id: '13'
          action: Script
          object_path: Next
      - step:
          id: '14'
          action: Script
          object_path: 'rowCnt = DataTable.GetSheet("Action1").GetRowCount'
      - step:
          id: '15'
          action: Script
          object_path: 'Set oDicEMPListCrane = CreateObject("Scripting.Dictionary")'
      - step:
          id: '16'
          action: Script
          object_path: For i = 1 To rowCnt
      - step:
          id: '17'
          object_path: 'DataTable.GetSheet("Action1")'
          action: SetCurrentRow(i)
      - step:
          id: '18'
          action: Script
          object_path: 'EN = DataTable.Value("EmployeeNumber","Action1")'
      - step:
          id: '19'
          action: Script
          object_path: 'Name = DataTable.Value("Name","Action1")'
      - step:
          id: '20'
          object_path: oDicEMPListCrane
          action: Add
          args: 'EN,Name'
      - step:
          id: '21'
          action: Script
          object_path: EN = EMPTY
      - step:
          id: '22'
          action: Script
          object_path: Name = EMPTY
      - step:
          id: '23'
          action: Script
          object_path: Next
      - step:
          id: '24'
          action: Script
          object_path: 'newFile = Parameter("metroRoster")'
      - step:
          id: '25'
          action: Script
          object_path: 'Set xls = createObject("excel.application")'
      - step:
          id: '26'
          object_path: xls
          action: visible=True
      - step:
          id: '27'
          object_path: xls
          action: DisplayAlerts
          args: = False
      - step:
          id: '28'
          object_path: xls
          action: AskToUpdateLinks
          args: = False
      - step:
          id: '29'
          action: Script
          object_path: Set workbook = xls.workbooks.open(newFile)
      - step:
          id: '30'
          action: Script
          object_path: 'Set sheet = workbook.worksheets("Paid Availability - On Call")'
      - step:
          id: '31'
          action: Script
          object_path: 'dayCheck = Weekday(Date,vbSunday)'
      - step:
          id: '32'
          action: Script
          object_path: If dayCheck = 5 Then
      - step:
          id: '33'
          action: Script
          object_path: 'rptStartDate = Right("0" & DateValue(Date), 10)'
      - step:
          id: '34'
          action: Script
          object_path: Else
      - step:
          id: '35'
          action: Script
          object_path: dayCheck = 5 - dayCheck
      - step:
          id: '36'
          action: Script
          object_path: rptStartDate = Date + dayCheck
      - step:
          id: '37'
          action: Script
          object_path: 'rptStartDate = Right("0" & rptStartDate, 10)'
      - step:
          id: '38'
          action: Script
          object_path: End If
      - step:
          id: '39'
          object_path: 'sheet.cells(1,7)'
          action: Value
          args: = DateValue(rptStartDate)
      - step:
          id: '40'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '41'
          action: Script
          object_path: 'rptFromDate = Replace(Right("0" & DateValue(rptStartDate), 10),"/",".")'
      - step:
          id: '42'
          action: Script
          object_path: 'rptToDate = Replace(Right("0" & DateValue(rptStartDate) + 7, 10),"/",".")'
      - step:
          id: '43'
          action: Script
          object_path: "'Clear Tabs"
      - step:
          id: '44'
          action: Script
          object_path: 'fn_ClearExistingRecord 5,10'
      - step:
          id: '45'
          action: Script
          object_path: 'fn_ClearExistingRecord 14,16'
      - step:
          id: '46'
          action: Script
          object_path: 'fn_ClearExistingRecord 21,23'
      - step:
          id: '47'
          action: Script
          object_path: 'fn_ClearExistingRecord 27,29'
      - step:
          id: '48'
          action: Script
          object_path: 'fn_ClearExistingRecord 36,38'
      - step:
          id: '49'
          action: Script
          object_path: 'fn_ClearExistingRecord 45,49'
      - step:
          id: '50'
          action: Script
          object_path: 'fn_ClearExistingRecord 53,59'
      - step:
          id: '51'
          action: Script
          object_path: 'fn_ClearExistingRecord 63,69'
      - step:
          id: '52'
          action: Script
          object_path: 'fn_clearCBDTab 1,41'
      - step:
          id: '53'
          action: Script
          object_path: 'fn_clearElectricalServicesTab 1,60'
      - step:
          id: '54'
          action: Script
          object_path: 'fn_clearTab "EXTRA THUR",1,147'
      - step:
          id: '55'
          action: Script
          object_path: 'fn_clearTab "EXTRA FRI",1,103'
      - step:
          id: '56'
          action: Script
          object_path: 'fn_clearTab "EXTRA SAT",1,127'
      - step:
          id: '57'
          action: Script
          object_path: 'fn_clearTab "EXTRA SUN",1,153'
      - step:
          id: '58'
          action: Script
          object_path: 'fn_clearTab "EXTRA MON",1,116'
      - step:
          id: '59'
          action: Script
          object_path: 'fn_clearTab "EXTRA TUE",1,104'
      - step:
          id: '60'
          action: Script
          object_path: 'fn_clearTab "EXTRA WED",1,67'
      - step:
          id: '61'
          action: Script
          object_path: "'The following dictionaries will be used to hold all NORTH depos employees availability records to update \"NORTH TICK SHEET\""
      - step:
          id: '62'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay1 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '63'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay2 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '64'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay3 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '65'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay4 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '66'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay5 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '67'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay6 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '68'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay7 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '69'
          action: Script
          object_path: 'Set oDicNorthDepoWeekDay8 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '70'
          action: Script
          object_path: "'The following dictionaries will be used to hold all SOUTH depos employees availability records to update \"SOUTH TICK SHEET\""
      - step:
          id: '71'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay1 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '72'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay2 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '73'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay3 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '74'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay4 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '75'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay5 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '76'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay6 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '77'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay7 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '78'
          action: Script
          object_path: 'Set oDicSouthDepoWeekDay8 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '79'
          action: Script
          object_path: "'List of Depo-wise Employee Numbers"
      - step:
          id: '80'
          action: Script
          object_path: 'Set oDicNorthEMPList =  CreateObject("Scripting.Dictionary")'
      - step:
          id: '81'
          action: Script
          object_path: 'Set oDicNorthEMPListDutyOfficer =  CreateObject("Scripting.Dictionary")'
      - step:
          id: '82'
          action: Script
          object_path: 'Set oDicSouthEMPList =  CreateObject("Scripting.Dictionary")'
      - step:
          id: '83'
          action: Script
          object_path: 'Set oDicSouthEMPListDutyOfficer =  CreateObject("Scripting.Dictionary")'
      - step:
          id: '84'
          action: Script
          object_path: 'Set oDicWingFieldEMPList =  CreateObject("Scripting.Dictionary")'
      - step:
          id: '85'
          object_path: "'SAPGuiUtil"
          action: AutoLogon
          args: '"ERP - CAQ - Quality Assurance", "410", Parameter("SAP_UserID"),Parameter("SAP_Password"), ""'
      - step:
          id: '86'
          action: Script
          object_path: "'If Not SAPGuiSession(\"Session\").SAPGuiWindow(\"SAP Easy Access\").SAPGuiOKCode(\"OKCode\").Exist(1) Then"
      - step:
          id: '87'
          action: Script
          object_path: "'\tscreenShotFileLocation = \"C:\\Temp\\SAP_Login_Failed.png\""
      - step:
          id: '88'
          action: Script
          object_path: "'\tDesktop.CaptureBitmap screenShotFileLocation ,true"
      - step:
          id: '89'
          action: Script
          object_path: "'\tReporter.ReportEvent micWarning, \"Step\", \"Unable to login to SAP.\", screenShotFileLocation"
      - step:
          id: '90'
          action: Script
          object_path: "'\tfn_SendResultAsEmail EmailTo, \"Failed to login to SAP.\", \"Failed to login to SAP. Process execution aborted!\", screenShotFileLocation"
      - step:
          id: '91'
          action: Script
          object_path: "'\tSystemUtil.CloseProcessByName(\"saplogon.exe\")"
      - step:
          id: '92'
          action: Script
          object_path: "'\tExitTest"
      - step:
          id: '93'
          action: Script
          object_path: "'End If"
      - step:
          id: '94'
          action: Script
          object_path: "'SAP CODING"
      - step:
          id: '95'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/n/ETSA/RES_REPORT"'
      - step:
          id: '96'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")'
          action: SendKey
          args: ENTER
      - step:
          id: '97'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet "PL-ELZ",rptFromDate,rptToDate,"NORTH","5"'
      - step:
          id: '98'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet "PL-HHL",rptFromDate,rptToDate,"NORTH","14"'
      - step:
          id: '99'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet"PL-WIN",rptFromDate,rptToDate,"NORTH","21"'
      - step:
          id: '100'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet"PL-MAR",rptFromDate,rptToDate,"SOUTH","27"'
      - step:
          id: '101'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet"PL-STM",rptFromDate,rptToDate,"SOUTH","36"'
      - step:
          id: '102'
          action: Script
          object_path: 'fn_Fillup_PaidAvailability_OnCall_Sheet"PL-MOR",rptFromDate,rptToDate,"SOUTH","45"'
      - step:
          id: '103'
          action: Script
          object_path: 'fn_FillupAVL2 53,59,"NORTH"'
      - step:
          id: '104'
          action: Script
          object_path: 'fn_FillupAVL2 63,69,"SOUTH"'
      - step:
          id: '105'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '106'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"CAT2"'
      - step:
          id: '107'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: SendKey
          args: ENTER
      - step:
          id: '108'
          action: Script
          object_path: For each key in oDicNorthEMPList.Keys
      - step:
          id: '109'
          action: Script
          object_path: 'fn_FridayNightShiftAndDutyOfficer key,rptFromDate,"North"'
      - step:
          id: '110'
          action: Script
          object_path: Next
      - step:
          id: '111'
          action: Script
          object_path: For each key in oDicSouthEMPList.Keys
      - step:
          id: '112'
          action: Script
          object_path: 'fn_FridayNightShiftAndDutyOfficer key,rptFromDate,"South"'
      - step:
          id: '113'
          action: Script
          object_path: Next
      - step:
          id: '114'
          action: Script
          object_path: For each key in oDicEMPListEnerven.Keys
      - step:
          id: '115'
          action: Script
          object_path: 'fn_FridayNightShiftEnerven key,rptFromDate'
      - step:
          id: '116'
          action: Script
          object_path: Next
      - step:
          id: '117'
          action: Script
          object_path: 'Set oDicNorthEMPListDup = CreateObject("Scripting.Dictionary")'
      - step:
          id: '118'
          action: Script
          object_path: For Each key in oDicNorthEMPList.Keys
      - step:
          id: '119'
          object_path: oDicNorthEMPListDup
          action: Add
          args: 'key, oDicNorthEMPList(key)'
      - step:
          id: '120'
          action: Script
          object_path: Next
      - step:
          id: '121'
          action: Script
          object_path: 'Set oDicSouthEMPListDup = CreateObject("Scripting.Dictionary")'
      - step:
          id: '122'
          action: Script
          object_path: For Each key in oDicSouthEMPList.Keys
      - step:
          id: '123'
          object_path: oDicSouthEMPListDup
          action: Add
          args: 'key, oDicSouthEMPList(key)'
      - step:
          id: '124'
          action: Script
          object_path: Next
      - step:
          id: '125'
          action: Script
          object_path: For each key in oDicNorthEMPListDup.Keys
      - step:
          id: '126'
          action: Script
          object_path: If oDicWingFieldEMPList.Exists(key) Then
      - step:
          id: '127'
          object_path: oDicWingFieldEMPList.Item(key) = oDicNorthEMPListDup
          action: Item(key)
      - step:
          id: '128'
          action: Script
          object_path: End If
      - step:
          id: '129'
          action: Script
          object_path: Next
      - step:
          id: '130'
          action: Script
          object_path: For each key in oDicWingFieldEMPList.Keys
      - step:
          id: '131'
          object_path: oDicNorthEMPListDup
          action: Remove(key)
      - step:
          id: '132'
          object_path: 'oDicSouthEMPListDup.Add key,oDicWingFieldEMPList'
          action: Item(key)
      - step:
          id: '133'
          action: Script
          object_path: Next
      - step:
          id: '134'
          action: Script
          object_path: 'fn_FillupFridayNightShift 53,59,"NORTH"'
      - step:
          id: '135'
          action: Script
          object_path: 'fn_FillupFridayNightShift 63,69,"SOUTH"'
      - step:
          id: '136'
          action: Script
          object_path: For Each key in oDicNorthEMPListDutyOfficer.Keys
      - step:
          id: '137'
          action: Script
          object_path: 'If oDicNorthEMPListDutyOfficer.Item(key) = "D1" Then'
      - step:
          id: '138'
          action: Script
          object_path: NorthDutyOfficer = key
      - step:
          id: '139'
          action: Script
          object_path: Exit For
      - step:
          id: '140'
          action: Script
          object_path: End If
      - step:
          id: '141'
          action: Script
          object_path: Next
      - step:
          id: '142'
          action: Script
          object_path: For Each key in oDicSouthEMPListDutyOfficer.Keys
      - step:
          id: '143'
          action: Script
          object_path: 'If oDicSouthEMPListDutyOfficer.Item(key) = "D1" Then'
      - step:
          id: '144'
          action: Script
          object_path: SouthDutyOfficer = key
      - step:
          id: '145'
          action: Script
          object_path: Exit For
      - step:
          id: '146'
          action: Script
          object_path: End If
      - step:
          id: '147'
          action: Script
          object_path: Next
      - step:
          id: '148'
          action: Script
          object_path: 'Set sheet4 = workbook.worksheets("Master Contact Numbers ")'
      - step:
          id: '149'
          action: Script
          object_path: sheet4Rows = sheet4.usedrange.rows.count
      - step:
          id: '150'
          action: Script
          object_path: For i = 3 To sheet4Rows
      - step:
          id: '151'
          action: Script
          object_path: 'If Trim(sheet4.Cells(i,1)) = Trim(NorthDutyOfficer) Then'
      - step:
          id: '152'
          action: Script
          object_path: 'NorthDutyOfficerName = Trim(sheet4.Cells(i,2)) & " " & Trim(sheet4.Cells(i,3))'
      - step:
          id: '153'
          action: Script
          object_path: 'NorthDutyOfficerContact = Trim(sheet4.Cells(i,5))'
      - step:
          id: '154'
          action: Script
          object_path: End If
      - step:
          id: '155'
          action: Script
          object_path: 'If Trim(sheet4.Cells(i,1)) = Trim(SouthDutyOfficer) Then'
      - step:
          id: '156'
          action: Script
          object_path: 'SouthDutyOfficerName = Trim(sheet4.Cells(i,2)) & " " & Trim(sheet4.Cells(i,3))'
      - step:
          id: '157'
          action: Script
          object_path: 'SouthDutyOfficerContact = Trim(sheet4.Cells(i,5))'
      - step:
          id: '158'
          action: Script
          object_path: End If
      - step:
          id: '159'
          action: Script
          object_path: Next
      - step:
          id: '160'
          object_path: sheet
          action: 'Cells(77,7)'
          args: '= ""'
      - step:
          id: '161'
          object_path: sheet
          action: 'Cells(77,9)'
          args: '= ""'
      - step:
          id: '162'
          object_path: sheet
          action: 'Cells(77,14)'
          args: '= ""'
      - step:
          id: '163'
          object_path: sheet
          action: 'Cells(77,16)'
          args: '= ""'
      - step:
          id: '164'
          object_path: sheet
          action: 'Cells(77,7)'
          args: = NorthDutyOfficerName
      - step:
          id: '165'
          object_path: sheet
          action: 'Cells(77,9)'
          args: = NorthDutyOfficerContact
      - step:
          id: '166'
          object_path: sheet
          action: 'Cells(77,14)'
          args: = SouthDutyOfficerName
      - step:
          id: '167'
          object_path: sheet
          action: 'Cells(77,16)'
          args: = SouthDutyOfficerContact
      - step:
          id: '168'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '169'
          action: Script
          object_path: 'Set sheet2 = workbook.worksheets("NORTH TICK SHEET")'
      - step:
          id: '170'
          object_path: sheet2
          action: Unprotect
      - step:
          id: '171'
          action: Script
          object_path: sheet2Rows = sheet2.usedrange.rows.count
      - step:
          id: '172'
          action: Script
          object_path: For i = 1 To sheet2Rows
      - step:
          id: '173'
          action: Script
          object_path: "'If sheet.cells(i,1).value <> \"\" Then"
      - step:
          id: '174'
          action: Script
          object_path: 'if VarType(sheet2.Range("A" & i).Value) <> vberror Then'
      - step:
          id: '175'
          action: Script
          object_path: 'If IsNumeric(sheet2.Range("A" & i).Value) Then'
      - step:
          id: '176'
          action: Script
          object_path: 'If oDicNorthDepoWeekDay1.Exists(Cstr(sheet2.Range("A" & i).Value)) Then'
      - step:
          id: '177'
          object_path: 'sheet2.Cells(i,9) = oDicNorthDepoWeekDay1.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '178'
          object_path: 'sheet2.Cells(i,10) = oDicNorthDepoWeekDay2.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '179'
          object_path: 'sheet2.Cells(i,11) = oDicNorthDepoWeekDay3.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '180'
          object_path: 'sheet2.Cells(i,12) = oDicNorthDepoWeekDay4.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '181'
          object_path: 'sheet2.Cells(i,13) = oDicNorthDepoWeekDay5.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '182'
          object_path: 'sheet2.Cells(i,14) = oDicNorthDepoWeekDay6.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '183'
          object_path: 'sheet2.Cells(i,15) = oDicNorthDepoWeekDay7.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '184'
          object_path: 'sheet2.Cells(i,16) = oDicNorthDepoWeekDay8.Item(Cstr(sheet2.Range("A" & i)'
          action: Value))
      - step:
          id: '185'
          action: Script
          object_path: End If
      - step:
          id: '186'
          action: Script
          object_path: End If
      - step:
          id: '187'
          action: Script
          object_path: End If
      - step:
          id: '188'
          action: Script
          object_path: Next
      - step:
          id: '189'
          object_path: sheet2
          action: Protect
      - step:
          id: '190'
          action: Script
          object_path: 'Set sheet3 = workbook.worksheets("SOUTH TICK SHEET ")'
      - step:
          id: '191'
          object_path: sheet3
          action: Unprotect
      - step:
          id: '192'
          action: Script
          object_path: sheet3Rows = sheet3.usedrange.rows.count
      - step:
          id: '193'
          action: Script
          object_path: For i = 1 To sheet3Rows
      - step:
          id: '194'
          action: Script
          object_path: "'If sheet.cells(i,1).value <> \"\" Then"
      - step:
          id: '195'
          action: Script
          object_path: 'if VarType(sheet3.Range("A" & i).Value) <> vberror Then'
      - step:
          id: '196'
          action: Script
          object_path: 'If IsNumeric(sheet3.Range("A" & i).Value) Then'
      - step:
          id: '197'
          action: Script
          object_path: 'If oDicSouthDepoWeekDay1.Exists(Cstr(sheet3.Range("A" & i).Value)) Then'
      - step:
          id: '198'
          object_path: 'sheet3.Cells(i,9) = oDicSouthDepoWeekDay1.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '199'
          object_path: 'sheet3.Cells(i,10) = oDicSouthDepoWeekDay2.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '200'
          object_path: 'sheet3.Cells(i,11) = oDicSouthDepoWeekDay3.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '201'
          object_path: 'sheet3.Cells(i,12) = oDicSouthDepoWeekDay4.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '202'
          object_path: 'sheet3.Cells(i,13) = oDicSouthDepoWeekDay5.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '203'
          object_path: 'sheet3.Cells(i,14) = oDicSouthDepoWeekDay6.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '204'
          object_path: 'sheet3.Cells(i,15) = oDicSouthDepoWeekDay7.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '205'
          object_path: 'sheet3.Cells(i,16) = oDicSouthDepoWeekDay8.Item(Cstr(sheet3.Range("A" & i)'
          action: Value))
      - step:
          id: '206'
          action: Script
          object_path: End If
      - step:
          id: '207'
          action: Script
          object_path: End If
      - step:
          id: '208'
          action: Script
          object_path: End If
      - step:
          id: '209'
          action: Script
          object_path: Next
      - step:
          id: '210'
          object_path: sheet3
          action: Protect
      - step:
          id: '211'
          object_path: workbook
          action: Save
      - step:
          id: '212'
          object_path: workbook
          action: Close
      - step:
          id: '213'
          object_path: xls
          action: Quit
      - step:
          id: '214'
          action: Script
          object_path: "'Close SAP"
      - step:
          id: '215'
          object_path: SystemUtil
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '216'
          action: Script
          object_path: "'Clear Variables"
      - step:
          id: '217'
          action: Script
          object_path: newFile = EMPTY
      - step:
          id: '218'
          action: Script
          object_path: Set xls = NOTHING
      - step:
          id: '219'
          action: Script
          object_path: Set workbook = NOTHING
      - step:
          id: '220'
          action: Script
          object_path: dayCheck = EMPTY
      - step:
          id: '221'
          action: Script
          object_path: rptStartDate = EMPTY
      - step:
          id: '222'
          action: Script
          object_path: rptFromDate = EMPTY
      - step:
          id: '223'
          action: Script
          object_path: rptToDate = EMPTY
      - step:
          id: '224'
          action: Script
          object_path: Set oDicNorthDepoWeekDay1 = NOTHING
      - step:
          id: '225'
          action: Script
          object_path: Set oDicNorthDepoWeekDay2 = NOTHING
      - step:
          id: '226'
          action: Script
          object_path: Set oDicNorthDepoWeekDay3 = NOTHING
      - step:
          id: '227'
          action: Script
          object_path: Set oDicNorthDepoWeekDay4 = NOTHING
      - step:
          id: '228'
          action: Script
          object_path: Set oDicNorthDepoWeekDay5 = NOTHING
      - step:
          id: '229'
          action: Script
          object_path: Set oDicNorthDepoWeekDay6 = NOTHING
      - step:
          id: '230'
          action: Script
          object_path: Set oDicNorthDepoWeekDay7 = NOTHING
      - step:
          id: '231'
          action: Script
          object_path: Set oDicNorthDepoWeekDay8 = NOTHING
      - step:
          id: '232'
          action: Script
          object_path: Set oDicSouthDepoWeekDay1 = NOTHING
      - step:
          id: '233'
          action: Script
          object_path: Set oDicSouthDepoWeekDay2 = NOTHING
      - step:
          id: '234'
          action: Script
          object_path: Set oDicSouthDepoWeekDay3 = NOTHING
      - step:
          id: '235'
          action: Script
          object_path: Set oDicSouthDepoWeekDay4 = NOTHING
      - step:
          id: '236'
          action: Script
          object_path: Set oDicSouthDepoWeekDay5 = NOTHING
      - step:
          id: '237'
          action: Script
          object_path: Set oDicSouthDepoWeekDay6 = NOTHING
      - step:
          id: '238'
          action: Script
          object_path: Set oDicSouthDepoWeekDay7 = NOTHING
      - step:
          id: '239'
          action: Script
          object_path: Set oDicSouthDepoWeekDay8 = NOTHING
      - step:
          id: '240'
          action: Script
          object_path: Set oDicNorthEMPList = NOTHING
      - step:
          id: '241'
          action: Script
          object_path: Set oDicNorthEMPListDup = NOTHING
      - step:
          id: '242'
          action: Script
          object_path: Set oDicNorthEMPListDutyOfficer = NOTHING
      - step:
          id: '243'
          action: Script
          object_path: Set oDicSouthEMPList = NOTHING
      - step:
          id: '244'
          action: Script
          object_path: Set oDicSouthEMPListDup = NOTHING
      - step:
          id: '245'
          action: Script
          object_path: Set oDicSouthEMPListDutyOfficer = NOTHING
      - step:
          id: '246'
          action: Script
          object_path: Set oDicWingFieldEMPList = NOTHING
      - step:
          id: '247'
          action: Script
          object_path: Set sheet2 = NOTHING
      - step:
          id: '248'
          action: Script
          object_path: sheet2Rows = EMPTY
      - step:
          id: '249'
          action: Script
          object_path: i = EMPTY
      - step:
          id: '250'
          action: Script
          object_path: Set sheet3 = NOTHING
      - step:
          id: '251'
          action: Script
          object_path: ExitTest
      - step:
          id: '252'
          action: Script
          object_path: 'Function fn_Fillup_PaidAvailability_OnCall_Sheet(WorkCentre,FromDate,ToDate,Zone,DepotRowStartFromAVL1)'
      - step:
          id: '253'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("Work Centre")'
          action: Set
          args: WorkCentre
      - step:
          id: '254'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("Date")'
          action: Set
          args: FromDate
      - step:
          id: '255'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiEdit("to")'
          action: Set
          args: ToDate
      - step:
          id: '256'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability_2").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '257'
          action: Script
          object_path: 'row = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").RowCount'
      - step:
          id: '258'
          action: Script
          object_path: "'The following dictionaries will be used to hold depo-wise employee availability records to update \"Paid Availability - On Call\" sheet"
      - step:
          id: '259'
          action: Script
          object_path: 'Set oDicWeekDay1 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '260'
          action: Script
          object_path: 'Set oDicWeekDay2 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '261'
          action: Script
          object_path: 'Set oDicWeekDay3 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '262'
          action: Script
          object_path: 'Set oDicWeekDay4 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '263'
          action: Script
          object_path: 'Set oDicWeekDay5 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '264'
          action: Script
          object_path: 'Set oDicWeekDay6 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '265'
          action: Script
          object_path: 'Set oDicWeekDay7 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '266'
          action: Script
          object_path: 'Set oDicWeekDay8 = CreateObject("Scripting.Dictionary")'
      - step:
          id: '267'
          action: Script
          object_path: For i = 1 To row
      - step:
          id: '268'
          action: Script
          object_path: 'EmpNum = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#1")'
      - step:
          id: '269'
          action: Script
          object_path: 'If WorkCentre = "PL-ELZ" Then'
      - step:
          id: '270'
          object_path: oDicNorthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '271'
          object_path: oDicNorthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '272'
          action: Script
          object_path: 'ElseIf WorkCentre = "PL-HHL" Then'
      - step:
          id: '273'
          object_path: oDicNorthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '274'
          object_path: oDicNorthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '275'
          action: Script
          object_path: 'ElseIf WorkCentre = "PL-WIN" Then'
      - step:
          id: '276'
          object_path: oDicNorthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '277'
          object_path: oDicWingFieldEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '278'
          object_path: oDicNorthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '279'
          action: Script
          object_path: 'ElseIf WorkCentre = "PL-MAR" Then'
      - step:
          id: '280'
          object_path: oDicSouthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '281'
          object_path: oDicSouthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '282'
          action: Script
          object_path: 'ElseIf WorkCentre = "PL-STM" Then'
      - step:
          id: '283'
          object_path: oDicSouthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '284'
          object_path: oDicSouthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '285'
          action: Script
          object_path: 'ElseIf WorkCentre = "PL-MOR" Then'
      - step:
          id: '286'
          object_path: oDicSouthEMPList
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '287'
          object_path: oDicSouthEMPListDutyOfficer
          action: Add
          args: 'EmpNum,1'
      - step:
          id: '288'
          action: Script
          object_path: End If
      - step:
          id: '289'
          action: Script
          object_path: "'Print DateValue(rptStartDate)"
      - step:
          id: '290'
          action: Script
          object_path: 'availWeekDay1 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#6")'
      - step:
          id: '291'
          object_path: oDicWeekDay1
          action: "Add\t"
          args: 'EmpNum,availWeekDay1'
      - step:
          id: '292'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '293'
          object_path: oDicNorthDepoWeekDay1
          action: Add
          args: 'EmpNum,availWeekDay1'
      - step:
          id: '294'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '295'
          object_path: oDicSouthDepoWeekDay1
          action: Add
          args: 'EmpNum,availWeekDay1'
      - step:
          id: '296'
          action: Script
          object_path: End  If
      - step:
          id: '297'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 1"
      - step:
          id: '298'
          action: Script
          object_path: 'availWeekDay2 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#7")'
      - step:
          id: '299'
          object_path: oDicWeekDay2
          action: "Add\t"
          args: 'EmpNum,availWeekDay2'
      - step:
          id: '300'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '301'
          object_path: oDicNorthDepoWeekDay2
          action: Add
          args: 'EmpNum,availWeekDay2'
      - step:
          id: '302'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '303'
          object_path: oDicSouthDepoWeekDay2
          action: Add
          args: 'EmpNum,availWeekDay2'
      - step:
          id: '304'
          action: Script
          object_path: End  If
      - step:
          id: '305'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 2"
      - step:
          id: '306'
          action: Script
          object_path: 'availWeekDay3 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#8")'
      - step:
          id: '307'
          object_path: oDicWeekDay3
          action: "Add\t"
          args: 'EmpNum,availWeekDay3'
      - step:
          id: '308'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '309'
          object_path: oDicNorthDepoWeekDay3
          action: Add
          args: 'EmpNum,availWeekDay3'
      - step:
          id: '310'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '311'
          object_path: oDicSouthDepoWeekDay3
          action: Add
          args: 'EmpNum,availWeekDay3'
      - step:
          id: '312'
          action: Script
          object_path: End  If
      - step:
          id: '313'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 3"
      - step:
          id: '314'
          action: Script
          object_path: 'availWeekDay4 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#9")'
      - step:
          id: '315'
          object_path: oDicWeekDay4
          action: "Add\t"
          args: 'EmpNum,availWeekDay4'
      - step:
          id: '316'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '317'
          object_path: oDicNorthDepoWeekDay4
          action: Add
          args: 'EmpNum,availWeekDay4'
      - step:
          id: '318'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '319'
          object_path: oDicSouthDepoWeekDay4
          action: Add
          args: 'EmpNum,availWeekDay4'
      - step:
          id: '320'
          action: Script
          object_path: End  If
      - step:
          id: '321'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 4"
      - step:
          id: '322'
          action: Script
          object_path: 'availWeekDay5 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#10")'
      - step:
          id: '323'
          object_path: oDicWeekDay5
          action: "Add\t"
          args: 'EmpNum,availWeekDay5'
      - step:
          id: '324'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '325'
          object_path: oDicNorthDepoWeekDay5
          action: Add
          args: 'EmpNum,availWeekDay5'
      - step:
          id: '326'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '327'
          object_path: oDicSouthDepoWeekDay5
          action: Add
          args: 'EmpNum,availWeekDay5'
      - step:
          id: '328'
          action: Script
          object_path: End  If
      - step:
          id: '329'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 5"
      - step:
          id: '330'
          action: Script
          object_path: 'availWeekDay6 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#11")'
      - step:
          id: '331'
          object_path: oDicWeekDay6
          action: "Add\t"
          args: 'EmpNum,availWeekDay6'
      - step:
          id: '332'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '333'
          object_path: oDicNorthDepoWeekDay6
          action: Add
          args: 'EmpNum,availWeekDay6'
      - step:
          id: '334'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '335'
          object_path: oDicSouthDepoWeekDay6
          action: Add
          args: 'EmpNum,availWeekDay6'
      - step:
          id: '336'
          action: Script
          object_path: End  If
      - step:
          id: '337'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 6"
      - step:
          id: '338'
          action: Script
          object_path: 'availWeekDay7 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#12")'
      - step:
          id: '339'
          object_path: oDicWeekDay7
          action: "Add\t"
          args: 'EmpNum,availWeekDay7'
      - step:
          id: '340'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '341'
          object_path: oDicNorthDepoWeekDay7
          action: Add
          args: 'EmpNum,availWeekDay7'
      - step:
          id: '342'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '343'
          object_path: oDicSouthDepoWeekDay7
          action: Add
          args: 'EmpNum,availWeekDay7'
      - step:
          id: '344'
          action: Script
          object_path: End  If
      - step:
          id: '345'
          action: Script
          object_path: "'Print DateValue(rptStartDate) + 7"
      - step:
          id: '346'
          action: Script
          object_path: 'availWeekDay8 = SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiGrid("GridViewCtrl").GetCellData(i,"#13")'
      - step:
          id: '347'
          object_path: oDicWeekDay8
          action: "Add\t"
          args: 'EmpNum,availWeekDay8'
      - step:
          id: '348'
          action: Script
          object_path: 'If LCase(Zone) = "north" then'
      - step:
          id: '349'
          object_path: oDicNorthDepoWeekDay8
          action: Add
          args: 'EmpNum,availWeekDay8'
      - step:
          id: '350'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '351'
          object_path: oDicSouthDepoWeekDay8
          action: Add
          args: 'EmpNum,availWeekDay8'
      - step:
          id: '352'
          action: Script
          object_path: End  If
      - step:
          id: '353'
          action: Script
          object_path: "'Print \"########################################################################################################\""
      - step:
          id: '354'
          action: Script
          object_path: Next
      - step:
          id: '355'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Resource Availability").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '356'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '357'
          action: Script
          object_path: For each key in oDicWeekDay1.Keys
      - step:
          id: '358'
          action: Script
          object_path: 'If InStr(oDicWeekDay1.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '359'
          object_path: sheet
          action: 'Cells(cnt,4)'
          args: = key
      - step:
          id: '360'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '361'
          action: Script
          object_path: End If
      - step:
          id: '362'
          action: Script
          object_path: Next
      - step:
          id: '363'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '364'
          action: Script
          object_path: For each key in oDicWeekDay2.Keys
      - step:
          id: '365'
          action: Script
          object_path: 'If InStr(oDicWeekDay2.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '366'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '367'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '368'
          action: Script
          object_path: End If
      - step:
          id: '369'
          action: Script
          object_path: Next
      - step:
          id: '370'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '371'
          action: Script
          object_path: For each key in oDicWeekDay3.Keys
      - step:
          id: '372'
          action: Script
          object_path: 'If InStr(oDicWeekDay3.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '373'
          object_path: sheet
          action: 'Cells(cnt,20)'
          args: = key
      - step:
          id: '374'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '375'
          action: Script
          object_path: End If
      - step:
          id: '376'
          action: Script
          object_path: Next
      - step:
          id: '377'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '378'
          action: Script
          object_path: For each key in oDicWeekDay4.Keys
      - step:
          id: '379'
          action: Script
          object_path: 'If InStr(oDicWeekDay4.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '380'
          object_path: sheet
          action: 'Cells(cnt,28)'
          args: = key
      - step:
          id: '381'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '382'
          action: Script
          object_path: End If
      - step:
          id: '383'
          action: Script
          object_path: Next
      - step:
          id: '384'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '385'
          action: Script
          object_path: For each key in oDicWeekDay5.Keys
      - step:
          id: '386'
          action: Script
          object_path: 'If InStr(oDicWeekDay5.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '387'
          object_path: sheet
          action: 'Cells(cnt,36)'
          args: = key
      - step:
          id: '388'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '389'
          action: Script
          object_path: End If
      - step:
          id: '390'
          action: Script
          object_path: Next
      - step:
          id: '391'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '392'
          action: Script
          object_path: For each key in oDicWeekDay6.Keys
      - step:
          id: '393'
          action: Script
          object_path: 'If InStr(oDicWeekDay6.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '394'
          object_path: sheet
          action: 'Cells(cnt,44)'
          args: = key
      - step:
          id: '395'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '396'
          action: Script
          object_path: End If
      - step:
          id: '397'
          action: Script
          object_path: Next
      - step:
          id: '398'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '399'
          action: Script
          object_path: For each key in oDicWeekDay7.Keys
      - step:
          id: '400'
          action: Script
          object_path: 'If InStr(oDicWeekDay7.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '401'
          object_path: sheet
          action: 'Cells(cnt,52)'
          args: = key
      - step:
          id: '402'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '403'
          action: Script
          object_path: End If
      - step:
          id: '404'
          action: Script
          object_path: Next
      - step:
          id: '405'
          action: Script
          object_path: cnt = DepotRowStartFromAVL1
      - step:
          id: '406'
          action: Script
          object_path: For each key in oDicWeekDay8.Keys
      - step:
          id: '407'
          action: Script
          object_path: 'If InStr(oDicWeekDay8.Item(key),"AVL(1)") > 0 And Not oDicEMPListCrane.Exists(key) Then'
      - step:
          id: '408'
          object_path: sheet
          action: 'Cells(cnt,60)'
          args: = key
      - step:
          id: '409'
          action: Script
          object_path: cnt = cnt +1
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
          object_path: Set oDicWeekDay1 = NOTHING
      - step:
          id: '413'
          action: Script
          object_path: Set oDicWeekDay2 = NOTHING
      - step:
          id: '414'
          action: Script
          object_path: Set oDicWeekDay3 = NOTHING
      - step:
          id: '415'
          action: Script
          object_path: Set oDicWeekDay4 = NOTHING
      - step:
          id: '416'
          action: Script
          object_path: Set oDicWeekDay5 = NOTHING
      - step:
          id: '417'
          action: Script
          object_path: Set oDicWeekDay6 = NOTHING
      - step:
          id: '418'
          action: Script
          object_path: Set oDicWeekDay7 = NOTHING
      - step:
          id: '419'
          action: Script
          object_path: Set oDicWeekDay8 = NOTHING
      - step:
          id: '420'
          action: Script
          object_path: DepotRowStartFromAVL1 = EMPTY
      - step:
          id: '421'
          action: Script
          object_path: End Function
      - step:
          id: '422'
          action: Script
          object_path: 'Function fn_ClearExistingRecord(fromRow,ToRow)'
      - step:
          id: '423'
          action: Script
          object_path: For i = FromRow To ToRow
      - step:
          id: '424'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '425'
          object_path: 'sheet.Range("D" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '426'
          object_path: 'sheet.Range("I" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '427'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '428'
          object_path: 'sheet.Range("L" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '429'
          object_path: 'sheet.Range("Q" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '430'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '431'
          object_path: 'sheet.Range("T" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '432'
          object_path: 'sheet.Range("Y" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '433'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '434'
          object_path: 'sheet.Range("AB" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '435'
          object_path: 'sheet.Range("AG" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '436'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '437'
          object_path: 'sheet.Range("AJ" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '438'
          object_path: 'sheet.Range("AO" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '439'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '440'
          object_path: 'sheet.Range("AR" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '441'
          object_path: 'sheet.Range("AW" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '442'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '443'
          object_path: 'sheet.Range("AZ" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '444'
          object_path: 'sheet.Range("BE" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '445'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '446'
          object_path: 'sheet.Range("BH" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '447'
          object_path: 'sheet.Range("BM" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '448'
          action: Script
          object_path: Next
      - step:
          id: '449'
          action: Script
          object_path: End Function
      - step:
          id: '450'
          action: Script
          object_path: 'Function fn_FillupAVL2(FromRow,ToRow,Zone)'
      - step:
          id: '451'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '452'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '453'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay1.Keys
      - step:
          id: '454'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay1.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '455'
          object_path: sheet
          action: 'Cells(cnt,4)'
          args: = key
      - step:
          id: '456'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '457'
          action: Script
          object_path: End If
      - step:
          id: '458'
          action: Script
          object_path: Next
      - step:
          id: '459'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '460'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay1.Keys
      - step:
          id: '461'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay1.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '462'
          object_path: sheet
          action: 'Cells(cnt,4)'
          args: = key
      - step:
          id: '463'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '464'
          action: Script
          object_path: End If
      - step:
          id: '465'
          action: Script
          object_path: Next
      - step:
          id: '466'
          action: Script
          object_path: End If
      - step:
          id: '467'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '468'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '469'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay2.Keys
      - step:
          id: '470'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay2.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '471'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '472'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '473'
          action: Script
          object_path: End If
      - step:
          id: '474'
          action: Script
          object_path: Next
      - step:
          id: '475'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '476'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay2.Keys
      - step:
          id: '477'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay2.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '478'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '479'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '480'
          action: Script
          object_path: End If
      - step:
          id: '481'
          action: Script
          object_path: Next
      - step:
          id: '482'
          action: Script
          object_path: End If
      - step:
          id: '483'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '484'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '485'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay3.Keys
      - step:
          id: '486'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay3.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '487'
          object_path: sheet
          action: 'Cells(cnt,20)'
          args: = key
      - step:
          id: '488'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '489'
          action: Script
          object_path: End If
      - step:
          id: '490'
          action: Script
          object_path: Next
      - step:
          id: '491'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '492'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay3.Keys
      - step:
          id: '493'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay3.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '494'
          object_path: sheet
          action: 'Cells(cnt,20)'
          args: = key
      - step:
          id: '495'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '496'
          action: Script
          object_path: End If
      - step:
          id: '497'
          action: Script
          object_path: Next
      - step:
          id: '498'
          action: Script
          object_path: End If
      - step:
          id: '499'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '500'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '501'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay4.Keys
      - step:
          id: '502'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay4.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '503'
          object_path: sheet
          action: 'Cells(cnt,28)'
          args: = key
      - step:
          id: '504'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '505'
          action: Script
          object_path: End If
      - step:
          id: '506'
          action: Script
          object_path: Next
      - step:
          id: '507'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '508'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay4.Keys
      - step:
          id: '509'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay4.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '510'
          object_path: sheet
          action: 'Cells(cnt,28)'
          args: = key
      - step:
          id: '511'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '512'
          action: Script
          object_path: End If
      - step:
          id: '513'
          action: Script
          object_path: Next
      - step:
          id: '514'
          action: Script
          object_path: End If
      - step:
          id: '515'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '516'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '517'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay5.Keys
      - step:
          id: '518'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay5.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '519'
          object_path: sheet
          action: 'Cells(cnt,36)'
          args: = key
      - step:
          id: '520'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '521'
          action: Script
          object_path: End If
      - step:
          id: '522'
          action: Script
          object_path: Next
      - step:
          id: '523'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '524'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay5.Keys
      - step:
          id: '525'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay5.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '526'
          object_path: sheet
          action: 'Cells(cnt,36)'
          args: = key
      - step:
          id: '527'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '528'
          action: Script
          object_path: End If
      - step:
          id: '529'
          action: Script
          object_path: Next
      - step:
          id: '530'
          action: Script
          object_path: End If
      - step:
          id: '531'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '532'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '533'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay6.Keys
      - step:
          id: '534'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay6.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '535'
          object_path: sheet
          action: 'Cells(cnt,44)'
          args: = key
      - step:
          id: '536'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '537'
          action: Script
          object_path: End If
      - step:
          id: '538'
          action: Script
          object_path: Next
      - step:
          id: '539'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '540'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay6.Keys
      - step:
          id: '541'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay6.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '542'
          object_path: sheet
          action: 'Cells(cnt,44)'
          args: = key
      - step:
          id: '543'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '544'
          action: Script
          object_path: End If
      - step:
          id: '545'
          action: Script
          object_path: Next
      - step:
          id: '546'
          action: Script
          object_path: End If
      - step:
          id: '547'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '548'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '549'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay7.Keys
      - step:
          id: '550'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay7.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '551'
          object_path: sheet
          action: 'Cells(cnt,52)'
          args: = key
      - step:
          id: '552'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '553'
          action: Script
          object_path: End If
      - step:
          id: '554'
          action: Script
          object_path: Next
      - step:
          id: '555'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '556'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay7.Keys
      - step:
          id: '557'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay7.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '558'
          object_path: sheet
          action: 'Cells(cnt,52)'
          args: = key
      - step:
          id: '559'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '560'
          action: Script
          object_path: End If
      - step:
          id: '561'
          action: Script
          object_path: Next
      - step:
          id: '562'
          action: Script
          object_path: End If
      - step:
          id: '563'
          action: Script
          object_path: cnt = FromRow
      - step:
          id: '564'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '565'
          action: Script
          object_path: For each key in oDicNorthDepoWeekDay8.Keys
      - step:
          id: '566'
          action: Script
          object_path: 'If InStr(oDicNorthDepoWeekDay8.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '567'
          object_path: sheet
          action: 'Cells(cnt,60)'
          args: = key
      - step:
          id: '568'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '569'
          action: Script
          object_path: End If
      - step:
          id: '570'
          action: Script
          object_path: Next
      - step:
          id: '571'
          action: Script
          object_path: 'ElseIf LCase(Zone) = "south" Then'
      - step:
          id: '572'
          action: Script
          object_path: For each key in oDicSouthDepoWeekDay8.Keys
      - step:
          id: '573'
          action: Script
          object_path: 'If InStr(oDicSouthDepoWeekDay8.Item(key),"AVL(2)") > 0 Then'
      - step:
          id: '574'
          object_path: sheet
          action: 'Cells(cnt,60)'
          args: = key
      - step:
          id: '575'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '576'
          action: Script
          object_path: End If
      - step:
          id: '577'
          action: Script
          object_path: Next
      - step:
          id: '578'
          action: Script
          object_path: End If
      - step:
          id: '579'
          action: Script
          object_path: End Function
      - step:
          id: '580'
          action: Script
          object_path: 'Function fn_clearCBDTab(FromRow,ToRow)'
      - step:
          id: '581'
          action: Script
          object_path: 'Set sheet4 = workbook.worksheets("CBD")'
      - step:
          id: '582'
          object_path: sheet4
          action: Unprotect
      - step:
          id: '583'
          action: Script
          object_path: For i = FromRow To ToRow
      - step:
          id: '584'
          action: Script
          object_path: 'if VarType(sheet4.Range("A" & i).Value) <> vberror Then'
      - step:
          id: '585'
          action: Script
          object_path: 'If IsNumeric(sheet4.Range("A" & i).Value) Then'
      - step:
          id: '586'
          object_path: 'sheet4.Range("A" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '587'
          action: Script
          object_path: End If
      - step:
          id: '588'
          action: Script
          object_path: End If
      - step:
          id: '589'
          action: Script
          object_path: Next
      - step:
          id: '590'
          action: Script
          object_path: For i = 32 To 41
      - step:
          id: '591'
          object_path: 'sheet4.Range("G" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '592'
          object_path: 'sheet4.Range("H" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '593'
          object_path: 'sheet4.Range("I" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '594'
          object_path: 'sheet4.Range("J" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '595'
          object_path: 'sheet4.Range("K" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '596'
          object_path: 'sheet4.Range("L" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '597'
          object_path: 'sheet4.Range("M" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '598'
          action: Script
          object_path: Next
      - step:
          id: '599'
          action: Script
          object_path: Set sheet4 = NOTHING
      - step:
          id: '600'
          action: Script
          object_path: End Function
      - step:
          id: '601'
          action: Script
          object_path: 'Function fn_clearElectricalServicesTab(FromRow,ToRow)'
      - step:
          id: '602'
          action: Script
          object_path: 'Set sheet4 = workbook.worksheets("ELECTRICAL SERVICES TICK SHEET")'
      - step:
          id: '603'
          object_path: sheet4
          action: Unprotect
      - step:
          id: '604'
          action: Script
          object_path: For i = FromRow To ToRow
      - step:
          id: '605'
          action: Script
          object_path: 'if VarType(sheet4.Range("A" & i).Value) <> vberror Then'
      - step:
          id: '606'
          action: Script
          object_path: 'If IsNumeric(sheet4.Range("A" & i).Value) Then'
      - step:
          id: '607'
          object_path: 'sheet4.Range("A" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '608'
          object_path: 'sheet4.Range("J" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '609'
          object_path: 'sheet4.Range("K" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '610'
          object_path: 'sheet4.Range("L" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '611'
          object_path: 'sheet4.Range("M" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '612'
          object_path: 'sheet4.Range("N" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '613'
          object_path: 'sheet4.Range("O" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '614'
          object_path: 'sheet4.Range("P" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '615'
          object_path: 'sheet4.Range("Q" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '616'
          action: Script
          object_path: End If
      - step:
          id: '617'
          action: Script
          object_path: End If
      - step:
          id: '618'
          action: Script
          object_path: Next
      - step:
          id: '619'
          action: Script
          object_path: Set sheet4 = NOTHING
      - step:
          id: '620'
          action: Script
          object_path: End Function
      - step:
          id: '621'
          action: Script
          object_path: 'Function fn_clearTab(TabName,FromRow,ToRow)'
      - step:
          id: '622'
          action: Script
          object_path: Set sheet4 = workbook.worksheets(TabName)
      - step:
          id: '623'
          object_path: sheet4
          action: Unprotect
      - step:
          id: '624'
          action: Script
          object_path: For i = FromRow To ToRow
      - step:
          id: '625'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '626'
          action: Script
          object_path: 'if VarType(sheet4.Range("A" & i).Value) <> vberror Then'
      - step:
          id: '627'
          action: Script
          object_path: 'If IsNumeric(sheet4.Range("A" & i).Value) Then'
      - step:
          id: '628'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '629'
          object_path: 'sheet4.Range("A" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '630'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '631'
          object_path: 'sheet4.Range("H" & i)'
          action: Value
          args: '= ""'
      - step:
          id: '632'
          action: Script
          object_path: End If
      - step:
          id: '633'
          action: Script
          object_path: End If
      - step:
          id: '634'
          action: Script
          object_path: Next
      - step:
          id: '635'
          action: Script
          object_path: Set sheet4 = NOTHING
      - step:
          id: '636'
          action: Script
          object_path: End Function
      - step:
          id: '637'
          action: Script
          object_path: 'Function fn_FridayNightShiftAndDutyOfficer(ENo,frmDate,Region)'
      - step:
          id: '638'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Data Entry Profile")'
          action: Set
          args: '"MWD_SAPR"'
      - step:
          id: '639'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Personnel Number")'
          action: Set
          args: ENo
      - step:
          id: '640'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter   (Enter)")'
          action: Click
      - step:
          id: '641'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key date")'
          action: Set
          args: frmDate
      - step:
          id: '642'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter Times   (F5)")'
          action: Click
      - step:
          id: '643'
          action: Script
          object_path: 'Entry = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Entry").GetROProperty("value")'
      - step:
          id: '644'
          action: Script
          object_path: ValidRows = fn_FindValidRowEntry(Entry)
      - step:
          id: '645'
          action: Script
          object_path: For i = 3 To ValidRows
      - step:
          id: '646'
          action: Script
          object_path: 'DWS = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"DWS")'
      - step:
          id: '647'
          action: Script
          object_path: 'WageType = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Wage Type")'
      - step:
          id: '648'
          action: Script
          object_path: 'FriHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#33")'
      - step:
          id: '649'
          action: Script
          object_path: 'Avail = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Avail")'
      - step:
          id: '650'
          action: Script
          object_path: If FriHours = EMPTY Then
      - step:
          id: '651'
          action: Script
          object_path: FriHours = 0
      - step:
          id: '652'
          action: Script
          object_path: End If
      - step:
          id: '653'
          action: Script
          object_path: 'If WageType = "2SUB" And DWS = "A003" And FriHours > 0 Then'
      - step:
          id: '654'
          action: Script
          object_path: 'If Region = "North" Then'
      - step:
          id: '655'
          object_path: oDicNorthEMPList
          action: item(ENo)
          args: '= "FNS"'
      - step:
          id: '656'
          action: Script
          object_path: 'ElseIf Region = "South" Then'
      - step:
          id: '657'
          object_path: oDicSouthEMPList
          action: item(ENo)
          args: '= "FNS"'
      - step:
          id: '658'
          action: Script
          object_path: End If
      - step:
          id: '659'
          action: Script
          object_path: End If
      - step:
          id: '660'
          action: Script
          object_path: 'If WageType = "2AVL" And Avail = "D1" Then'
      - step:
          id: '661'
          action: Script
          object_path: 'If Region = "North" Then'
      - step:
          id: '662'
          object_path: oDicNorthEMPListDutyOfficer
          action: Item(ENo)
          args: '= "D1"'
      - step:
          id: '663'
          action: Script
          object_path: 'ElseIf Region = "South" Then'
      - step:
          id: '664'
          object_path: oDicSouthEMPListDutyOfficer
          action: Item(ENo)
          args: '= "D1"'
      - step:
          id: '665'
          action: Script
          object_path: End If
      - step:
          id: '666'
          action: Script
          object_path: End If
      - step:
          id: '667'
          action: Script
          object_path: Next
      - step:
          id: '668'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '669'
          action: Script
          object_path: End Function
      - step:
          id: '670'
          action: Script
          object_path: 'Function fn_FillupFridayNightShift(rowStart,rowEnd,Zone)'
      - step:
          id: '671'
          action: Script
          object_path: cnt = rowStart
      - step:
          id: '672'
          action: Script
          object_path: For i = rowStart to rowEnd
      - step:
          id: '673'
          action: Script
          object_path: 'If sheet.Cells(i,12) = EMPTY Then'
      - step:
          id: '674'
          action: Script
          object_path: Exit For
      - step:
          id: '675'
          action: Script
          object_path: cnt = i
      - step:
          id: '676'
          action: Script
          object_path: End If
      - step:
          id: '677'
          action: Script
          object_path: Next
      - step:
          id: '678'
          action: Script
          object_path: 'If LCase(Zone) = "north" Then'
      - step:
          id: '679'
          action: Script
          object_path: For each key in oDicNorthEMPListDup.Keys
      - step:
          id: '680'
          action: Script
          object_path: 'If oDicNorthEMPListDup.Item(key) = "FNS" Then'
      - step:
          id: '681'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '682'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '683'
          action: Script
          object_path: End If
      - step:
          id: '684'
          action: Script
          object_path: Next
      - step:
          id: '685'
          action: Script
          object_path: End If
      - step:
          id: '686'
          action: Script
          object_path: 'If LCase(Zone) = "south" Then'
      - step:
          id: '687'
          action: Script
          object_path: For each key in oDicSouthEMPListDup.Keys
      - step:
          id: '688'
          action: Script
          object_path: 'If oDicSouthEMPListDup.Item(key) = "FNS" Then'
      - step:
          id: '689'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '690'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '691'
          action: Script
          object_path: End If
      - step:
          id: '692'
          action: Script
          object_path: Next
      - step:
          id: '693'
          action: Script
          object_path: For each key in oDicEMPListEnervenFridayNight.Keys
      - step:
          id: '694'
          action: Script
          object_path: 'If oDicEMPListEnervenFridayNight.Item(key) = "FNS" Then'
      - step:
          id: '695'
          object_path: sheet
          action: 'Cells(cnt,12)'
          args: = key
      - step:
          id: '696'
          action: Script
          object_path: cnt = cnt +1
      - step:
          id: '697'
          action: Script
          object_path: End If
      - step:
          id: '698'
          action: Script
          object_path: Next
      - step:
          id: '699'
          action: Script
          object_path: End If
      - step:
          id: '700'
          action: Script
          object_path: End Function
      - step:
          id: '701'
          action: Script
          object_path: Function fn_FindValidRowEntry(Entry)
      - step:
          id: '702'
          action: Script
          object_path: Set regex = New regExp
      - step:
          id: '703'
          object_path: regex
          action: Pattern
          args: "= \"\\d+\""
      - step:
          id: '704'
          object_path: regex
          action: Global
          args: = True
      - step:
          id: '705'
          action: Script
          object_path: Set Matches = regex.Execute(Entry)
      - step:
          id: '706'
          action: Script
          object_path: fn_FindValidRowEntry = Matches(1)
      - step:
          id: '707'
          action: Script
          object_path: Set regex = NOTHING
      - step:
          id: '708'
          action: Script
          object_path: Set Matches = NOTHING
      - step:
          id: '709'
          action: Script
          object_path: End Function
      - step:
          id: '710'
          action: Script
          object_path: 'Function fn_FridayNightShiftEnerven(ENo,frmDate)'
      - step:
          id: '711'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Data Entry Profile")'
          action: Set
          args: '"MWD_SAPR"'
      - step:
          id: '712'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Personnel Number")'
          action: Set
          args: ENo
      - step:
          id: '713'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter   (Enter)")'
          action: Click
      - step:
          id: '714'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiEdit("Key date")'
          action: Set
          args: frmDate
      - step:
          id: '715'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Initial Screen").SAPGuiButton("Enter Times   (F5)")'
          action: Click
      - step:
          id: '716'
          action: Script
          object_path: 'Entry = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiEdit("Entry").GetROProperty("value")'
      - step:
          id: '717'
          action: Script
          object_path: ValidRows = fn_FindValidRowEntry(Entry)
      - step:
          id: '718'
          action: Script
          object_path: For i = 3 To ValidRows
      - step:
          id: '719'
          action: Script
          object_path: 'DWS = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"DWS")'
      - step:
          id: '720'
          action: Script
          object_path: 'WageType = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"Wage Type")'
      - step:
          id: '721'
          action: Script
          object_path: 'FriHours = SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiTable("Data Entry Area").GetCellData(i,"#33")'
      - step:
          id: '722'
          action: Script
          object_path: If FriHours = EMPTY Then
      - step:
          id: '723'
          action: Script
          object_path: FriHours = 0
      - step:
          id: '724'
          action: Script
          object_path: End If
      - step:
          id: '725'
          action: Script
          object_path: 'If WageType = "2SUB" And DWS = "A003" And FriHours > 0 Then'
      - step:
          id: '726'
          object_path: oDicEMPListEnervenFridayNight
          action: Add
          args: 'ENo,"FNS"'
      - step:
          id: '727'
          action: Script
          object_path: End If
      - step:
          id: '728'
          action: Script
          object_path: Next
      - step:
          id: '729'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Time Sheet: Data Entry").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '730'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Display Times   (F6)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[6]'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    name: User
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - type
                        - name
                        - micclass
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Password
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - type
                        - name
                        - micclass
                      ordinal_identifier: ''
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              name: Resource Availability_2
              child_objects:
                - object:
                    smart_identification: ''
                    name: Work Centre
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: to
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Date
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              name: Resource Availability
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'Continue with this logon,'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'Continue with this logon, without ending any other logons in the system.'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - micclass
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Continue with this logon
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '.*Continue with this logon and end any other logons in the system..*'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - text
                        - micclass
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Confirm Selection   (Enter)
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - tooltip
                        - name
                        - micclass
                      ordinal_identifier: ''
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
              basic_identification:
                property_ref:
                  - text
                  - program
                  - name
                  - micclass
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Information_2
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - tooltip
                        - name
                        - micclass
                      ordinal_identifier: ''
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
              basic_identification:
                property_ref:
                  - text
                  - program
                  - name
                  - micclass
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              name: Display Messages
              child_objects:
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
                    basic_identification:
                      property_ref:
                        - tooltip
                        - name
                        - micclass
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
                      value: '.*Display Messages.*'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
              basic_identification:
                property_ref:
                  - transaction
                  - text
                  - program
                  - micclass
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
                    last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
              last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
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
        last_update_time: 'Wednesday, 8 June 2022 9:52:40 AM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
