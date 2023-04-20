namespace: BCRM_Reports
operation:
  name: GetCurrentandReportWeekNumber
  inputs:
  - calenderFilePath: C:/Users/svcrpabot/OneDrive - SA Power Networks/AEMO Reports/MDP_Reports/AEMO-Calendar-File.xlsx
  - rptDate:
      required: false
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.GetCurrentandReportWeekNumber:1.0.0
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
        object_path: calenderFilePath = Parameter("calenderFilePath")
    - step:
        id: '2'
        action: Script
        object_path: rptDate = Parameter("rptDate")
    - step:
        id: '3'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '4'
        action: Script
        object_path: If (rptDate = "") or (rptDate =  empty) Then
    - step:
        id: '5'
        action: Script
        object_path: today = Date
    - step:
        id: '6'
        action: Script
        object_path: Else
    - step:
        id: '7'
        action: Script
        object_path: today = CDate(rptDate)
    - step:
        id: '8'
        action: Script
        object_path: End If
    - step:
        id: '9'
        action: Script
        object_path: currentdayofWeek = WeekdayName(weekday(today))
    - step:
        id: '10'
        action: Script
        object_path: Parameter("currentdayofWeek") = currentdayofWeek
    - step:
        id: '11'
        action: Script
        object_path: calenderWorkSheet = Year(date)
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
        args: calenderFilePath, oldYearWorksheet, oldYearWorksheet
    - step:
        id: '21'
        object_path: Datatable
        action: ImportSheet
        args: calenderFilePath, calenderWorkSheet, calenderWorkSheet
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
        object_path: '''go through all the rows to get the week number for today'
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
        object_path: START_DATE = DataTable("START_DATE", calenderWorkSheet)
    - step:
        id: '29'
        action: Script
        object_path: END_DATE = DataTable("END_DATE", calenderWorkSheet)
    - step:
        id: '30'
        action: Script
        object_path: '''When current date is greater than start date and less then
          end date get the report details for the week'
    - step:
        id: '31'
        action: Script
        object_path: If (CDate(today) > CDate(START_DATE)) and (CDate(today) < CDate(END_DATE))
          Then
    - step:
        id: '32'
        action: Script
        object_path: WEEK_NUMBER = DataTable("WEEK_NUMBER", calenderWorkSheet)
    - step:
        id: '33'
        action: Script
        object_path: ESTIMATES_WEEK_A = DataTable("ESTIMATES_WEEK_A", calenderWorkSheet)
    - step:
        id: '34'
        action: Script
        object_path: ESTIMATES_WEEK_B = DataTable("ESTIMATES_WEEK_B", calenderWorkSheet)
    - step:
        id: '35'
        action: Script
        object_path: NULLS_PRELIM_A = DataTable("NULLS_PRELIM_A", calenderWorkSheet)
    - step:
        id: '36'
        action: Script
        object_path: NULLS_R1_A = DataTable("NULLS_R1_A", calenderWorkSheet)
    - step:
        id: '37'
        action: Script
        object_path: NULLS_R2_A = DataTable("NULLS_R2_A", calenderWorkSheet)
    - step:
        id: '38'
        action: Script
        object_path: NULLS_FINAL_A = DataTable("NULLS_FINAL_A", calenderWorkSheet)
    - step:
        id: '39'
        action: Script
        object_path: NULLS_PRELIM_B = DataTable("NULLS_PRELIM_B", calenderWorkSheet)
    - step:
        id: '40'
        action: Script
        object_path: NULLS_R1_B = DataTable("NULLS_R1_B", calenderWorkSheet)
    - step:
        id: '41'
        action: Script
        object_path: NULLS_R2_B = DataTable("NULLS_R2_B", calenderWorkSheet)
    - step:
        id: '42'
        action: Script
        object_path: NULLS_FINAL_B = DataTable("NULLS_FINAL_B", calenderWorkSheet)
    - step:
        id: '43'
        action: Script
        object_path: intRunLoop = intRowCount
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: Next
    - step:
        id: '46'
        action: Script
        object_path: If WEEK_NUMBER = "" Then
    - step:
        id: '47'
        object_path: Datatable
        action: ImportSheet
        args: calenderFilePath, nextYearWorksheet, nextYearWorksheet
    - step:
        id: '48'
        action: Script
        object_path: intRowCount = DataTable.GetSheet(nextYearWorksheet).GetRowCount
    - step:
        id: '49'
        action: Script
        object_path: For intRunLoop = 1 to intRowCount
    - step:
        id: '50'
        object_path: DataTable.GetSheet(nextYearWorksheet)
        action: SetCurrentRow
        args: intRunLoop
    - step:
        id: '51'
        action: Script
        object_path: START_DATE = DataTable("START_DATE", nextYearWorksheet)
    - step:
        id: '52'
        action: Script
        object_path: END_DATE = DataTable("END_DATE", nextYearWorksheet)
    - step:
        id: '53'
        action: Script
        object_path: '''When current date is greater than start date and less then
          end date get the report details for the week'
    - step:
        id: '54'
        action: Script
        object_path: If (CDate(today) > CDate(START_DATE)) and (CDate(today) < CDate(END_DATE))
          Then
    - step:
        id: '55'
        action: Script
        object_path: WEEK_NUMBER = DataTable("WEEK_NUMBER", nextYearWorksheet)
    - step:
        id: '56'
        action: Script
        object_path: ESTIMATES_WEEK_A = DataTable("ESTIMATES_WEEK_A", nextYearWorksheet)
    - step:
        id: '57'
        action: Script
        object_path: ESTIMATES_WEEK_B = DataTable("ESTIMATES_WEEK_B", nextYearWorksheet)
    - step:
        id: '58'
        action: Script
        object_path: NULLS_PRELIM_A = DataTable("NULLS_PRELIM_A", nextYearWorksheet)
    - step:
        id: '59'
        action: Script
        object_path: NULLS_R1_A = DataTable("NULLS_R1_A", nextYearWorksheet)
    - step:
        id: '60'
        action: Script
        object_path: NULLS_R2_A = DataTable("NULLS_R2_A", nextYearWorksheet)
    - step:
        id: '61'
        action: Script
        object_path: NULLS_FINAL_A = DataTable("NULLS_FINAL_A", nextYearWorksheet)
    - step:
        id: '62'
        action: Script
        object_path: NULLS_PRELIM_B = DataTable("NULLS_PRELIM_B", nextYearWorksheet)
    - step:
        id: '63'
        action: Script
        object_path: NULLS_R1_B = DataTable("NULLS_R1_B", nextYearWorksheet)
    - step:
        id: '64'
        action: Script
        object_path: NULLS_R2_B = DataTable("NULLS_R2_B", nextYearWorksheet)
    - step:
        id: '65'
        action: Script
        object_path: NULLS_FINAL_B = DataTable("NULLS_FINAL_B", nextYearWorksheet)
    - step:
        id: '66'
        action: Script
        object_path: intRunLoop = intRowCount
    - step:
        id: '67'
        action: Script
        object_path: End If
    - step:
        id: '68'
        action: Script
        object_path: Next
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: Parameter("currentWeekNumber") = WEEK_NUMBER
    - step:
        id: '71'
        action: Script
        object_path: Parameter("ESTIMATES_WEEK_A") = ESTIMATES_WEEK_A
    - step:
        id: '72'
        action: Script
        object_path: Parameter("ESTIMATES_WEEK_B") = ESTIMATES_WEEK_B
    - step:
        id: '73'
        action: Script
        object_path: Parameter("NULLS_PRELIM_A") = NULLS_PRELIM_A
    - step:
        id: '74'
        action: Script
        object_path: Parameter("NULLS_R1_A") = NULLS_R1_A
    - step:
        id: '75'
        action: Script
        object_path: Parameter("NULLS_R2_A") = NULLS_R2_A
    - step:
        id: '76'
        action: Script
        object_path: Parameter("NULLS_FINAL_A") = NULLS_FINAL_A
    - step:
        id: '77'
        action: Script
        object_path: Parameter("NULLS_PRELIM_B") = NULLS_PRELIM_B
    - step:
        id: '78'
        action: Script
        object_path: Parameter("NULLS_R1_B") = NULLS_R1_B
    - step:
        id: '79'
        action: Script
        object_path: Parameter("NULLS_R2_B") = NULLS_R2_B
    - step:
        id: '80'
        action: Script
        object_path: Parameter("NULLS_FINAL_B") = NULLS_FINAL_B
    - step:
        id: '81'
        action: Script
        object_path: Parameter("todayDate") = today
    - step:
        id: '82'
        action: Script
        object_path: Parameter("todayYear") = calenderWorkSheet
  outputs:
  - currentWeekNumber:
      robot: true
      value: ${currentWeekNumber}
  - ESTIMATES_WEEK_A:
      robot: true
      value: ${ESTIMATES_WEEK_A}
  - ESTIMATES_WEEK_B:
      robot: true
      value: ${ESTIMATES_WEEK_B}
  - NULLS_PRELIM_A:
      robot: true
      value: ${NULLS_PRELIM_A}
  - NULLS_R1_A:
      robot: true
      value: ${NULLS_R1_A}
  - NULLS_R2_A:
      robot: true
      value: ${NULLS_R2_A}
  - NULLS_FINAL_A:
      robot: true
      value: ${NULLS_FINAL_A}
  - NULLS_PRELIM_B:
      robot: true
      value: ${NULLS_PRELIM_B}
  - NULLS_R1_B:
      robot: true
      value: ${NULLS_R1_B}
  - NULLS_R2_B:
      robot: true
      value: ${NULLS_R2_B}
  - NULLS_FINAL_B:
      robot: true
      value: ${NULLS_FINAL_B}
  - todayDate:
      robot: true
      value: ${todayDate}
  - todayYear:
      robot: true
      value: ${todayYear}
  - currentdayofWeek:
      robot: true
      value: ${currentdayofWeek}
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
