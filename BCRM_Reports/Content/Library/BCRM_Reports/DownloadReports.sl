namespace: BCRM_Reports
operation:
  name: DownloadReports
  inputs:
  - UserName
  - Password
  - rptDate:
      required: false
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.DownloadReports:1.0.0
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
        object_path: Username = Parameter("UserName")
    - step:
        id: '2'
        action: Script
        object_path: Username = LCase(Username)
    - step:
        id: '3'
        action: Script
        object_path: Password = Parameter("Password")
    - step:
        id: '4'
        action: Script
        object_path: reportDate = Parameter("rptDate")
    - step:
        id: '5'
        action: Script
        object_path: location = Parameter("location")
    - step:
        id: '6'
        action: Script
        object_path: '''Get current loggedin username'
    - step:
        id: '7'
        action: Script
        object_path: Set objNetwork = CreateObject("Wscript.Network")
    - step:
        id: '8'
        action: Script
        object_path: currUser = objNetwork.UserName
    - step:
        id: '9'
        action: Script
        object_path: Set objNetwork = Nothing
    - step:
        id: '10'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '11'
        action: Script
        object_path: If Not objFSO.FolderExists(location) Then
    - step:
        id: '12'
        object_path: objFSO
        action: CreateFolder(location)
    - step:
        id: '13'
        action: Script
        object_path: End If
    - step:
        id: '14'
        action: Script
        object_path: xmlFolder = location&"\XML Files\"
    - step:
        id: '15'
        action: Script
        object_path: downloadFolder = "C:\Automation Downloads\"
    - step:
        id: '16'
        action: Script
        object_path: csFSpec = location&"\MDP Logs\Execution Log.txt"
    - step:
        id: '17'
        action: Script
        object_path: '''Delete existing files in the XML folder - CleanUp activity'
    - step:
        id: '18'
        action: Script
        object_path: Const DeleteReadOnly = TRUE
    - step:
        id: '19'
        object_path: objFSO
        action: DeleteFile(xmlFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '20'
        action: Script
        object_path: '''delete all existing xml files from the user download folder'
    - step:
        id: '21'
        action: Script
        object_path: For each file in objFSO.GetFolder(downloadFolder).Files
    - step:
        id: '22'
        action: Script
        object_path: If LCase(objFSO.GetExtensionName(file.Name))  = "xml" Then
    - step:
        id: '23'
        object_path: objFSO.DeleteFile(file
        action: Path)
    - step:
        id: '24'
        action: Script
        object_path: End If
    - step:
        id: '25'
        action: Script
        object_path: Next
    - step:
        id: '26'
        action: Script
        object_path: '''Read the last line from the log file'
    - step:
        id: '27'
        action: Script
        object_path: Set objFile = objFSO.OpenTextFile(csFSpec, 1)
    - step:
        id: '28'
        action: Script
        object_path: Do Until objFile.AtEndOfStream
    - step:
        id: '29'
        action: Script
        object_path: strLine = objFile.ReadLine
    - step:
        id: '30'
        action: Script
        object_path: Loop
    - step:
        id: '31'
        object_path: objFile
        action: Close
    - step:
        id: '32'
        action: Script
        object_path: Set objFile = Nothing
    - step:
        id: '33'
        action: Script
        object_path: '''Function to count Subtring in a string - used to count number
          of ''TRUE'' in the logfile for number of expected reports'
    - step:
        id: '34'
        action: Script
        object_path: Function CountSubstring(str,substr)
    - step:
        id: '35'
        action: Script
        object_path: CountSubstring = 0
    - step:
        id: '36'
        action: Script
        object_path: For i = 1 To Len(str)
    - step:
        id: '37'
        action: Script
        object_path: If Len(str) >= Len(substr) Then
    - step:
        id: '38'
        action: Script
        object_path: If InStr(i,str,substr) Then
    - step:
        id: '39'
        action: Script
        object_path: CountSubstring = CountSubstring + 1
    - step:
        id: '40'
        action: Script
        object_path: i = InStr(i,str,substr) + Len(substr) - 1
    - step:
        id: '41'
        action: Script
        object_path: End If
    - step:
        id: '42'
        action: Script
        object_path: Else
    - step:
        id: '43'
        action: Script
        object_path: Exit For
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
        object_path: End Function
    - step:
        id: '47'
        action: Script
        object_path: '''Number of expected reports'
    - step:
        id: '48'
        action: Script
        object_path: numOfReports = countSubstring(strLine, "TRUE")
    - step:
        id: '49'
        action: Script
        object_path: 'rptCount = 0 '
        comment: initialise reports count with zero
    - step:
        id: '50'
        action: Script
        object_path: '''Open MSATS'
    - step:
        id: '51'
        action: Script
        object_path: URL = "https://msats.prod.nemnet.net.au/msats/index.jsp"
    - step:
        id: '52'
        object_path: SystemUtil
        action: Run
        args: '"chrome.exe",URL,,,3'
    - step:
        id: '53'
        action: Script
        object_path: If reportDate <> "" Then
    - step:
        id: '54'
        action: Script
        object_path: strDate = reportDate
    - step:
        id: '55'
        action: Script
        object_path: Else
    - step:
        id: '56'
        action: Script
        object_path: strDate = Date
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        action: Script
        object_path: strDate = CDate (strDate)
    - step:
        id: '59'
        action: Script
        object_path: dayDate = Day(strDate)
    - step:
        id: '60'
        action: Script
        object_path: monthDate = Month(strDate)
    - step:
        id: '61'
        action: Script
        object_path: monthDatetext = LCase(MonthName(Month(strDate),True))
    - step:
        id: '62'
        action: Script
        object_path: YearDate = Year(strDate)
    - step:
        id: '63'
        action: Script
        object_path: If Len(dayDate) = 1 Then
    - step:
        id: '64'
        action: Script
        object_path: dayDate = "0"& dayDate
    - step:
        id: '65'
        action: Script
        object_path: End If
    - step:
        id: '66'
        action: Script
        object_path: If Len(monthDate) = 1 Then
    - step:
        id: '67'
        action: Script
        object_path: monthDate = "0"& monthDate
    - step:
        id: '68'
        action: Script
        object_path: End If
    - step:
        id: '69'
        action: Script
        object_path: '''rptnameString = "nemmco_"&right(YearDate,2)&monthDate&dayDate  ''-
          this is old report format name leaving commented as AEMO mar rever back
          to this change'
    - step:
        id: '70'
        action: Script
        object_path: rptnameString = "mdmtm_"&Username
    - step:
        id: '71'
        action: Script
        object_path: monthDate = monthDate&"-"&monthDatetext
    - step:
        id: '72'
        action: Script
        object_path: '''Login to MSATS and navigate to current days folder'
    - step:
        id: '73'
        object_path: Browser("Login").Page("Login").WebEdit("userID")
        action: Set
        args: Username
    - step:
        id: '74'
        object_path: Browser("Login").Page("Login").WebEdit("password")
        action: Set
        args: Password
    - step:
        id: '75'
        object_path: Browser("Login").Page("Login").Image("Login")
        action: Click
    - step:
        id: '76'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '77'
        object_path: Browser("Login").Page("MSATS").Frame("toc").WebElement("DataLoadImport")
        action: Click
    - step:
        id: '78'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '79'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("ParticipantArchive")
        action: Click
    - step:
        id: '80'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '81'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&YearDate,
          "html tag:=A")
        action: Click
    - step:
        id: '82'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '83'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&monthDate,
          "html tag:=A")
        action: Click
    - step:
        id: '84'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '85'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").Link("text:="&dayDate,
          "html tag:=A")
        action: Click
    - step:
        id: '86'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '87'
        action: Script
        object_path: myLen = Len(strLine)
    - step:
        id: '88'
        action: Script
        object_path: lastDelimiter = InstrRev(strLine, ",")
    - step:
        id: '89'
        action: Script
        object_path: rptAvailFlag = Mid(strLine, lastDelimiter+1)
    - step:
        id: '90'
        action: Script
        object_path: CurrArchivelink = Mid(strLine, lastDelimiter-8)
    - step:
        id: '91'
        action: Script
        object_path: CurrArchivelink = Replace(CurrArchivelink, ","&rptAvailFlag,
          "")
    - step:
        id: '92'
        action: Script
        object_path: '''Check if the reports were not downloaded earlier'
    - step:
        id: '93'
        action: Script
        object_path: allRptDownloaded = Empty
    - step:
        id: '94'
        action: Script
        object_path: If rptAvailFlag  = "FALSE" Then
    - step:
        id: '95'
        action: Script
        object_path: contentRows = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").RowCount
    - step:
        id: '96'
        action: Script
        object_path: row = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").GetRowWithCellText(CurrArchivelink)
    - step:
        id: '97'
        action: Script
        object_path: '''For arcRowns = row To contentRows'
    - step:
        id: '98'
        action: Script
        object_path: '''Changed to search all folders for files that match'
    - step:
        id: '99'
        action: Script
        object_path: For arcRowns = 3 To contentRows
    - step:
        id: '100'
        action: Script
        object_path: Set ObjClick = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(arcRowns,1,"Link",0)
    - step:
        id: '101'
        object_path: ObjClick
        action: Click
    - step:
        id: '102'
        action: Script
        object_path: Set ObjClick = Nothing
    - step:
        id: '103'
        action: Script
        object_path: '''Get page numbers available and create an array'
    - step:
        id: '104'
        action: Script
        object_path: PageNumbers = Browser("Login").Page("MSATS").Frame("DETAIL").WebElement("PageNumbers").GetROProperty("innertext")
    - step:
        id: '105'
        action: Script
        object_path: Set regex = New regExp
    - step:
        id: '106'
        object_path: regex
        action: Pattern
        args: = "\d+"
    - step:
        id: '107'
        object_path: regex
        action: Global
        args: = True
    - step:
        id: '108'
        action: Script
        object_path: Set Matches = regex.Execute(PageNumbers)
    - step:
        id: '109'
        action: Script
        object_path: matchCount = Matches.Count
    - step:
        id: '110'
        action: Script
        object_path: rptAvailable = Empty
    - step:
        id: '111'
        action: Script
        object_path: '''Try downloading reports by checking all pages available'
    - step:
        id: '112'
        action: Script
        object_path: For i = 0 to matchCount-1
    - step:
        id: '113'
        action: Script
        object_path: '''Click on page number only when the reports page number is
          not page 1'
    - step:
        id: '114'
        action: Script
        object_path: If Matches(i) <> 1 Then
    - step:
        id: '115'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ParticipantArchive").Link("text:="&Matches(i),"html
          tag:=A")
        action: Click
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: '''get total count of rows'
    - step:
        id: '118'
        action: Script
        object_path: totalRows = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").RowCount
    - step:
        id: '119'
        action: Script
        object_path: '''go through each row and check try downloading only when the
          report file name has the user name string'
    - step:
        id: '120'
        action: Script
        object_path: If totalRows > 2 Then
    - step:
        id: '121'
        action: Script
        object_path: For rowscnt = 3 to totalRows
    - step:
        id: '122'
        action: Script
        object_path: fileName = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").GetCellData(rowscnt,
          1)
    - step:
        id: '123'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '124'
        action: Script
        object_path: If Instr(fileName, rptnameString) > 0 Then
    - step:
        id: '125'
        action: Script
        object_path: '''If Instr(1,fileName, rptnameString) > 0 Then'
    - step:
        id: '126'
        action: Script
        object_path: Set rptLink = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(rowscnt,1,"Link",1)
    - step:
        id: '127'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '128'
        object_path: rptLink
        action: Click
    - step:
        id: '129'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '130'
        action: Script
        object_path: Set rptLink = Nothing
    - step:
        id: '131'
        action: Script
        object_path: Set rptdownload = Browser("Login").Page("MSATS").Frame("DETAIL").WebTable("ArchiveContents").ChildItem(3,1,"Link",0)
    - step:
        id: '132'
        object_path: rptdownload
        action: Click
    - step:
        id: '133'
        action: Script
        object_path: rptAvailable = "Available"
    - step:
        id: '134'
        action: Script
        object_path: rptCount = rptCount +  1
    - step:
        id: '135'
        action: Script
        object_path: Set rptdownload = Nothing
    - step:
        id: '136'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '137'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '138'
        action: Script
        object_path: End If
    - step:
        id: '139'
        action: Script
        object_path: Next
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
        object_path: Parameter("ReportsAvailable") = rptCount
    - step:
        id: '143'
        action: Script
        object_path: If matchCount = 0 Then
    - step:
        id: '144'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '145'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '146'
        action: Script
        object_path: Else
    - step:
        id: '147'
        action: Script
        object_path: For Iterator = 0 To matchCount-1
    - step:
        id: '148'
        object_path: Browser("Login")
        action: Back
    - step:
        id: '149'
        action: Script
        object_path: Next
    - step:
        id: '150'
        action: Script
        object_path: End If
    - step:
        id: '151'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '152'
        action: Script
        object_path: Set Matches = NOTHING
    - step:
        id: '153'
        action: Script
        object_path: Next
    - step:
        id: '154'
        action: Script
        object_path: End If
    - step:
        id: '155'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '156'
        action: Script
        object_path: If rptCount = 0 Then
    - step:
        id: '157'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Reports are not available", "Reports are not available"
    - step:
        id: '158'
        action: Script
        object_path: ExitTest
    - step:
        id: '159'
        action: Script
        object_path: End If
    - step:
        id: '160'
        action: Script
        object_path: ''' Move downloaded xml files to the XML folder for next task
          to format'
    - step:
        id: '161'
        object_path: objFSO
        action: MoveFile
        args: downloadFolder&"*.xml", xmlFolder
    - step:
        id: '162'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '163'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '164'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '165'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '166'
        object_path: Browser("Login")
        action: Close
    - step:
        id: '167'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '168'
        action: Script
        object_path: Username = empty
    - step:
        id: '169'
        action: Script
        object_path: Password = empty
    - step:
        id: '170'
        action: Script
        object_path: xmlFolder = empty
    - step:
        id: '171'
        action: Script
        object_path: numOfReports = empty
    - step:
        id: '172'
        action: Script
        object_path: strDate = empty
    - step:
        id: '173'
        action: Script
        object_path: dayDate = empty
    - step:
        id: '174'
        action: Script
        object_path: monthDate = empty
    - step:
        id: '175'
        action: Script
        object_path: monthDatetext = empty
    - step:
        id: '176'
        action: Script
        object_path: YearDate = empty
    - step:
        id: '177'
        action: Script
        object_path: myLen = empty
    - step:
        id: '178'
        action: Script
        object_path: lastDelimiter = empty
    - step:
        id: '179'
        action: Script
        object_path: rptAvailFlag = empty
    - step:
        id: '180'
        action: Script
        object_path: CurrArchivelink = empty
    - step:
        id: '181'
        action: Script
        object_path: allRptDownloaded = empty
    - step:
        id: '182'
        action: Script
        object_path: rptAvailFlag  = empty
    - step:
        id: '183'
        action: Script
        object_path: contentRows = empty
    - step:
        id: '184'
        action: Script
        object_path: row = empty
    - step:
        id: '185'
        action: Script
        object_path: arcRowns = empty
    - step:
        id: '186'
        action: Script
        object_path: PageNumbers = empty
    - step:
        id: '187'
        action: Script
        object_path: matchCount = empty
    - step:
        id: '188'
        action: Script
        object_path: totalRows = empty
    - step:
        id: '189'
        action: Script
        object_path: rowscnt = empty
    - step:
        id: '190'
        action: Script
        object_path: fileName = empty
    - step:
        id: '191'
        action: Script
        object_path: Iterator = empty
    - step:
        id: '192'
        action: Script
        object_path: ExitTest
  outputs:
  - ReportsAvailable:
      robot: true
      value: ${ReportsAvailable}
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
            value: https://msats.preprod.nemnet.net.au/msats/index.jsp
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
          value: 0
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
      last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                value: '10002'
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
          last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
              last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
              last_update_time: Tuesday, 14 March 2023 12:59:24 PM
              child_objects:
              - object:
                  class: WebTable
                  name: ParticipantArchive
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                  last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                value: https://msats.preprod.nemnet.net.au/msats/index.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.preprod.nemnet.net.au/msats/index.jsp
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
                value: '10001'
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
          last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                    value: '144'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '146'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: '19'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              - property:
                  value:
                    value: '297'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                    value: '144'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '177'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: '19'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              - property:
                  value:
                    value: '328'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Tuesday, 14 March 2023 12:59:24 PM
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
                    value: '208'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              - property:
                  value:
                    value: '359'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '872'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Tuesday, 14 March 2023 12:59:24 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
