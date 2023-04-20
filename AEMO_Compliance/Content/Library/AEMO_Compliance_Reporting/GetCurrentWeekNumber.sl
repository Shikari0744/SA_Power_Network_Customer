namespace: AEMO_Compliance_Reporting
operation:
  name: GetCurrentWeekNumber
  inputs:
    - calenderFilePath
    - rptDate:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:AEMO_Compliance_Reporting.GetCurrentWeekNumber:1.0.0'
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
          object_path: "'Get Input Parameter values"
      - step:
          id: '2'
          action: Script
          object_path: 'calenderFilePath = Parameter("calenderFilePath")'
      - step:
          id: '3'
          action: Script
          object_path: 'rptDate = Parameter("rptDate")'
      - step:
          id: '4'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '5'
          action: Script
          object_path: "'If report date is blank then consider todays date as report date"
      - step:
          id: '6'
          action: Script
          object_path: 'If (rptDate = "") or (rptDate =  empty) Then'
      - step:
          id: '7'
          action: Script
          object_path: today = Date
      - step:
          id: '8'
          action: Script
          object_path: Else
      - step:
          id: '9'
          action: Script
          object_path: today = CDate(rptDate)
      - step:
          id: '10'
          action: Script
          object_path: End If
      - step:
          id: '11'
          action: Script
          object_path: calenderWorkSheet = Year(today)
      - step:
          id: '12'
          action: Script
          object_path: oldYearWorksheet = calenderWorkSheet-1
      - step:
          id: '13'
          action: Script
          object_path: nextYearWorksheet = calenderWorkSheet+1
      - step:
          id: '14'
          action: Script
          object_path: oldYearWorksheet = CStr(oldYearWorksheet)
      - step:
          id: '15'
          action: Script
          object_path: calenderWorkSheet = CStr(calenderWorkSheet)
      - step:
          id: '16'
          action: Script
          object_path: nextYearWorksheet = CStr(nextYearWorksheet)
      - step:
          id: '17'
          object_path: Datatable
          action: AddSheet(oldYearWorksheet)
      - step:
          id: '18'
          object_path: Datatable
          action: AddSheet(calenderWorkSheet)
      - step:
          id: '19'
          object_path: Datatable
          action: AddSheet(nextYearWorksheet)
      - step:
          id: '20'
          object_path: Datatable
          action: ImportSheet
          args: 'calenderFilePath, oldYearWorksheet, oldYearWorksheet'
      - step:
          id: '21'
          object_path: Datatable
          action: ImportSheet
          args: 'calenderFilePath, calenderWorkSheet, calenderWorkSheet'
      - step:
          id: '22'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '23'
          action: Script
          object_path: WEEK_NUMBER = Empty
      - step:
          id: '24'
          action: Script
          object_path: "'go through all the rows to get the week number for today"
      - step:
          id: '25'
          action: Script
          object_path: intRowCount = DataTable.GetSheet(calenderWorkSheet).GetRowCount
      - step:
          id: '26'
          action: Script
          object_path: For intRunLoop = 1 to intRowCount
      - step:
          id: '27'
          object_path: DataTable.GetSheet(calenderWorkSheet)
          action: SetCurrentRow
          args: intRunLoop
      - step:
          id: '28'
          action: Script
          object_path: 'START_DATE = DataTable("START_DATE", calenderWorkSheet)'
      - step:
          id: '29'
          action: Script
          object_path: 'END_DATE = DataTable("END_DATE", calenderWorkSheet)'
      - step:
          id: '30'
          action: Script
          object_path: "'When current date is greater than start date and less then end date get the report details for the week"
      - step:
          id: '31'
          action: Script
          object_path: 'If (CDate(today) > CDate(START_DATE)) and (CDate(today) < CDate(END_DATE)) Then'
      - step:
          id: '32'
          action: Script
          object_path: 'WEEK_NUMBER = DataTable("WEEK_NUMBER", calenderWorkSheet)'
      - step:
          id: '33'
          action: Script
          object_path: intRunLoop = intRowCount
      - step:
          id: '34'
          action: Script
          object_path: End If
      - step:
          id: '35'
          action: Script
          object_path: Next
      - step:
          id: '36'
          action: Script
          object_path: 'If WEEK_NUMBER = "" Then'
      - step:
          id: '37'
          object_path: Datatable
          action: ImportSheet
          args: 'calenderFilePath, nextYearWorksheet, nextYearWorksheet'
      - step:
          id: '38'
          action: Script
          object_path: intRowCount = DataTable.GetSheet(nextYearWorksheet).GetRowCount
      - step:
          id: '39'
          action: Script
          object_path: For intRunLoop = 1 to intRowCount
      - step:
          id: '40'
          object_path: DataTable.GetSheet(nextYearWorksheet)
          action: SetCurrentRow
          args: intRunLoop
      - step:
          id: '41'
          action: Script
          object_path: 'START_DATE = DataTable("START_DATE", nextYearWorksheet)'
      - step:
          id: '42'
          action: Script
          object_path: 'END_DATE = DataTable("END_DATE", nextYearWorksheet)'
      - step:
          id: '43'
          action: Script
          object_path: "'When current date is greater than start date and less then end date get the report details for the week"
      - step:
          id: '44'
          action: Script
          object_path: 'If (CDate(today) > CDate(START_DATE)) and (CDate(today) < CDate(END_DATE)) Then'
      - step:
          id: '45'
          action: Script
          object_path: 'WEEK_NUMBER = DataTable("WEEK_NUMBER", nextYearWorksheet)'
      - step:
          id: '46'
          action: Script
          object_path: intRunLoop = intRowCount
      - step:
          id: '47'
          action: Script
          object_path: End If
      - step:
          id: '48'
          action: Script
          object_path: Next
      - step:
          id: '49'
          action: Script
          object_path: End If
      - step:
          id: '50'
          action: Script
          object_path: If Len(WEEK_NUMBER) = 1 Then
      - step:
          id: '51'
          action: Script
          object_path: 'WEEK_NUMBER = "0"&WEEK_NUMBER'
      - step:
          id: '52'
          action: Script
          object_path: End If
      - step:
          id: '53'
          action: Script
          object_path: 'Parameter("currentWeekNumber") = WEEK_NUMBER'
      - step:
          id: '54'
          action: Script
          object_path: 'Parameter("todayDate") = today'
      - step:
          id: '55'
          action: Script
          object_path: "'Clear variables"
      - step:
          id: '56'
          action: Script
          object_path: calenderFilePath = empty
      - step:
          id: '57'
          action: Script
          object_path: rptDate = empty
      - step:
          id: '58'
          action: Script
          object_path: today = empty
      - step:
          id: '59'
          action: Script
          object_path: calenderWorkSheet = empty
      - step:
          id: '60'
          action: Script
          object_path: oldYearWorksheet = empty
      - step:
          id: '61'
          action: Script
          object_path: nextYearWorksheet = empty
      - step:
          id: '62'
          action: Script
          object_path: oldYearWorksheet = empty
      - step:
          id: '63'
          action: Script
          object_path: calenderWorkSheet = empty
      - step:
          id: '64'
          action: Script
          object_path: nextYearWorksheet = empty
      - step:
          id: '65'
          action: Script
          object_path: WEEK_NUMBER = empty
      - step:
          id: '66'
          action: Script
          object_path: intRowCount = empty
      - step:
          id: '67'
          action: Script
          object_path: intRunLoop = empty
      - step:
          id: '68'
          action: Script
          object_path: START_DATE = empty
      - step:
          id: '69'
          action: Script
          object_path: END_DATE = empty
      - step:
          id: '70'
          action: Script
          object_path: ExitTest
  outputs:
    - currentWeekNumber:
        robot: true
        value: '${currentWeekNumber}'
    - todayDate:
        robot: true
        value: '${todayDate}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
