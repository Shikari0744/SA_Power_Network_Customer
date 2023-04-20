namespace: BCRM_Reports
operation:
  name: Initiate_Report_Download
  inputs:
  - EstimatesWeekA_StartDT:
      required: false
  - EstimatesWeekA_EndDT:
      required: false
  - EstimatesWeekB_StartDT:
      required: false
  - EstimatesWeekB_EndDT:
      required: false
  - NullsPrelimA_StartDT:
      required: false
  - NullsPrelimA_EndDT:
      required: false
  - NullsR1A_StartDT:
      required: false
  - NullsR1A_EndDT:
      required: false
  - NullsR2A_StartDT:
      required: false
  - NullsR2A_EndDT:
      required: false
  - NullsFinalA_StartDT:
      required: false
  - NullsFinalA_EndDT:
      required: false
  - NullsPrelimB_StartDT:
      required: false
  - NullsPrelimB_EndDT:
      required: false
  - NullsR1B_StartDT:
      required: false
  - NullsR1B_EndDT:
      required: false
  - NullsR2B_StartDT:
      required: false
  - NullsR2B_EndDT:
      required: false
  - NullsFinalB_StartDT:
      required: false
  - NullsFinalB_EndDT:
      required: false
  - MSATS_UserID
  - MSATS_UserPWD
  - runDate:
      required: false
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.Initiate_Report_Download:1.0.0
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
        object_path: '''Create a log file for request IDs'
    - step:
        id: '2'
        action: Script
        object_path: LogFileLocation = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: RequestIDLogLocation = LogFileLocation&"MDP Logs\Request IDs.txt"
    - step:
        id: '4'
        action: Script
        object_path: DownloadedLogLocation = LogFileLocation&"\MDP Logs\Reports Downloaded.txt"
    - step:
        id: '5'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '6'
        action: Script
        object_path: If fso.FileExists(RequestIDLogLocation)Then
    - step:
        id: '7'
        object_path: fso
        action: DeleteFile(RequestIDLogLocation)
    - step:
        id: '8'
        action: Script
        object_path: End If
    - step:
        id: '9'
        action: Script
        object_path: If fso.FileExists(DownloadedLogLocation)Then
    - step:
        id: '10'
        object_path: fso
        action: DeleteFile(DownloadedLogLocation)
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: Set textFile = fso.CreateTextFile(RequestIDLogLocation, true)
    - step:
        id: '13'
        object_path: textFile
        action: WriteLine("Request
        args: IDs")
    - step:
        id: '14'
        object_path: textFile
        action: Close
    - step:
        id: '15'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '16'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '17'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '18'
        action: Script
        object_path: LogFileLocation = Parameter("location")
    - step:
        id: '19'
        action: Script
        object_path: '''Get date for generating log and running reports - test comments'
    - step:
        id: '20'
        action: Script
        object_path: If Parameter("runDate") = "" Then
    - step:
        id: '21'
        action: Script
        object_path: strSafeDate = Right("0" & DatePart("d",Date), 2) &"/"& Right("0"
          & DatePart("m",Date), 2) &"/"& DatePart("yyyy",Date)
    - step:
        id: '22'
        action: Script
        object_path: Else
    - step:
        id: '23'
        action: Script
        object_path: strSafeDate = Replace(Parameter("runDate"),".","/")
    - step:
        id: '24'
        action: Script
        object_path: End If
    - step:
        id: '25'
        action: Script
        object_path: strSafeTime = Right("0" & Hour(Now), 2) &":"& Right("0" & Minute(Now),
          2) &":"& Right("0" & Second(Now), 2)
    - step:
        id: '26'
        action: Script
        object_path: strDateTime = strSafeDate &"T"& strSafeTime
    - step:
        id: '27'
        action: Script
        object_path: Header = "rptDate,EstimatesWeekA_Int,EstimatesWeekA_Cons,EstimatesWeekB_Int,EstimatesWeekB_Cons,NullsPrelimA_Int,NullsPrelimA_Cons,NullsPrelimB_Int,NullsPrelimB_Cons,NullsR1A_Int,NullsR1A_Cons,NullsR1B_Int,NullsR1B_Cons,NullsR2A_Int,NullsR2A_Cons,NullsR2B_Int,NullsR2B_Cons,NullsFinalA_Int,NullsFinalA_Cons,NullsFinalB_Int,NullsFinalB_Cons,CurrArchivelink,rptAvailFlag"
    - step:
        id: '28'
        action: Script
        object_path: '''LogFile Check'
    - step:
        id: '29'
        action: Script
        object_path: logfileFolder = InStrRev(LogFileLocation, "\")
    - step:
        id: '30'
        action: Script
        object_path: logfileFolder = Mid(LogFileLocation, logfileFolder+1, Len(LogFileLocation))
    - step:
        id: '31'
        action: Script
        object_path: ExectionLogFile = LogFileLocation&"\MDP Logs\Execution Log.txt"
    - step:
        id: '32'
        action: Script
        object_path: Parameter("executionLog") = ExectionLogFile
    - step:
        id: '33'
        action: Script
        object_path: '''Creates the log file header, but is already created so commented
          out'
    - step:
        id: '34'
        action: Script
        object_path: '''Set fso = CreateObject("Scripting.FileSystemObject")'
    - step:
        id: '35'
        action: Script
        object_path: '''If fso.FileExists(ExectionLogFile) Then'
    - step:
        id: '36'
        action: Script
        object_path: "'\tSET objFile = fso.GetFile(ExectionLogFile)"
    - step:
        id: '37'
        action: Script
        object_path: "'\tIf objFile.Size > 0 Then"
    - step:
        id: '38'
        action: Script
        object_path: "'\t\tcontent = fso.OpenTextFile(ExectionLogFile).ReadAll()"
    - step:
        id: '39'
        action: Script
        object_path: "'\tElse"
    - step:
        id: '40'
        action: Script
        object_path: "'\t\t'Do something else"
    - step:
        id: '41'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '42'
        action: Script
        object_path: '''Else'
    - step:
        id: '43'
        action: Script
        object_path: "'\tSet MDPLogfile = fso.CreateTextFile(ExectionLogFile, True)"
    - step:
        id: '44'
        action: Script
        object_path: "'\tMDPLogfile.WriteLine(Header)"
    - step:
        id: '45'
        action: Script
        object_path: "'\tMDPLogfile.Close"
    - step:
        id: '46'
        action: Script
        object_path: "'\tSet MDPLogfile = Nothing"
    - step:
        id: '47'
        action: Script
        object_path: '''End If'
    - step:
        id: '48'
        action: Script
        object_path: '''Set fso = Nothing'
    - step:
        id: '49'
        action: Script
        object_path: logEntry = strDateTime &","
    - step:
        id: '50'
        action: Script
        object_path: URL = "https://msats.prod.nemnet.net.au/msats/index.jsp"
    - step:
        id: '51'
        object_path: SystemUtil
        action: Run
        args: '"chrome.exe",URL,,,3'
    - step:
        id: '52'
        action: Script
        object_path: Function date_ddmmmyyy(strDate)
    - step:
        id: '53'
        action: Script
        object_path: If strDate <> "" Then
    - step:
        id: '54'
        action: Script
        object_path: strDate = CDate (strDate)
    - step:
        id: '55'
        action: Script
        object_path: a = Day(strDate)
    - step:
        id: '56'
        action: Script
        object_path: b = MonthName(Month(strDate),True)
    - step:
        id: '57'
        action: Script
        object_path: c = Year(strDate)
    - step:
        id: '58'
        action: Script
        object_path: If a < 10 Then
    - step:
        id: '59'
        action: Script
        object_path: a = "0"&a
    - step:
        id: '60'
        action: Script
        object_path: End If
    - step:
        id: '61'
        action: Script
        object_path: date_ddmmmyyy = a &"-"& b &"-"& c
    - step:
        id: '62'
        action: Script
        object_path: End If
    - step:
        id: '63'
        action: Script
        object_path: End Function
    - step:
        id: '64'
        action: Script
        object_path: Sub sapn_screenShot_done(msg)
    - step:
        id: '65'
        action: Script
        object_path: screenShotFileLocaiton = "C:\temp\HP-UFT-Test.png"
    - step:
        id: '66'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton ,true
    - step:
        id: '67'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '68'
        action: Script
        object_path: Set objFSo = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '69'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '70'
        action: Script
        object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
    - step:
        id: '71'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg, screenShotFileLocaiton
    - step:
        id: '72'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '73'
        object_path: SystemUtil
        action: Run
        args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
    - step:
        id: '74'
        action: Script
        object_path: else
    - step:
        id: '75'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg
    - step:
        id: '76'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '77'
        action: Script
        object_path: end if
    - step:
        id: '78'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '79'
        action: Script
        object_path: Set objFSo = Nothing
    - step:
        id: '80'
        action: Script
        object_path: End Sub
    - step:
        id: '81'
        action: Script
        object_path: EstimatesWeekA_Start = Parameter("EstimatesWeekA_StartDT")
    - step:
        id: '82'
        action: Script
        object_path: EstimatesWeekA_Start = date_ddmmmyyy(EstimatesWeekA_Start)
    - step:
        id: '83'
        action: Script
        object_path: EstimatesWeekA_End = Parameter("EstimatesWeekA_EndDT")
    - step:
        id: '84'
        action: Script
        object_path: EstimatesWeekA_End = date_ddmmmyyy(EstimatesWeekA_End)
    - step:
        id: '85'
        action: Script
        object_path: EstimatesWeekB_Start = Parameter("EstimatesWeekB_StartDT")
    - step:
        id: '86'
        action: Script
        object_path: EstimatesWeekB_Start = date_ddmmmyyy(EstimatesWeekB_Start)
    - step:
        id: '87'
        action: Script
        object_path: EstimatesWeekB_End = Parameter("EstimatesWeekB_EndDT")
    - step:
        id: '88'
        action: Script
        object_path: EstimatesWeekB_End = date_ddmmmyyy(EstimatesWeekB_End)
    - step:
        id: '89'
        action: Script
        object_path: NullsPrelimA_Start = Parameter("NullsPrelimA_StartDT")
    - step:
        id: '90'
        action: Script
        object_path: NullsPrelimA_Start = date_ddmmmyyy(NullsPrelimA_Start)
    - step:
        id: '91'
        action: Script
        object_path: NullsPrelimA_End = Parameter("NullsPrelimA_EndDT")
    - step:
        id: '92'
        action: Script
        object_path: NullsPrelimA_End = date_ddmmmyyy(NullsPrelimA_End)
    - step:
        id: '93'
        action: Script
        object_path: NullsR1A_Start = Parameter("NullsR1A_StartDT")
    - step:
        id: '94'
        action: Script
        object_path: NullsR1A_Start = date_ddmmmyyy(NullsR1A_Start)
    - step:
        id: '95'
        action: Script
        object_path: NullsR1A_End = Parameter("NullsR1A_EndDT")
    - step:
        id: '96'
        action: Script
        object_path: NullsR1A_End = date_ddmmmyyy(NullsR1A_End)
    - step:
        id: '97'
        action: Script
        object_path: NullsR2A_Start = Parameter("NullsR2A_StartDT")
    - step:
        id: '98'
        action: Script
        object_path: NullsR2A_Start = date_ddmmmyyy(NullsR2A_Start)
    - step:
        id: '99'
        action: Script
        object_path: NullsR2A_End = Parameter("NullsR2A_EndDT")
    - step:
        id: '100'
        action: Script
        object_path: NullsR2A_End = date_ddmmmyyy(NullsR2A_End)
    - step:
        id: '101'
        action: Script
        object_path: NullsFinalA_Start = Parameter("NullsFinalA_StartDT")
    - step:
        id: '102'
        action: Script
        object_path: NullsFinalA_Start = date_ddmmmyyy(NullsFinalA_Start)
    - step:
        id: '103'
        action: Script
        object_path: NullsFinalA_End = Parameter("NullsFinalA_EndDT")
    - step:
        id: '104'
        action: Script
        object_path: NullsFinalA_End = date_ddmmmyyy(NullsFinalA_End)
    - step:
        id: '105'
        action: Script
        object_path: NullsPrelimB_Start = Parameter("NullsPrelimB_StartDT")
    - step:
        id: '106'
        action: Script
        object_path: NullsPrelimB_Start = date_ddmmmyyy(NullsPrelimB_Start)
    - step:
        id: '107'
        action: Script
        object_path: NullsPrelimB_End = Parameter("NullsPrelimB_EndDT")
    - step:
        id: '108'
        action: Script
        object_path: NullsPrelimB_End = date_ddmmmyyy(NullsPrelimB_End)
    - step:
        id: '109'
        action: Script
        object_path: NullsR1B_Start = Parameter("NullsR1B_StartDT")
    - step:
        id: '110'
        action: Script
        object_path: NullsR1B_Start = date_ddmmmyyy(NullsR1B_Start)
    - step:
        id: '111'
        action: Script
        object_path: NullsR1B_End = Parameter("NullsR1B_EndDT")
    - step:
        id: '112'
        action: Script
        object_path: NullsR1B_End = date_ddmmmyyy(NullsR1B_End)
    - step:
        id: '113'
        action: Script
        object_path: NullsR2B_Start = Parameter("NullsR2B_StartDT")
    - step:
        id: '114'
        action: Script
        object_path: NullsR2B_Start = date_ddmmmyyy(NullsR2B_Start)
    - step:
        id: '115'
        action: Script
        object_path: NullsR2B_End = Parameter("NullsR2B_EndDT")
    - step:
        id: '116'
        action: Script
        object_path: NullsR2B_End = date_ddmmmyyy(NullsR2B_End)
    - step:
        id: '117'
        action: Script
        object_path: NullsFinalB_Start = Parameter("NullsFinalB_StartDT")
    - step:
        id: '118'
        action: Script
        object_path: NullsFinalB_Start = date_ddmmmyyy(NullsFinalB_Start)
    - step:
        id: '119'
        action: Script
        object_path: NullsFinalB_End = Parameter("NullsFinalB_EndDT")
    - step:
        id: '120'
        action: Script
        object_path: NullsFinalB_End = date_ddmmmyyy(NullsFinalB_End)
    - step:
        id: '121'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '122'
        object_path: Browser("Login").Page("Login").WebEdit("UserId")
        action: Set
        args: Parameter("MSATS_UserID")
    - step:
        id: '123'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '124'
        object_path: Browser("Login").Page("Login").WebEdit("Password")
        action: Set
        args: Parameter("MSATS_UserPWD")
    - step:
        id: '125'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '126'
        object_path: Browser("Login").Page("Login").Image("Login")
        action: Click
    - step:
        id: '127'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '128'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").WebElement("ReportsandAlerts")
        action: Click
    - step:
        id: '129'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '130'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '131'
        action: Script
        object_path: '''Create empty variable to add to if no report is initiated
          for download'
    - step:
        id: '132'
        action: Script
        object_path: ReportsDownloaded = ""
    - step:
        id: '133'
        action: Script
        object_path: '''Estimate WeekA Reports'
    - step:
        id: '134'
        action: Script
        object_path: If (EstimatesWeekA_Start <> "") and (EstimatesWeekA_End <> "")
          Then
    - step:
        id: '135'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM26 -
          MDP Substitution")
        action: Click
    - step:
        id: '136'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '137'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '138'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: EstimatesWeekA_Start
    - step:
        id: '139'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: EstimatesWeekA_End
    - step:
        id: '140'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '141'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '142'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '143'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '144'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '145'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '146'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '147'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Estimates
          Week A report not initiated,"
    - step:
        id: '148'
        action: Script
        object_path: Else
    - step:
        id: '149'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '150'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '151'
        object_path: f
        action: WriteLine
        args: ("Estimate Week A Reports Interval")
    - step:
        id: '152'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '153'
        object_path: f
        action: Close
    - step:
        id: '154'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '155'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '156'
        action: Script
        object_path: End If
    - step:
        id: '157'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '158'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '159'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '160'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM26 -
          MDP Substitution")
        action: Click
    - step:
        id: '161'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '162'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: EstimatesWeekA_Start
    - step:
        id: '163'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: EstimatesWeekA_End
    - step:
        id: '164'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '165'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '166'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '167'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '168'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '169'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '170'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '171'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Estimates
          Week A report not initiated,"
    - step:
        id: '172'
        action: Script
        object_path: Else
    - step:
        id: '173'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '174'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '175'
        object_path: f
        action: WriteLine
        args: ("Estimate Week A Reports Consumption")
    - step:
        id: '176'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '177'
        object_path: f
        action: Close
    - step:
        id: '178'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '179'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '180'
        action: Script
        object_path: End If
    - step:
        id: '181'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '182'
        action: Script
        object_path: Else
    - step:
        id: '183'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '184'
        action: Script
        object_path: End If
    - step:
        id: '185'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '186'
        action: Script
        object_path: '''Estimate WeekB Reports'
    - step:
        id: '187'
        action: Script
        object_path: If (EstimatesWeekB_Start <> "") and (EstimatesWeekB_End <> "")
          Then
    - step:
        id: '188'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '189'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '190'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM26 -
          MDP Substitution")
        action: Click
    - step:
        id: '191'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '192'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '193'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: EstimatesWeekB_Start
    - step:
        id: '194'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: EstimatesWeekB_End
    - step:
        id: '195'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '196'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '197'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '198'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '199'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '200'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '201'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '202'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Estimates
          Week B report not initiated,"
    - step:
        id: '203'
        action: Script
        object_path: Else
    - step:
        id: '204'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '205'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '206'
        object_path: f
        action: WriteLine
        args: ("Estimate Week B Reports Interval")
    - step:
        id: '207'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '208'
        object_path: f
        action: Close
    - step:
        id: '209'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '210'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '211'
        action: Script
        object_path: End If
    - step:
        id: '212'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '213'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '214'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '215'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM26 -
          MDP Substitution")
        action: Click
    - step:
        id: '216'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '217'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: EstimatesWeekB_Start
    - step:
        id: '218'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: EstimatesWeekB_End
    - step:
        id: '219'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '220'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '221'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '222'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '223'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '224'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '225'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '226'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Estimates
          Week B report not initiated,"
    - step:
        id: '227'
        action: Script
        object_path: Else
    - step:
        id: '228'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '229'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '230'
        object_path: f
        action: WriteLine
        args: ("Estimate Week B Reports Consumption")
    - step:
        id: '231'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '232'
        object_path: f
        action: Close
    - step:
        id: '233'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '234'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '235'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '236'
        action: Script
        object_path: End If
    - step:
        id: '237'
        action: Script
        object_path: Else
    - step:
        id: '238'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '239'
        action: Script
        object_path: End If
    - step:
        id: '240'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '241'
        action: Script
        object_path: '''Nulls Prelim A reports'
    - step:
        id: '242'
        action: Script
        object_path: If (NullsPrelimA_Start <> "") and (NullsPrelimA_End <> "") Then
    - step:
        id: '243'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '244'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '245'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '246'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '247'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '248'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsPrelimA_Start
    - step:
        id: '249'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsPrelimA_End
    - step:
        id: '250'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '251'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '252'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '253'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '254'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '255'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '256'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '257'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '258'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '259'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '260'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '261'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls Prelim
          A report not initiated,"
    - step:
        id: '262'
        action: Script
        object_path: Else
    - step:
        id: '263'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '264'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '265'
        object_path: f
        action: WriteLine
        args: ("Nulls Prelim A Reports Interval")
    - step:
        id: '266'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '267'
        object_path: f
        action: Close
    - step:
        id: '268'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '269'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '270'
        action: Script
        object_path: End If
    - step:
        id: '271'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '272'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '273'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '274'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '275'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '276'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsPrelimA_Start
    - step:
        id: '277'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsPrelimA_End
    - step:
        id: '278'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '279'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '280'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '281'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '282'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '283'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '284'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '285'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '286'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '287'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '288'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '289'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '290'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls Prelim
          A report not initiated,"
    - step:
        id: '291'
        action: Script
        object_path: Else
    - step:
        id: '292'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '293'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '294'
        object_path: f
        action: WriteLine
        args: ("Nulls Prelim A Reports Consumption")
    - step:
        id: '295'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '296'
        object_path: f
        action: Close
    - step:
        id: '297'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '298'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '299'
        action: Script
        object_path: End If
    - step:
        id: '300'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '301'
        action: Script
        object_path: Else
    - step:
        id: '302'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '303'
        action: Script
        object_path: End If
    - step:
        id: '304'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '305'
        action: Script
        object_path: '''Nulls Prelim B reports'
    - step:
        id: '306'
        action: Script
        object_path: If (NullsPrelimB_Start <> "") and (NullsPrelimB_End <> "") Then
    - step:
        id: '307'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '308'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '309'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '310'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '311'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsPrelimB_Start
    - step:
        id: '312'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsPrelimB_End
    - step:
        id: '313'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '314'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '315'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '316'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '317'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '318'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '319'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '320'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '321'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '322'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '323'
        action: Script
        object_path: If requestID <> "" Then
    - step:
        id: '324'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls Prelim
          B report not initiated,"
    - step:
        id: '325'
        action: Script
        object_path: Else
    - step:
        id: '326'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '327'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '328'
        object_path: f
        action: WriteLine
        args: ("Nulls Prelim B Reports Interval")
    - step:
        id: '329'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '330'
        object_path: f
        action: Close
    - step:
        id: '331'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '332'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '333'
        action: Script
        object_path: End If
    - step:
        id: '334'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '335'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '336'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '337'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '338'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '339'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsPrelimB_Start
    - step:
        id: '340'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsPrelimB_End
    - step:
        id: '341'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '342'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '343'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '344'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '345'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '346'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '347'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '348'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '349'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '350'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '351'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '352'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '353'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls Prelim
          B report not initiated,"
    - step:
        id: '354'
        action: Script
        object_path: Else
    - step:
        id: '355'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '356'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '357'
        object_path: f
        action: WriteLine
        args: ("Nulls Prelim B Reports Consumption")
    - step:
        id: '358'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '359'
        object_path: f
        action: Close
    - step:
        id: '360'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '361'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '362'
        action: Script
        object_path: End If
    - step:
        id: '363'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '364'
        action: Script
        object_path: Else
    - step:
        id: '365'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '366'
        action: Script
        object_path: End If
    - step:
        id: '367'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '368'
        action: Script
        object_path: '''Nulls R1A reports'
    - step:
        id: '369'
        action: Script
        object_path: If (NullsR1A_Start <> "") and (NullsR1A_End <> "") Then
    - step:
        id: '370'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '371'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '372'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '373'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '374'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR1A_Start
    - step:
        id: '375'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR1A_End
    - step:
        id: '376'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '377'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '378'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '379'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '380'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '381'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '382'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '383'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '384'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '385'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '386'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '387'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls R1A
          report not initiated,"
    - step:
        id: '388'
        action: Script
        object_path: Else
    - step:
        id: '389'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '390'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '391'
        object_path: f
        action: WriteLine
        args: ("Nulls R1 A Reports Interval")
    - step:
        id: '392'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '393'
        object_path: f
        action: Close
    - step:
        id: '394'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '395'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '396'
        action: Script
        object_path: End If
    - step:
        id: '397'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '398'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '399'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '400'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '401'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '402'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR1A_Start
    - step:
        id: '403'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR1A_End
    - step:
        id: '404'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '405'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '406'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '407'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '408'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '409'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '410'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '411'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '412'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '413'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '414'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '415'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '416'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls R1A
          report not initiated,"
    - step:
        id: '417'
        action: Script
        object_path: Else
    - step:
        id: '418'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '419'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '420'
        object_path: f
        action: WriteLine
        args: ("Nulls R1 A Reports Consumption")
    - step:
        id: '421'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '422'
        object_path: f
        action: Close
    - step:
        id: '423'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '424'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '425'
        action: Script
        object_path: End If
    - step:
        id: '426'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '427'
        action: Script
        object_path: Else
    - step:
        id: '428'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '429'
        action: Script
        object_path: End If
    - step:
        id: '430'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '431'
        action: Script
        object_path: '''Nulls R1B reports'
    - step:
        id: '432'
        action: Script
        object_path: If (NullsR1B_Start <> "") and (NullsR1B_End <> "") Then
    - step:
        id: '433'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '434'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '435'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '436'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '437'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR1B_Start
    - step:
        id: '438'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR1B_End
    - step:
        id: '439'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '440'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '441'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '442'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '443'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '444'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '445'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '446'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '447'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '448'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '449'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '450'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls R1B
          report not initiated,"
    - step:
        id: '451'
        action: Script
        object_path: Else
    - step:
        id: '452'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '453'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '454'
        object_path: f
        action: WriteLine
        args: ("Nulls R1 B Reports Interval")
    - step:
        id: '455'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '456'
        object_path: f
        action: Close
    - step:
        id: '457'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '458'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '459'
        action: Script
        object_path: End If
    - step:
        id: '460'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '461'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '462'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '463'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '464'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '465'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR1B_Start
    - step:
        id: '466'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR1B_End
    - step:
        id: '467'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '468'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '469'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '470'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '471'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '472'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '473'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '474'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '475'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '476'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '477'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '478'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '479'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls R1B
          report not initiated,"
    - step:
        id: '480'
        action: Script
        object_path: Else
    - step:
        id: '481'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '482'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '483'
        object_path: f
        action: WriteLine
        args: ("Nulls R1 B Reports Consumption")
    - step:
        id: '484'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '485'
        object_path: f
        action: Close
    - step:
        id: '486'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '487'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '488'
        action: Script
        object_path: End If
    - step:
        id: '489'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '490'
        action: Script
        object_path: Else
    - step:
        id: '491'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '492'
        action: Script
        object_path: End If
    - step:
        id: '493'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '494'
        action: Script
        object_path: '''Nulls R2A reports'
    - step:
        id: '495'
        action: Script
        object_path: If (NullsR2A_Start <> "") and (NullsR2A_End <> "") Then
    - step:
        id: '496'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '497'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '498'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '499'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '500'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR2A_Start
    - step:
        id: '501'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR2A_End
    - step:
        id: '502'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '503'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '504'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '505'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '506'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '507'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '508'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '509'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '510'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '511'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '512'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '513'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls R2A
          report not initiated,"
    - step:
        id: '514'
        action: Script
        object_path: Else
    - step:
        id: '515'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '516'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '517'
        object_path: f
        action: WriteLine
        args: ("Nulls R2 A Reports Interval")
    - step:
        id: '518'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '519'
        object_path: f
        action: Close
    - step:
        id: '520'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '521'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '522'
        action: Script
        object_path: End If
    - step:
        id: '523'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '524'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '525'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '526'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '527'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '528'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR2A_Start
    - step:
        id: '529'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR2A_End
    - step:
        id: '530'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '531'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '532'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '533'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '534'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '535'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '536'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '537'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '538'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '539'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '540'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '541'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '542'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls R2A
          report not initiated,"
    - step:
        id: '543'
        action: Script
        object_path: Else
    - step:
        id: '544'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '545'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '546'
        object_path: f
        action: WriteLine
        args: ("Nulls R2 A Reports Consumption")
    - step:
        id: '547'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '548'
        object_path: f
        action: Close
    - step:
        id: '549'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '550'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '551'
        action: Script
        object_path: End If
    - step:
        id: '552'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '553'
        action: Script
        object_path: Else
    - step:
        id: '554'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '555'
        action: Script
        object_path: End If
    - step:
        id: '556'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '557'
        action: Script
        object_path: '''Nulls R2B reports'
    - step:
        id: '558'
        action: Script
        object_path: If (NullsR2B_Start <> "") and (NullsR2B_End <> "") Then
    - step:
        id: '559'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '560'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '561'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '562'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '563'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR2B_Start
    - step:
        id: '564'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR2B_End
    - step:
        id: '565'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '566'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '567'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '568'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '569'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '570'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '571'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '572'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '573'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '574'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '575'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '576'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls R2B
          report not initiated,"
    - step:
        id: '577'
        action: Script
        object_path: Else
    - step:
        id: '578'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '579'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '580'
        object_path: f
        action: WriteLine
        args: ("Nulls R2 B Reports Interval")
    - step:
        id: '581'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '582'
        object_path: f
        action: Close
    - step:
        id: '583'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '584'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '585'
        action: Script
        object_path: End If
    - step:
        id: '586'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '587'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '588'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '589'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '590'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '591'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsR2B_Start
    - step:
        id: '592'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsR2B_End
    - step:
        id: '593'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '594'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '595'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '596'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '597'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '598'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '599'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '600'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '601'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '602'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '603'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '604'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '605'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls R2B
          report not initiated,"
    - step:
        id: '606'
        action: Script
        object_path: Else
    - step:
        id: '607'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '608'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '609'
        object_path: f
        action: WriteLine
        args: ("Nulls R2 B Reports Consumption")
    - step:
        id: '610'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '611'
        object_path: f
        action: Close
    - step:
        id: '612'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '613'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '614'
        action: Script
        object_path: End If
    - step:
        id: '615'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '616'
        action: Script
        object_path: Else
    - step:
        id: '617'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '618'
        action: Script
        object_path: End If
    - step:
        id: '619'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '620'
        action: Script
        object_path: '''Nulls Final A reports'
    - step:
        id: '621'
        action: Script
        object_path: If (NullsFinalA_Start <> "") and (NullsFinalA_End <> "") Then
    - step:
        id: '622'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '623'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '624'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '625'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '626'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsFinalA_Start
    - step:
        id: '627'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsFinalA_End
    - step:
        id: '628'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '629'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '630'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '631'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '632'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '633'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '634'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '635'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '636'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '637'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '638'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '639'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls Final
          A report not initiated,"
    - step:
        id: '640'
        action: Script
        object_path: Else
    - step:
        id: '641'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '642'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '643'
        object_path: f
        action: WriteLine
        args: ("Nulls Final A Reports Interval")
    - step:
        id: '644'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '645'
        object_path: f
        action: Close
    - step:
        id: '646'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '647'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '648'
        action: Script
        object_path: End If
    - step:
        id: '649'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '650'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '651'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '652'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '653'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '654'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsFinalA_Start
    - step:
        id: '655'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsFinalA_End
    - step:
        id: '656'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '657'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '658'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '659'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '660'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '661'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '662'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '663'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '664'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '665'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '666'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '667'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '668'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls Final
          A report not initiated,"
    - step:
        id: '669'
        action: Script
        object_path: Else
    - step:
        id: '670'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '671'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '672'
        object_path: f
        action: WriteLine
        args: ("Nulls Final A Reports Consumption")
    - step:
        id: '673'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '674'
        object_path: f
        action: Close
    - step:
        id: '675'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '676'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '677'
        action: Script
        object_path: End If
    - step:
        id: '678'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '679'
        action: Script
        object_path: Else
    - step:
        id: '680'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '681'
        action: Script
        object_path: End If
    - step:
        id: '682'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '683'
        action: Script
        object_path: '''Nulls Final B reports'
    - step:
        id: '684'
        action: Script
        object_path: If (NullsFinalB_Start <> "") and (NullsFinalB_End <> "") Then
    - step:
        id: '685'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '686'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '687'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '688'
        action: Script
        object_path: '''Interval Reports'
    - step:
        id: '689'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsFinalB_Start
    - step:
        id: '690'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsFinalB_End
    - step:
        id: '691'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '692'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '693'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '694'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Interval"'
    - step:
        id: '695'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '696'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '697'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '698'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '699'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '700'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '701'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '702'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Interval Nulls Final
          B report not initiated,"
    - step:
        id: '703'
        action: Script
        object_path: Else
    - step:
        id: '704'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '705'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '706'
        object_path: f
        action: WriteLine
        args: ("Nulls Final B Reports Interval")
    - step:
        id: '707'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '708'
        object_path: f
        action: Close
    - step:
        id: '709'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '710'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '711'
        action: Script
        object_path: End If
    - step:
        id: '712'
        action: Script
        object_path: '''Consumption reports'
    - step:
        id: '713'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Link("MDM")
        action: Click
    - step:
        id: '714'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '715'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").Link("RM11 -
          MDM Missing Data")
        action: Click
    - step:
        id: '716'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '717'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("StartDate")
        action: Set
        args: NullsFinalB_Start
    - step:
        id: '718'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebEdit("EndDate")
        action: Set
        args: NullsFinalB_End
    - step:
        id: '719'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '720'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebList("WebList")
        action: Select
        args: '"ETSAMDP"'
    - step:
        id: '721'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '722'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("DataType")
        action: Select
        args: '"Consumption"'
    - step:
        id: '723'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '724'
        object_path: '''Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")'
        action: Select
        args: '"SecondTierNMIs"'
    - step:
        id: '725'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebRadioGroup("NMISelection")
        action: Select
        args: '"AllNMIs"'
    - step:
        id: '726'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '727'
        object_path: Browser("Login").Page("MSATS").Frame("Frame_2").WebButton("Save")
        action: Click
    - step:
        id: '728'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '729'
        action: Script
        object_path: requestID = Browser("MSATS").Page("MSATS_2").Frame("DETAIL").WebElement("Report
          has been submitted.").GetROProperty("innertext")
    - step:
        id: '730'
        action: Script
        object_path: If requestID = "" Then
    - step:
        id: '731'
        action: Script
        object_path: ReportsDownloaded = ReportsDownloaded & " Consumption Nulls Final
          B report not initiated,"
    - step:
        id: '732'
        action: Script
        object_path: Else
    - step:
        id: '733'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '734'
        action: Script
        object_path: Set f = fso.openTextFile(RequestIDLogLocation,8)
    - step:
        id: '735'
        object_path: f
        action: WriteLine
        args: ("Nulls Final B Reports Consumption")
    - step:
        id: '736'
        object_path: f
        action: WriteLine
        args: (requestID)
    - step:
        id: '737'
        object_path: f
        action: Close
    - step:
        id: '738'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '739'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '740'
        action: Script
        object_path: End If
    - step:
        id: '741'
        action: Script
        object_path: logEntry = logEntry & "TRUE,TRUE,"
    - step:
        id: '742'
        action: Script
        object_path: Else
    - step:
        id: '743'
        action: Script
        object_path: logEntry = logEntry & ",,"
    - step:
        id: '744'
        action: Script
        object_path: End If
    - step:
        id: '745'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '746'
        action: Script
        object_path: '''Check the current archive link name'
    - step:
        id: '747'
        object_path: Browser("Login").Page("MSATS").Frame("toc").WebElement("DataLoadImport")
        action: Click
    - step:
        id: '748'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '749'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("ParticipantArchive")
        action: Click
    - step:
        id: '750'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '751'
        action: Script
        object_path: '''Get current date, month and year to navigate through the report
          archive pages'
    - step:
        id: '752'
        action: Script
        object_path: strDate = Date
    - step:
        id: '753'
        action: Script
        object_path: strDate = CDate (strDate)
    - step:
        id: '754'
        action: Script
        object_path: dayDate = Day(strDate)
    - step:
        id: '755'
        action: Script
        object_path: monthDate = Month(strDate)
    - step:
        id: '756'
        action: Script
        object_path: monthDatetext = LCase(MonthName(Month(strDate),True))
    - step:
        id: '757'
        action: Script
        object_path: YearDate = Year(strDate)
    - step:
        id: '758'
        action: Script
        object_path: If Len(dayDate) = 1 Then
    - step:
        id: '759'
        action: Script
        object_path: dayDate = "0"& dayDate
    - step:
        id: '760'
        action: Script
        object_path: End If
    - step:
        id: '761'
        action: Script
        object_path: If Len(monthDate) = 1 Then
    - step:
        id: '762'
        action: Script
        object_path: monthDate = "0"& monthDate
    - step:
        id: '763'
        action: Script
        object_path: End If
    - step:
        id: '764'
        action: Script
        object_path: monthDate = monthDate&"-"&monthDatetext
    - step:
        id: '765'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '766'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&YearDate,
          "html tag:=A")
        action: Click
    - step:
        id: '767'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '768'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&monthDate,
          "html tag:=A")
        action: Click
    - step:
        id: '769'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '770'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&dayDate,
          "html tag:=A")
        action: Click
    - step:
        id: '771'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '772'
        action: Script
        object_path: sapn_screenShot_done(msg)
    - step:
        id: '773'
        action: Script
        object_path: '''get the content of the last row'
    - step:
        id: '774'
        action: Script
        object_path: rows = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").RowCount
    - step:
        id: '775'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '776'
        action: Script
        object_path: Parameter("numberOfRows") = rows
    - step:
        id: '777'
        action: Script
        object_path: If ReportsDownloaded = "" Then
    - step:
        id: '778'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '779'
        action: Script
        object_path: Set textFile = fso.CreateTextFile(DownloadedLogLocation, true)
    - step:
        id: '780'
        object_path: textFile
        action: WriteLine("Reports
        args: Were Downloaded")
    - step:
        id: '781'
        object_path: textFile
        action: Close
    - step:
        id: '782'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '783'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '784'
        action: Script
        object_path: Else
    - step:
        id: '785'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '786'
        action: Script
        object_path: Set textFile = fso.CreateTextFile(DownloadedLogLocation, true)
    - step:
        id: '787'
        object_path: textFile
        action: WriteLine(ReportsDownloaded)
    - step:
        id: '788'
        object_path: textFile
        action: Close
    - step:
        id: '789'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '790'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '791'
        action: Script
        object_path: End If
    - step:
        id: '792'
        action: Script
        object_path: Parameter("ReportsDownloaded") = ReportsDownloaded
    - step:
        id: '793'
        action: Script
        object_path: lastrptlink = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").GetCellData(rows,
          1)
    - step:
        id: '794'
        action: Script
        object_path: logEntry = logEntry&lastrptlink&",FALSE"
    - step:
        id: '795'
        action: Script
        object_path: '''Write Log Entry'
    - step:
        id: '796'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '797'
        action: Script
        object_path: Set objFileToWrite = fso.OpenTextFile(ExectionLogFile,8,true)
    - step:
        id: '798'
        object_path: objFileToWrite
        action: WriteLine(logEntry)
    - step:
        id: '799'
        object_path: objFileToWrite
        action: Close
    - step:
        id: '800'
        action: Script
        object_path: Set objFileToWrite = Nothing
    - step:
        id: '801'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '802'
        object_path: Browser("Login").Page("MSATS").Frame("Frame").Image("Logout")
        action: Click
    - step:
        id: '803'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '804'
        object_path: Browser("Login")
        action: Close
    - step:
        id: '805'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '806'
        action: Script
        object_path: EstimatesWeekA_Start = Empty
    - step:
        id: '807'
        action: Script
        object_path: EstimatesWeekA_End = Empty
    - step:
        id: '808'
        action: Script
        object_path: EstimatesWeekB_Start = Empty
    - step:
        id: '809'
        action: Script
        object_path: EstimatesWeekB_End = Empty
    - step:
        id: '810'
        action: Script
        object_path: NullsPrelimA_Start = Empty
    - step:
        id: '811'
        action: Script
        object_path: NullsPrelimA_End = Empty
    - step:
        id: '812'
        action: Script
        object_path: NullsR1A_Start = Empty
    - step:
        id: '813'
        action: Script
        object_path: NullsR1A_End = Empty
    - step:
        id: '814'
        action: Script
        object_path: NullsR2A_Start = Empty
    - step:
        id: '815'
        action: Script
        object_path: NullsR2A_End = Empty
    - step:
        id: '816'
        action: Script
        object_path: NullsFinalA_Start = Empty
    - step:
        id: '817'
        action: Script
        object_path: NullsFinalA_End = Empty
    - step:
        id: '818'
        action: Script
        object_path: NullsPrelimB_Start = Empty
    - step:
        id: '819'
        action: Script
        object_path: NullsPrelimB_End = Empty
    - step:
        id: '820'
        action: Script
        object_path: NullsR1B_Start = Empty
    - step:
        id: '821'
        action: Script
        object_path: NullsR1B_End = Empty
    - step:
        id: '822'
        action: Script
        object_path: NullsR2B_Start = Empty
    - step:
        id: '823'
        action: Script
        object_path: NullsR2B_End = Empty
    - step:
        id: '824'
        action: Script
        object_path: NullsFinalB_Start = Empty
    - step:
        id: '825'
        action: Script
        object_path: NullsFinalB_End = Empty
    - step:
        id: '826'
        action: Script
        object_path: logEntry = Empty
    - step:
        id: '827'
        action: Script
        object_path: strDate = Empty
    - step:
        id: '828'
        action: Script
        object_path: dayDate = Empty
    - step:
        id: '829'
        action: Script
        object_path: monthDate = Empty
    - step:
        id: '830'
        action: Script
        object_path: monthDatetext = Empty
    - step:
        id: '831'
        action: Script
        object_path: YearDate = Empty
    - step:
        id: '832'
        action: Script
        object_path: rows = Empty
    - step:
        id: '833'
        action: Script
        object_path: lastrptlink = Empty
    - step:
        id: '834'
        action: Script
        object_path: ExectionLogFile = Empty
    - step:
        id: '835'
        action: Script
        object_path: strSafeDate = Empty
    - step:
        id: '836'
        action: Script
        object_path: strSafeTime = Empty
    - step:
        id: '837'
        action: Script
        object_path: strDateTime = Empty
    - step:
        id: '838'
        action: Script
        object_path: Header = Empty
    - step:
        id: '839'
        action: Script
        object_path: content = Empty
    - step:
        id: '840'
        action: Script
        object_path: ExitTest
  outputs:
  - numberOfRows:
      robot: true
      value: ${numberOfRows}
  - ReportsDownloaded:
      robot: true
      value: ${ReportsDownloaded}
  - executionLog:
      robot: true
      value: ${executionLog}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Browser
      name: MSATS
      properties:
      - property:
          value:
            value: MSATS
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://msats.prod.nemnet.net.au/msats/index.jsp
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Login
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
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: MSATS
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
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Tuesday, 14 March 2023 12:38:04 PM
      child_objects:
      - object:
          class: Page
          name: MSATS_2
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
                value: https://msats.preprod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.preprod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MSATS
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
                value: '10000'
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
          last_update_time: Tuesday, 14 March 2023 12:38:04 PM
          child_objects:
          - object:
              class: Frame
              name: DETAIL
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
                    value: https://msats.preprod.nemnet.net.au/msats/RM_Report.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/RM_Report.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: DETAIL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebElement
                  name: Report has been submitted.
                  properties:
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
                        value: WebElement
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Report has been submitted. Request ID is ETSAMDP_RM26_20220113105849921
                        regular_expression: false
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: H1
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
                        value: ''
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
                        value: //H1[1]
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
      - object:
          class: Page
          name: MSATS
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
                value: https://msats.prod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.prod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MSATS
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
                value: '10000'
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
          last_update_time: Tuesday, 14 March 2023 12:38:04 PM
          child_objects:
          - object:
              class: Frame
              name: toc
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
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS Table of contents
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
                    value: toc
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebElement
                  name: DataLoadImport
                  properties:
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
                        value: WebElement
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Data Load Import
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
                        value: menu
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
                        value: //DIV[13]
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: ParticipantArchive
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //DIV[14]/A[3]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: Participant Archive
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Participant Archive
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=Archive&pageNo=1
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - text
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL_2
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
                    value: https://msats.prod.nemnet.net.au/msats/RM_MDM_ReportList.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/RM_MDM_ReportList.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: DETAIL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects: []
          - object:
              class: Frame
              name: DETAIL
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
                    value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=Archive&pageNo=1
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: DETAIL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebTable
                  name: ArchiveContents
                  properties:
                  - property:
                      value:
                        value: WebTable
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[2]/TD[1]/TABLE[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: role
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: TABLE
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
                        value: '1'
                        regular_expression: false
                      name: border
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - role
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 2
                      type: index
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - html id
                      - border
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: '2020'
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TD/A[normalize-space()="2020"]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: '2020'
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '2020'
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=uZHtudZsAGYf2DR1EmyuyQ%3D%3D&pageNo=1
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - text
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
  - object:
      class: Browser
      name: Login
      properties:
      - property:
          value:
            value: https://msats.prod.nemnet.net.au/msats/index.jsp
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Login
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
            value: Login
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
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Tuesday, 14 March 2023 12:38:04 PM
      child_objects:
      - object:
          class: Page
          name: MSATS
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
                value: https://msats.prod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.prod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MSATS
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
                value: '10056'
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
          last_update_time: Tuesday, 14 March 2023 12:38:04 PM
          child_objects:
          - object:
              class: Frame
              name: toc
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
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS Table of contents
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
                    value: toc
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebElement
                  name: DataLoadImport
                  properties:
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
                        value: WebElement
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Data Load Import
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
                        value: menu
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
                        value: //DIV[13]
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: ParticipantArchive
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //DIV[14]/A[3]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: Participant Archive
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Participant Archive
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=Archive&pageNo=1
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - text
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
          - object:
              class: Frame
              name: Frame_2
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
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
                    value: https://msats.prod.nemnet.net.au/msats/RM_MDM_ReportList.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/RM_MDM_ReportList.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
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
                - visible
                - micclass
                - html id
                ordinal_identifier:
                  value: 1
                  type: index
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
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebRadioGroup
                  name: NMISelection
                  properties:
                  - property:
                      value:
                        value: WebRadioGroup
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[9]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: AllNMIs
                        regular_expression: false
                      name: value
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: nmiselection
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '2'
                        regular_expression: false
                      name: items count
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
                        value: ''
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - name
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - name
                      - html id
                      - class
                      - items count
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: WebRadioGroup
                  name: DataType
                  properties:
                  - property:
                      value:
                        value: WebRadioGroup
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR/TD[normalize-space()="IntervalConsumption"]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: Consumption
                        regular_expression: false
                      name: value
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: metertype
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '2'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: INPUT
                        regular_expression: false
                      name: html tag
                      hidden: true
                      read_only: true
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
                        value: ''
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Interval;Consumption
                        regular_expression: false
                      name: all items
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - name
                      - html id
                      - class
                      - items count
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: WebList
                  properties:
                  - property:
                      value:
                        value: WebList
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[5]/TD[2]/SELECT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '1'
                        regular_expression: false
                      name: visible items
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
                        value: MDP
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '30'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: SELECT
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
                        value: ''
                        regular_expression: false
                      name: default value
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 1
                      type: index
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - name
                      - html id
                      - class
                      - default value
                      - items count
                      - visible items
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: StartDate
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
                        value: //TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: start
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '11'
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
                        value: 21-Oct-2020
                        regular_expression: false
                      name: default value
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - type
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 0
                      type: index
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: EndDate
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
                        value: //TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[4]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: end
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '11'
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
                        value: 21-Oct-2020
                        regular_expression: false
                      name: default value
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - type
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 1
                      type: index
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Save
                  properties:
                  - property:
                      value:
                        value: WebButton
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[3]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: Save
                        regular_expression: false
                      name: value
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: submit
                        regular_expression: false
                      name: type
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Save
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - type
                    - html tag
                    - acc_name
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - name
                      - type
                      - html id
                      - value
                      - class
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: RM26 - MDP Substitution
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[13]/TD[1]/UL[1]/LI[1]/A[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: RM26 - MDP Substitution and Estimation Report - SubstitutionEstimation
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: RM26 - MDP Substitution and Estimation Report - SubstitutionEstimation
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '0'
                        regular_expression: false
                      name: index
                      hidden: false
                      read_only: false
                      type: NUMBER
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/RM_Report.jsp?report=RM26_SUBSTITUTE_ESTIMATE&action=input
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    - acc_name
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - text
                      - html tag
                    optional_filter:
                      property_ref:
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: RM11 - MDM Missing Data
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[3]/TD[1]/UL[1]/LI[1]/A[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: RM11 - MDM Missing Data (null) Report - MissingData
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: RM11 - MDM Missing Data (null) Report - MissingData
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '0'
                        regular_expression: false
                      name: index
                      hidden: false
                      read_only: false
                      type: NUMBER
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/RM_Report.jsp?report=RM11_MISSING_DATA&action=input
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - text
                      - html tag
                    optional_filter:
                      property_ref:
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
          - object:
              class: Frame
              name: Frame
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
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
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS Table of contents
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
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
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
                - visible
                - micclass
                - html id
                ordinal_identifier:
                  value: 0
                  type: index
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
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebElement
                  name: ReportsandAlerts
                  properties:
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
                        value: WebElement
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Reports and Alerts
                        regular_expression: false
                      name: innertext
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: DIV
                        regular_expression: false
                      name: html tag
                      hidden: true
                      read_only: true
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
                        value: menu
                        regular_expression: false
                      name: class
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: //DIV[19]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - class
                    - acc_name
                    - _xpath
                    ordinal_identifier:
                      value: 7
                      type: index
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
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: MDM
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //DIV[20]/A[2]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: MDM
                        regular_expression: false
                      name: text
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: MDM
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/RM_MDM_ReportList.jsp
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 23
                      type: index
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - text
                      - html tag
                    optional_filter:
                      property_ref:
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Image
                  name: Logout
                  properties:
                  - property:
                      value:
                        value: Image
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //DIV[30]/A[1]/IMG[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '149'
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
                        value: Image
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Image Link
                        regular_expression: false
                      name: image type
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: IMG
                        regular_expression: false
                      name: html tag
                      hidden: true
                      read_only: true
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
                        value: '16'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: button_logout.gif
                        regular_expression: false
                      name: file name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Logout
                        regular_expression: false
                      name: alt
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - alt
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - alt
                      - image type
                      - html id
                      - name
                      - file name
                      - class
                      - visible
                      - width
                      - height
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL
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
                    value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=Archive&pageNo=1
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: DETAIL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
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
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects:
              - object:
                  class: WebTable
                  name: ArchiveContents
                  properties:
                  - property:
                      value:
                        value: WebTable
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TR[2]/TD[1]/TABLE[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: role
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: TABLE
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
                        value: '1'
                        regular_expression: false
                      name: border
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - role
                    - html tag
                    - acc_name
                    ordinal_identifier:
                      value: 2
                      type: index
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - html id
                      - border
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
              - object:
                  class: Link
                  name: '2020'
                  properties:
                  - property:
                      value:
                        value: Link
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //TD/A[normalize-space()="2020"]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
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
                        value: '2020'
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '2020'
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: A
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
                        value: https://msats.prod.nemnet.net.au/msats/FW300_ParticipantArchiveList.jsp?directoryToView=uZHtudZsAGYf2DR1EmyuyQ%3D%3D&pageNo=1
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - text
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - text
                      - html id
                      - class
                      - name
                      - href
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 14 March 2023 12:38:04 PM
                  child_objects: []
      - object:
          class: Page
          name: Login
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
                value: https://msats.prod.nemnet.net.au/msats/index.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.prod.nemnet.net.au/msats/index.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Login
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
                value: '10055'
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
          last_update_time: Tuesday, 14 March 2023 12:38:04 PM
          child_objects:
          - object:
              class: WebEdit
              name: UserId
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
                    value: //TR[normalize-space()="UserID (*):"]/TD[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
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
                    value: userID
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '15'
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
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
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
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - html tag
                - acc_name
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
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Password
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
                    value: //TR[normalize-space()="Password (*):"]/TD[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: password
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
                    value: password
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '524288'
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
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
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
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - html tag
                - acc_name
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
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects: []
          - object:
              class: Image
              name: Login
              properties:
              - property:
                  value:
                    value: Image
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="image"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '74'
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
                    value: Image
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Image Button
                    regular_expression: false
                  name: image type
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: image
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '16'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: button_login.gif
                    regular_expression: false
                  name: file name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Login
                    regular_expression: false
                  name: alt
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - alt
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - alt
                  - image type
                  - html id
                  - name
                  - file name
                  - class
                  - visible
                  - width
                  - height
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 14 March 2023 12:38:04 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
