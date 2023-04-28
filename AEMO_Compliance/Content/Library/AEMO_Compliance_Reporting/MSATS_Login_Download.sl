namespace: AEMO_Compliance_Reporting
operation:
  name: MSATS_Login_Download
  inputs:
  - LNSP_User
  - LNSP_Pass
  - MP_User
  - MP_Pass
  - MDP_User
  - MDP_Pass
  - DateForRpt
  - location
  - downloadReports
  sequential_action:
    gav: com.microfocus.seq:AEMO_Compliance_Reporting.MSATS_Login_Download:1.0.0
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
        object_path: '''get folder locations'
    - step:
        id: '2'
        action: Script
        object_path: ParentFolder = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: DateForRpt = Parameter("DateForRpt")
    - step:
        id: '4'
        action: Script
        object_path: If DateForRpt = "" Then
    - step:
        id: '5'
        action: Script
        object_path: DateForRpt = Date
    - step:
        id: '6'
        action: Script
        object_path: Else
    - step:
        id: '7'
        action: Script
        object_path: DateForRpt = CDate(DateForRpt)
    - step:
        id: '8'
        action: Script
        object_path: End If
    - step:
        id: '9'
        action: Script
        object_path: Reports_Download = ParentFolder&"XML Files"
    - step:
        id: '10'
        action: Script
        object_path: Excel_Reports = ParentFolder&"Excel Files"
    - step:
        id: '11'
        action: Script
        object_path: FormatReports = ParentFolder&"Formatted Files"
    - step:
        id: '12'
        action: Script
        object_path: Parameter("rptDownloadFolder") = Reports_Download
    - step:
        id: '13'
        action: Script
        object_path: Parameter("xlsWorkingFolder") = Excel_Reports
    - step:
        id: '14'
        action: Script
        object_path: Parameter("formatrptFolder") = FormatReports
    - step:
        id: '15'
        action: Script
        object_path: Set FSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '16'
        action: Script
        object_path: '''Delete all files from the downloaded reports folder'
    - step:
        id: '17'
        action: Script
        object_path: For Each file In FSO.GetFolder(Reports_Download).Files
    - step:
        id: '18'
        object_path: FSO.DeleteFile file
        action: Path,
        args: 'True'
    - step:
        id: '19'
        action: Script
        object_path: Next
    - step:
        id: '20'
        action: Script
        object_path: For Each file In FSO.GetFolder(Excel_Reports).Files
    - step:
        id: '21'
        object_path: FSO.DeleteFile file
        action: Path,
        args: 'True'
    - step:
        id: '22'
        action: Script
        object_path: Next
    - step:
        id: '23'
        action: Script
        object_path: For Each file In FSO.GetFolder(FormatReports).Files
    - step:
        id: '24'
        object_path: FSO.DeleteFile file
        action: Path,
        args: 'True'
    - step:
        id: '25'
        action: Script
        object_path: Next
    - step:
        id: '26'
        action: Script
        object_path: '''Const DeleteReadOnly = TRUE'
    - step:
        id: '27'
        action: Script
        object_path: '''If fso.FileExists(Reports_Download&"\*")Then'
    - step:
        id: '28'
        action: Script
        object_path: "'\tFSO.DeleteFile(Reports_Download&\"\\*\"), DeleteReadOnly"
    - step:
        id: '29'
        action: Script
        object_path: '''End If'
    - step:
        id: '30'
        action: Script
        object_path: '''If fso.FileExists(Excel_Reports&"\*")Then'
    - step:
        id: '31'
        action: Script
        object_path: "'\tFSO.DeleteFile(Excel_Reports&\"\\*\"), DeleteReadOnly"
    - step:
        id: '32'
        action: Script
        object_path: '''End If'
    - step:
        id: '33'
        action: Script
        object_path: '''If fso.FileExists(FormatReports&"\*")Then'
    - step:
        id: '34'
        action: Script
        object_path: "'\tFSO.DeleteFile(FormatReports&\"\\*\"), DeleteReadOnly"
    - step:
        id: '35'
        action: Script
        object_path: '''End If'
    - step:
        id: '36'
        object_path: '''FSO'
        action: DeleteFile(Reports_Download&"\*"),
        args: DeleteReadOnly
    - step:
        id: '37'
        object_path: '''FSO'
        action: DeleteFile(Excel_Reports&"\*"),
        args: DeleteReadOnly
    - step:
        id: '38'
        object_path: '''FSO'
        action: DeleteFile(FormatReports&"\*"),
        args: DeleteReadOnly
    - step:
        id: '39'
        action: Script
        object_path: '''Get Date Details'
    - step:
        id: '40'
        action: Script
        object_path: lastweekdate = DateForRpt
    - step:
        id: '41'
        action: Script
        object_path: currentDate = Day(DateForRpt)
    - step:
        id: '42'
        action: Script
        object_path: If Len(currentDate) = 1 Then
    - step:
        id: '43'
        action: Script
        object_path: currentDate = "0"&currentDate
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: '''currentMonth = Month(Date)  '' change made by Sai on 01/11/2022'
    - step:
        id: '46'
        action: Script
        object_path: currentMonth = Month(DateForRpt)
    - step:
        id: '47'
        action: Script
        object_path: If Len(currentMonth) = 1 Then
    - step:
        id: '48'
        action: Script
        object_path: currentMonth = "0"&currentMonth
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: '''currentMonthName = LCase(MonthName(Month(Date),True))    ''
          change made by Sai on 01/11/2022'
    - step:
        id: '51'
        action: Script
        object_path: currentMonthName = LCase(MonthName(Month(DateForRpt),True))
    - step:
        id: '52'
        action: Script
        object_path: currentMonthLink = currentMonth&"-"&currentMonthName
    - step:
        id: '53'
        action: Script
        object_path: '''currentYear = Year(Date)'
    - step:
        id: '54'
        action: Script
        object_path: currentYear = Year(DateForRpt)
    - step:
        id: '55'
        action: Script
        object_path: dtreportname = currentYear &"."& currentMonth &"."& currentDate
    - step:
        id: '56'
        action: Script
        object_path: '''get date previous weeks report'
    - step:
        id: '57'
        action: Script
        object_path: lastweekdate = DateAdd("d", -7, DateForRpt)
    - step:
        id: '58'
        action: Script
        object_path: lastweekDay = Day(lastweekdate)
    - step:
        id: '59'
        action: Script
        object_path: If Len(lastweekDay) = 1 Then
    - step:
        id: '60'
        action: Script
        object_path: lastweekDay = "0"&lastweekDay
    - step:
        id: '61'
        action: Script
        object_path: End If
    - step:
        id: '62'
        action: Script
        object_path: lastweekMonth = Month(lastweekdate)
    - step:
        id: '63'
        action: Script
        object_path: If Len(lastweekMonth) = 1 Then
    - step:
        id: '64'
        action: Script
        object_path: lastweekMonth = "0"&lastweekMonth
    - step:
        id: '65'
        action: Script
        object_path: End If
    - step:
        id: '66'
        action: Script
        object_path: lastWeekrptDate = Year(lastweekdate)&"."&lastweekMonth&"."&lastweekDay
    - step:
        id: '67'
        action: Script
        object_path: '''output date for formatted file name'
    - step:
        id: '68'
        action: Script
        object_path: Parameter("dateForRptName") = dtreportname
    - step:
        id: '69'
        action: Script
        object_path: Parameter("dateForLastWeekRpt") = lastWeekrptDate
    - step:
        id: '70'
        action: Script
        object_path: '''get the current day of the week from input parameters'
    - step:
        id: '71'
        action: Script
        object_path: currentdayofWeek = WeekdayName(weekday(DateForRpt))
    - step:
        id: '72'
        action: Script
        object_path: '''''Set the login values based on the current day of the week'
    - step:
        id: '73'
        action: Script
        object_path: Select Case currentdayofWeek
    - step:
        id: '74'
        action: Script
        object_path: Case "Monday"
    - step:
        id: '75'
        action: Script
        object_path: UserName = Parameter("LNSP_User")
    - step:
        id: '76'
        action: Script
        object_path: Password = Parameter("LNSP_Pass")
    - step:
        id: '77'
        action: Script
        object_path: fileCnt = 1
    - step:
        id: '78'
        action: Script
        object_path: fileNameConvention = "catsm_sdq_umplp"
    - step:
        id: '79'
        action: Script
        object_path: rptRole = "LNSP"
    - step:
        id: '80'
        action: Script
        object_path: teamsFolder = "LNSP Compliance Reporting"
    - step:
        id: '81'
        action: Script
        object_path: Case "Tuesday"
    - step:
        id: '82'
        action: Script
        object_path: UserName = Parameter("MP_User")
    - step:
        id: '83'
        action: Script
        object_path: Password = Parameter("MP_Pass")
    - step:
        id: '84'
        action: Script
        object_path: fileCnt = 2
    - step:
        id: '85'
        action: Script
        object_path: fileNameConvention = "catsm_sdq_etsapmp"
    - step:
        id: '86'
        action: Script
        object_path: rptRole = "MPB"
    - step:
        id: '87'
        action: Script
        object_path: teamsFolder = "MPB Compliance Reporting"
    - step:
        id: '88'
        action: Script
        object_path: Case "Wednesday"
    - step:
        id: '89'
        action: Script
        object_path: UserName = Parameter("MDP_User")
    - step:
        id: '90'
        action: Script
        object_path: Password = Parameter("MDP_Pass")
    - step:
        id: '91'
        action: Script
        object_path: fileCnt = 2
    - step:
        id: '92'
        action: Script
        object_path: fileNameConvention = "catsm_sdq_etsamdp"
    - step:
        id: '93'
        action: Script
        object_path: rptRole = "MDP"
    - step:
        id: '94'
        action: Script
        object_path: teamsFolder = "MDP Compliance Reporting"
    - step:
        id: '95'
        action: Script
        object_path: Case "Thursday"
    - step:
        id: '96'
        action: Script
        object_path: UserName = Parameter("LNSP_User")
    - step:
        id: '97'
        action: Script
        object_path: Password = Parameter("LNSP_Pass")
    - step:
        id: '98'
        action: Script
        object_path: fileCnt = 2
    - step:
        id: '99'
        action: Script
        object_path: fileNameConvention = "catsm_sdq_umplp"
    - step:
        id: '100'
        action: Script
        object_path: rptRole = "RP"
    - step:
        id: '101'
        action: Script
        object_path: teamsFolder = "RP Compliance Reporting"
    - step:
        id: '102'
        action: Script
        object_path: Case else
    - step:
        id: '103'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Unable to login to MSATS ", "day of the week input is blank/not
          available"
    - step:
        id: '104'
        action: Script
        object_path: End Select
    - step:
        id: '105'
        action: Script
        object_path: Parameter("ReportRole") = rptRole
    - step:
        id: '106'
        action: Script
        object_path: Parameter("currentdayofWeek") = currentdayofWeek
    - step:
        id: '107'
        action: Script
        object_path: 'Parameter("teamsRptFolder") = Replace(teamsFolder, " ", "%20") '
        comment: for url space need to replaced by %20
    - step:
        id: '108'
        action: Script
        object_path: If Parameter("downloadReports") = "Yes" Then
    - step:
        id: '109'
        action: Script
        object_path: '''launch MSATS'
    - step:
        id: '110'
        action: Script
        object_path: URL = "https://msats.prod.nemnet.net.au/msats/index.jsp"
    - step:
        id: '111'
        object_path: '''SystemUtil'
        action: CloseProcessByName("chrome.exe")
    - step:
        id: '112'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '113'
        object_path: SystemUtil
        action: Run
        args: '"chrome.exe",URL,,,3'
    - step:
        id: '114'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '115'
        object_path: Browser("Login").Page("Login").WebEdit("userID")
        action: Set
        args: UserName
    - step:
        id: '116'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '117'
        object_path: Browser("Login").Page("Login").WebEdit("password")
        action: Set
        args: Password
    - step:
        id: '118'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '119'
        object_path: Browser("Login").Page("Login").Image("Login")
        action: Click
    - step:
        id: '120'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '121'
        object_path: Browser("Login").Page("MSATS").Frame("toc").WebElement("Data
          Load Import")
        action: Click
    - step:
        id: '122'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '123'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("Participant
          Archive")
        action: Click
    - step:
        id: '124'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '125'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("Participant
          Archive").Link("html tag:=A","innertext:="&currentYear,"text:="&currentYear)
        action: Click
    - step:
        id: '126'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '127'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("Participant
          Archive").Link("html tag:=A","innertext:="&currentMonthLink,"text:="&currentMonthLink)
        action: Click
    - step:
        id: '128'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '129'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("Participant
          Archive").Link("html tag:=A","innertext:="&currentDate,"text:="&currentDate)
        action: Click
    - step:
        id: '130'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '131'
        action: Script
        object_path: contentRows = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").RowCount
    - step:
        id: '132'
        action: Script
        object_path: rptCount = 0
    - step:
        id: '133'
        action: Script
        object_path: For arcRows = 3 to contentRows
    - step:
        id: '134'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '135'
        action: Script
        object_path: Set ObjClick = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(arcRows,1,"Link",0)
    - step:
        id: '136'
        object_path: ObjClick
        action: Click
    - step:
        id: '137'
        action: Script
        object_path: Set ObjClick = Nothing
    - step:
        id: '138'
        action: Script
        object_path: '''Get page numbers available and create an array'
    - step:
        id: '139'
        action: Script
        object_path: PageNumbers = Browser("Login").Page("MSATS").Frame("DETAIL").WebElement("PageNumbers").GetROProperty("innertext")
    - step:
        id: '140'
        action: Script
        object_path: Set regex = New regExp
    - step:
        id: '141'
        object_path: regex
        action: Pattern
        args: = "\d+"
    - step:
        id: '142'
        object_path: regex
        action: Global
        args: = True
    - step:
        id: '143'
        action: Script
        object_path: Set Matches = regex.Execute(PageNumbers)
    - step:
        id: '144'
        action: Script
        object_path: matchCount = Matches.Count
    - step:
        id: '145'
        action: Script
        object_path: '''Try downloading reports by checking all pages available'
    - step:
        id: '146'
        action: Script
        object_path: For i = 0 to matchCount-1
    - step:
        id: '147'
        action: Script
        object_path: '''Click on page number only when the reports page number is
          not page 1'
    - step:
        id: '148'
        action: Script
        object_path: If Matches(i) <> 1 Then
    - step:
        id: '149'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("Participant
          Archive").Link("text:="&Matches(i),"html tag:=A")
        action: Click
    - step:
        id: '150'
        action: Script
        object_path: End If
    - step:
        id: '151'
        action: Script
        object_path: '''get total count of rows'
    - step:
        id: '152'
        action: Script
        object_path: totalRows = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").RowCount
    - step:
        id: '153'
        action: Script
        object_path: '''go through each row and check try downloading only when the
          report file name has the user name string'
    - step:
        id: '154'
        action: Script
        object_path: If totalRows > 2 Then
    - step:
        id: '155'
        action: Script
        object_path: For rowscnt = 3 to totalRows
    - step:
        id: '156'
        action: Script
        object_path: fileName = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").GetCellData(rowscnt,
          1)
    - step:
        id: '157'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '158'
        action: Script
        object_path: If Instr(1, fileName, fileNameConvention) > 0 Then
    - step:
        id: '159'
        action: Script
        object_path: Set rptLink = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(rowscnt,1,"Link",1)
    - step:
        id: '160'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '161'
        object_path: rptLink
        action: Click
    - step:
        id: '162'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '163'
        action: Script
        object_path: Set rptLink = Nothing
    - step:
        id: '164'
        action: Script
        object_path: Set rptdownload = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(3,1,"Link",0)
    - step:
        id: '165'
        object_path: rptdownload
        action: Click
    - step:
        id: '166'
        action: Script
        object_path: rptCount = rptCount +  1
    - step:
        id: '167'
        action: Script
        object_path: Set rptdownload = Nothing
    - step:
        id: '168'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '169'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '170'
        action: Script
        object_path: If rptCount = fileCnt Then
    - step:
        id: '171'
        action: Script
        object_path: Exit for
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '174'
        action: Script
        object_path: End If
    - step:
        id: '175'
        action: Script
        object_path: Next
    - step:
        id: '176'
        action: Script
        object_path: End If
    - step:
        id: '177'
        action: Script
        object_path: If rptCount = fileCnt Then
    - step:
        id: '178'
        action: Script
        object_path: i = matchCount-1
    - step:
        id: '179'
        action: Script
        object_path: End If
    - step:
        id: '180'
        action: Script
        object_path: Next
    - step:
        id: '181'
        action: Script
        object_path: If matchCount = 0 Then
    - step:
        id: '182'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '183'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '184'
        action: Script
        object_path: Else
    - step:
        id: '185'
        action: Script
        object_path: For Iterator = 0 To matchCount-1
    - step:
        id: '186'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '187'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '188'
        action: Script
        object_path: Next
    - step:
        id: '189'
        action: Script
        object_path: End If
    - step:
        id: '190'
        action: Script
        object_path: If rptCount = fileCnt Then
    - step:
        id: '191'
        action: Script
        object_path: arcRows = contentRows
    - step:
        id: '192'
        action: Script
        object_path: End If
    - step:
        id: '193'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '194'
        action: Script
        object_path: Set Matches = NOTHING
    - step:
        id: '195'
        action: Script
        object_path: Next
    - step:
        id: '196'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '197'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '198'
        object_path: Browser("Login")
        action: Close
    - step:
        id: '199'
        action: Script
        object_path: '''If all reports aren''t downloaded, flag a warning'
    - step:
        id: '200'
        action: Script
        object_path: If rptCount = 0 Then
    - step:
        id: '201'
        action: Script
        object_path: Parameter("ReportsDownloaded") = "Number of downloaded deports
          does not equal number of expected reports"
    - step:
        id: '202'
        action: Script
        object_path: End If
    - step:
        id: '203'
        action: Script
        object_path: Parameter("rptCount") = rptCount
    - step:
        id: '204'
        action: Script
        object_path: Parameter("fileCnt") = fileCnt
    - step:
        id: '205'
        action: Script
        object_path: GetDownloadsPath = "C:\Automation Downloads"
    - step:
        id: '206'
        action: Script
        object_path: Set FSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '207'
        action: Script
        object_path: Set objFolder = FSO.GetFolder(GetDownloadsPath)
    - step:
        id: '208'
        action: Script
        object_path: Set colFiles = objFolder.Files
    - step:
        id: '209'
        action: Script
        object_path: For Each objFile in colFiles
    - step:
        id: '210'
        action: Script
        object_path: If UCase(FSO.GetExtensionName(objFile.name)) = "XML" Then
    - step:
        id: '211'
        action: Script
        object_path: If Instr(1, objFile.name, fileNameConvention) > 0 Then
    - step:
        id: '212'
        object_path: FSO.MoveFile GetDownloadsPath&"\"&objFile
        action: name,
        args: Reports_Download&"\"
    - step:
        id: '213'
        action: Script
        object_path: End If
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
        object_path: End If
    - step:
        id: '217'
        action: Script
        object_path: '''Clear variables'
    - step:
        id: '218'
        action: Script
        object_path: Set FSO = Nothing
    - step:
        id: '219'
        action: Script
        object_path: Set colFiles = Nothing
    - step:
        id: '220'
        action: Script
        object_path: Set objFolder = Nothing
    - step:
        id: '221'
        action: Script
        object_path: Reports_Download = empty
    - step:
        id: '222'
        action: Script
        object_path: Excel_Reports = empty
    - step:
        id: '223'
        action: Script
        object_path: Formatted_Reports = empty
    - step:
        id: '224'
        action: Script
        object_path: currentDate = empty
    - step:
        id: '225'
        action: Script
        object_path: currentMonth = empty
    - step:
        id: '226'
        action: Script
        object_path: currentMonthName = empty
    - step:
        id: '227'
        action: Script
        object_path: currentMonthLink = empty
    - step:
        id: '228'
        action: Script
        object_path: currentYeay = empty
    - step:
        id: '229'
        action: Script
        object_path: currentdayofWeek = empty
    - step:
        id: '230'
        action: Script
        object_path: UserName = empty
    - step:
        id: '231'
        action: Script
        object_path: Password = empty
    - step:
        id: '232'
        action: Script
        object_path: fileCnt = empty
    - step:
        id: '233'
        action: Script
        object_path: fileNameConvention = empty
    - step:
        id: '234'
        action: Script
        object_path: URL = empty
    - step:
        id: '235'
        action: Script
        object_path: contentRows = empty
    - step:
        id: '236'
        action: Script
        object_path: rptCount = empty
    - step:
        id: '237'
        action: Script
        object_path: arcRows = empty
    - step:
        id: '238'
        action: Script
        object_path: PageNumbers = empty
    - step:
        id: '239'
        action: Script
        object_path: i = empty
    - step:
        id: '240'
        action: Script
        object_path: totalRows = empty
    - step:
        id: '241'
        action: Script
        object_path: rowscnt = empty
    - step:
        id: '242'
        action: Script
        object_path: fileName = empty
    - step:
        id: '243'
        action: Script
        object_path: Iterator = empty
    - step:
        id: '244'
        action: Script
        object_path: ExitTest
    - step:
        id: '245'
        action: Wait
        args: '"2"'
        default_args: '"1"'
  outputs:
  - dateForRptName:
      robot: true
      value: ${dateForRptName}
  - ReportRole:
      robot: true
      value: ${ReportRole}
  - rptDownloadFolder:
      robot: true
      value: ${rptDownloadFolder}
  - xlsWorkingFolder:
      robot: true
      value: ${xlsWorkingFolder}
  - formatrptFolder:
      robot: true
      value: ${formatrptFolder}
  - currentdayofWeek:
      robot: true
      value: ${currentdayofWeek}
  - dateForLastWeekRpt:
      robot: true
      value: ${dateForLastWeekRpt}
  - teamsRptFolder:
      robot: true
      value: ${teamsRptFolder}
  - ReportsDownloaded:
      robot: true
      value: ${ReportsDownloaded}
  - rptCount:
      robot: true
      value: ${rptCount}
  - fileCnt:
      robot: true
      value: ${fileCnt}
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
      name: Login
      properties:
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
        active: false
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 27 February 2023 8:46:50 AM
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
                value: '20000'
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
          last_update_time: Monday, 27 February 2023 8:46:50 AM
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
              last_update_time: Monday, 27 February 2023 8:46:50 AM
              child_objects:
              - object:
                  class: WebElement
                  name: Data Load Import
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
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
                  child_objects: []
              - object:
                  class: Link
                  name: Participant Archive
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
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: IMG
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
                    - image type
                    - html tag
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
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
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
              last_update_time: Monday, 27 February 2023 8:46:50 AM
              child_objects:
              - object:
                  class: WebTable
                  name: Participant Archive
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
                        value: //TABLE[1]
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
                        value: '0'
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
                      value: 0
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
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
                  child_objects: []
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
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
                  child_objects: []
              - object:
                  class: WebElement
                  name: PageNumbers
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
                        value: 'Page No: .*'
                        regular_expression: true
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: TD
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
                        value: '//TR/TD[normalize-space()="Page No: 1 2"]'
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
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Monday, 27 February 2023 8:46:50 AM
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
          last_update_time: Monday, 27 February 2023 8:46:50 AM
          child_objects:
          - object:
              class: WebEdit
              name: userID
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
                  hidden: false
                  read_only: false
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
                  hidden: true
                  read_only: true
                  type: STRING
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
              last_update_time: Monday, 27 February 2023 8:46:50 AM
              child_objects: []
          - object:
              class: WebEdit
              name: password
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
                  hidden: false
                  read_only: false
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
                  hidden: true
                  read_only: true
                  type: STRING
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
              last_update_time: Monday, 27 February 2023 8:46:50 AM
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
                  hidden: false
                  read_only: false
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
                - image type
                - html tag
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
              last_update_time: Monday, 27 February 2023 8:46:50 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
