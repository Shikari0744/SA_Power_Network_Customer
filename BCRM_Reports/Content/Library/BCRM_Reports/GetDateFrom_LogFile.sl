namespace: BCRM_Reports
operation:
  name: GetDateFrom_LogFile
  inputs:
  - RunDate:
      required: false
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.GetDateFrom_LogFile:1.0.0
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
        object_path: LogFilePath = Parameter("location")&"MDP Logs\Execution Log.txt"
    - step:
        id: '2'
        action: Script
        object_path: runDate = Parameter("RunDate")
    - step:
        id: '3'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '4'
        action: Script
        object_path: Set objFile = objFSO.OpenTextFile(LogFilePath, 1)
    - step:
        id: '5'
        action: Script
        object_path: Do Until objFile.AtEndOfStream
    - step:
        id: '6'
        action: Script
        object_path: strLine = objFile.ReadLine
    - step:
        id: '7'
        action: Script
        object_path: If runDate <> "" and InStr(strLine, runDate) Then
    - step:
        id: '8'
        action: Script
        object_path: Exit Do
    - step:
        id: '9'
        action: Script
        object_path: End If
    - step:
        id: '10'
        action: Script
        object_path: Loop
    - step:
        id: '11'
        object_path: objFile
        action: Close
    - step:
        id: '12'
        action: Script
        object_path: Set objFile = Nothing
    - step:
        id: '13'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '14'
        action: Script
        object_path: dateLoc = Instr(1, strLine, "T")
    - step:
        id: '15'
        action: Script
        object_path: currReportDate = Left(strLine, dateLoc-1)
    - step:
        id: '16'
        action: Script
        object_path: Parameter("currReportDate") = currReportDate
    - step:
        id: '17'
        action: Script
        object_path: '''get old report Name String'
    - step:
        id: '18'
        action: Script
        object_path: currReportDate = CDate(currReportDate)
    - step:
        id: '19'
        action: Script
        object_path: rptDateWeekday = WeekDayName(WeekDay(currReportDate))
    - step:
        id: '20'
        action: Script
        object_path: '''If current day is monday get friday as previous week day'
    - step:
        id: '21'
        action: Script
        object_path: If rptDateWeekday = "Monday" Then
    - step:
        id: '22'
        action: Script
        object_path: oldRptDate = DateAdd("d", -3, currReportDate)
    - step:
        id: '23'
        action: Script
        object_path: Else
    - step:
        id: '24'
        action: Script
        object_path: oldRptDate = DateAdd("d", -1, currReportDate)
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: oldRptNameStr = Replace(oldRptDate, "/", ".")
    - step:
        id: '27'
        action: Script
        object_path: Parameter("oldRptNameStr") = oldRptNameStr
    - step:
        id: '28'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '29'
        action: Script
        object_path: LogFilePath = empty
    - step:
        id: '30'
        action: Script
        object_path: dateLoc = empty
    - step:
        id: '31'
        action: Script
        object_path: currReportDate = empty
    - step:
        id: '32'
        action: Script
        object_path: ExitTest
  outputs:
  - currReportDate:
      robot: true
      value: ${currReportDate}
  - oldRptNameStr:
      robot: true
      value: ${oldRptNameStr}
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
