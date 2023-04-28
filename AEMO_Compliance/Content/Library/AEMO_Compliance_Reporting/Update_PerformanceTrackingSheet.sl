namespace: AEMO_Compliance_Reporting
operation:
  name: Update_PerformanceTrackingSheet
  inputs:
  - dayofWeek: Monday
  - role: LNSP
  - SummaryDoc: LNSP-2022.11.28-Week 49_Summary.xls
  - PerfTrackingDate:
      required: false
      default: 28/11/2022
  - location
  sequential_action:
    gav: com.microfocus.seq:AEMO_Compliance_Reporting.Update_PerformanceTrackingSheet:1.0.0
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
        object_path: LNSPPerfTrackingDoc= "AEMO Compliance Summary Report - Performance
          Tracking 2021_2022.xlsx"
    - step:
        id: '2'
        action: Script
        object_path: location = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: PerfTrackingLoc = location&"Formatted Files"
    - step:
        id: '4'
        action: Script
        object_path: dayofWeek = Parameter("dayofWeek")
    - step:
        id: '5'
        action: Script
        object_path: reportRole = Parameter("role")
    - step:
        id: '6'
        action: Script
        object_path: ExcelLocation = location&"Excel Files"
    - step:
        id: '7'
        action: Script
        object_path: SummaryDoc = Parameter("SummaryDoc")
    - step:
        id: '8'
        action: Script
        object_path: PerfTrackingDate = Parameter("PerfTrackingDate")
    - step:
        id: '9'
        action: Script
        object_path: PerfTrackingSheet = PerfTrackingLoc &"\"& LNSPPerfTrackingDoc
    - step:
        id: '10'
        action: Script
        object_path: SummaryFileLoc = ExcelLocation &"\"& SummaryDoc
    - step:
        id: '11'
        action: Script
        object_path: '''Based on current week day get next weekday'
    - step:
        id: '12'
        action: Script
        object_path: Select Case dayofWeek
    - step:
        id: '13'
        action: Script
        object_path: Case "Monday"
    - step:
        id: '14'
        action: Script
        object_path: nextday = "Tuesday"
    - step:
        id: '15'
        action: Script
        object_path: Case "Tuesday"
    - step:
        id: '16'
        action: Script
        object_path: nextday = "Wednesday"
    - step:
        id: '17'
        action: Script
        object_path: Case "Wednesday"
    - step:
        id: '18'
        action: Script
        object_path: nextday = "Thursday"
    - step:
        id: '19'
        action: Script
        object_path: End Select
    - step:
        id: '20'
        action: Script
        object_path: '''summary file location from downloaded files and day role value
          to check in the perf tracking document'
    - step:
        id: '21'
        action: Script
        object_path: dayRole = dayofWeek&" - "&reportRole
    - step:
        id: '22'
        action: Script
        object_path: If (PerfTrackingDate = empty) or (PerfTrackingDate = "") Then
    - step:
        id: '23'
        action: Script
        object_path: PerfTrackingDate = Date
    - step:
        id: '24'
        action: Script
        object_path: Else
    - step:
        id: '25'
        action: Script
        object_path: PerfTrackingDate = CDate(PerfTrackingDate)
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        action: Script
        object_path: '''open the summaryu sheet to get the query and count column
          names'
    - step:
        id: '28'
        action: Script
        object_path: Set ObjAppExcel = CreateObject("Excel.Application")
    - step:
        id: '29'
        object_path: ObjAppExcel
        action: visible
        args: = false
    - step:
        id: '30'
        action: Script
        object_path: Set summaryworkBook = ObjAppExcel.Workbooks.open(SummaryFileLoc)
    - step:
        id: '31'
        action: Script
        object_path: Set SummarySheet = summaryworkBook.ActiveSheet
    - step:
        id: '32'
        action: Script
        object_path: Summaryrows = SummarySheet.UsedRange.Rows.Count
    - step:
        id: '33'
        action: Script
        object_path: SummaryCols = SummarySheet.UsedRange.Columns.Count
    - step:
        id: '34'
        action: Script
        object_path: '''get Query id Column'
    - step:
        id: '35'
        action: Script
        object_path: For cols = 1 to SummaryCols
    - step:
        id: '36'
        action: Script
        object_path: If SummarySheet.Cells(1,cols) = "QueryId" Then
    - step:
        id: '37'
        action: Script
        object_path: queryCol = cols
    - step:
        id: '38'
        action: Script
        object_path: Exit For
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: Next
    - step:
        id: '41'
        action: Script
        object_path: '''get Count Column'
    - step:
        id: '42'
        action: Script
        object_path: For cols = 1 to SummaryCols
    - step:
        id: '43'
        action: Script
        object_path: If SummarySheet.Cells(1,cols) = "Count" Then
    - step:
        id: '44'
        action: Script
        object_path: countCol = cols
    - step:
        id: '45'
        action: Script
        object_path: Exit For
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: Next
    - step:
        id: '48'
        action: Script
        object_path: '''store query and count data to a Dictionary when count is not
          0'
    - step:
        id: '49'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '50'
        action: Script
        object_path: For querys = 2 to Summaryrows
    - step:
        id: '51'
        action: Script
        object_path: If SummarySheet.Cells(querys,countCol) <> "" Then
    - step:
        id: '52'
        action: Script
        object_path: If oDic.Exists(Trim(SummarySheet.Cells(querys,queryCol))) Then
    - step:
        id: '53'
        action: Script
        object_path: itm = oDic.Item(SummarySheet.Cells(querys,queryCol))
    - step:
        id: '54'
        object_path: oDic.Item(SummarySheet.Cells(querys,queryCol)) = SummarySheet
        action: Cells(querys,countCol)
        args: + itm
    - step:
        id: '55'
        action: Script
        object_path: Else
    - step:
        id: '56'
        object_path: oDic.Add Trim(SummarySheet.Cells(querys,queryCol)) , SummarySheet
        action: Cells(querys,countCol)
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: Next
    - step:
        id: '60'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '61'
        action: Script
        object_path: ''' open perf tracking document to get the current day''s row
          and date column'
    - step:
        id: '62'
        action: Script
        object_path: Set perfworkBook = ObjAppExcel.Workbooks.open(PerfTrackingSheet)
    - step:
        id: '63'
        action: Script
        object_path: REm Get the object of the first sheet in the workbook
    - step:
        id: '64'
        action: Script
        object_path: Set objectSheet = perfworkBook.Sheets("Summary")
    - step:
        id: '65'
        action: Script
        object_path: '''set objValueFind = objectSheet.UsedRange.Find(PerfTrackingDate)'
    - step:
        id: '66'
        action: Script
        object_path: usedRows = objectSheet.UsedRange.Rows.Count
    - step:
        id: '67'
        action: Script
        object_path: colCount = objectSheet.UsedRange.Columns.Count
    - step:
        id: '68'
        action: Script
        object_path: '''get currnt days''s row'
    - step:
        id: '69'
        action: Script
        object_path: For i = 1 to usedRows
    - step:
        id: '70'
        action: Script
        object_path: sdq = objectSheet.Cells(i,1)
    - step:
        id: '71'
        action: Script
        object_path: If sdq = dayRole Then
    - step:
        id: '72'
        action: Script
        object_path: currRow = i
    - step:
        id: '73'
        action: Script
        object_path: Exit For
    - step:
        id: '74'
        action: Script
        object_path: End If
    - step:
        id: '75'
        action: Script
        object_path: Next
    - step:
        id: '76'
        action: Script
        object_path: '''get next days row'
    - step:
        id: '77'
        action: Script
        object_path: For nextdayitem = currRow to usedRows
    - step:
        id: '78'
        action: Script
        object_path: If nextday <> Empty Then
    - step:
        id: '79'
        action: Script
        object_path: nextweekday = objectSheet.Cells(nextdayitem,1)
    - step:
        id: '80'
        action: Script
        object_path: If inStr(1, nextweekday, nextday) > 0 Then
    - step:
        id: '81'
        action: Script
        object_path: nextdayRow = nextdayitem
    - step:
        id: '82'
        action: Script
        object_path: Exit For
    - step:
        id: '83'
        action: Script
        object_path: End If
    - step:
        id: '84'
        action: Script
        object_path: Else
    - step:
        id: '85'
        action: Script
        object_path: nextdayRow = usedRows
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: Next
    - step:
        id: '88'
        action: Script
        object_path: '''get current date''s column'
    - step:
        id: '89'
        action: Script
        object_path: For colCnt = 1 to colCount
    - step:
        id: '90'
        action: Script
        object_path: dateRow = objectSheet.Cells(currRow,colCnt)
    - step:
        id: '91'
        action: Script
        object_path: If dateRow = PerfTrackingDate Then
    - step:
        id: '92'
        action: Script
        object_path: dateCol = colCnt
    - step:
        id: '93'
        action: Script
        object_path: Exit for
    - step:
        id: '94'
        action: Script
        object_path: End If
    - step:
        id: '95'
        action: Script
        object_path: Next
    - step:
        id: '96'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '97'
        action: Script
        object_path: '''Write values to the perf tracking document'
    - step:
        id: '98'
        action: Script
        object_path: For summarySheetCount = currRow to nextdayRow
    - step:
        id: '99'
        action: Script
        object_path: queryName = objectSheet.Cells(summarySheetCount,1)
    - step:
        id: '100'
        action: Script
        object_path: If oDic.Exists(Trim(queryName)) then
    - step:
        id: '101'
        object_path: objectSheet.Cells(summarySheetCount,dateCol)  = oDic
        action: Item(Trim(queryName))
    - step:
        id: '102'
        action: Script
        object_path: End If
    - step:
        id: '103'
        action: Script
        object_path: Next
    - step:
        id: '104'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '105'
        object_path: perfworkBook
        action: Save
    - step:
        id: '106'
        object_path: perfworkBook
        action: close
    - step:
        id: '107'
        object_path: ObjAppExcel
        action: quit
    - step:
        id: '108'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '109'
        action: Script
        object_path: Set ObjAppExcel = Nothing
    - step:
        id: '110'
        action: Script
        object_path: Set SummarySheet = Nothing
    - step:
        id: '111'
        action: Script
        object_path: Set objectSheet = Nothing
    - step:
        id: '112'
        action: Script
        object_path: Set perfworkBook =  Nothing
    - step:
        id: '113'
        action: Script
        object_path: Set summaryworkBook = Nothing
    - step:
        id: '114'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '115'
        action: Script
        object_path: usedRows = Empty
    - step:
        id: '116'
        action: Script
        object_path: colCount = Empty
    - step:
        id: '117'
        action: Script
        object_path: cols = Empty
    - step:
        id: '118'
        action: Script
        object_path: queryCol = Empty
    - step:
        id: '119'
        action: Script
        object_path: countCol = Empty
    - step:
        id: '120'
        action: Script
        object_path: querys = Empty
    - step:
        id: '121'
        action: Script
        object_path: i = Empty
    - step:
        id: '122'
        action: Script
        object_path: sdq = Empty
    - step:
        id: '123'
        action: Script
        object_path: currRow = Empty
    - step:
        id: '124'
        action: Script
        object_path: nextdayitem =Empty
    - step:
        id: '125'
        action: Script
        object_path: nextweekday = Empty
    - step:
        id: '126'
        action: Script
        object_path: nextdayRow = Empty
    - step:
        id: '127'
        action: Script
        object_path: colCnt = Empty
    - step:
        id: '128'
        action: Script
        object_path: dateRow = Empty
    - step:
        id: '129'
        action: Script
        object_path: dateCol = Empty
    - step:
        id: '130'
        action: Script
        object_path: queryName = Empty
    - step:
        id: '131'
        action: Script
        object_path: ExitTest
  outputs:
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
