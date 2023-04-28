namespace: BCRM_Reports
operation:
  name: StartandEndDateReports
  inputs:
  - EstimatesWeekA_Number: '0'
  - EstimatesWeekB_Number: '0'
  - NullsPrelimA_Number: '0'
  - NullsPrelimB_Number: '0'
  - NullsR1A_Number: '0'
  - NullsR1B_Number: '0'
  - NullsR2A_Number: '0'
  - NullsR2B_Number: '0'
  - NullsFinalA_Number: '0'
  - NullsFinalB_Number: '0'
  - calenderFilePath
  - todayDate
  - todayYear
  - todayWeekNumber
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.StartandEndDateReports:1.0.0
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
        object_path: '''clear input variables'
    - step:
        id: '2'
        action: Script
        object_path: todayWeekNumber = empty
    - step:
        id: '3'
        action: Script
        object_path: calenderWorkSheet = empty
    - step:
        id: '4'
        action: Script
        object_path: EstimatesWeekA_Number = empty
    - step:
        id: '5'
        action: Script
        object_path: EstimatesWeekB_Number = empty
    - step:
        id: '6'
        action: Script
        object_path: NullsPrelimA_Number = empty
    - step:
        id: '7'
        action: Script
        object_path: NullsPrelimB_Number = empty
    - step:
        id: '8'
        action: Script
        object_path: NullsR1A_Number = empty
    - step:
        id: '9'
        action: Script
        object_path: NullsR1B_Number = empty
    - step:
        id: '10'
        action: Script
        object_path: NullsR2A_Number = empty
    - step:
        id: '11'
        action: Script
        object_path: NullsR2B_Number = empty
    - step:
        id: '12'
        action: Script
        object_path: NullsFinalA_Number = empty
    - step:
        id: '13'
        action: Script
        object_path: NullsFinalB_Number = empty
    - step:
        id: '14'
        action: Script
        object_path: '''Get Input values'
    - step:
        id: '15'
        action: Script
        object_path: calenderFilePath = Parameter("calenderFilePath")
    - step:
        id: '16'
        action: Script
        object_path: today = Parameter("todayDate")
    - step:
        id: '17'
        action: Script
        object_path: today = CDate(today)
    - step:
        id: '18'
        action: Script
        object_path: calenderWorkSheet = Parameter("todayYear")
    - step:
        id: '19'
        action: Script
        object_path: EstimatesWeekA_Number = Parameter("EstimatesWeekA_Number")
    - step:
        id: '20'
        action: Script
        object_path: EstimatesWeekB_Number = Parameter("EstimatesWeekB_Number")
    - step:
        id: '21'
        action: Script
        object_path: NullsPrelimA_Number = Parameter("NullsPrelimA_Number")
    - step:
        id: '22'
        action: Script
        object_path: NullsPrelimB_Number = Parameter("NullsPrelimB_Number")
    - step:
        id: '23'
        action: Script
        object_path: NullsR1A_Number = Parameter("NullsR1A_Number")
    - step:
        id: '24'
        action: Script
        object_path: NullsR1B_Number = Parameter("NullsR1B_Number")
    - step:
        id: '25'
        action: Script
        object_path: NullsR2A_Number = Parameter("NullsR2A_Number")
    - step:
        id: '26'
        action: Script
        object_path: NullsR2B_Number = Parameter("NullsR2B_Number")
    - step:
        id: '27'
        action: Script
        object_path: NullsFinalA_Number = Parameter("NullsFinalA_Number")
    - step:
        id: '28'
        action: Script
        object_path: NullsFinalB_Number = Parameter("NullsFinalB_Number")
    - step:
        id: '29'
        action: Script
        object_path: todayWeekNumber = Parameter("todayWeekNumber")
    - step:
        id: '30'
        action: Script
        object_path: '''Add sheets to datatable for the years working on'
    - step:
        id: '31'
        action: Script
        object_path: oldYearWorksheet = calenderWorkSheet-1
    - step:
        id: '32'
        action: Script
        object_path: nextYearWorksheet = calenderWorkSheet+1
    - step:
        id: '33'
        action: Script
        object_path: oldYearWorksheet = CStr(oldYearWorksheet)
    - step:
        id: '34'
        action: Script
        object_path: calenderWorkSheet = CStr(calenderWorkSheet)
    - step:
        id: '35'
        action: Script
        object_path: nextYearWorksheet = CStr(nextYearWorksheet)
    - step:
        id: '36'
        object_path: Datatable
        action: AddSheet(oldYearWorksheet)
    - step:
        id: '37'
        object_path: Datatable
        action: AddSheet(calenderWorkSheet)
    - step:
        id: '38'
        object_path: Datatable
        action: AddSheet(nextYearWorksheet)
    - step:
        id: '39'
        object_path: Datatable
        action: ImportSheet
        args: calenderFilePath, oldYearWorksheet, oldYearWorksheet
    - step:
        id: '40'
        object_path: Datatable
        action: ImportSheet
        args: calenderFilePath, calenderWorkSheet, calenderWorkSheet
    - step:
        id: '41'
        action: Script
        object_path: PrevYearFlag = False
    - step:
        id: '42'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '43'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '44'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '45'
        action: Script
        object_path: WNUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '46'
        action: Script
        object_path: sDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '47'
        action: Script
        object_path: eDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '48'
        action: Script
        object_path: cYear = Year(today)
    - step:
        id: '49'
        action: Script
        object_path: sDateYear = Year(sDate)
    - step:
        id: '50'
        action: Script
        object_path: eDateYear = Year(eDate)
    - step:
        id: '51'
        action: Script
        object_path: If todayWeekNumber = WNUMBER And  today >= cDate(sDate) And today
          <= cDate(eDate) Then
    - step:
        id: '52'
        action: Script
        object_path: If cYear > sDateYear And sDateYear <> eDateYear Then
    - step:
        id: '53'
        action: Script
        object_path: PrevYearFlag = True
    - step:
        id: '54'
        action: Script
        object_path: Exit for
    - step:
        id: '55'
        action: Script
        object_path: ElseIf cYear = sDateYear And cYear = eDateYear Then
    - step:
        id: '56'
        action: Script
        object_path: PrevYearFlag = True
    - step:
        id: '57'
        action: Script
        object_path: Exit for
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: Next
    - step:
        id: '61'
        action: Script
        object_path: '''Get start and end date for ESTIMATES_WEEK_A'
    - step:
        id: '62'
        action: Script
        object_path: If EstimatesWeekA_Number <> "0" Then
    - step:
        id: '63'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(EstimatesWeekA_Number)) and
          (todayWeekNumber <> "") and PrevYearFlag Then
    - step:
        id: '64'
        action: Script
        object_path: '''If estimates week A is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '65'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '66'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '67'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '68'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '69'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekA_Number) Then
    - step:
        id: '70'
        action: Script
        object_path: EstwkAStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '71'
        action: Script
        object_path: EstwkAEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '72'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '73'
        action: Script
        object_path: End If
    - step:
        id: '74'
        action: Script
        object_path: Next
    - step:
        id: '75'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(EstimatesWeekA_Number))
          and (todayWeekNumber <> "")  Then
    - step:
        id: '76'
        action: Script
        object_path: '''If estimates week A is less than current week number then
          get data from current year sheet'
    - step:
        id: '77'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '78'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '79'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '80'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '81'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekA_Number) Then
    - step:
        id: '82'
        action: Script
        object_path: EstwkAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '83'
        action: Script
        object_path: EstwkAEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '84'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '85'
        action: Script
        object_path: End If
    - step:
        id: '86'
        action: Script
        object_path: Next
    - step:
        id: '87'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(EstimatesWeekA_Number))
          and (todayWeekNumber <> "") Then
    - step:
        id: '88'
        action: Script
        object_path: '''If estimates week A is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '89'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '90'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '91'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '92'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '93'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekA_Number) Then
    - step:
        id: '94'
        action: Script
        object_path: EstwkAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '95'
        action: Script
        object_path: EstwkAEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '96'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '97'
        action: Script
        object_path: End If
    - step:
        id: '98'
        action: Script
        object_path: Next
    - step:
        id: '99'
        action: Script
        object_path: End If
    - step:
        id: '100'
        action: Script
        object_path: End If
    - step:
        id: '101'
        action: Script
        object_path: '''Write ESTIMATES_WEEK_A start and end dates to output'
    - step:
        id: '102'
        action: Script
        object_path: Parameter("EstimatesWeekA_Start") = EstwkAStartDate
    - step:
        id: '103'
        action: Script
        object_path: Parameter("EstimatesWeekA_End") = EstwkAEndDate
    - step:
        id: '104'
        action: Script
        object_path: '''Get start and end date for ESTIMATES_WEEK_B'
    - step:
        id: '105'
        action: Script
        object_path: If EstimatesWeekA_Number <> "0" Then
    - step:
        id: '106'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(EstimatesWeekB_Number)) and
          (todayWeekNumber <> "") and PrevYearFlag Then
    - step:
        id: '107'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '108'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '109'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '110'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '111'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '112'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekB_Number) Then
    - step:
        id: '113'
        action: Script
        object_path: EstwkBStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '114'
        action: Script
        object_path: EstwkBEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '115'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: Next
    - step:
        id: '118'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(EstimatesWeekB_Number))
          and (todayWeekNumber <> "")  Then
    - step:
        id: '119'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '120'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '121'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '122'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '123'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '124'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekB_Number) Then
    - step:
        id: '125'
        action: Script
        object_path: EstwkBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '126'
        action: Script
        object_path: EstwkBEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '127'
        action: Script
        object_path: intRun = intRow
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
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(EstimatesWeekB_Number))
          and (todayWeekNumber <> "") Then
    - step:
        id: '131'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '132'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '133'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '134'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '135'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '136'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(EstimatesWeekB_Number) Then
    - step:
        id: '137'
        action: Script
        object_path: EstwkBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '138'
        action: Script
        object_path: EstwkBEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '139'
        action: Script
        object_path: intRun = intRow
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
        object_path: End If
    - step:
        id: '143'
        action: Script
        object_path: End If
    - step:
        id: '144'
        action: Script
        object_path: '''Write ESTIMATES_WEEK_B start and end dates to output'
    - step:
        id: '145'
        action: Script
        object_path: Parameter("EstimatesWeekB_Start") = EstwkBStartDate
    - step:
        id: '146'
        action: Script
        object_path: Parameter("EstimatesWeekB_End") = EstwkBEndDate
    - step:
        id: '147'
        action: Script
        object_path: '''Get start and end date for NULLS_PRELIM_A'
    - step:
        id: '148'
        action: Script
        object_path: If NullsPrelimA_Number <> "0" Then
    - step:
        id: '149'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsPrelimA_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '150'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '151'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '152'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '153'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '154'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '155'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimA_Number) Then
    - step:
        id: '156'
        action: Script
        object_path: NullsPrelimAStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '157'
        action: Script
        object_path: NullsPrelimAEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '158'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '159'
        action: Script
        object_path: End If
    - step:
        id: '160'
        action: Script
        object_path: Next
    - step:
        id: '161'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsPrelimA_Number)) and
          (todayWeekNumber <> "")  Then
    - step:
        id: '162'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '163'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '164'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '165'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '166'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '167'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimA_Number) Then
    - step:
        id: '168'
        action: Script
        object_path: NullsPrelimAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '169'
        action: Script
        object_path: NullsPrelimAEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '170'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '171'
        action: Script
        object_path: End If
    - step:
        id: '172'
        action: Script
        object_path: Next
    - step:
        id: '173'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsPrelimA_Number)) and
          (todayWeekNumber <> "") Then
    - step:
        id: '174'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '175'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '176'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '177'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '178'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '179'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimA_Number) Then
    - step:
        id: '180'
        action: Script
        object_path: NullsPrelimAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '181'
        action: Script
        object_path: NullsPrelimAEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '182'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '183'
        action: Script
        object_path: End If
    - step:
        id: '184'
        action: Script
        object_path: Next
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
        object_path: '''Write NULLS_PRELIM_A start and end dates to output'
    - step:
        id: '188'
        action: Script
        object_path: Parameter("NullsPrelimA_Start") = NullsPrelimAStartDate
    - step:
        id: '189'
        action: Script
        object_path: Parameter("NullsPrelimA_End") = NullsPrelimAEndDate
    - step:
        id: '190'
        action: Script
        object_path: '''Get start and end date for NULLS_PRELIM_B'
    - step:
        id: '191'
        action: Script
        object_path: If NullsPrelimB_Number <> "0" Then
    - step:
        id: '192'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsPrelimB_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '193'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '194'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '195'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '196'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '197'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '198'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimB_Number) Then
    - step:
        id: '199'
        action: Script
        object_path: NullsPrelimBStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '200'
        action: Script
        object_path: NullsPrelimBEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '201'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '202'
        action: Script
        object_path: End If
    - step:
        id: '203'
        action: Script
        object_path: Next
    - step:
        id: '204'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsPrelimB_Number)) and
          (todayWeekNumber <> "")  Then
    - step:
        id: '205'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '206'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '207'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '208'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '209'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '210'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimB_Number) Then
    - step:
        id: '211'
        action: Script
        object_path: NullsPrelimBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '212'
        action: Script
        object_path: NullsPrelimBEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '213'
        action: Script
        object_path: intRun = intRow
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
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsPrelimB_Number)) and
          (todayWeekNumber <> "") Then
    - step:
        id: '217'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '218'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '219'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '220'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '221'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '222'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsPrelimB_Number) Then
    - step:
        id: '223'
        action: Script
        object_path: NullsPrelimBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '224'
        action: Script
        object_path: NullsPrelimBEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '225'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '226'
        action: Script
        object_path: End If
    - step:
        id: '227'
        action: Script
        object_path: Next
    - step:
        id: '228'
        action: Script
        object_path: End If
    - step:
        id: '229'
        action: Script
        object_path: End If
    - step:
        id: '230'
        action: Script
        object_path: '''Write NULLS_PRELIM_B start and end dates to output'
    - step:
        id: '231'
        action: Script
        object_path: Parameter("NullsPrelimB_Start") = NullsPrelimBStartDate
    - step:
        id: '232'
        action: Script
        object_path: Parameter("NullsPrelimB_End") = NullsPrelimBEndDate
    - step:
        id: '233'
        action: Script
        object_path: '''Get start and end date for NULLS_R1_A'
    - step:
        id: '234'
        action: Script
        object_path: If NullsR1A_Number <> "0" Then
    - step:
        id: '235'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsR1A_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '236'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '237'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '238'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '239'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '240'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '241'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1A_Number) Then
    - step:
        id: '242'
        action: Script
        object_path: NullsR1AStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '243'
        action: Script
        object_path: NullsR1AEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '244'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '245'
        action: Script
        object_path: End If
    - step:
        id: '246'
        action: Script
        object_path: Next
    - step:
        id: '247'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsR1A_Number)) and (todayWeekNumber
          <> "") Then
    - step:
        id: '248'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '249'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '250'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '251'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '252'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '253'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1A_Number) Then
    - step:
        id: '254'
        action: Script
        object_path: NullsR1AStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '255'
        action: Script
        object_path: NullsR1AEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '256'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '257'
        action: Script
        object_path: End If
    - step:
        id: '258'
        action: Script
        object_path: Next
    - step:
        id: '259'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsR1A_Number)) and (todayWeekNumber
          <> "") Then
    - step:
        id: '260'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '261'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '262'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '263'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '264'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '265'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1A_Number) Then
    - step:
        id: '266'
        action: Script
        object_path: NullsR1AStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '267'
        action: Script
        object_path: NullsR1AEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '268'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '269'
        action: Script
        object_path: End If
    - step:
        id: '270'
        action: Script
        object_path: Next
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
        object_path: '''Write NULLS_R1_A start and end dates to output'
    - step:
        id: '274'
        action: Script
        object_path: Parameter("NullsR1A_Start") = NullsR1AStartDate
    - step:
        id: '275'
        action: Script
        object_path: Parameter("NullsR1A_End") = NullsR1AEndDate
    - step:
        id: '276'
        action: Script
        object_path: '''Get start and end date for NULLS_R1_B'
    - step:
        id: '277'
        action: Script
        object_path: If NullsR1B_Number <> "0" Then
    - step:
        id: '278'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsR1B_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '279'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '280'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '281'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '282'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '283'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '284'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1B_Number) Then
    - step:
        id: '285'
        action: Script
        object_path: NullsR1BStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '286'
        action: Script
        object_path: NullsR1BEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '287'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '288'
        action: Script
        object_path: End If
    - step:
        id: '289'
        action: Script
        object_path: Next
    - step:
        id: '290'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsR1B_Number)) and (todayWeekNumber
          <> "")  Then
    - step:
        id: '291'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '292'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '293'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '294'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '295'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '296'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1B_Number) Then
    - step:
        id: '297'
        action: Script
        object_path: NullsR1BStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '298'
        action: Script
        object_path: NullsR1BEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '299'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '300'
        action: Script
        object_path: End If
    - step:
        id: '301'
        action: Script
        object_path: Next
    - step:
        id: '302'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsR1B_Number)) and (todayWeekNumber
          <> "") Then
    - step:
        id: '303'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '304'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '305'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '306'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '307'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '308'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR1B_Number) Then
    - step:
        id: '309'
        action: Script
        object_path: NullsR1BStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '310'
        action: Script
        object_path: NullsR1BEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '311'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '312'
        action: Script
        object_path: End If
    - step:
        id: '313'
        action: Script
        object_path: Next
    - step:
        id: '314'
        action: Script
        object_path: End If
    - step:
        id: '315'
        action: Script
        object_path: End If
    - step:
        id: '316'
        action: Script
        object_path: '''Write NULLS_R1_B start and end dates to output'
    - step:
        id: '317'
        action: Script
        object_path: Parameter("NullsR1B_Start") = NullsR1BStartDate
    - step:
        id: '318'
        action: Script
        object_path: Parameter("NullsR1B_End") = NullsR1BEndDate
    - step:
        id: '319'
        action: Script
        object_path: '''Get start and end date for NULLS_R2_A'
    - step:
        id: '320'
        action: Script
        object_path: If NullsR2A_Number <> "0" Then
    - step:
        id: '321'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsR2A_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '322'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '323'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '324'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '325'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '326'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '327'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2A_Number) Then
    - step:
        id: '328'
        action: Script
        object_path: NullsR2AStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '329'
        action: Script
        object_path: NullsR2AEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '330'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '331'
        action: Script
        object_path: End If
    - step:
        id: '332'
        action: Script
        object_path: Next
    - step:
        id: '333'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsR2A_Number)) and (todayWeekNumber
          <> "")  Then
    - step:
        id: '334'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '335'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '336'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '337'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '338'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '339'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2A_Number) Then
    - step:
        id: '340'
        action: Script
        object_path: NullsR2AStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '341'
        action: Script
        object_path: NullsR2AEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '342'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '343'
        action: Script
        object_path: End If
    - step:
        id: '344'
        action: Script
        object_path: Next
    - step:
        id: '345'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsR2A_Number)) and (todayWeekNumber
          <> "") Then
    - step:
        id: '346'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '347'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '348'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '349'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '350'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '351'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2A_Number) Then
    - step:
        id: '352'
        action: Script
        object_path: NullsR2AStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '353'
        action: Script
        object_path: NullsR2AEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '354'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '355'
        action: Script
        object_path: End If
    - step:
        id: '356'
        action: Script
        object_path: Next
    - step:
        id: '357'
        action: Script
        object_path: End If
    - step:
        id: '358'
        action: Script
        object_path: End If
    - step:
        id: '359'
        action: Script
        object_path: '''Write NULLS_R2_A start and end dates to output'
    - step:
        id: '360'
        action: Script
        object_path: Parameter("NullsR2A_Start") = NullsR2AStartDate
    - step:
        id: '361'
        action: Script
        object_path: Parameter("NullsR2A_End") = NullsR2AEndDate
    - step:
        id: '362'
        action: Script
        object_path: '''Get start and end date for NULLS_R2_B'
    - step:
        id: '363'
        action: Script
        object_path: If NullsR2B_Number <> "0" Then
    - step:
        id: '364'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsR2B_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '365'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '366'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '367'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '368'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '369'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '370'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2B_Number) Then
    - step:
        id: '371'
        action: Script
        object_path: NullsR2BStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '372'
        action: Script
        object_path: NullsR2BEndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '373'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '374'
        action: Script
        object_path: End If
    - step:
        id: '375'
        action: Script
        object_path: Next
    - step:
        id: '376'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsR2B_Number)) and (todayWeekNumber
          <> "")  Then
    - step:
        id: '377'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '378'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '379'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '380'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '381'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '382'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2B_Number) Then
    - step:
        id: '383'
        action: Script
        object_path: NullsR2BStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '384'
        action: Script
        object_path: NullsR2BEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '385'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '386'
        action: Script
        object_path: End If
    - step:
        id: '387'
        action: Script
        object_path: Next
    - step:
        id: '388'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsR2B_Number)) and (todayWeekNumber
          <> "") Then
    - step:
        id: '389'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '390'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '391'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '392'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '393'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '394'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsR2B_Number) Then
    - step:
        id: '395'
        action: Script
        object_path: NullsR2BStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '396'
        action: Script
        object_path: NullsR2BEndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '397'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '398'
        action: Script
        object_path: End If
    - step:
        id: '399'
        action: Script
        object_path: Next
    - step:
        id: '400'
        action: Script
        object_path: End If
    - step:
        id: '401'
        action: Script
        object_path: End If
    - step:
        id: '402'
        action: Script
        object_path: '''Write NULLS_R2_B start and end dates to output'
    - step:
        id: '403'
        action: Script
        object_path: Parameter("NullsR2B_Start") = NullsR2BStartDate
    - step:
        id: '404'
        action: Script
        object_path: Parameter("NullsR2B_End") = NullsR2BEndDate
    - step:
        id: '405'
        action: Script
        object_path: '''Get start and end date for NULLS_FINAL_A'
    - step:
        id: '406'
        action: Script
        object_path: If NullsFinalA_Number <> "0" Then
    - step:
        id: '407'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsFinalA_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '408'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '409'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '410'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '411'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '412'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '413'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalA_Number) Then
    - step:
        id: '414'
        action: Script
        object_path: NullsFinalAStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '415'
        action: Script
        object_path: NullsFinalAndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '416'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '417'
        action: Script
        object_path: End If
    - step:
        id: '418'
        action: Script
        object_path: Next
    - step:
        id: '419'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsFinalA_Number)) and
          (todayWeekNumber <> "")  Then
    - step:
        id: '420'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '421'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '422'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '423'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '424'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '425'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalA_Number) Then
    - step:
        id: '426'
        action: Script
        object_path: NullsFinalAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '427'
        action: Script
        object_path: NullsFinalAndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '428'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '429'
        action: Script
        object_path: End If
    - step:
        id: '430'
        action: Script
        object_path: Next
    - step:
        id: '431'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsFinalA_Number)) and
          (todayWeekNumber <> "") Then
    - step:
        id: '432'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '433'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '434'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '435'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '436'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '437'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalA_Number) Then
    - step:
        id: '438'
        action: Script
        object_path: NullsFinalAStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '439'
        action: Script
        object_path: NullsFinalAndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '440'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '441'
        action: Script
        object_path: End If
    - step:
        id: '442'
        action: Script
        object_path: Next
    - step:
        id: '443'
        action: Script
        object_path: End If
    - step:
        id: '444'
        action: Script
        object_path: End If
    - step:
        id: '445'
        action: Script
        object_path: '''Write NULLS_FINAL_A start and end dates to output'
    - step:
        id: '446'
        action: Script
        object_path: Parameter("NullsFinalA_Start") = NullsFinalAStartDate
    - step:
        id: '447'
        action: Script
        object_path: Parameter("NullsFinalA_End") = NullsFinalAndDate
    - step:
        id: '448'
        action: Script
        object_path: '''Get start and end date for NULLS_FINAL_B'
    - step:
        id: '449'
        action: Script
        object_path: If NullsFinalB_Number <> "0" Then
    - step:
        id: '450'
        action: Script
        object_path: If (Cint(todayWeekNumber) < Cint(NullsFinalB_Number)) and (todayWeekNumber
          <> "") and PrevYearFlag Then
    - step:
        id: '451'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '452'
        action: Script
        object_path: intRow = DataTable.GetSheet(oldYearWorksheet).GetRowCount
    - step:
        id: '453'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '454'
        object_path: DataTable.GetSheet(oldYearWorksheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '455'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",oldYearWorksheet)
    - step:
        id: '456'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalB_Number) Then
    - step:
        id: '457'
        action: Script
        object_path: NullsFinalBStartDate = Datatable("START_DATE",oldYearWorksheet)
    - step:
        id: '458'
        action: Script
        object_path: NullsFinalBndDate = Datatable("END_DATE",oldYearWorksheet)
    - step:
        id: '459'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '460'
        action: Script
        object_path: End If
    - step:
        id: '461'
        action: Script
        object_path: Next
    - step:
        id: '462'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) > Cint(NullsFinalB_Number)) and
          (todayWeekNumber <> "")  Then
    - step:
        id: '463'
        action: Script
        object_path: '''If estimates week B is less than current week number then
          get data from current year sheet'
    - step:
        id: '464'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '465'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '466'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '467'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '468'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalB_Number) Then
    - step:
        id: '469'
        action: Script
        object_path: NullsFinalBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '470'
        action: Script
        object_path: NullsFinalBndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '471'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '472'
        action: Script
        object_path: End If
    - step:
        id: '473'
        action: Script
        object_path: Next
    - step:
        id: '474'
        action: Script
        object_path: ElseIf (Cint(todayWeekNumber) < Cint(NullsFinalB_Number)) and
          (todayWeekNumber <> "") Then
    - step:
        id: '475'
        action: Script
        object_path: '''If estimates week B is greater than current week number then
          get data from previous year sheet'
    - step:
        id: '476'
        action: Script
        object_path: intRow = DataTable.GetSheet(calenderWorkSheet).GetRowCount
    - step:
        id: '477'
        action: Script
        object_path: For intRun = 1 to intRow
    - step:
        id: '478'
        object_path: DataTable.GetSheet(calenderWorkSheet)
        action: SetCurrentRow
        args: intRun
    - step:
        id: '479'
        action: Script
        object_path: OldWEEK_NUMBER = Datatable("WEEK_NUMBER",calenderWorkSheet)
    - step:
        id: '480'
        action: Script
        object_path: If Cint(OldWEEK_NUMBER) = Cint(NullsFinalB_Number) Then
    - step:
        id: '481'
        action: Script
        object_path: NullsFinalBStartDate = Datatable("START_DATE",calenderWorkSheet)
    - step:
        id: '482'
        action: Script
        object_path: NullsFinalBndDate = Datatable("END_DATE",calenderWorkSheet)
    - step:
        id: '483'
        action: Script
        object_path: intRun = intRow
    - step:
        id: '484'
        action: Script
        object_path: End If
    - step:
        id: '485'
        action: Script
        object_path: Next
    - step:
        id: '486'
        action: Script
        object_path: End If
    - step:
        id: '487'
        action: Script
        object_path: End If
    - step:
        id: '488'
        action: Script
        object_path: '''Write NULLS_FINAL_B start and end dates to output'
    - step:
        id: '489'
        action: Script
        object_path: Parameter("NullsFinalB_Start") = NullsFinalBStartDate
    - step:
        id: '490'
        action: Script
        object_path: Parameter("NullsFinalB_End") = NullsFinalBndDate
    - step:
        id: '491'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '492'
        action: Script
        object_path: todayWeekNumber = empty
    - step:
        id: '493'
        action: Script
        object_path: calenderWorkSheet = empty
    - step:
        id: '494'
        action: Script
        object_path: EstimatesWeekA_Number = empty
    - step:
        id: '495'
        action: Script
        object_path: EstimatesWeekB_Number = empty
    - step:
        id: '496'
        action: Script
        object_path: NullsPrelimA_Number = empty
    - step:
        id: '497'
        action: Script
        object_path: NullsPrelimB_Number = empty
    - step:
        id: '498'
        action: Script
        object_path: NullsR1A_Number = empty
    - step:
        id: '499'
        action: Script
        object_path: NullsR1B_Number = empty
    - step:
        id: '500'
        action: Script
        object_path: NullsR2A_Number = empty
    - step:
        id: '501'
        action: Script
        object_path: NullsR2B_Number = empty
    - step:
        id: '502'
        action: Script
        object_path: NullsFinalA_Number = empty
    - step:
        id: '503'
        action: Script
        object_path: NullsFinalB_Number = empty
    - step:
        id: '504'
        action: Script
        object_path: calenderFilePath = empty
    - step:
        id: '505'
        action: Script
        object_path: today = empty
    - step:
        id: '506'
        action: Script
        object_path: oldYearWorksheet = empty
    - step:
        id: '507'
        action: Script
        object_path: nextYearWorksheet = empty
    - step:
        id: '508'
        action: Script
        object_path: OldWEEK_NUMBER = empty
    - step:
        id: '509'
        action: Script
        object_path: intRow = empty
    - step:
        id: '510'
        action: Script
        object_path: intRun = empty
    - step:
        id: '511'
        action: Script
        object_path: EstwkAStartDate = empty
    - step:
        id: '512'
        action: Script
        object_path: EstwkAEndDate = empty
    - step:
        id: '513'
        action: Script
        object_path: EstwkBStartDate = empty
    - step:
        id: '514'
        action: Script
        object_path: EstwkBEndDate = empty
    - step:
        id: '515'
        action: Script
        object_path: NullsPrelimAStartDate = empty
    - step:
        id: '516'
        action: Script
        object_path: NullsPrelimAEndDate = empty
    - step:
        id: '517'
        action: Script
        object_path: NullsPrelimBStartDate = empty
    - step:
        id: '518'
        action: Script
        object_path: NullsPrelimBEndDate = empty
    - step:
        id: '519'
        action: Script
        object_path: NullsR1AStartDate = empty
    - step:
        id: '520'
        action: Script
        object_path: NullsR1AEndDate = empty
    - step:
        id: '521'
        action: Script
        object_path: NullsR1BStartDate = empty
    - step:
        id: '522'
        action: Script
        object_path: NullsR1BEndDate = empty
    - step:
        id: '523'
        action: Script
        object_path: NullsR2AStartDate = empty
    - step:
        id: '524'
        action: Script
        object_path: NullsR2AEndDate = empty
    - step:
        id: '525'
        action: Script
        object_path: NullsR2BStartDate = empty
    - step:
        id: '526'
        action: Script
        object_path: NullsR2BEndDate = empty
    - step:
        id: '527'
        action: Script
        object_path: NullsFinalAStartDate = empty
    - step:
        id: '528'
        action: Script
        object_path: NullsFinalAndDate = empty
    - step:
        id: '529'
        action: Script
        object_path: NullsFinalBStartDate = empty
    - step:
        id: '530'
        action: Script
        object_path: NullsFinalBndDate = empty
    - step:
        id: '531'
        action: Script
        object_path: ExitTest
  outputs:
  - EstimatesWeekA_Start:
      robot: true
      value: ${EstimatesWeekA_Start}
  - EstimatesWeekA_End:
      robot: true
      value: ${EstimatesWeekA_End}
  - EstimatesWeekB_Start:
      robot: true
      value: ${EstimatesWeekB_Start}
  - EstimatesWeekB_End:
      robot: true
      value: ${EstimatesWeekB_End}
  - NullsPrelimA_Start:
      robot: true
      value: ${NullsPrelimA_Start}
  - NullsPrelimA_End:
      robot: true
      value: ${NullsPrelimA_End}
  - NullsPrelimB_Start:
      robot: true
      value: ${NullsPrelimB_Start}
  - NullsPrelimB_End:
      robot: true
      value: ${NullsPrelimB_End}
  - NullsR1A_Start:
      robot: true
      value: ${NullsR1A_Start}
  - NullsR1A_End:
      robot: true
      value: ${NullsR1A_End}
  - NullsR1B_Start:
      robot: true
      value: ${NullsR1B_Start}
  - NullsR1B_End:
      robot: true
      value: ${NullsR1B_End}
  - NullsR2A_Start:
      robot: true
      value: ${NullsR2A_Start}
  - NullsR2A_End:
      robot: true
      value: ${NullsR2A_End}
  - NullsR2B_Start:
      robot: true
      value: ${NullsR2B_Start}
  - NullsR2B_End:
      robot: true
      value: ${NullsR2B_End}
  - NullsFinalA_Start:
      robot: true
      value: ${NullsFinalA_Start}
  - NullsFinalA_End:
      robot: true
      value: ${NullsFinalA_End}
  - NullsFinalB_Start:
      robot: true
      value: ${NullsFinalB_Start}
  - NullsFinalB_End:
      robot: true
      value: ${NullsFinalB_End}
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
