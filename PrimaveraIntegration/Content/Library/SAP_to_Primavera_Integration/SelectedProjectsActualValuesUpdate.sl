namespace: SAP_to_Primavera_Integration
operation:
  name: SelectedProjectsActualValuesUpdate
  inputs:
  - projectID
  - prima_user
  - prima_pass
  sequential_action:
    gav: com.microfocus.seq:SAP_to_Primavera_Integration.SelectedProjectsActualValuesUpdate:1.0.0
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
        object_path: '''****************************************************************SCRIPT*************************************************************************'''
    - step:
        id: '2'
        action: Script
        object_path: ''' Open Edge and load Primavera'
    - step:
        id: '3'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '4'
        action: Script
        object_path: URL = "https://prvprd612.utilities.etsa.net.au/p6/action/login"
    - step:
        id: '5'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '6'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '7'
        action: Script
        object_path: While Browser("Oracle Primavera P6 EPPM").Page("Oracle Primavera
          P6 EPPM").WebEdit("Username").Exist = False
    - step:
        id: '8'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '9'
        action: Script
        object_path: Wend
    - step:
        id: '10'
        action: Script
        object_path: ''' Login as svcrobotest'
    - step:
        id: '11'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '12'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Oracle Primavera P6
          EPPM").WebEdit("Username")
        action: Highlight
    - step:
        id: '13'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Oracle Primavera P6
          EPPM").WebEdit("Username")
        action: Set
        args: Parameter("prima_user")
    - step:
        id: '14'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Oracle Primavera P6
          EPPM").WebEdit("password")
        action: Set
        args: Parameter("prima_pass")
    - step:
        id: '15'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '16'
        action: Script
        object_path: ''' Log in'
    - step:
        id: '17'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Oracle Primavera P6
          EPPM").WebButton("Sign In")
        action: Click
    - step:
        id: '18'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '19'
        action: Script
        object_path: ''' Navigate to projects'
    - step:
        id: '20'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Dashboards").Link("Projects")
        action: Click
    - step:
        id: '21'
        action: Wait
        args: '"8"'
        default_args: '"1"'
    - step:
        id: '22'
        action: Script
        object_path: ''''' Turn on "Reporting only" filter'
    - step:
        id: '23'
        object_path: '''Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").WebButton("Filters")'
        action: Click
    - step:
        id: '24'
        object_path: '''Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").Link("Manage Filters...")'
        action: Click
    - step:
        id: '25'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '26'
        object_path: '''Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").WebCheckBox("PlannedFilter")'
        action: Set
        args: '"OFF"'
    - step:
        id: '27'
        object_path: '''Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").WebCheckBox("ActualsFilter")'
        action: Set
        args: '"ON"'
    - step:
        id: '28'
        action: Script
        object_path: ''''' Check if save button is disabled. If so, click cancel.
          Otherwise this throws an error.'
    - step:
        id: '29'
        action: Script
        object_path: '''If Browser("Primavera P6 - Activities").Page("Primavera P6
          - Enterprise").WebButton("FilterSave").Object.disabled = false Then'
    - step:
        id: '30'
        action: Script
        object_path: "'\tsaveFilterVis = Browser(\"Primavera P6 - Activities\").Page(\"\
          Primavera P6 - Enterprise\").WebButton(\"FilterSave\").GetROProperty(\"\
          visible\")"
    - step:
        id: '31'
        action: Script
        object_path: "'\tIf saveFilterVis = True Then"
    - step:
        id: '32'
        action: Script
        object_path: "'\t\tBrowser(\"Primavera P6 - Activities\").Page(\"Primavera\
          \ P6 - Enterprise\").WebButton(\"FilterSave\").Click"
    - step:
        id: '33'
        action: Script
        object_path: "'\t\tWait 45"
    - step:
        id: '34'
        action: Script
        object_path: "'\t\tSet mySendKeys = CreateObject(\"WScript.Shell\")"
    - step:
        id: '35'
        action: Script
        object_path: "'\t\tmySendKeys.SendKeys \"{F5}\""
    - step:
        id: '36'
        action: Script
        object_path: "'\t\tWait 3"
    - step:
        id: '37'
        action: Script
        object_path: "'\t\tmySendKeys.SendKeys \"{ENTER}\""
    - step:
        id: '38'
        action: Script
        object_path: "'\t\tSet mySendKeys = NOTHING"
    - step:
        id: '39'
        action: Script
        object_path: "'\t\tWait 10"
    - step:
        id: '40'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '41'
        action: Script
        object_path: '''Else'
    - step:
        id: '42'
        action: Script
        object_path: "'\tBrowser(\"Primavera P6 - Activities\").Page(\"Primavera P6\
          \ - Enterprise\").WebButton(\"FilterCancel\").Click"
    - step:
        id: '43'
        action: Script
        object_path: '''End If'
    - step:
        id: '44'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '45'
        action: Script
        object_path: ''' Close any open projects'
    - step:
        id: '46'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebElement("class:=pgbu-icon
          pgbu-icon-cog","html tag:=I","index:=0")
        action: Click
    - step:
        id: '47'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Close
          All")
        action: Click
    - step:
        id: '48'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '49'
        action: Script
        object_path: ''' Check if projects were closed'
    - step:
        id: '50'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebElement("class:=pgbu-icon
          pgbu-icon-cog","html tag:=I","index:=0")
        action: Click
    - step:
        id: '51'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").Link("Close All").Object.disabled Then
    - step:
        id: '52'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Close
          All")
        action: Highlight
    - step:
        id: '53'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Close
          All")
        action: Click
    - step:
        id: '54'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '55'
        action: Script
        object_path: End If
    - step:
        id: '56'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebButton("Grid
          View")
        action: Click
    - step:
        id: '57'
        action: Script
        object_path: '''If projectID is not empty, open specified projects, else open
          all'
    - step:
        id: '58'
        action: Script
        object_path: If Parameter("projectID") <> "" Then
    - step:
        id: '59'
        action: Script
        object_path: ''' Open specified projects'
    - step:
        id: '60'
        action: Script
        object_path: ''' Find amount of project ID''s entered'
    - step:
        id: '61'
        action: Script
        object_path: projectID = Parameter("projectID")
    - step:
        id: '62'
        action: Script
        object_path: projectID = UCase(projectID)
    - step:
        id: '63'
        action: Script
        object_path: projectID_input = Split(projectID, ",")
    - step:
        id: '64'
        action: Script
        object_path: lengthOf = Ubound(projectID_input)
    - step:
        id: '65'
        action: Script
        object_path: ''' Add projects to array'
    - step:
        id: '66'
        action: Script
        object_path: ProjectIDArray = Array()
    - step:
        id: '67'
        action: Script
        object_path: For o = 0 To lengthOf
    - step:
        id: '68'
        action: Script
        object_path: '''trim white space around project ID'
    - step:
        id: '69'
        action: Script
        object_path: trim_projectID_input = Trim(projectID_input(o))
    - step:
        id: '70'
        action: Script
        object_path: ReDim Preserve ProjectIDArray(UBound(ProjectIDArray) + 1)
    - step:
        id: '71'
        action: Script
        object_path: ProjectIDArray(UBound(ProjectIDArray)) = trim_projectID_input
    - step:
        id: '72'
        action: Script
        object_path: Next
    - step:
        id: '73'
        action: Script
        object_path: ''' Get length of array'
    - step:
        id: '74'
        action: Script
        object_path: lengthOfArray = UBound(ProjectIDArray) + 1
    - step:
        id: '75'
        action: Script
        object_path: projectNotFound = 0
    - step:
        id: '76'
        action: Script
        object_path: ''' Open each project'
    - step:
        id: '77'
        action: Script
        object_path: For each ID in ProjectIDArray
    - step:
        id: '78'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise_2").WebEdit("Search")
        action: Set
        args: ID
    - step:
        id: '79'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '80'
        action: Script
        object_path: ''' If project does not exist, send email'
    - step:
        id: '81'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise_2").WebElement("No search results found.").Exist(3) Then
    - step:
        id: '82'
        action: Script
        object_path: projectNotFound = projectNotFound + 1
    - step:
        id: '83'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '84'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '85'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '86'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,DL_ITAutomationteam@sapowernetworks.com.au"
    - step:
        id: '87'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Project "&ID&" not found. Project could not be updated."'
    - step:
        id: '88'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '89'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '90'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '91'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '92'
        object_path: MyEmail
        action: Send
    - step:
        id: '93'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '94'
        action: Script
        object_path: Else
    - step:
        id: '95'
        action: Script
        object_path: ''' If project does exist, open project'
    - step:
        id: '96'
        action: Script
        object_path: projRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Enterprise_2").WebTable("SA Power Networks").GetRowWithCellText(ID)
    - step:
        id: '97'
        action: Script
        object_path: Set projectRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Enterprise_2").WebTable("SA Power Networks").ChildItem(projRow, 1,
          "WebElement", 0)
    - step:
        id: '98'
        object_path: projectRow
        action: Click
    - step:
        id: '99'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise_2").WebElement("WebElement")
        action: Click
    - step:
        id: '100'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise_2").Link("Open
          Project")
        action: Click
    - step:
        id: '101'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '102'
        action: Script
        object_path: End  If
    - step:
        id: '103'
        action: Script
        object_path: Next
    - step:
        id: '104'
        action: Script
        object_path: If projectNotFound = lengthOfArray Then
    - step:
        id: '105'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '106'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '107'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '108'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '109'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: No Project ID''s could be found or opened. Process Exited.
          Number of Projects searched: "&lengthOfArray'
    - step:
        id: '110'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '111'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '112'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '113'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '114'
        object_path: MyEmail
        action: Send
    - step:
        id: '115'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '116'
        action: Script
        object_path: ExitTest
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebButton("Grid
          View")
        action: Click
    - step:
        id: '119'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '120'
        action: Script
        object_path: '''Load Activities Page'
    - step:
        id: '121'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").Link("Activities")
        action: Click
    - step:
        id: '122'
        action: Script
        object_path: Else
    - step:
        id: '123'
        action: Script
        object_path: ''' Open all projects'
    - step:
        id: '124'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebElement("class:=pgbu-icon
          pgbu-icon-cog","html tag:=I","index:=0")
        action: Click
    - step:
        id: '125'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '126'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Open
          Project")
        action: Highlight
    - step:
        id: '127'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Open
          Project")
        action: Click
    - step:
        id: '128'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '129'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebButton("Grid
          View")
        action: Click
    - step:
        id: '130'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '131'
        action: Script
        object_path: '''Check if project was opened'
    - step:
        id: '132'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").WebElement("class:=pgbu-icon
          pgbu-icon-cog","html tag:=I","index:=0")
        action: Click
    - step:
        id: '133'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise").Link("Open Project").Exist(3) Then
    - step:
        id: '134'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Open
          Project")
        action: Highlight
    - step:
        id: '135'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Enterprise").Link("Open
          Project")
        action: Click
    - step:
        id: '136'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '137'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").Link("Activities")
        action: Click
    - step:
        id: '138'
        action: Script
        object_path: Else
    - step:
        id: '139'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Enterprise").Link("Activities")
        action: Click
    - step:
        id: '140'
        action: Script
        object_path: End If
    - step:
        id: '141'
        action: Script
        object_path: End  If
    - step:
        id: '142'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '143'
        action: Script
        object_path: ''' Wait for Activities page to load, if it doesn''t, exit test'
    - step:
        id: '144'
        action: Script
        object_path: For b = 1 To 10
    - step:
        id: '145'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebButton("Views").Exist(3) = false Then
    - step:
        id: '146'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '147'
        action: Script
        object_path: ElseIf Browser("Primavera P6 - Activities").Page("Primavera P6
          - Activities").WebButton("Views").Exist(3) Then
    - step:
        id: '148'
        action: Script
        object_path: Exit For
    - step:
        id: '149'
        action: Script
        object_path: End If
    - step:
        id: '150'
        action: Script
        object_path: If b = 10 Then
    - step:
        id: '151'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Error loading Activities page","Project(s) no longer exist(s),
          or you do not have access to it."
    - step:
        id: '152'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Error loading Activities page","Project(s) no longer exist(s),
          or you do not have access to it."
    - step:
        id: '153'
        action: Script
        object_path: '''send email about failure to load activities'
    - step:
        id: '154'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '155'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '156'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '157'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,DL_ITAutomationteam@sapowernetworks.com.au"
    - step:
        id: '158'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Error thrown while trying to load Activites page: ''Project(s)
          no longer exist(s), or you do not have access to it.''"'
    - step:
        id: '159'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '160'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '161'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '162'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '163'
        object_path: MyEmail
        action: Send
    - step:
        id: '164'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '165'
        action: Script
        object_path: ExitTest
    - step:
        id: '166'
        action: Script
        object_path: End If
    - step:
        id: '167'
        action: Script
        object_path: Next
    - step:
        id: '168'
        action: Script
        object_path: ''' There may be a popup to say there are too many activites
          being displayed (>5000).'
    - step:
        id: '169'
        action: Script
        object_path: ''' This is fixed by selecting the filter.'
    - step:
        id: '170'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("OK").Exist(3)
          Then
    - step:
        id: '171'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        action: Script
        object_path: ''' Select Automation view'
    - step:
        id: '174'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Views")
        action: Click
    - step:
        id: '175'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Automation
          View")
        action: Click
    - step:
        id: '176'
        action: Script
        object_path: ''' Collapse bottom dock'
    - step:
        id: '177'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '178'
        action: Script
        object_path: If ExpandCollapseDock = "Collapse Dock" Then
    - step:
        id: '179'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '180'
        action: Script
        object_path: End If
    - step:
        id: '181'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '182'
        action: Script
        object_path: actDetailsRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").RowCount
    - step:
        id: '183'
        action: Script
        object_path: ''' Download excel document, get excelRow count and last order
          number, use with counter to exit at the end of the table'
    - step:
        id: '184'
        action: Script
        object_path: excelValue = DownloadExcel
    - step:
        id: '185'
        action: Script
        object_path: excelValue = Split(excelValue,",")
    - step:
        id: '186'
        action: Script
        object_path: '''excel row count'
    - step:
        id: '187'
        action: Script
        object_path: excelRow = excelValue(0)
    - step:
        id: '188'
        action: Script
        object_path: excelRow = Cint(excelRow)
    - step:
        id: '189'
        action: Script
        object_path: '''last order number'
    - step:
        id: '190'
        action: Script
        object_path: lastOrder = excelValue(1)
    - step:
        id: '191'
        action: Script
        object_path: lastOrder = CDbl(lastOrder)
    - step:
        id: '192'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '193'
        action: Script
        object_path: If excelRow <= actDetailsRow Then
    - step:
        id: '194'
        action: Script
        object_path: noScroll = False
    - step:
        id: '195'
        action: Script
        object_path: Else
    - step:
        id: '196'
        action: Script
        object_path: noScroll = True
    - step:
        id: '197'
        action: Script
        object_path: End If
    - step:
        id: '198'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebButton("Save View").Object.disabled = false Then
    - step:
        id: '199'
        action: Script
        object_path: saveVis = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebButton("Save View").GetROProperty("visible")
    - step:
        id: '200'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '201'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Save
          View")
        action: Click
    - step:
        id: '202'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '203'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '204'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '205'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '206'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '207'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '208'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '209'
        action: Script
        object_path: End If
    - step:
        id: '210'
        action: Script
        object_path: End If
    - step:
        id: '211'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '212'
        action: Script
        object_path: 'contents = "Actual row count: " &actDetailsRow & ", Excel row
          count: " & excelRow'
    - step:
        id: '213'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '214'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '215'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '216'
        object_path: f
        action: Close
    - step:
        id: '217'
        action: Script
        object_path: Else
    - step:
        id: '218'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '219'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '220'
        object_path: textFile
        action: Close
    - step:
        id: '221'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '222'
        action: Script
        object_path: End If
    - step:
        id: '223'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '224'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '225'
        action: Script
        object_path: If excelRow > actDetailsRow Then
    - step:
        id: '226'
        action: Script
        object_path: actDetailsRow = actDetailsRow - 3
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: ''' creating a list of completed projects so record ROI'
    - step:
        id: '229'
        action: Script
        object_path: updatedProjects = ""
    - step:
        id: '230'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '231'
        action: Script
        object_path: contents = "row number, project name, order number"
    - step:
        id: '232'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '233'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '234'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '235'
        object_path: f
        action: Close
    - step:
        id: '236'
        action: Script
        object_path: Else
    - step:
        id: '237'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '238'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '239'
        object_path: textFile
        action: Close
    - step:
        id: '240'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '241'
        action: Script
        object_path: End If
    - step:
        id: '242'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '243'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '244'
        action: Script
        object_path: ''' Iterate through rows until order number column is not empty'
    - step:
        id: '245'
        action: Script
        object_path: For j = 1 To actDetailsRow
    - step:
        id: '246'
        action: Script
        object_path: counter = counter + 1
    - step:
        id: '247'
        action: Script
        object_path: cnt = cnt + 1
    - step:
        id: '248'
        action: Script
        object_path: '''Print "Current Counts(counter): " & counter'
    - step:
        id: '249'
        action: Script
        object_path: '''Print "Current Iterations (j): " & j'
    - step:
        id: '250'
        action: Script
        object_path: ''' Scroll down table'
    - step:
        id: '251'
        action: Script
        object_path: If excelRow - counter < actDetailsRow And noScroll Then
    - step:
        id: '252'
        action: Script
        object_path: actDetailsRow = actDetailsRow + 3
    - step:
        id: '253'
        action: Script
        object_path: fn_ScrollToBottom
    - step:
        id: '254'
        action: Script
        object_path: For jj = 2 to actDetailsRow - 1
    - step:
        id: '255'
        action: Script
        object_path: fn_ScrollToBottom
    - step:
        id: '256'
        action: Script
        object_path: projNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 7)
    - step:
        id: '257'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 6)
    - step:
        id: '258'
        action: Script
        object_path: '''Print "JJ: " & jj'
    - step:
        id: '259'
        action: Script
        object_path: '''Print "Project: " & projNum'
    - step:
        id: '260'
        action: Script
        object_path: '''Print "Order: "& ordNum'
    - step:
        id: '261'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '262'
        action: Script
        object_path: contents = jj & "," & projNum & "," & ordNum
    - step:
        id: '263'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '264'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '265'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '266'
        object_path: f
        action: Close
    - step:
        id: '267'
        action: Script
        object_path: Else
    - step:
        id: '268'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '269'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '270'
        object_path: textFile
        action: Close
    - step:
        id: '271'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '272'
        action: Script
        object_path: End If
    - step:
        id: '273'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '274'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '275'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '276'
        action: Script
        object_path: If inStr(ordNum,",") Then
    - step:
        id: '277'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '278'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '279'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '280'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,"
    - step:
        id: '281'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Multiple order numbers found in single row for Project
          "&projNum&" Order: "&ordNum'
    - step:
        id: '282'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '283'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '284'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '285'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '286'
        object_path: MyEmail
        action: Send
    - step:
        id: '287'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '288'
        action: Script
        object_path: ElseIf projNum <> "" and len(ordNum) <> 9 Then
    - step:
        id: '289'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '290'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '291'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '292'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '293'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Incomplete order number found for Project "&projNum&" Order:
          "&ordNum'
    - step:
        id: '294'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '295'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '296'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '297'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '298'
        object_path: MyEmail
        action: Send
    - step:
        id: '299'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '300'
        action: Script
        object_path: ElseIf projNum <> "" Then
    - step:
        id: '301'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '302'
        action: Script
        object_path: labourActualCost = 0
    - step:
        id: '303'
        action: Script
        object_path: labourActualCost = CDbl(labourActualCost)
    - step:
        id: '304'
        action: Script
        object_path: materialActualCost = 0
    - step:
        id: '305'
        action: Script
        object_path: materialActualCost = CDbl(materialActualCost)
    - step:
        id: '306'
        action: Script
        object_path: servicesActualCost = 0
    - step:
        id: '307'
        action: Script
        object_path: servicesActualCost = CDbl(servicesActualCost)
    - step:
        id: '308'
        action: Script
        object_path: totalLabour = 0
    - step:
        id: '309'
        action: Script
        object_path: totalLabour = CDbl(totalLabour)
    - step:
        id: '310'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '311'
        action: Script
        object_path: Flag = True
    - step:
        id: '312'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(jj, 6, "WebElement",
          0)
    - step:
        id: '313'
        object_path: rowObj
        action: Click
    - step:
        id: '314'
        action: Script
        object_path: orderStatus = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 12)
    - step:
        id: '315'
        action: Script
        object_path: '''**********************************************************************SAP
          STARTS HERE******************************************************************************************************'
    - step:
        id: '316'
        action: Script
        object_path: '''GET FULL WBS ELEMENT'
    - step:
        id: '317'
        action: Script
        object_path: '''go to transaction S_ALR_87013534, set up form, and open project
          number'
    - step:
        id: '318'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '319'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '320'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '321'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '322'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '323'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(3) Then
    - step:
        id: '324'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '325'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '326'
        action: Script
        object_path: End If
    - step:
        id: '327'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '328'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '329'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '330'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '331'
        action: Script
        object_path: End If
    - step:
        id: '332'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '333'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projNum
    - step:
        id: '334'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '335'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '336'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '337'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '338'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '339'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '340'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projNum,"PRJ "&projNum'
    - step:
        id: '341'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '342'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projNum'
    - step:
        id: '343'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '344'
        action: Script
        object_path: rowContainingOrdNum = findBudget(tree, ordNum)
    - step:
        id: '345'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '346'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '347'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '348'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '349'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '350'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project actual cost, Labour actual cost, Material actual
          cost or Services actual cost could not be extracted). "
    - step:
        id: '351'
        action: Script
        object_path: Else
    - step:
        id: '352'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '353'
        action: Script
        object_path: End If
    - step:
        id: '354'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '355'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '356'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '357'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(3) Then
    - step:
        id: '358'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '359'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '360'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '361'
        action: Script
        object_path: End If
    - step:
        id: '362'
        action: Script
        object_path: If WBSelement <> "" Then
    - step:
        id: '363'
        action: Script
        object_path: '''ACTUAL LABOUR, MATERIALS AND SERVICES $'
    - step:
        id: '364'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '365'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '366'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '367'
        action: Script
        object_path: planVersion = GetPlanVersion
    - step:
        id: '368'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '369'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '370'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '371'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '372'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '373'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '374'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '375'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '376'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '377'
        action: Script
        object_path: Else
    - step:
        id: '378'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '379'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '380'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '381'
        action: Script
        object_path: Found = 0
    - step:
        id: '382'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '383'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '384'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '385'
        action: Script
        object_path: Found = 1
    - step:
        id: '386'
        action: Script
        object_path: Exit For
    - step:
        id: '387'
        action: Script
        object_path: End if
    - step:
        id: '388'
        action: Script
        object_path: Next
    - step:
        id: '389'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '390'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '391'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '392'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '393'
        action: Script
        object_path: LactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '394'
        action: Script
        object_path: LactualCost = CDbl(LactualCost)
    - step:
        id: '395'
        action: Script
        object_path: labourActualCost = labourActualCost + LactualCost
    - step:
        id: '396'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '397'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '398'
        action: Script
        object_path: Else
    - step:
        id: '399'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '400'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '401'
        action: Script
        object_path: End  If
    - step:
        id: '402'
        action: Script
        object_path: End  If
    - step:
        id: '403'
        action: Script
        object_path: Next
    - step:
        id: '404'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '405'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '406'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '407'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '408'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '409'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '410'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '411'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '412'
        action: Script
        object_path: Else
    - step:
        id: '413'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '414'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '415'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '416'
        action: Script
        object_path: Found = 0
    - step:
        id: '417'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '418'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '419'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '420'
        action: Script
        object_path: Found = 1
    - step:
        id: '421'
        action: Script
        object_path: Exit For
    - step:
        id: '422'
        action: Script
        object_path: End if
    - step:
        id: '423'
        action: Script
        object_path: Next
    - step:
        id: '424'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '425'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '426'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '427'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '428'
        action: Script
        object_path: MactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '429'
        action: Script
        object_path: MactualCost = CDbl(MactualCost)
    - step:
        id: '430'
        action: Script
        object_path: materialActualCost = materialActualCost + MactualCost
    - step:
        id: '431'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '432'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '433'
        action: Script
        object_path: Else
    - step:
        id: '434'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '435'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '436'
        action: Script
        object_path: End If
    - step:
        id: '437'
        action: Script
        object_path: End If
    - step:
        id: '438'
        action: Script
        object_path: Next
    - step:
        id: '439'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '440'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '441'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '442'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '443'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '444'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '445'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '446'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '447'
        action: Script
        object_path: Else
    - step:
        id: '448'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '449'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '450'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '451'
        action: Script
        object_path: Found = 0
    - step:
        id: '452'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '453'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '454'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '455'
        action: Script
        object_path: Found = 1
    - step:
        id: '456'
        action: Script
        object_path: Exit For
    - step:
        id: '457'
        action: Script
        object_path: End if
    - step:
        id: '458'
        action: Script
        object_path: Next
    - step:
        id: '459'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '460'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '461'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '462'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '463'
        action: Script
        object_path: SactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '464'
        action: Script
        object_path: SactualCost = CDbl(SactualCost)
    - step:
        id: '465'
        action: Script
        object_path: servicesActualCost = servicesActualCost + SactualCost
    - step:
        id: '466'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '467'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '468'
        action: Script
        object_path: Else
    - step:
        id: '469'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '470'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '471'
        action: Script
        object_path: End  If
    - step:
        id: '472'
        action: Script
        object_path: End  If
    - step:
        id: '473'
        action: Script
        object_path: Next
    - step:
        id: '474'
        action: Script
        object_path: If labourActualCost = 0 Then
    - step:
        id: '475'
        action: Script
        object_path: emailContent = emailContent& "Labour actual cost not found. "
    - step:
        id: '476'
        action: Script
        object_path: End If
    - step:
        id: '477'
        action: Script
        object_path: If materialActualCost = 0 Then
    - step:
        id: '478'
        action: Script
        object_path: emailContent = emailContent& "Material actual cost not found.
          "
    - step:
        id: '479'
        action: Script
        object_path: End If
    - step:
        id: '480'
        action: Script
        object_path: If servicesActualCost = 0 Then
    - step:
        id: '481'
        action: Script
        object_path: emailContent = emailContent& "Services actual cost not found.
          "
    - step:
        id: '482'
        action: Script
        object_path: End If
    - step:
        id: '483'
        action: Script
        object_path: End  If
    - step:
        id: '484'
        action: Script
        object_path: '''ACTUAL PROJECT COST'
    - step:
        id: '485'
        action: Script
        object_path: '''move to transaction IW33 and open order number'
    - step:
        id: '486'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '487'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '488'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: ordNum
    - step:
        id: '489'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '490'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Costs"'
    - step:
        id: '491'
        action: Script
        object_path: systemStatus = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiEdit("Sys.Status").GetROProperty("value")
    - step:
        id: '492'
        action: Script
        object_path: '''only read table if system status = CNF or PCNF'
    - step:
        id: '493'
        action: Script
        object_path: If InStr(systemStatus,"CNF") or InStr(systemStatus,"PCNF") Then
    - step:
        id: '494'
        action: Script
        object_path: '''use functions to expand sap stree and get project actual cost'
    - step:
        id: '495'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTree("TableTreeControl")
    - step:
        id: '496'
        object_path: tree
        action: SelectNode
        args: '"Costs"'
    - step:
        id: '497'
        action: Script
        object_path: nodeKey = tree.Object.SelectedItemNode
    - step:
        id: '498'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '499'
        action: Script
        object_path: For i = 0 to columnNames.Length - 1
    - step:
        id: '500'
        action: Script
        object_path: columnName = columnNames.ElementAt(i)
    - step:
        id: '501'
        action: Script
        object_path: itemText = tree.Object.GetItemText(nodeKey, columnName)
    - step:
        id: '502'
        action: Script
        object_path: If columnName = "C          8" Then
    - step:
        id: '503'
        action: Script
        object_path: actualProjectCost = itemText
    - step:
        id: '504'
        action: Script
        object_path: If actualProjectCost = 0 Then
    - step:
        id: '505'
        action: Script
        object_path: emailContent = emailContent& "Actual Project cost not found.
          "
    - step:
        id: '506'
        action: Script
        object_path: End If
    - step:
        id: '507'
        action: Script
        object_path: Exit For
    - step:
        id: '508'
        action: Script
        object_path: End If
    - step:
        id: '509'
        action: Script
        object_path: Next
    - step:
        id: '510'
        action: Script
        object_path: Else
    - step:
        id: '511'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '512'
        action: Script
        object_path: emailContent = emailContent& "Actual Project cost not found.
          "
    - step:
        id: '513'
        action: Script
        object_path: End If
    - step:
        id: '514'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '515'
        action: Script
        object_path: '''ACTUAL LABOUR HOURS'
    - step:
        id: '516'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '517'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '518'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '519'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '520'
        action: Script
        object_path: If controlKeyValue = "INSU" Then
    - step:
        id: '521'
        action: Script
        object_path: labourHours = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Actual work")
    - step:
        id: '522'
        action: Script
        object_path: '''total labour hours'
    - step:
        id: '523'
        action: Script
        object_path: totalLabour = totalLabour + CDbl(labourHours)
    - step:
        id: '524'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable")
        action: SelectRow
        args: i
    - step:
        id: '525'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Act.
          Data")
        action: Click
    - step:
        id: '526'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Confirmations
          List")
        action: Click
    - step:
        id: '527'
        action: Script
        object_path: '''iterate through table and extract resources assigned to order
          number'
    - step:
        id: '528'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) = false Then
    - step:
        id: '529'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiElement("Confirmation
          Data").Exist(3) = False Then
    - step:
        id: '530'
        action: Script
        object_path: employeeR = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").RowCount
    - step:
        id: '531'
        action: Script
        object_path: '''set up dictionary for employee times'
    - step:
        id: '532'
        action: Script
        object_path: Set employeeTableDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '533'
        object_path: employeeTableDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '534'
        action: Script
        object_path: '''set up dictionary for employee names'
    - step:
        id: '535'
        action: Script
        object_path: Set employeeNameDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '536'
        object_path: employeeNameDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '537'
        action: Script
        object_path: '''set up array for date of time entries'
    - step:
        id: '538'
        action: Script
        object_path: DateOfTimeEntry = Array()
    - step:
        id: '539'
        action: Script
        object_path: For r = 1 To employeeR
    - step:
        id: '540'
        action: Script
        object_path: empNumber = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Personnel number")
    - step:
        id: '541'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Name of employee")
    - step:
        id: '542'
        action: Script
        object_path: empHrs = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Actual work")
    - step:
        id: '543'
        action: Script
        object_path: empHrs = CDbl(empHrs)
    - step:
        id: '544'
        action: Script
        object_path: If len(empNumber) = 5 Then
    - step:
        id: '545'
        action: Script
        object_path: empNumber = "000"&empNumber
    - step:
        id: '546'
        action: Script
        object_path: ElseIf len(empNumber) = 6 Then
    - step:
        id: '547'
        action: Script
        object_path: empNumber = "00"&empNumber
    - step:
        id: '548'
        action: Script
        object_path: Elseif len(empNumber) = 7 Then
    - step:
        id: '549'
        action: Script
        object_path: empNumber = "0"&empNumber
    - step:
        id: '550'
        action: Script
        object_path: End If
    - step:
        id: '551'
        action: Script
        object_path: '''add employee number and hours to dictionary'
    - step:
        id: '552'
        action: Script
        object_path: If empNumber <> "" and empHrs <> "" and empName = "" Then
    - step:
        id: '553'
        action: Script
        object_path: If employeeTableDict.Exists(empNumber) = false Then
    - step:
        id: '554'
        object_path: employeeTableDict
        action: Add
        args: empNumber, empHrs
    - step:
        id: '555'
        action: Script
        object_path: End If
    - step:
        id: '556'
        action: Script
        object_path: End If
    - step:
        id: '557'
        action: Script
        object_path: If empName <> "" Then
    - step:
        id: '558'
        action: Script
        object_path: If employeeNameDict.Exists(empNumber) = false Then
    - step:
        id: '559'
        object_path: employeeNameDict
        action: Add
        args: empNumber, empName
    - step:
        id: '560'
        action: Script
        object_path: End If
    - step:
        id: '561'
        action: Script
        object_path: End If
    - step:
        id: '562'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '563'
        action: Script
        object_path: '''add employee numbers into a string to be converted into an
          array'
    - step:
        id: '564'
        action: Script
        object_path: If InStr(personnelNo, empNumber) = 0 Then
    - step:
        id: '565'
        action: Script
        object_path: personnelNo = personnelNo & " " & empNumber
    - step:
        id: '566'
        action: Script
        object_path: End If
    - step:
        id: '567'
        action: Script
        object_path: '''get date of time entry'
    - step:
        id: '568'
        action: Script
        object_path: dateOfEntry = SAPGuiSession("Session").SAPGuiWindow("Display
          Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,"Actual start
          (date)")
    - step:
        id: '569'
        action: Script
        object_path: If dateOfEntry <> "" Then
    - step:
        id: '570'
        action: Script
        object_path: dateOfEntry = replace(dateOfEntry,".", "-")
    - step:
        id: '571'
        action: Script
        object_path: dateOfEntry = CDate(dateOfEntry)
    - step:
        id: '572'
        action: Script
        object_path: ReDim Preserve DateOfTimeEntry(UBound(DateOfTimeEntry) + 1)
    - step:
        id: '573'
        action: Script
        object_path: DateOfTimeEntry(UBound(DateOfTimeEntry)) = dateOfEntry
    - step:
        id: '574'
        action: Script
        object_path: End If
    - step:
        id: '575'
        action: Script
        object_path: Next
    - step:
        id: '576'
        action: Script
        object_path: '''remove white space and split string into array of employee
          numbers'
    - step:
        id: '577'
        action: Script
        object_path: personnelNo = Trim(personnelNo)
    - step:
        id: '578'
        action: Script
        object_path: If InStr(personnelNo," ") > 0 Then
    - step:
        id: '579'
        action: Script
        object_path: personnelNumber = Split(personnelNo)
    - step:
        id: '580'
        action: Script
        object_path: noEmpHoursFound = False
    - step:
        id: '581'
        action: Script
        object_path: End If
    - step:
        id: '582'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '583'
        action: Script
        object_path: '''get existing start date in p6 and time posting dates from
          sap'
    - step:
        id: '584'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable")
        action: SelectCell
        args: employeeR,"Order"
    - step:
        id: '585'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations")
        action: SendKey
        args: ENTER
    - step:
        id: '586'
        action: Script
        object_path: startDate1 = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj,1)
    - step:
        id: '587'
        action: Script
        object_path: startDate2 = Split(startDate1, " ")
    - step:
        id: '588'
        action: Script
        object_path: startDate = CDate(startDate2(0))
    - step:
        id: '589'
        action: Script
        object_path: '''sort time posting dates'
    - step:
        id: '590'
        action: Script
        object_path: BubbleSort DateOfTimeEntry
    - step:
        id: '591'
        action: Script
        object_path: '''if earliest time posting date is earlier than the p6 start
          date'
    - step:
        id: '592'
        action: Script
        object_path: If DateOfTimeEntry(0) < startDate Then
    - step:
        id: '593'
        action: Script
        object_path: If newStartDate = "" or newStartDate > DateOfTimeEntry(0) Then
    - step:
        id: '594'
        action: Script
        object_path: newStart = DateOfTimeEntry(0)
    - step:
        id: '595'
        action: Script
        object_path: dayDate = Day(newStart)
    - step:
        id: '596'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '597'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '598'
        action: Script
        object_path: End If
    - step:
        id: '599'
        action: Script
        object_path: monthDate = Month(newStart)
    - step:
        id: '600'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '601'
        action: Script
        object_path: yearDate = Year(newStart)
    - step:
        id: '602'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '603'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '604'
        action: Script
        object_path: End If
    - step:
        id: '605'
        action: Script
        object_path: Else
    - step:
        id: '606'
        action: Script
        object_path: dayDate = Day(startDate)
    - step:
        id: '607'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '608'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '609'
        action: Script
        object_path: End If
    - step:
        id: '610'
        action: Script
        object_path: monthDate = Month(startDate)
    - step:
        id: '611'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '612'
        action: Script
        object_path: yearDate = Year(startDate)
    - step:
        id: '613'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '614'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '615'
        action: Script
        object_path: End If
    - step:
        id: '616'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiButton("Back")
        action: Click
    - step:
        id: '617'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '618'
        action: Script
        object_path: Else
    - step:
        id: '619'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '620'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '621'
        action: Script
        object_path: End If
    - step:
        id: '622'
        action: Script
        object_path: Else
    - step:
        id: '623'
        action: Script
        object_path: noEmpHoursFound = true
    - step:
        id: '624'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '625'
        action: Script
        object_path: End If
    - step:
        id: '626'
        action: Script
        object_path: ElseIf controlKeyValue = "SOPL" Then
    - step:
        id: '627'
        action: Script
        object_path: labourHours = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Actual work")
    - step:
        id: '628'
        action: Script
        object_path: '''total labour hours'
    - step:
        id: '629'
        action: Script
        object_path: totalLabour = totalLabour + CDbl(labourHours)
    - step:
        id: '630'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable")
        action: SelectRow
        args: i
    - step:
        id: '631'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Act.
          Data")
        action: Click
    - step:
        id: '632'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Confirmations
          List")
        action: Click
    - step:
        id: '633'
        action: Script
        object_path: '''iterate through table and extract resources assigned to order
          number'
    - step:
        id: '634'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) = false Then
    - step:
        id: '635'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiElement("Confirmation
          Data").Exist(3) = False Then
    - step:
        id: '636'
        action: Script
        object_path: employeeR = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").RowCount
    - step:
        id: '637'
        action: Script
        object_path: '''set up dictionary for employee times'
    - step:
        id: '638'
        action: Script
        object_path: Set employeeTableDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '639'
        object_path: employeeTableDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '640'
        action: Script
        object_path: '''set up dictionary for employee names'
    - step:
        id: '641'
        action: Script
        object_path: Set employeeNameDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '642'
        object_path: employeeNameDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '643'
        action: Script
        object_path: '''set up array for date of time entries'
    - step:
        id: '644'
        action: Script
        object_path: DateOfTimeEntry = Array()
    - step:
        id: '645'
        action: Script
        object_path: For r = 1 To employeeR
    - step:
        id: '646'
        action: Script
        object_path: empNumber = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Personnel number")
    - step:
        id: '647'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Name of employee")
    - step:
        id: '648'
        action: Script
        object_path: empHrs = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Actual work")
    - step:
        id: '649'
        action: Script
        object_path: empHrs = CDbl(empHrs)
    - step:
        id: '650'
        action: Script
        object_path: If len(empNumber) = 5 Then
    - step:
        id: '651'
        action: Script
        object_path: empNumber = "000"&empNumber
    - step:
        id: '652'
        action: Script
        object_path: ElseIf len(empNumber) = 6 Then
    - step:
        id: '653'
        action: Script
        object_path: empNumber = "00"&empNumber
    - step:
        id: '654'
        action: Script
        object_path: Elseif len(empNumber) = 7 Then
    - step:
        id: '655'
        action: Script
        object_path: empNumber = "0"&empNumber
    - step:
        id: '656'
        action: Script
        object_path: End If
    - step:
        id: '657'
        action: Script
        object_path: '''add employee number and hours to dictionary'
    - step:
        id: '658'
        action: Script
        object_path: If empNumber <> "" and empHrs <> "" and empName = "" Then
    - step:
        id: '659'
        action: Script
        object_path: If employeeTableDict.Exists(empNumber) = false Then
    - step:
        id: '660'
        object_path: employeeTableDict
        action: Add
        args: empNumber, empHrs
    - step:
        id: '661'
        action: Script
        object_path: End If
    - step:
        id: '662'
        action: Script
        object_path: End If
    - step:
        id: '663'
        action: Script
        object_path: If empName <> "" Then
    - step:
        id: '664'
        action: Script
        object_path: If employeeNameDict.Exists(empNumber) = false Then
    - step:
        id: '665'
        object_path: employeeNameDict
        action: Add
        args: empNumber, empName
    - step:
        id: '666'
        action: Script
        object_path: End If
    - step:
        id: '667'
        action: Script
        object_path: End If
    - step:
        id: '668'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '669'
        action: Script
        object_path: '''add employee numbers into a string to be converted into an
          array'
    - step:
        id: '670'
        action: Script
        object_path: If InStr(personnelNo, empNumber) = 0 Then
    - step:
        id: '671'
        action: Script
        object_path: personnelNo = personnelNo & " " & empNumber
    - step:
        id: '672'
        action: Script
        object_path: End If
    - step:
        id: '673'
        action: Script
        object_path: '''get date of time entry'
    - step:
        id: '674'
        action: Script
        object_path: dateOfEntry = SAPGuiSession("Session").SAPGuiWindow("Display
          Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,"Actual start
          (date)")
    - step:
        id: '675'
        action: Script
        object_path: If dateOfEntry <> "" Then
    - step:
        id: '676'
        action: Script
        object_path: dateOfEntry = replace(dateOfEntry,".", "-")
    - step:
        id: '677'
        action: Script
        object_path: dateOfEntry = CDate(dateOfEntry)
    - step:
        id: '678'
        action: Script
        object_path: ReDim Preserve DateOfTimeEntry(UBound(DateOfTimeEntry) + 1)
    - step:
        id: '679'
        action: Script
        object_path: DateOfTimeEntry(UBound(DateOfTimeEntry)) = dateOfEntry
    - step:
        id: '680'
        action: Script
        object_path: End If
    - step:
        id: '681'
        action: Script
        object_path: Next
    - step:
        id: '682'
        action: Script
        object_path: '''remove white space and split string into array of employee
          numbers'
    - step:
        id: '683'
        action: Script
        object_path: personnelNo = Trim(personnelNo)
    - step:
        id: '684'
        action: Script
        object_path: If InStr(personnelNo," ") > 0 Then
    - step:
        id: '685'
        action: Script
        object_path: personnelNumber = Split(personnelNo)
    - step:
        id: '686'
        action: Script
        object_path: noEmpHoursFound = False
    - step:
        id: '687'
        action: Script
        object_path: End If
    - step:
        id: '688'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '689'
        action: Script
        object_path: '''get existing start date in p6 and time posting dates from
          sap'
    - step:
        id: '690'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable")
        action: SelectCell
        args: employeeR,"Order"
    - step:
        id: '691'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations")
        action: SendKey
        args: ENTER
    - step:
        id: '692'
        action: Script
        object_path: startDate1 = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj,1)
    - step:
        id: '693'
        action: Script
        object_path: startDate2 = Split(startDate1, " ")
    - step:
        id: '694'
        action: Script
        object_path: startDate = CDate(startDate2(0))
    - step:
        id: '695'
        action: Script
        object_path: '''sort time posting dates'
    - step:
        id: '696'
        action: Script
        object_path: BubbleSort DateOfTimeEntry
    - step:
        id: '697'
        action: Script
        object_path: '''if earliest time posting date is earlier than the p6 start
          date'
    - step:
        id: '698'
        action: Script
        object_path: If DateOfTimeEntry(0) < startDate Then
    - step:
        id: '699'
        action: Script
        object_path: If newStartDate = "" or newStartDate > DateOfTimeEntry(0) Then
    - step:
        id: '700'
        action: Script
        object_path: newStart = DateOfTimeEntry(0)
    - step:
        id: '701'
        action: Script
        object_path: dayDate = Day(newStart)
    - step:
        id: '702'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '703'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '704'
        action: Script
        object_path: End If
    - step:
        id: '705'
        action: Script
        object_path: monthDate = Month(newStart)
    - step:
        id: '706'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '707'
        action: Script
        object_path: yearDate = Year(newStart)
    - step:
        id: '708'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '709'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '710'
        action: Script
        object_path: End If
    - step:
        id: '711'
        action: Script
        object_path: Else
    - step:
        id: '712'
        action: Script
        object_path: dayDate = Day(startDate)
    - step:
        id: '713'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '714'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '715'
        action: Script
        object_path: End If
    - step:
        id: '716'
        action: Script
        object_path: monthDate = Month(startDate)
    - step:
        id: '717'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '718'
        action: Script
        object_path: yearDate = Year(startDate)
    - step:
        id: '719'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '720'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '721'
        action: Script
        object_path: End If
    - step:
        id: '722'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiButton("Back")
        action: Click
    - step:
        id: '723'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '724'
        action: Script
        object_path: Else
    - step:
        id: '725'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '726'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '727'
        action: Script
        object_path: End If
    - step:
        id: '728'
        action: Script
        object_path: Else
    - step:
        id: '729'
        action: Script
        object_path: noEmpHoursFound = true
    - step:
        id: '730'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '731'
        action: Script
        object_path: End If
    - step:
        id: '732'
        action: Script
        object_path: End  If
    - step:
        id: '733'
        action: Script
        object_path: Else
    - step:
        id: '734'
        action: Script
        object_path: Exit For
    - step:
        id: '735'
        action: Script
        object_path: End  If
    - step:
        id: '736'
        action: Script
        object_path: Next
    - step:
        id: '737'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '738'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) Then
    - step:
        id: '739'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '740'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '741'
        action: Script
        object_path: Else
    - step:
        id: '742'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '743'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '744'
        action: Script
        object_path: End If
    - step:
        id: '745'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '746'
        action: Script
        object_path: '''**********************************************************************SAP
          ENDS HERE******************************************************************************************************'
    - step:
        id: '747'
        action: Script
        object_path: '''only enter actual data if activity status is not Not Started'
    - step:
        id: '748'
        action: Script
        object_path: If orderStatus <> "Not Started" Then
    - step:
        id: '749'
        action: Script
        object_path: '''input actual project budget'
    - step:
        id: '750'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '751'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails")
        action: Highlight
    - step:
        id: '752'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,8,"WebElement",0)
        action: DoubleClick
    - step:
        id: '753'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '754'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: actualProjectCost
    - step:
        id: '755'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '756'
        action: Script
        object_path: '''input actual labour hours'
    - step:
        id: '757'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,10,"WebElement",0)
        action: DoubleClick
    - step:
        id: '758'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '759'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: totalLabour
    - step:
        id: '760'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '761'
        action: Script
        object_path: '''update start date'
    - step:
        id: '762'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,
          1, "WebElement", 0)
        action: DoubleClick
    - step:
        id: '763'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '764'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: newStartDate
    - step:
        id: '765'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '766'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '767'
        action: Script
        object_path: '''save'
    - step:
        id: '768'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '769'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '770'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '771'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '772'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '773'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '774'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '775'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '776'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '777'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '778'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '779'
        action: Script
        object_path: End If
    - step:
        id: '780'
        action: Script
        object_path: End If
    - step:
        id: '781'
        action: Script
        object_path: '''expand bottom dock'
    - step:
        id: '782'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '783'
        action: Script
        object_path: If ExpandCollapseDock = "Expand Dock" Then
    - step:
        id: '784'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '785'
        action: Script
        object_path: End If
    - step:
        id: '786'
        action: Script
        object_path: ''' Open Assignments tab, if enabled and visible'
    - step:
        id: '787'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").Link("Assignments").Object.disabled = false Then
    - step:
        id: '788'
        action: Script
        object_path: assignmentVis = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("Assignments").GetROProperty("visible")
    - step:
        id: '789'
        action: Script
        object_path: If assignmentVis = True Then
    - step:
        id: '790'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments")
        action: Click
    - step:
        id: '791'
        action: Script
        object_path: '''use functions to add resources and input extractions into
          p6'
    - step:
        id: '792'
        action: Script
        object_path: Call AddLabourResource(labourActualCost)
    - step:
        id: '793'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '794'
        action: Script
        object_path: Call AddMaterialResource(materialActualCost)
    - step:
        id: '795'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '796'
        action: Script
        object_path: Call AddServicesResource(servicesActualCost)
    - step:
        id: '797'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '798'
        action: Script
        object_path: If noEmpHoursFound = true Then
    - step:
        id: '799'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '800'
        action: Script
        object_path: ElseIf noEmpHoursFound = false Then
    - step:
        id: '801'
        action: Script
        object_path: For Each perNumber in personnelNumber
    - step:
        id: '802'
        action: Script
        object_path: employeeHours = employeeTableDict.Item(perNumber)
    - step:
        id: '803'
        action: Script
        object_path: Call AddEmployeeResource(perNumber, employeeHours)
    - step:
        id: '804'
        action: Script
        object_path: Next
    - step:
        id: '805'
        action: Script
        object_path: End If
    - step:
        id: '806'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf Browser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Object.disabled = false\
          \ Then"
    - step:
        id: '807'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tsaveVis = Browser(\"Oracle Primavera P6 EPPM\"\
          ).Page(\"Primavera P6 - Activities\").WebButton(\"Save\").GetROProperty(\"\
          visible\")"
    - step:
        id: '808'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tIf saveVis = True Then"
    - step:
        id: '809'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tBrowser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Click"
    - step:
        id: '810'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '811'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tSet mySendKeys = CreateObject(\"WScript.Shell\"\
          )"
    - step:
        id: '812'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tmySendKeys.SendKeys \"{F5}\""
    - step:
        id: '813'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tSet mySendKeys = NOTHING"
    - step:
        id: '814'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '815'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tEnd If"
    - step:
        id: '816'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '817'
        action: Script
        object_path: Else
    - step:
        id: '818'
        action: Script
        object_path: 'emailContent = emailContent& "Assignments tab not visible: Activity
          Type is not Level of Effort. "'
    - step:
        id: '819'
        action: Script
        object_path: End If
    - step:
        id: '820'
        action: Script
        object_path: End If
    - step:
        id: '821'
        action: Script
        object_path: '''collapse bottom dock'
    - step:
        id: '822'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '823'
        action: Script
        object_path: If ExpandCollapseDock = "Collapse Dock" Then
    - step:
        id: '824'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '825'
        action: Script
        object_path: End If
    - step:
        id: '826'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '827'
        action: Script
        object_path: End If
    - step:
        id: '828'
        action: Script
        object_path: If orderStatus = "Not Started" and (actualProjectCost <> 0 or
          labourActualCost <> 0 or materialActualCost <> 0 or servicesActualCost <>
          0 or totalLabour <> 0) Then
    - step:
        id: '829'
        action: Script
        object_path: 'emailContent = "Activity Status is set to Not Started however
          actual values have been found: Project actual cost: $" & actualProjectCost
          & ", Labour actual cost: $" &labourActualCost &", actual Material cost:
          $" &materialActualCost &", Services actual cost: $" &servicesActualCost&",
          Labour total hours: "&totalLabour &"."'
    - step:
        id: '830'
        action: Script
        object_path: End If
    - step:
        id: '831'
        action: Script
        object_path: '''send email to team about project data'
    - step:
        id: '832'
        action: Script
        object_path: If emailContent = Empty Then
    - step:
        id: '833'
        action: Script
        object_path: emailContent = "No issues found."
    - step:
        id: '834'
        action: Script
        object_path: End If
    - step:
        id: '835'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '836'
        object_path: MyEmail
        action: Subject
        args: = "Project "&projNum&" Actual Values Automation Update"
    - step:
        id: '837'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '838'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '839'
        object_path: MyEmail
        action: TextBody
        args: '= "PROJECT "&projNum&" ORDER "&ordNum&": "&vbNewLine&"COMMENTS: "&emailContent'
    - step:
        id: '840'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '841'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '842'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '843'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '844'
        object_path: MyEmail
        action: Send
    - step:
        id: '845'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '846'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '847'
        action: Script
        object_path: '''scroll up and down again to reposition table correctly'
    - step:
        id: '848'
        action: Script
        object_path: Call ScrollTablePosition(counter,actDetailsRow)
    - step:
        id: '849'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '850'
        action: Script
        object_path: contents = "$" & actualProjectCost & "," & totalLabour & "hrs,$"
          & labourActualCost & ",$" & materialActualCost & ",$" & servicesActualCost
    - step:
        id: '851'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '852'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '853'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '854'
        object_path: f
        action: Close
    - step:
        id: '855'
        action: Script
        object_path: Else
    - step:
        id: '856'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '857'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '858'
        object_path: textFile
        action: Close
    - step:
        id: '859'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '860'
        action: Script
        object_path: End If
    - step:
        id: '861'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '862'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '863'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '864'
        action: Script
        object_path: '''add to string of completed projects'
    - step:
        id: '865'
        action: Script
        object_path: updatedProjects = updatedProjects & "," & projNum
    - step:
        id: '866'
        action: Script
        object_path: End If
    - step:
        id: '867'
        action: Script
        object_path: Next
    - step:
        id: '868'
        action: Script
        object_path: Exit For
    - step:
        id: '869'
        action: Script
        object_path: Else
    - step:
        id: '870'
        action: Script
        object_path: If j = 2 And counter > 3 Then
    - step:
        id: '871'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '872'
        action: Script
        object_path: divisor = actDetailsRow
    - step:
        id: '873'
        action: Script
        object_path: pgdnValue = Int(cnt/divisor)
    - step:
        id: '874'
        action: Script
        object_path: '''Print "pgdnValue from line 285: " & pgdnValue'
    - step:
        id: '875'
        action: Script
        object_path: '''Print "Divisor: " & divisor'
    - step:
        id: '876'
        action: Script
        object_path: '''print "Counter: " & counter'
    - step:
        id: '877'
        action: Script
        object_path: '''print "cnt: " & cnt'
    - step:
        id: '878'
        action: Script
        object_path: divisor = EMPTY
    - step:
        id: '879'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '880'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '881'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '882'
        action: Script
        object_path: For t = 1 To pgdnValue - 1
    - step:
        id: '883'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '884'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '885'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '886'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '887'
        action: Script
        object_path: Next
    - step:
        id: '888'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '889'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(actDetailsRow,
          7)
    - step:
        id: '890'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(actDetailsRow,
          6)
    - step:
        id: '891'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '892'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '893'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '894'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '895'
        action: Script
        object_path: Else
    - step:
        id: '896'
        action: Script
        object_path: If j <> 1 And Flag = True Then
    - step:
        id: '897'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '898'
        action: Script
        object_path: divisor = actDetailsRow
    - step:
        id: '899'
        action: Script
        object_path: If noScroll Then
    - step:
        id: '900'
        action: Script
        object_path: pgdnValue = Int(cnt/divisor)
    - step:
        id: '901'
        action: Script
        object_path: End If
    - step:
        id: '902'
        action: Script
        object_path: divisor = EMPTY
    - step:
        id: '903'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '904'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '905'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '906'
        action: Script
        object_path: If counter <= actDetailsRow And noScroll Then
    - step:
        id: '907'
        action: Script
        object_path: pgdnValue = pgdnValue - 1
    - step:
        id: '908'
        action: Script
        object_path: End If
    - step:
        id: '909'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '910'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '911'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '912'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '913'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '914'
        action: Script
        object_path: Next
    - step:
        id: '915'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 7)
    - step:
        id: '916'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 6)
    - step:
        id: '917'
        action: Script
        object_path: Flag = False
    - step:
        id: '918'
        action: Script
        object_path: ElseIf j<> 1 Then
    - step:
        id: '919'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 7)
    - step:
        id: '920'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 6)
    - step:
        id: '921'
        action: Script
        object_path: End If
    - step:
        id: '922'
        action: Script
        object_path: End If
    - step:
        id: '923'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '924'
        action: Script
        object_path: If j <> 1 and Not(projNumCheck =  projNum And ordNumCheck = ordNum)
          Then
    - step:
        id: '925'
        object_path: Reporter
        action: ReportEvent
        args: 'micFail, "Checking previous row is having correct Project Number: "
          & projNum & " and Order Number: " & ordNum,"Didn''t find the match; hence
          exiting this execution"'
    - step:
        id: '926'
        object_path: Reporter
        action: ReportEvent
        args: 'micWarning, "Found previous Record has got Project Number: " & projNumCheck
          & " and Order Number: " & ordNumCheck,"Not pointing to correct row in the
          activity table"'
    - step:
        id: '927'
        action: Script
        object_path: '''send email to team'
    - step:
        id: '928'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '929'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '930'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '931'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,DL_ITAutomationteam@sapowernetworks.com.au"
    - step:
        id: '932'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Previous row check failed, test exited. Expected: "&projNumCheck&"
          "&ordNumCheck&", Actual: "&projNum&" "&ordNum'
    - step:
        id: '933'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '934'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '935'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '936'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '937'
        object_path: MyEmail
        action: Send
    - step:
        id: '938'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '939'
        action: Script
        object_path: ExitTest
    - step:
        id: '940'
        action: Script
        object_path: End If
    - step:
        id: '941'
        action: Script
        object_path: '''Print "Project_Prev: " & projNumCheck'
    - step:
        id: '942'
        action: Script
        object_path: '''Print "Order_Prev: " & ordNumCheck'
    - step:
        id: '943'
        action: Script
        object_path: projNumCheck = EMPTY
    - step:
        id: '944'
        action: Script
        object_path: ordNumCheck = EMPTY
    - step:
        id: '945'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '946'
        action: Script
        object_path: projNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 7)
    - step:
        id: '947'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 6)
    - step:
        id: '948'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '949'
        action: Script
        object_path: '''Print "J: " & j'
    - step:
        id: '950'
        action: Script
        object_path: '''Print "Project: " & projNum'
    - step:
        id: '951'
        action: Script
        object_path: '''Print "Order: " & ordNum'
    - step:
        id: '952'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '953'
        action: Script
        object_path: contents = j & "," & projNum & "," & ordNum
    - step:
        id: '954'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '955'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '956'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '957'
        object_path: f
        action: Close
    - step:
        id: '958'
        action: Script
        object_path: Else
    - step:
        id: '959'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '960'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '961'
        object_path: textFile
        action: Close
    - step:
        id: '962'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '963'
        action: Script
        object_path: End If
    - step:
        id: '964'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '965'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '966'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '967'
        action: Script
        object_path: If inStr(ordNum,",") Then
    - step:
        id: '968'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '969'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '970'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '971'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,"
    - step:
        id: '972'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Multiple order numbers found in single row for Project
          "&projNum&" Order: "&ordNum'
    - step:
        id: '973'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '974'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '975'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '976'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '977'
        object_path: MyEmail
        action: Send
    - step:
        id: '978'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '979'
        action: Script
        object_path: ElseIf projNum <> "" and len(ordNum) <> 9 Then
    - step:
        id: '980'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '981'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '982'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '983'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '984'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Incomplete order number found for Project "&projNum&" Order:
          "&ordNum'
    - step:
        id: '985'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '986'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '987'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '988'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '989'
        object_path: MyEmail
        action: Send
    - step:
        id: '990'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '991'
        action: Script
        object_path: ElseIf projNum <> "" Then
    - step:
        id: '992'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '993'
        action: Script
        object_path: labourActualCost = 0
    - step:
        id: '994'
        action: Script
        object_path: labourActualCost = CDbl(labourActualCost)
    - step:
        id: '995'
        action: Script
        object_path: materialActualCost = 0
    - step:
        id: '996'
        action: Script
        object_path: materialActualCost = CDbl(materialActualCost)
    - step:
        id: '997'
        action: Script
        object_path: servicesActualCost = 0
    - step:
        id: '998'
        action: Script
        object_path: servicesActualCost = CDbl(servicesActualCost)
    - step:
        id: '999'
        action: Script
        object_path: totalLabour = 0
    - step:
        id: '1000'
        action: Script
        object_path: totalLabour = CDbl(totalLabour)
    - step:
        id: '1001'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1002'
        action: Script
        object_path: Flag = True
    - step:
        id: '1003'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(j, 6, "WebElement",
          0)
    - step:
        id: '1004'
        object_path: rowObj
        action: Click
    - step:
        id: '1005'
        action: Script
        object_path: orderStatus = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 12)
    - step:
        id: '1006'
        action: Script
        object_path: '''**********************************************************************SAP
          STARTS HERE******************************************************************************************************'
    - step:
        id: '1007'
        action: Script
        object_path: '''GET FULL WBS ELEMENT'
    - step:
        id: '1008'
        action: Script
        object_path: '''go to transaction S_ALR_87013534, set up form, and open project
          number'
    - step:
        id: '1009'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '1010'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '1011'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '1012'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '1013'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1014'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(3) Then
    - step:
        id: '1015'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '1016'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '1017'
        action: Script
        object_path: End If
    - step:
        id: '1018'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '1019'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '1020'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '1021'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1022'
        action: Script
        object_path: End If
    - step:
        id: '1023'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '1024'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projNum
    - step:
        id: '1025'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '1026'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '1027'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '1028'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '1029'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1030'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '1031'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projNum,"PRJ "&projNum'
    - step:
        id: '1032'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '1033'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projNum'
    - step:
        id: '1034'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '1035'
        action: Script
        object_path: rowContainingOrdNum = findBudget(tree, ordNum)
    - step:
        id: '1036'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '1037'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '1038'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '1039'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '1040'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '1041'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project actual cost, Labour actual cost, Material actual
          cost or Services actual cost could not be extracted). "
    - step:
        id: '1042'
        action: Script
        object_path: Else
    - step:
        id: '1043'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '1044'
        action: Script
        object_path: End If
    - step:
        id: '1045'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1046'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '1047'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '1048'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(3) Then
    - step:
        id: '1049'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '1050'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '1051'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1052'
        action: Script
        object_path: End If
    - step:
        id: '1053'
        action: Script
        object_path: If WBSelement <> "" Then
    - step:
        id: '1054'
        action: Script
        object_path: '''ACTUAL LABOUR, MATERIALS AND SERVICES $'
    - step:
        id: '1055'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '1056'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '1057'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '1058'
        action: Script
        object_path: planVersion = GetPlanVersion
    - step:
        id: '1059'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '1060'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '1061'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '1062'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '1063'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '1064'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '1065'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '1066'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '1067'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1068'
        action: Script
        object_path: Else
    - step:
        id: '1069'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '1070'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '1071'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '1072'
        action: Script
        object_path: Found = 0
    - step:
        id: '1073'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '1074'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '1075'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '1076'
        action: Script
        object_path: Found = 1
    - step:
        id: '1077'
        action: Script
        object_path: Exit For
    - step:
        id: '1078'
        action: Script
        object_path: End if
    - step:
        id: '1079'
        action: Script
        object_path: Next
    - step:
        id: '1080'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '1081'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '1082'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '1083'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '1084'
        action: Script
        object_path: LactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '1085'
        action: Script
        object_path: LactualCost = CDbl(LactualCost)
    - step:
        id: '1086'
        action: Script
        object_path: labourActualCost = labourActualCost + LactualCost
    - step:
        id: '1087'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1088'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1089'
        action: Script
        object_path: Else
    - step:
        id: '1090'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1091'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1092'
        action: Script
        object_path: End  If
    - step:
        id: '1093'
        action: Script
        object_path: End  If
    - step:
        id: '1094'
        action: Script
        object_path: Next
    - step:
        id: '1095'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '1096'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '1097'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '1098'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '1099'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '1100'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '1101'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '1102'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1103'
        action: Script
        object_path: Else
    - step:
        id: '1104'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '1105'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '1106'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '1107'
        action: Script
        object_path: Found = 0
    - step:
        id: '1108'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '1109'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '1110'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '1111'
        action: Script
        object_path: Found = 1
    - step:
        id: '1112'
        action: Script
        object_path: Exit For
    - step:
        id: '1113'
        action: Script
        object_path: End if
    - step:
        id: '1114'
        action: Script
        object_path: Next
    - step:
        id: '1115'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '1116'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '1117'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '1118'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '1119'
        action: Script
        object_path: MactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '1120'
        action: Script
        object_path: MactualCost = CDbl(MactualCost)
    - step:
        id: '1121'
        action: Script
        object_path: materialActualCost = materialActualCost + MactualCost
    - step:
        id: '1122'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1123'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1124'
        action: Script
        object_path: Else
    - step:
        id: '1125'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1126'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1127'
        action: Script
        object_path: End If
    - step:
        id: '1128'
        action: Script
        object_path: End If
    - step:
        id: '1129'
        action: Script
        object_path: Next
    - step:
        id: '1130'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '1131'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '1132'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '1133'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '1134'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '1135'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '1136'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '1137'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1138'
        action: Script
        object_path: Else
    - step:
        id: '1139'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '1140'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '1141'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '1142'
        action: Script
        object_path: Found = 0
    - step:
        id: '1143'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '1144'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '1145'
        action: Script
        object_path: If NodeText = ("ORD "&ordNum) Then
    - step:
        id: '1146'
        action: Script
        object_path: Found = 1
    - step:
        id: '1147'
        action: Script
        object_path: Exit For
    - step:
        id: '1148'
        action: Script
        object_path: End if
    - step:
        id: '1149'
        action: Script
        object_path: Next
    - step:
        id: '1150'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '1151'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '1152'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '1153'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '1154'
        action: Script
        object_path: SactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '1155'
        action: Script
        object_path: SactualCost = CDbl(SactualCost)
    - step:
        id: '1156'
        action: Script
        object_path: servicesActualCost = servicesActualCost + SactualCost
    - step:
        id: '1157'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1158'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1159'
        action: Script
        object_path: Else
    - step:
        id: '1160'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '1161'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '1162'
        action: Script
        object_path: End  If
    - step:
        id: '1163'
        action: Script
        object_path: End  If
    - step:
        id: '1164'
        action: Script
        object_path: Next
    - step:
        id: '1165'
        action: Script
        object_path: If labourActualCost = 0 Then
    - step:
        id: '1166'
        action: Script
        object_path: emailContent = emailContent& "Labour actual cost not found. "
    - step:
        id: '1167'
        action: Script
        object_path: End If
    - step:
        id: '1168'
        action: Script
        object_path: If materialActualCost = 0 Then
    - step:
        id: '1169'
        action: Script
        object_path: emailContent = emailContent& "Material actual cost not found.
          "
    - step:
        id: '1170'
        action: Script
        object_path: End If
    - step:
        id: '1171'
        action: Script
        object_path: If servicesActualCost = 0 Then
    - step:
        id: '1172'
        action: Script
        object_path: emailContent = emailContent& "Services actual cost not found.
          "
    - step:
        id: '1173'
        action: Script
        object_path: End If
    - step:
        id: '1174'
        action: Script
        object_path: End  If
    - step:
        id: '1175'
        action: Script
        object_path: '''ACTUAL PROJECT COST'
    - step:
        id: '1176'
        action: Script
        object_path: '''move to transaction IW33 and open order number'
    - step:
        id: '1177'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '1178'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '1179'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: ordNum
    - step:
        id: '1180'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '1181'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Costs"'
    - step:
        id: '1182'
        action: Script
        object_path: systemStatus = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiEdit("Sys.Status").GetROProperty("value")
    - step:
        id: '1183'
        action: Script
        object_path: '''only read table if system status = CNF or PCNF'
    - step:
        id: '1184'
        action: Script
        object_path: If InStr(systemStatus,"CNF") or InStr(systemStatus,"PCNF") Then
    - step:
        id: '1185'
        action: Script
        object_path: '''use functions to expand sap stree and get project actual cost'
    - step:
        id: '1186'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTree("TableTreeControl")
    - step:
        id: '1187'
        object_path: tree
        action: SelectNode
        args: '"Costs"'
    - step:
        id: '1188'
        action: Script
        object_path: nodeKey = tree.Object.SelectedItemNode
    - step:
        id: '1189'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '1190'
        action: Script
        object_path: For i = 0 to columnNames.Length - 1
    - step:
        id: '1191'
        action: Script
        object_path: columnName = columnNames.ElementAt(i)
    - step:
        id: '1192'
        action: Script
        object_path: itemText = tree.Object.GetItemText(nodeKey, columnName)
    - step:
        id: '1193'
        action: Script
        object_path: If columnName = "C          8" Then
    - step:
        id: '1194'
        action: Script
        object_path: actualProjectCost = itemText
    - step:
        id: '1195'
        action: Script
        object_path: If actualProjectCost = 0 Then
    - step:
        id: '1196'
        action: Script
        object_path: emailContent = emailContent& "Actual Project cost not found.
          "
    - step:
        id: '1197'
        action: Script
        object_path: End If
    - step:
        id: '1198'
        action: Script
        object_path: Exit For
    - step:
        id: '1199'
        action: Script
        object_path: End If
    - step:
        id: '1200'
        action: Script
        object_path: Next
    - step:
        id: '1201'
        action: Script
        object_path: Else
    - step:
        id: '1202'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '1203'
        action: Script
        object_path: emailContent = emailContent& "Actual Project cost not found.
          "
    - step:
        id: '1204'
        action: Script
        object_path: End If
    - step:
        id: '1205'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '1206'
        action: Script
        object_path: '''ACTUAL LABOUR HOURS'
    - step:
        id: '1207'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '1208'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '1209'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '1210'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '1211'
        action: Script
        object_path: If controlKeyValue = "INSU" Then
    - step:
        id: '1212'
        action: Script
        object_path: labourHours = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Actual work")
    - step:
        id: '1213'
        action: Script
        object_path: '''total labour hours'
    - step:
        id: '1214'
        action: Script
        object_path: totalLabour = totalLabour + CDbl(labourHours)
    - step:
        id: '1215'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable")
        action: SelectRow
        args: i
    - step:
        id: '1216'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Act.
          Data")
        action: Click
    - step:
        id: '1217'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Confirmations
          List")
        action: Click
    - step:
        id: '1218'
        action: Script
        object_path: '''iterate through table and extract resources assigned to order
          number'
    - step:
        id: '1219'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) = false Then
    - step:
        id: '1220'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiElement("Confirmation
          Data").Exist(3) = False Then
    - step:
        id: '1221'
        action: Script
        object_path: employeeR = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").RowCount
    - step:
        id: '1222'
        action: Script
        object_path: '''set up dictionary for employee times'
    - step:
        id: '1223'
        action: Script
        object_path: Set employeeTableDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '1224'
        object_path: employeeTableDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '1225'
        action: Script
        object_path: '''set up dictionary for employee names'
    - step:
        id: '1226'
        action: Script
        object_path: Set employeeNameDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '1227'
        object_path: employeeNameDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '1228'
        action: Script
        object_path: '''set up array for date of time entries'
    - step:
        id: '1229'
        action: Script
        object_path: DateOfTimeEntry = Array()
    - step:
        id: '1230'
        action: Script
        object_path: For r = 1 To employeeR
    - step:
        id: '1231'
        action: Script
        object_path: empNumber = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Personnel number")
    - step:
        id: '1232'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Name of employee")
    - step:
        id: '1233'
        action: Script
        object_path: empHrs = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Actual work")
    - step:
        id: '1234'
        action: Script
        object_path: empHrs = CDbl(empHrs)
    - step:
        id: '1235'
        action: Script
        object_path: If len(empNumber) = 5 Then
    - step:
        id: '1236'
        action: Script
        object_path: empNumber = "000"&empNumber
    - step:
        id: '1237'
        action: Script
        object_path: ElseIf len(empNumber) = 6 Then
    - step:
        id: '1238'
        action: Script
        object_path: empNumber = "00"&empNumber
    - step:
        id: '1239'
        action: Script
        object_path: Elseif len(empNumber) = 7 Then
    - step:
        id: '1240'
        action: Script
        object_path: empNumber = "0"&empNumber
    - step:
        id: '1241'
        action: Script
        object_path: End If
    - step:
        id: '1242'
        action: Script
        object_path: '''add employee number and hours to dictionary'
    - step:
        id: '1243'
        action: Script
        object_path: If empNumber <> "" and empHrs <> "" and empName = "" Then
    - step:
        id: '1244'
        action: Script
        object_path: If employeeTableDict.Exists(empNumber) = false Then
    - step:
        id: '1245'
        object_path: employeeTableDict
        action: Add
        args: empNumber, empHrs
    - step:
        id: '1246'
        action: Script
        object_path: End If
    - step:
        id: '1247'
        action: Script
        object_path: End If
    - step:
        id: '1248'
        action: Script
        object_path: If empName <> "" Then
    - step:
        id: '1249'
        action: Script
        object_path: If employeeNameDict.Exists(empNumber) = false Then
    - step:
        id: '1250'
        object_path: employeeNameDict
        action: Add
        args: empNumber, empName
    - step:
        id: '1251'
        action: Script
        object_path: End If
    - step:
        id: '1252'
        action: Script
        object_path: End If
    - step:
        id: '1253'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1254'
        action: Script
        object_path: '''add employee numbers into a string to be converted into an
          array'
    - step:
        id: '1255'
        action: Script
        object_path: If InStr(personnelNo, empNumber) = 0 Then
    - step:
        id: '1256'
        action: Script
        object_path: personnelNo = personnelNo & " " & empNumber
    - step:
        id: '1257'
        action: Script
        object_path: End If
    - step:
        id: '1258'
        action: Script
        object_path: '''get date of time entry'
    - step:
        id: '1259'
        action: Script
        object_path: dateOfEntry = SAPGuiSession("Session").SAPGuiWindow("Display
          Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,"Actual start
          (date)")
    - step:
        id: '1260'
        action: Script
        object_path: If dateOfEntry <> "" Then
    - step:
        id: '1261'
        action: Script
        object_path: dateOfEntry = replace(dateOfEntry,".", "-")
    - step:
        id: '1262'
        action: Script
        object_path: dateOfEntry = CDate(dateOfEntry)
    - step:
        id: '1263'
        action: Script
        object_path: ReDim Preserve DateOfTimeEntry(UBound(DateOfTimeEntry) + 1)
    - step:
        id: '1264'
        action: Script
        object_path: DateOfTimeEntry(UBound(DateOfTimeEntry)) = dateOfEntry
    - step:
        id: '1265'
        action: Script
        object_path: End If
    - step:
        id: '1266'
        action: Script
        object_path: Next
    - step:
        id: '1267'
        action: Script
        object_path: '''remove white space and split string into array of employee
          numbers'
    - step:
        id: '1268'
        action: Script
        object_path: personnelNo = Trim(personnelNo)
    - step:
        id: '1269'
        action: Script
        object_path: personnelNumber = Split(personnelNo)
    - step:
        id: '1270'
        action: Script
        object_path: noEmpHoursFound = False
    - step:
        id: '1271'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1272'
        action: Script
        object_path: '''get existing start date in p6 and time posting dates from
          sap'
    - step:
        id: '1273'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable")
        action: SelectCell
        args: employeeR,"Order"
    - step:
        id: '1274'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations")
        action: SendKey
        args: ENTER
    - step:
        id: '1275'
        action: Script
        object_path: startDate1 = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j,1)
    - step:
        id: '1276'
        action: Script
        object_path: startDate2 = Split(startDate1, " ")
    - step:
        id: '1277'
        action: Script
        object_path: startDate = CDate(startDate2(0))
    - step:
        id: '1278'
        action: Script
        object_path: '''sort time posting dates'
    - step:
        id: '1279'
        action: Script
        object_path: BubbleSort DateOfTimeEntry
    - step:
        id: '1280'
        action: Script
        object_path: '''if earliest time posting date is earlier than the p6 start
          date'
    - step:
        id: '1281'
        action: Script
        object_path: If DateOfTimeEntry(0) < startDate Then
    - step:
        id: '1282'
        action: Script
        object_path: If newStartDate = "" or newStartDate > DateOfTimeEntry(0) Then
    - step:
        id: '1283'
        action: Script
        object_path: newStart = DateOfTimeEntry(0)
    - step:
        id: '1284'
        action: Script
        object_path: dayDate = Day(newStart)
    - step:
        id: '1285'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '1286'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '1287'
        action: Script
        object_path: End If
    - step:
        id: '1288'
        action: Script
        object_path: monthDate = Month(newStart)
    - step:
        id: '1289'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '1290'
        action: Script
        object_path: yearDate = Year(newStart)
    - step:
        id: '1291'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '1292'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '1293'
        action: Script
        object_path: End If
    - step:
        id: '1294'
        action: Script
        object_path: Else
    - step:
        id: '1295'
        action: Script
        object_path: dayDate = Day(startDate)
    - step:
        id: '1296'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '1297'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '1298'
        action: Script
        object_path: End If
    - step:
        id: '1299'
        action: Script
        object_path: monthDate = Month(startDate)
    - step:
        id: '1300'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '1301'
        action: Script
        object_path: yearDate = Year(startDate)
    - step:
        id: '1302'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '1303'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '1304'
        action: Script
        object_path: End If
    - step:
        id: '1305'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1306'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1307'
        action: Script
        object_path: Else
    - step:
        id: '1308'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1309'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1310'
        action: Script
        object_path: End If
    - step:
        id: '1311'
        action: Script
        object_path: Else
    - step:
        id: '1312'
        action: Script
        object_path: noEmpHoursFound = true
    - step:
        id: '1313'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1314'
        action: Script
        object_path: End If
    - step:
        id: '1315'
        action: Script
        object_path: ElseIf controlKeyValue = "SOPL" Then
    - step:
        id: '1316'
        action: Script
        object_path: labourHours = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Actual work")
    - step:
        id: '1317'
        action: Script
        object_path: '''total labour hours'
    - step:
        id: '1318'
        action: Script
        object_path: totalLabour = totalLabour + CDbl(labourHours)
    - step:
        id: '1319'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable")
        action: SelectRow
        args: i
    - step:
        id: '1320'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Act.
          Data")
        action: Click
    - step:
        id: '1321'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Confirmations
          List")
        action: Click
    - step:
        id: '1322'
        action: Script
        object_path: '''iterate through table and extract resources assigned to order
          number'
    - step:
        id: '1323'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) = false Then
    - step:
        id: '1324'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiElement("Confirmation
          Data").Exist(3) = False Then
    - step:
        id: '1325'
        action: Script
        object_path: employeeR = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").RowCount
    - step:
        id: '1326'
        action: Script
        object_path: '''set up dictionary for employee times'
    - step:
        id: '1327'
        action: Script
        object_path: Set employeeTableDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '1328'
        object_path: employeeTableDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '1329'
        action: Script
        object_path: '''set up dictionary for employee names'
    - step:
        id: '1330'
        action: Script
        object_path: Set employeeNameDict = CreateObject("Scripting.Dictionary")
    - step:
        id: '1331'
        object_path: employeeNameDict
        action: CompareMode
        args: = vbTextCompare
    - step:
        id: '1332'
        action: Script
        object_path: '''set up array for date of time entries'
    - step:
        id: '1333'
        action: Script
        object_path: DateOfTimeEntry = Array()
    - step:
        id: '1334'
        action: Script
        object_path: For r = 1 To employeeR
    - step:
        id: '1335'
        action: Script
        object_path: empNumber = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Personnel number")
    - step:
        id: '1336'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Name of employee")
    - step:
        id: '1337'
        action: Script
        object_path: empHrs = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Actual work")
    - step:
        id: '1338'
        action: Script
        object_path: empHrs = CDbl(empHrs)
    - step:
        id: '1339'
        action: Script
        object_path: If len(empNumber) = 5 Then
    - step:
        id: '1340'
        action: Script
        object_path: empNumber = "000"&empNumber
    - step:
        id: '1341'
        action: Script
        object_path: ElseIf len(empNumber) = 6 Then
    - step:
        id: '1342'
        action: Script
        object_path: empNumber = "00"&empNumber
    - step:
        id: '1343'
        action: Script
        object_path: Elseif len(empNumber) = 7 Then
    - step:
        id: '1344'
        action: Script
        object_path: empNumber = "0"&empNumber
    - step:
        id: '1345'
        action: Script
        object_path: End If
    - step:
        id: '1346'
        action: Script
        object_path: '''add employee number and hours to dictionary'
    - step:
        id: '1347'
        action: Script
        object_path: If empNumber <> "" and empHrs <> "" and empName = "" Then
    - step:
        id: '1348'
        action: Script
        object_path: If employeeTableDict.Exists(empNumber) = false Then
    - step:
        id: '1349'
        object_path: employeeTableDict
        action: Add
        args: empNumber, empHrs
    - step:
        id: '1350'
        action: Script
        object_path: End If
    - step:
        id: '1351'
        action: Script
        object_path: End If
    - step:
        id: '1352'
        action: Script
        object_path: If empName <> "" Then
    - step:
        id: '1353'
        action: Script
        object_path: If employeeNameDict.Exists(empNumber) = false Then
    - step:
        id: '1354'
        object_path: employeeNameDict
        action: Add
        args: empNumber, empName
    - step:
        id: '1355'
        action: Script
        object_path: End If
    - step:
        id: '1356'
        action: Script
        object_path: End If
    - step:
        id: '1357'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1358'
        action: Script
        object_path: '''add employee numbers into a string to be converted into an
          array'
    - step:
        id: '1359'
        action: Script
        object_path: If InStr(personnelNo, empNumber) = 0 Then
    - step:
        id: '1360'
        action: Script
        object_path: personnelNo = personnelNo & " " & empNumber
    - step:
        id: '1361'
        action: Script
        object_path: End If
    - step:
        id: '1362'
        action: Script
        object_path: '''get date of time entry'
    - step:
        id: '1363'
        action: Script
        object_path: dateOfEntry = SAPGuiSession("Session").SAPGuiWindow("Display
          Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,"Actual start
          (date)")
    - step:
        id: '1364'
        action: Script
        object_path: If dateOfEntry <> "" Then
    - step:
        id: '1365'
        action: Script
        object_path: dateOfEntry = replace(dateOfEntry,".", "-")
    - step:
        id: '1366'
        action: Script
        object_path: dateOfEntry = CDate(dateOfEntry)
    - step:
        id: '1367'
        action: Script
        object_path: ReDim Preserve DateOfTimeEntry(UBound(DateOfTimeEntry) + 1)
    - step:
        id: '1368'
        action: Script
        object_path: DateOfTimeEntry(UBound(DateOfTimeEntry)) = dateOfEntry
    - step:
        id: '1369'
        action: Script
        object_path: End If
    - step:
        id: '1370'
        action: Script
        object_path: Next
    - step:
        id: '1371'
        action: Script
        object_path: '''remove white space and split string into array of employee
          numbers'
    - step:
        id: '1372'
        action: Script
        object_path: personnelNo = Trim(personnelNo)
    - step:
        id: '1373'
        action: Script
        object_path: If InStr(personnelNo," ") > 0 Then
    - step:
        id: '1374'
        action: Script
        object_path: personnelNumber = Split(personnelNo)
    - step:
        id: '1375'
        action: Script
        object_path: noEmpHoursFound = False
    - step:
        id: '1376'
        action: Script
        object_path: End If
    - step:
        id: '1377'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1378'
        action: Script
        object_path: '''get existing start date in p6 and time posting dates from
          sap'
    - step:
        id: '1379'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable")
        action: SelectCell
        args: employeeR,"Order"
    - step:
        id: '1380'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations")
        action: SendKey
        args: ENTER
    - step:
        id: '1381'
        action: Script
        object_path: startDate1 = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j,1)
    - step:
        id: '1382'
        action: Script
        object_path: startDate2 = Split(startDate1, " ")
    - step:
        id: '1383'
        action: Script
        object_path: startDate = CDate(startDate2(0))
    - step:
        id: '1384'
        action: Script
        object_path: '''sort time posting dates'
    - step:
        id: '1385'
        action: Script
        object_path: BubbleSort DateOfTimeEntry
    - step:
        id: '1386'
        action: Script
        object_path: '''if earliest time posting date is earlier than the p6 start
          date'
    - step:
        id: '1387'
        action: Script
        object_path: If DateOfTimeEntry(0) < startDate Then
    - step:
        id: '1388'
        action: Script
        object_path: If newStartDate = "" or newStartDate > DateOfTimeEntry(0) Then
    - step:
        id: '1389'
        action: Script
        object_path: newStart = DateOfTimeEntry(0)
    - step:
        id: '1390'
        action: Script
        object_path: dayDate = Day(newStart)
    - step:
        id: '1391'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '1392'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '1393'
        action: Script
        object_path: End If
    - step:
        id: '1394'
        action: Script
        object_path: monthDate = Month(newStart)
    - step:
        id: '1395'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '1396'
        action: Script
        object_path: yearDate = Year(newStart)
    - step:
        id: '1397'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '1398'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '1399'
        action: Script
        object_path: End If
    - step:
        id: '1400'
        action: Script
        object_path: Else
    - step:
        id: '1401'
        action: Script
        object_path: dayDate = Day(startDate)
    - step:
        id: '1402'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '1403'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '1404'
        action: Script
        object_path: End If
    - step:
        id: '1405'
        action: Script
        object_path: monthDate = Month(startDate)
    - step:
        id: '1406'
        action: Script
        object_path: monthDate = MonthName(monthDate, true)
    - step:
        id: '1407'
        action: Script
        object_path: yearDate = Year(startDate)
    - step:
        id: '1408'
        action: Script
        object_path: yearDate = Replace(yearDate, "20", "", 1, 1)
    - step:
        id: '1409'
        action: Script
        object_path: newStartDate = dayDate&"-"&monthDate&"-"&yearDate&" "
    - step:
        id: '1410'
        action: Script
        object_path: End If
    - step:
        id: '1411'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1412'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1413'
        action: Script
        object_path: Else
    - step:
        id: '1414'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1415'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1416'
        action: Script
        object_path: End If
    - step:
        id: '1417'
        action: Script
        object_path: Else
    - step:
        id: '1418'
        action: Script
        object_path: noEmpHoursFound = true
    - step:
        id: '1419'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '1420'
        action: Script
        object_path: End If
    - step:
        id: '1421'
        action: Script
        object_path: End  If
    - step:
        id: '1422'
        action: Script
        object_path: Else
    - step:
        id: '1423'
        action: Script
        object_path: Exit For
    - step:
        id: '1424'
        action: Script
        object_path: End  If
    - step:
        id: '1425'
        action: Script
        object_path: Next
    - step:
        id: '1426'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '1427'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) Then
    - step:
        id: '1428'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '1429'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '1430'
        action: Script
        object_path: Else
    - step:
        id: '1431'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '1432'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '1433'
        action: Script
        object_path: End If
    - step:
        id: '1434'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '1435'
        action: Script
        object_path: '''**********************************************************************SAP
          ENDS HERE******************************************************************************************************'
    - step:
        id: '1436'
        action: Script
        object_path: '''only enter actual data if activity status is not Not Started'
    - step:
        id: '1437'
        action: Script
        object_path: If orderStatus <> "Not Started" Then
    - step:
        id: '1438'
        action: Script
        object_path: '''input actual project budget'
    - step:
        id: '1439'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '1440'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails")
        action: Highlight
    - step:
        id: '1441'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,8,"WebElement",0)
        action: DoubleClick
    - step:
        id: '1442'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1443'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: actualProjectCost
    - step:
        id: '1444'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1445'
        action: Script
        object_path: '''input actual labour hours'
    - step:
        id: '1446'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,10,"WebElement",0)
        action: DoubleClick
    - step:
        id: '1447'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1448'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: totalLabour
    - step:
        id: '1449'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1450'
        action: Script
        object_path: '''update start date'
    - step:
        id: '1451'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,
          1, "WebElement", 0)
        action: DoubleClick
    - step:
        id: '1452'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1453'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: newStartDate
    - step:
        id: '1454'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1455'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '1456'
        action: Script
        object_path: '''save'
    - step:
        id: '1457'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1458'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1459'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1460'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1461'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1462'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1463'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1464'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1465'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1466'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1467'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1468'
        action: Script
        object_path: End If
    - step:
        id: '1469'
        action: Script
        object_path: End If
    - step:
        id: '1470'
        action: Script
        object_path: '''expand bottom dock'
    - step:
        id: '1471'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '1472'
        action: Script
        object_path: If ExpandCollapseDock = "Expand Dock" Then
    - step:
        id: '1473'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '1474'
        action: Script
        object_path: End If
    - step:
        id: '1475'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '1476'
        action: Script
        object_path: ''' Open Assignments tab, if enabled and visible'
    - step:
        id: '1477'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").Link("Assignments").Object.disabled = false Then
    - step:
        id: '1478'
        action: Script
        object_path: assignmentVis = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("Assignments").GetROProperty("visible")
    - step:
        id: '1479'
        action: Script
        object_path: If assignmentVis = True Then
    - step:
        id: '1480'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments")
        action: Click
    - step:
        id: '1481'
        action: Script
        object_path: '''use functions to add resources and input extractions into
          p6'
    - step:
        id: '1482'
        action: Script
        object_path: Call AddLabourResource(labourActualCost)
    - step:
        id: '1483'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1484'
        action: Script
        object_path: Call AddMaterialResource(materialActualCost)
    - step:
        id: '1485'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1486'
        action: Script
        object_path: Call AddServicesResource(servicesActualCost)
    - step:
        id: '1487'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1488'
        action: Script
        object_path: If noEmpHoursFound = true Then
    - step:
        id: '1489'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1490'
        action: Script
        object_path: ElseIf noEmpHoursFound = false Then
    - step:
        id: '1491'
        action: Script
        object_path: For Each perNumber in personnelNumber
    - step:
        id: '1492'
        action: Script
        object_path: employeeHours = employeeTableDict.Item(perNumber)
    - step:
        id: '1493'
        action: Script
        object_path: Call AddEmployeeResource(perNumber, employeeHours)
    - step:
        id: '1494'
        action: Script
        object_path: Next
    - step:
        id: '1495'
        action: Script
        object_path: End If
    - step:
        id: '1496'
        action: Script
        object_path: "'\t\t\t\t\t\tIf Browser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Object.disabled = false\
          \ Then"
    - step:
        id: '1497'
        action: Script
        object_path: "'\t\t\t\t\t\t\tsaveVis = Browser(\"Oracle Primavera P6 EPPM\"\
          ).Page(\"Primavera P6 - Activities\").WebButton(\"Save\").GetROProperty(\"\
          visible\")"
    - step:
        id: '1498'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf saveVis = True Then"
    - step:
        id: '1499'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tBrowser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Click"
    - step:
        id: '1500'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '1501'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tSet mySendKeys = CreateObject(\"WScript.Shell\"\
          )"
    - step:
        id: '1502'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tmySendKeys.SendKeys \"{F5}\""
    - step:
        id: '1503'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tSet mySendKeys = NOTHING"
    - step:
        id: '1504'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '1505'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '1506'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '1507'
        action: Script
        object_path: Else
    - step:
        id: '1508'
        action: Script
        object_path: 'emailContent = emailContent& "Assignments tab not visible: Activity
          Type is not Level of Effort. "'
    - step:
        id: '1509'
        action: Script
        object_path: End If
    - step:
        id: '1510'
        action: Script
        object_path: End If
    - step:
        id: '1511'
        action: Script
        object_path: '''collapse bottom dock'
    - step:
        id: '1512'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '1513'
        action: Script
        object_path: If ExpandCollapseDock = "Collapse Dock" Then
    - step:
        id: '1514'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '1515'
        action: Script
        object_path: End If
    - step:
        id: '1516'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1517'
        action: Script
        object_path: End If
    - step:
        id: '1518'
        action: Script
        object_path: If orderStatus = "Not Started" and (actualProjectCost <> 0 or
          labourActualCost <> 0 or materialActualCost <> 0 or servicesActualCost <>
          0 or totalLabour <> 0) Then
    - step:
        id: '1519'
        action: Script
        object_path: 'emailContent = "Activity Status is set to Not Started however
          actual values have been found: Project actual cost: $" & actualProjectCost
          & ", Labour actual cost: $" &labourActualCost &", actual Material cost:
          $" &materialActualCost &", Services actual cost: $" &servicesActualCost&",
          Labour total hours: "&totalLabour &"."'
    - step:
        id: '1520'
        action: Script
        object_path: End If
    - step:
        id: '1521'
        action: Script
        object_path: '''send email to team about project data'
    - step:
        id: '1522'
        action: Script
        object_path: If emailContent = Empty Then
    - step:
        id: '1523'
        action: Script
        object_path: emailContent = "No issues found."
    - step:
        id: '1524'
        action: Script
        object_path: End If
    - step:
        id: '1525'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '1526'
        object_path: MyEmail
        action: Subject
        args: = "Project "&projNum&" Actual Values Automation Update"
    - step:
        id: '1527'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '1528'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '1529'
        object_path: MyEmail
        action: TextBody
        args: '= "PROJECT "&projNum&" ORDER "&ordNum&": "&vbNewLine&"COMMENTS: "&emailContent'
    - step:
        id: '1530'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '1531'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '1532'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '1533'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '1534'
        object_path: MyEmail
        action: Send
    - step:
        id: '1535'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '1536'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1537'
        action: Script
        object_path: '''scroll up and down again to reposition table correctly'
    - step:
        id: '1538'
        action: Script
        object_path: Call ScrollTablePosition(counter,actDetailsRow)
    - step:
        id: '1539'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '1540'
        action: Script
        object_path: contents = "$" & actualProjectCost & "," & totalLabour & "hrs,$"
          & labourActualCost & ",$" & materialActualCost & ",$" & servicesActualCost
    - step:
        id: '1541'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Actual Log "&today&".txt")
          Then
    - step:
        id: '1542'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Actual Log "&today&".txt",8)
    - step:
        id: '1543'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '1544'
        object_path: f
        action: Close
    - step:
        id: '1545'
        action: Script
        object_path: Else
    - step:
        id: '1546'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Actual Log
          "&today&".txt", true)
    - step:
        id: '1547'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '1548'
        object_path: textFile
        action: Close
    - step:
        id: '1549'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '1550'
        action: Script
        object_path: End If
    - step:
        id: '1551'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '1552'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '1553'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '1554'
        action: Script
        object_path: '''add to string of completed projects'
    - step:
        id: '1555'
        action: Script
        object_path: updatedProjects = updatedProjects & "," & projNum
    - step:
        id: '1556'
        action: Script
        object_path: End If
    - step:
        id: '1557'
        action: Script
        object_path: End If
    - step:
        id: '1558'
        action: Script
        object_path: If j Mod actDetailsRow = 0 And excelRow <> actDetailsRow And
          noScroll Then
    - step:
        id: '1559'
        action: Script
        object_path: iteration = iteration + 1
    - step:
        id: '1560'
        action: Script
        object_path: pgdnValue = Int(counter/(actDetailsRow - 1))
    - step:
        id: '1561'
        action: Script
        object_path: '''Print "pgdnValue from line 370: " & pgdnValue'
    - step:
        id: '1562'
        action: Script
        object_path: '''Function for scrolling to Top'
    - step:
        id: '1563'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '1564'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1565'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '1566'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1567'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '1568'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1569'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1570'
        action: Script
        object_path: Next
    - step:
        id: '1571'
        action: Script
        object_path: j = 1
    - step:
        id: '1572'
        action: Script
        object_path: cnt = cnt + 2
    - step:
        id: '1573'
        action: Script
        object_path: End If
    - step:
        id: '1574'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 6)
    - step:
        id: '1575'
        action: Script
        object_path: If counter = excelRow or ordNum = lastOrder Then
    - step:
        id: '1576'
        action: Script
        object_path: Exit For
    - step:
        id: '1577'
        action: Script
        object_path: End If
    - step:
        id: '1578'
        action: Script
        object_path: Next
    - step:
        id: '1579'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '1580'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '1581'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"UFT.Edge.NativeMessagingHost.exe"'
    - step:
        id: '1582'
        action: Script
        object_path: '''send email about completion of process'
    - step:
        id: '1583'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '1584'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '1585'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '1586'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '1587'
        object_path: MyEmail
        action: TextBody
        args: '= "UPDATE: Successful completion of process. All specified projects
          have been updated with Planned values. "'
    - step:
        id: '1588'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '1589'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '1590'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '1591'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '1592'
        object_path: MyEmail
        action: Send
    - step:
        id: '1593'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '1594'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1595'
        action: Script
        object_path: '''split list of completed projects'
    - step:
        id: '1596'
        action: Script
        object_path: updatedProjects_array = Split(updatedProjects, ",")
    - step:
        id: '1597'
        action: Script
        object_path: lengthOf_updatedProjects_array = Ubound(updatedProjects_array)
    - step:
        id: '1598'
        action: Script
        object_path: Parameter("noOfUpdatedProj") = lengthOf_updatedProjects_array
    - step:
        id: '1599'
        action: Script
        object_path: '''****************************************************************FUNCTIONS*********************************************************************'''
    - step:
        id: '1600'
        action: Script
        object_path: '''expand sap trees'
    - step:
        id: '1601'
        action: Script
        object_path: Function getColNameFromTitle(tree, title)
    - step:
        id: '1602'
        action: Script
        object_path: Set colNames = tree.Object.GetColumnNames
    - step:
        id: '1603'
        action: Script
        object_path: For i = 1 To (colNames.length-1)
    - step:
        id: '1604'
        action: Script
        object_path: selectedColTitle = tree.Object.GetColumnTitleFromName(colNames(i))
    - step:
        id: '1605'
        action: Script
        object_path: If selectedColTitle = title Then
    - step:
        id: '1606'
        action: Script
        object_path: getColNameFromTitle = colNames(i)
    - step:
        id: '1607'
        action: Script
        object_path: Exit For
    - step:
        id: '1608'
        action: Script
        object_path: End If
    - step:
        id: '1609'
        action: Script
        object_path: Next
    - step:
        id: '1610'
        action: Script
        object_path: End Function
    - step:
        id: '1611'
        action: Script
        object_path: '''find order number'
    - step:
        id: '1612'
        action: Script
        object_path: Function findBudget(tree, ordNum)
    - step:
        id: '1613'
        action: Script
        object_path: rowContainingOrdNum = Array()
    - step:
        id: '1614'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '1615'
        action: Script
        object_path: set columnKeys = tree.Object.GetColumnCol(columnNames(0))
    - step:
        id: '1616'
        action: Script
        object_path: For i = 1 To (columnKeys.length-1)
    - step:
        id: '1617'
        action: Script
        object_path: If InStr(columnKeys(i), ordNum) > 0 Then
    - step:
        id: '1618'
        action: Script
        object_path: If InStr(columnKeys(i-1), "WBS") > 0 Then
    - step:
        id: '1619'
        action: Script
        object_path: If InStr(columnKeys(i+1), "WBS") > 0 or InStr(columnKeys(i+1),
          "Result") > 0 Then
    - step:
        id: '1620'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '1621'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1622'
        action: Script
        object_path: AddItem rowContainingOrdNum, i
    - step:
        id: '1623'
        action: Script
        object_path: Exit For
    - step:
        id: '1624'
        action: Script
        object_path: ElseIf InStr(columnKeys(i+1), "ORD") > 0 Then
    - step:
        id: '1625'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '1626'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1627'
        action: Script
        object_path: End If
    - step:
        id: '1628'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-1), "ORD") > 0 Then
    - step:
        id: '1629'
        action: Script
        object_path: If InStr(columnKeys(i-2), "WBS") > 0 Then
    - step:
        id: '1630'
        action: Script
        object_path: WBSelement = columnKeys(i-2)
    - step:
        id: '1631'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1632'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-3), "WBS") > 0 Then
    - step:
        id: '1633'
        action: Script
        object_path: WBSelement = columnKeys(i-3)
    - step:
        id: '1634'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1635'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-4), "WBS") > 0 Then
    - step:
        id: '1636'
        action: Script
        object_path: WBSelement = columnKeys(i-4)
    - step:
        id: '1637'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1638'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-5), "WBS") > 0 Then
    - step:
        id: '1639'
        action: Script
        object_path: WBSelement = columnKeys(i-5)
    - step:
        id: '1640'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1641'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-6), "WBS") > 0 Then
    - step:
        id: '1642'
        action: Script
        object_path: WBSelement = columnKeys(i-6)
    - step:
        id: '1643'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1644'
        action: Script
        object_path: End If
    - step:
        id: '1645'
        action: Script
        object_path: End If
    - step:
        id: '1646'
        action: Script
        object_path: End If
    - step:
        id: '1647'
        action: Script
        object_path: Next
    - step:
        id: '1648'
        action: Script
        object_path: findBudget = rowContainingOrdNum
    - step:
        id: '1649'
        action: Script
        object_path: End Function
    - step:
        id: '1650'
        action: Script
        object_path: Function AddItem(arr, val)
    - step:
        id: '1651'
        action: Script
        object_path: ReDim Preserve arr(UBound(arr) + 1)
    - step:
        id: '1652'
        action: Script
        object_path: arr(UBound(arr)) = val
    - step:
        id: '1653'
        action: Script
        object_path: AddItem = arr
    - step:
        id: '1654'
        action: Script
        object_path: End Function
    - step:
        id: '1655'
        action: Script
        object_path: '''add labour resource'
    - step:
        id: '1656'
        action: Script
        object_path: Function AddLabourResource(labourActualCost)
    - step:
        id: '1657'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1658'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1659'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1660'
        action: Script
        object_path: found = false
    - step:
        id: '1661'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1662'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1663'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1664'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1665'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1666'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '1667'
        action: Script
        object_path: found = true
    - step:
        id: '1668'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '1669'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1670'
        object_path: labourResource
        action: Click
    - step:
        id: '1671'
        action: Script
        object_path: Exit For
    - step:
        id: '1672'
        action: Script
        object_path: ElseIf w = resourceRowCount  Then
    - step:
        id: '1673'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1674'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1675'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1676'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1677'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1678'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1679'
        action: Script
        object_path: Exit For
    - step:
        id: '1680'
        action: Script
        object_path: End If
    - step:
        id: '1681'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1682'
        action: Script
        object_path: w = 1
    - step:
        id: '1683'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1684'
        action: Script
        object_path: Exit For
    - step:
        id: '1685'
        action: Script
        object_path: End If
    - step:
        id: '1686'
        action: Script
        object_path: End If
    - step:
        id: '1687'
        action: Script
        object_path: Next
    - step:
        id: '1688'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1689'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1690'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1691'
        action: Script
        object_path: Call AddLabourResourceValues(labourResourceAvail,labourActualCost)
    - step:
        id: '1692'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1693'
        action: Script
        object_path: Else
    - step:
        id: '1694'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1695'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1696'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1697'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1698'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Labour Resource"'
    - step:
        id: '1699'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1700'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1701'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1702'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Labour ","title:=Labour","index:=0")
        action: Click
    - step:
        id: '1703'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1704'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1705'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1706'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1707'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '1708'
        action: Script
        object_path: End If
    - step:
        id: '1709'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1710'
        action: Script
        object_path: Else
    - step:
        id: '1711'
        action: Script
        object_path: labourResourceAdded = False
    - step:
        id: '1712'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1713'
        action: Script
        object_path: emailContent = emailContent& "Labour resource could not be found.
          "
    - step:
        id: '1714'
        action: Script
        object_path: End If
    - step:
        id: '1715'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1716'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1717'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1718'
        action: Script
        object_path: found = false
    - step:
        id: '1719'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1720'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1721'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1722'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1723'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '1724'
        action: Script
        object_path: found = true
    - step:
        id: '1725'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '1726'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1727'
        object_path: labourResource
        action: Click
    - step:
        id: '1728'
        action: Script
        object_path: Exit For
    - step:
        id: '1729'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1730'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1731'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1732'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1733'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1734'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1735'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1736'
        action: Script
        object_path: Exit For
    - step:
        id: '1737'
        action: Script
        object_path: End If
    - step:
        id: '1738'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1739'
        action: Script
        object_path: w = 1
    - step:
        id: '1740'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1741'
        action: Script
        object_path: Exit For
    - step:
        id: '1742'
        action: Script
        object_path: End If
    - step:
        id: '1743'
        action: Script
        object_path: End If
    - step:
        id: '1744'
        action: Script
        object_path: Next
    - step:
        id: '1745'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1746'
        action: Script
        object_path: '''add values'
    - step:
        id: '1747'
        action: Script
        object_path: Call AddLabourResourceValues(labourResourceAvail,labourActualCost)
    - step:
        id: '1748'
        action: Script
        object_path: End If
    - step:
        id: '1749'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1750'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1751'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1752'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1753'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1754'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1755'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1756'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1757'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1758'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1759'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1760'
        action: Script
        object_path: End If
    - step:
        id: '1761'
        action: Script
        object_path: End If
    - step:
        id: '1762'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1763'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1764'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1765'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1766'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1767'
        action: Script
        object_path: Next
    - step:
        id: '1768'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1769'
        action: Script
        object_path: End Function
    - step:
        id: '1770'
        action: Script
        object_path: '''add material resource'
    - step:
        id: '1771'
        action: Script
        object_path: Function AddMaterialResource(materialActualCost)
    - step:
        id: '1772'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1773'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1774'
        action: Script
        object_path: found = false
    - step:
        id: '1775'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1776'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1777'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1778'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1779'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1780'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '1781'
        action: Script
        object_path: found = true
    - step:
        id: '1782'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '1783'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1784'
        object_path: materialResource
        action: Click
    - step:
        id: '1785'
        action: Script
        object_path: Exit For
    - step:
        id: '1786'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1787'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1788'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1789'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1790'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1791'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1792'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1793'
        action: Script
        object_path: Exit For
    - step:
        id: '1794'
        action: Script
        object_path: End If
    - step:
        id: '1795'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1796'
        action: Script
        object_path: w = 1
    - step:
        id: '1797'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1798'
        action: Script
        object_path: Exit For
    - step:
        id: '1799'
        action: Script
        object_path: End If
    - step:
        id: '1800'
        action: Script
        object_path: End If
    - step:
        id: '1801'
        action: Script
        object_path: Next
    - step:
        id: '1802'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1803'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1804'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1805'
        action: Script
        object_path: Call AddMaterialResourceValues(materialResourceAvail,materialActualCost)
    - step:
        id: '1806'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1807'
        action: Script
        object_path: Else
    - step:
        id: '1808'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1809'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1810'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1811'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1812'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Material Resource"'
    - step:
        id: '1813'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1814'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1815'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1816'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Material ","title:=Material","index:=0")
        action: Click
    - step:
        id: '1817'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1818'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1819'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1820'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1821'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '1822'
        action: Script
        object_path: End If
    - step:
        id: '1823'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1824'
        action: Script
        object_path: Else
    - step:
        id: '1825'
        action: Script
        object_path: materialResourceAdded = False
    - step:
        id: '1826'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1827'
        action: Script
        object_path: emailContent = emailContent& "Material resource could not be
          found. "
    - step:
        id: '1828'
        action: Script
        object_path: End If
    - step:
        id: '1829'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1830'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1831'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1832'
        action: Script
        object_path: found = false
    - step:
        id: '1833'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1834'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1835'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1836'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1837'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '1838'
        action: Script
        object_path: found = true
    - step:
        id: '1839'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '1840'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1841'
        object_path: materialResource
        action: Click
    - step:
        id: '1842'
        action: Script
        object_path: Exit For
    - step:
        id: '1843'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1844'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1845'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1846'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1847'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1848'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1849'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1850'
        action: Script
        object_path: Exit For
    - step:
        id: '1851'
        action: Script
        object_path: End If
    - step:
        id: '1852'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1853'
        action: Script
        object_path: w = 1
    - step:
        id: '1854'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1855'
        action: Script
        object_path: Exit For
    - step:
        id: '1856'
        action: Script
        object_path: End If
    - step:
        id: '1857'
        action: Script
        object_path: End If
    - step:
        id: '1858'
        action: Script
        object_path: Next
    - step:
        id: '1859'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1860'
        action: Script
        object_path: '''add values'
    - step:
        id: '1861'
        action: Script
        object_path: Call AddMaterialResourceValues(materialResourceAvail,materialActualCost)
    - step:
        id: '1862'
        action: Script
        object_path: End If
    - step:
        id: '1863'
        action: Script
        object_path: '''save'
    - step:
        id: '1864'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1865'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1866'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1867'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1868'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1869'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1870'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1871'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1872'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1873'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1874'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1875'
        action: Script
        object_path: End If
    - step:
        id: '1876'
        action: Script
        object_path: End If
    - step:
        id: '1877'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1878'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1879'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1880'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1881'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1882'
        action: Script
        object_path: Next
    - step:
        id: '1883'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1884'
        action: Script
        object_path: End Function
    - step:
        id: '1885'
        action: Script
        object_path: '''add services resource'
    - step:
        id: '1886'
        action: Script
        object_path: Function AddServicesResource(servicesActualCost)
    - step:
        id: '1887'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1888'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1889'
        action: Script
        object_path: found = false
    - step:
        id: '1890'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1891'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1892'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1893'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1894'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1895'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '1896'
        action: Script
        object_path: found = true
    - step:
        id: '1897'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '1898'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1899'
        object_path: servicesResource
        action: Click
    - step:
        id: '1900'
        action: Script
        object_path: Exit For
    - step:
        id: '1901'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1902'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1903'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1904'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1905'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1906'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1907'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1908'
        action: Script
        object_path: Exit For
    - step:
        id: '1909'
        action: Script
        object_path: End If
    - step:
        id: '1910'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1911'
        action: Script
        object_path: w = 1
    - step:
        id: '1912'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1913'
        action: Script
        object_path: Exit For
    - step:
        id: '1914'
        action: Script
        object_path: End If
    - step:
        id: '1915'
        action: Script
        object_path: End If
    - step:
        id: '1916'
        action: Script
        object_path: Next
    - step:
        id: '1917'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1918'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1919'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1920'
        action: Script
        object_path: Call AddServicesResourceValues(servicesResourceAvail,servicesActualCost)
    - step:
        id: '1921'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1922'
        action: Script
        object_path: Else
    - step:
        id: '1923'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1924'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1925'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1926'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1927'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Services Resource"'
    - step:
        id: '1928'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1929'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1930'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1931'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Services ","title:=Services","index:=0")
        action: Click
    - step:
        id: '1932'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1933'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1934'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1935'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1936'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '1937'
        action: Script
        object_path: End If
    - step:
        id: '1938'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1939'
        action: Script
        object_path: Else
    - step:
        id: '1940'
        action: Script
        object_path: servicesResourceAdded = False
    - step:
        id: '1941'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1942'
        action: Script
        object_path: emailContent = emailContent& "Services resource could not be
          found. "
    - step:
        id: '1943'
        action: Script
        object_path: End If
    - step:
        id: '1944'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1945'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1946'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1947'
        action: Script
        object_path: found = false
    - step:
        id: '1948'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1949'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1950'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1951'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1952'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '1953'
        action: Script
        object_path: found = true
    - step:
        id: '1954'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '1955'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1956'
        object_path: servicesResource
        action: Click
    - step:
        id: '1957'
        action: Script
        object_path: Exit For
    - step:
        id: '1958'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1959'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1960'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1961'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1962'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1963'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1964'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1965'
        action: Script
        object_path: Exit For
    - step:
        id: '1966'
        action: Script
        object_path: End If
    - step:
        id: '1967'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1968'
        action: Script
        object_path: w = 1
    - step:
        id: '1969'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1970'
        action: Script
        object_path: Exit For
    - step:
        id: '1971'
        action: Script
        object_path: End  If
    - step:
        id: '1972'
        action: Script
        object_path: End If
    - step:
        id: '1973'
        action: Script
        object_path: Next
    - step:
        id: '1974'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1975'
        action: Script
        object_path: '''add values'
    - step:
        id: '1976'
        action: Script
        object_path: Call AddServicesResourceValues(servicesResourceAvail,servicesActualCost)
    - step:
        id: '1977'
        action: Script
        object_path: End If
    - step:
        id: '1978'
        action: Script
        object_path: '''save'
    - step:
        id: '1979'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1980'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1981'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1982'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1983'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1984'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1985'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1986'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1987'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1988'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1989'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1990'
        action: Script
        object_path: End If
    - step:
        id: '1991'
        action: Script
        object_path: End If
    - step:
        id: '1992'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1993'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1994'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1995'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1996'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1997'
        action: Script
        object_path: Next
    - step:
        id: '1998'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1999'
        action: Script
        object_path: End Function
    - step:
        id: '2000'
        action: Script
        object_path: '''add labour values (called from within the AddLabourResource
          function)'
    - step:
        id: '2001'
        action: Script
        object_path: Function AddLabourResourceValues(labourResourceAvail,labourActualCost)
    - step:
        id: '2002'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2003'
        action: Script
        object_path: found = false
    - step:
        id: '2004'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2005'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2006'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2007'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2008'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2009'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '2010'
        action: Script
        object_path: found = true
    - step:
        id: '2011'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '2012'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2013'
        object_path: labourResource
        action: Click
    - step:
        id: '2014'
        action: Script
        object_path: Exit For
    - step:
        id: '2015'
        action: Script
        object_path: ElseIf w = resourceRowCount  Then
    - step:
        id: '2016'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2017'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2018'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2019'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2020'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2021'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2022'
        action: Script
        object_path: Exit For
    - step:
        id: '2023'
        action: Script
        object_path: End If
    - step:
        id: '2024'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2025'
        action: Script
        object_path: w = 1
    - step:
        id: '2026'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '2027'
        action: Script
        object_path: Exit For
    - step:
        id: '2028'
        action: Script
        object_path: End If
    - step:
        id: '2029'
        action: Script
        object_path: End If
    - step:
        id: '2030'
        action: Script
        object_path: Next
    - step:
        id: '2031'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2032'
        action: Script
        object_path: Set labResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '2033'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2034'
        object_path: labResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '2035'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2036'
        action: Script
        object_path: Set labResWebCheckBox = Nothing
    - step:
        id: '2037'
        action: Script
        object_path: If labourActualCost <> 0 Then
    - step:
        id: '2038'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2039'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,8,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2040'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2041'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: labourActualCost
    - step:
        id: '2042'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2043'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2044'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2045'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2046'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2047'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '2048'
        action: Script
        object_path: End If
    - step:
        id: '2049'
        action: Script
        object_path: End Function
    - step:
        id: '2050'
        action: Script
        object_path: '''add material values (called from within the AddMaterialResource
          function)'
    - step:
        id: '2051'
        action: Script
        object_path: Function AddMaterialResourceValues(materialResourceAvail,materialActualCost)
    - step:
        id: '2052'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2053'
        action: Script
        object_path: found = false
    - step:
        id: '2054'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2055'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2056'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2057'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2058'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2059'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '2060'
        action: Script
        object_path: found = true
    - step:
        id: '2061'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '2062'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2063'
        object_path: materialResource
        action: Click
    - step:
        id: '2064'
        action: Script
        object_path: Exit For
    - step:
        id: '2065'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '2066'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2067'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2068'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2069'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2070'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2071'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2072'
        action: Script
        object_path: Exit For
    - step:
        id: '2073'
        action: Script
        object_path: End If
    - step:
        id: '2074'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2075'
        action: Script
        object_path: w = 1
    - step:
        id: '2076'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '2077'
        action: Script
        object_path: Exit For
    - step:
        id: '2078'
        action: Script
        object_path: End If
    - step:
        id: '2079'
        action: Script
        object_path: End If
    - step:
        id: '2080'
        action: Script
        object_path: Next
    - step:
        id: '2081'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2082'
        action: Script
        object_path: Set matResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '2083'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2084'
        object_path: matResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '2085'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2086'
        action: Script
        object_path: Set matResWebCheckBox = Nothing
    - step:
        id: '2087'
        action: Script
        object_path: If materialActualCost <> 0 Then
    - step:
        id: '2088'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2089'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,8,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2090'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2091'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: materialActualCost
    - step:
        id: '2092'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2093'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Click
    - step:
        id: '2094'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2095'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2096'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2097'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2098'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,5,
          "WebElement",0)
        action: Click
    - step:
        id: '2099'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2100'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2101'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,5,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2102'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2103'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: materialActualCost
    - step:
        id: '2104'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2105'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2106'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2107'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2108'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,8,
          "WebElement",0)
        action: Click
    - step:
        id: '2109'
        action: Script
        object_path: End If
    - step:
        id: '2110'
        action: Script
        object_path: End Function
    - step:
        id: '2111'
        action: Script
        object_path: '''add services values (called from within the AddServicesResource
          function)'
    - step:
        id: '2112'
        action: Script
        object_path: Function AddServicesResourceValues(servicesResourceAvail,servicesActualCost)
    - step:
        id: '2113'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2114'
        action: Script
        object_path: found = false
    - step:
        id: '2115'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2116'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2117'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2118'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2119'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2120'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '2121'
        action: Script
        object_path: found = true
    - step:
        id: '2122'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '2123'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2124'
        object_path: servicesResource
        action: Click
    - step:
        id: '2125'
        action: Script
        object_path: Exit For
    - step:
        id: '2126'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '2127'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2128'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2129'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2130'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2131'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2132'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2133'
        action: Script
        object_path: Exit For
    - step:
        id: '2134'
        action: Script
        object_path: End If
    - step:
        id: '2135'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2136'
        action: Script
        object_path: w = 1
    - step:
        id: '2137'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '2138'
        action: Script
        object_path: Exit For
    - step:
        id: '2139'
        action: Script
        object_path: End If
    - step:
        id: '2140'
        action: Script
        object_path: End If
    - step:
        id: '2141'
        action: Script
        object_path: Next
    - step:
        id: '2142'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2143'
        action: Script
        object_path: Set serResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '2144'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2145'
        object_path: serResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '2146'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2147'
        action: Script
        object_path: Set serResWebCheckBox = Nothing
    - step:
        id: '2148'
        action: Script
        object_path: If servicesActualCost <> 0 Then
    - step:
        id: '2149'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2150'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,8,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2151'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2152'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: servicesActualCost
    - step:
        id: '2153'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2154'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2155'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2156'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2157'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,5,
          "WebElement",0)
        action: Click
    - step:
        id: '2158'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2159'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2160'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,5,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2161'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2162'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: servicesActualCost
    - step:
        id: '2163'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2164'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2165'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2166'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2167'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,8,
          "WebElement",0)
        action: Click
    - step:
        id: '2168'
        action: Script
        object_path: End If
    - step:
        id: '2169'
        action: Script
        object_path: End Function
    - step:
        id: '2170'
        action: Script
        object_path: '''add employee resource'
    - step:
        id: '2171'
        action: Script
        object_path: Function AddEmployeeResource(perNumber,employeeHours)
    - step:
        id: '2172'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '2173'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2174'
        action: Script
        object_path: found = false
    - step:
        id: '2175'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2176'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2177'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2178'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2179'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2180'
        action: Script
        object_path: If inStr(resourceRow,perNumber) > 0 Then
    - step:
        id: '2181'
        action: Script
        object_path: found = true
    - step:
        id: '2182'
        action: Script
        object_path: employeeResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText(perNumber)
    - step:
        id: '2183'
        action: Script
        object_path: Set employeeResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2184'
        object_path: employeeResource
        action: Click
    - step:
        id: '2185'
        action: Script
        object_path: Exit For
    - step:
        id: '2186'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '2187'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2188'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2189'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2190'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2191'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2192'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2193'
        action: Script
        object_path: Exit For
    - step:
        id: '2194'
        action: Script
        object_path: End If
    - step:
        id: '2195'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2196'
        action: Script
        object_path: w = 1
    - step:
        id: '2197'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '2198'
        action: Script
        object_path: Exit For
    - step:
        id: '2199'
        action: Script
        object_path: End  If
    - step:
        id: '2200'
        action: Script
        object_path: End If
    - step:
        id: '2201'
        action: Script
        object_path: Next
    - step:
        id: '2202'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2203'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '2204'
        action: Script
        object_path: If found = true Then
    - step:
        id: '2205'
        action: Script
        object_path: Call AddResourceValues(perNumber,employeeHours)
    - step:
        id: '2206'
        action: Script
        object_path: '''add resource'
    - step:
        id: '2207'
        action: Script
        object_path: Else
    - step:
        id: '2208'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '2209'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2210'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '2211'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2212'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: perNumber
    - step:
        id: '2213'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2214'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '2215'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '2216'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:="&perNumber&" ","title:="&perNumber,"index:=0")
        action: Click
    - step:
        id: '2217'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2218'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '2219'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '2220'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '2221'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '2222'
        action: Script
        object_path: '''click next row then back to row to get to the top of the resource
          table'
    - step:
        id: '2223'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(j+1, 6, "WebElement",
          0)
    - step:
        id: '2224'
        object_path: rowObj
        action: Click
    - step:
        id: '2225'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2226'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(j, 6, "WebElement",
          0)
    - step:
        id: '2227'
        object_path: rowObj
        action: Click
    - step:
        id: '2228'
        action: Script
        object_path: End If
    - step:
        id: '2229'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2230'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '2231'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2232'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2233'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2234'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2235'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2236'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2237'
        action: Script
        object_path: If inStr(resourceRow,perNumber) > 0 Then
    - step:
        id: '2238'
        action: Script
        object_path: found = true
    - step:
        id: '2239'
        action: Script
        object_path: employeeResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText(perNumber)
    - step:
        id: '2240'
        action: Script
        object_path: Set employeeResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2241'
        object_path: employeeResource
        action: Click
    - step:
        id: '2242'
        action: Script
        object_path: Exit For
    - step:
        id: '2243'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '2244'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2245'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2246'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2247'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2248'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2249'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2250'
        action: Script
        object_path: Exit For
    - step:
        id: '2251'
        action: Script
        object_path: End If
    - step:
        id: '2252'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2253'
        action: Script
        object_path: w = 1
    - step:
        id: '2254'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '2255'
        action: Script
        object_path: Exit For
    - step:
        id: '2256'
        action: Script
        object_path: End If
    - step:
        id: '2257'
        action: Script
        object_path: End If
    - step:
        id: '2258'
        action: Script
        object_path: Next
    - step:
        id: '2259'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2260'
        action: Script
        object_path: '''add values'
    - step:
        id: '2261'
        action: Script
        object_path: Call AddResourceValues(perNumber,employeeHours)
    - step:
        id: '2262'
        action: Script
        object_path: Else
    - step:
        id: '2263'
        action: Script
        object_path: employeeResourceAdded = False
    - step:
        id: '2264'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '2265'
        action: Script
        object_path: employeeNumberToFind = perNumber
    - step:
        id: '2266'
        action: Script
        object_path: For Each perNumber in personnelNumber
    - step:
        id: '2267'
        action: Script
        object_path: If employeeNumberToFind = perNumber Then
    - step:
        id: '2268'
        action: Script
        object_path: employeeName = employeeNameDict.Item(perNumber)
    - step:
        id: '2269'
        action: Script
        object_path: Exit For
    - step:
        id: '2270'
        action: Script
        object_path: End If
    - step:
        id: '2271'
        action: Script
        object_path: Next
    - step:
        id: '2272'
        action: Script
        object_path: If inStr(emailContent, perNumber) = 0 Then
    - step:
        id: '2273'
        action: Script
        object_path: emailContent = emailContent & "Employee "&employeeName&" ("&perNumber&")
          not found in resource pool. " &employeeHours&" hour(s) to be added. "
    - step:
        id: '2274'
        action: Script
        object_path: End If
    - step:
        id: '2275'
        action: Script
        object_path: End If
    - step:
        id: '2276'
        action: Script
        object_path: End If
    - step:
        id: '2277'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '2278'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '2279'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '2280'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '2281'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '2282'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2283'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '2284'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '2285'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2286'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '2287'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '2288'
        action: Script
        object_path: End If
    - step:
        id: '2289'
        action: Script
        object_path: End If
    - step:
        id: '2290'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '2291'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '2292'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2293'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '2294'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2295'
        action: Script
        object_path: Next
    - step:
        id: '2296'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2297'
        action: Script
        object_path: End Function
    - step:
        id: '2298'
        action: Script
        object_path: '''add employee resource values'
    - step:
        id: '2299'
        action: Script
        object_path: Function AddResourceValues(perNumber,employeeHours)
    - step:
        id: '2300'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '2301'
        action: Script
        object_path: found = false
    - step:
        id: '2302'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '2303'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '2304'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2305'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '2306'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '2307'
        action: Script
        object_path: If inStr(resourceRow,perNumber) > 0 Then
    - step:
        id: '2308'
        action: Script
        object_path: found = true
    - step:
        id: '2309'
        action: Script
        object_path: employeeResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText(perNumber)
    - step:
        id: '2310'
        action: Script
        object_path: Set employeeResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '2311'
        object_path: employeeResource
        action: Click
    - step:
        id: '2312'
        action: Script
        object_path: Exit For
    - step:
        id: '2313'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '2314'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '2315'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '2316'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '2317'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '2318'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '2319'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '2320'
        action: Script
        object_path: Exit For
    - step:
        id: '2321'
        action: Script
        object_path: End If
    - step:
        id: '2322'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2323'
        action: Script
        object_path: w = 1
    - step:
        id: '2324'
        action: Script
        object_path: End  If
    - step:
        id: '2325'
        action: Script
        object_path: End If
    - step:
        id: '2326'
        action: Script
        object_path: Next
    - step:
        id: '2327'
        action: Script
        object_path: Set empResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(employeeResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '2328'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2329'
        object_path: empResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '2330'
        action: Script
        object_path: Set empResWebCheckBox = Nothing
    - step:
        id: '2331'
        action: Script
        object_path: If employeeHours <> "" Then
    - step:
        id: '2332'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '2333'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(employeeResourceAvail,5,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '2334'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2335'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: employeeHours
    - step:
        id: '2336'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2337'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2338'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '2339'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2340'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2341'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(employeeResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '2342'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2343'
        action: Script
        object_path: End If
    - step:
        id: '2344'
        action: Script
        object_path: End Function
    - step:
        id: '2345'
        action: Script
        object_path: '''sort the array of time entries'
    - step:
        id: '2346'
        action: Script
        object_path: Function BubbleSort(DateOfEntry)
    - step:
        id: '2347'
        action: Script
        object_path: Dim j, k, Temp
    - step:
        id: '2348'
        action: Script
        object_path: For j = LBound(DateOfEntry) To UBound(DateOfEntry)
    - step:
        id: '2349'
        action: Script
        object_path: For k = j + 1 To UBound(DateOfEntry)
    - step:
        id: '2350'
        action: Script
        object_path: If (DateOfEntry(j) > DateOfEntry(k)) Then
    - step:
        id: '2351'
        action: Script
        object_path: Temp = DateOfEntry(j)
    - step:
        id: '2352'
        action: Script
        object_path: DateOfEntry(j) = DateOfEntry(k)
    - step:
        id: '2353'
        action: Script
        object_path: DateOfEntry(k) = Temp
    - step:
        id: '2354'
        action: Script
        object_path: End If
    - step:
        id: '2355'
        action: Script
        object_path: Next
    - step:
        id: '2356'
        action: Script
        object_path: Next
    - step:
        id: '2357'
        action: Script
        object_path: DateOfTimeEntry = DateOfEntry
    - step:
        id: '2358'
        action: Script
        object_path: End Function
    - step:
        id: '2359'
        action: Script
        object_path: '''function to get plan version, Plan Version is month before
          current'
    - step:
        id: '2360'
        action: Script
        object_path: Function GetPlanVersion()
    - step:
        id: '2361'
        action: Script
        object_path: monthNum1 = Month(date)
    - step:
        id: '2362'
        action: Script
        object_path: If monthNum1 = 1 Then
    - step:
        id: '2363'
        action: Script
        object_path: monthNum = 12
    - step:
        id: '2364'
        action: Script
        object_path: Else
    - step:
        id: '2365'
        action: Script
        object_path: monthNum = monthNum1 - 1
    - step:
        id: '2366'
        action: Script
        object_path: End If
    - step:
        id: '2367'
        action: Script
        object_path: If len(monthNum) = 2 Then
    - step:
        id: '2368'
        action: Script
        object_path: planVersion = "E"&monthNum
    - step:
        id: '2369'
        action: Script
        object_path: Else
    - step:
        id: '2370'
        action: Script
        object_path: planVersion = "E0"&monthNum
    - step:
        id: '2371'
        action: Script
        object_path: End If
    - step:
        id: '2372'
        action: Script
        object_path: GetPlanVersion = planVersion
    - step:
        id: '2373'
        action: Script
        object_path: End Function
    - step:
        id: '2374'
        action: Script
        object_path: '''get WBS search for table'
    - step:
        id: '2375'
        action: Script
        object_path: Function WBSsearch(WBSelement)
    - step:
        id: '2376'
        action: Script
        object_path: WBSelementSplit = Split(WBSelement,"-")
    - step:
        id: '2377'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '2378'
        action: Script
        object_path: For e = 1 to lengthOfSplit
    - step:
        id: '2379'
        action: Script
        object_path: WBSelementSplit(e) = WBSelementSplit(e-1)&"-"&WBSelementSplit(e)
    - step:
        id: '2380'
        action: Script
        object_path: Next
    - step:
        id: '2381'
        action: Script
        object_path: Const removalIndex = 0
    - step:
        id: '2382'
        action: Script
        object_path: For x=removalIndex To UBound(WBSelementSplit)-1
    - step:
        id: '2383'
        action: Script
        object_path: WBSelementSplit(x) = WBSelementSplit(x + 1)
    - step:
        id: '2384'
        action: Script
        object_path: Next
    - step:
        id: '2385'
        action: Script
        object_path: ReDim Preserve WBSelementSplit(UBound(WBSelementSplit) - 1)
    - step:
        id: '2386'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2387'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '2388'
        action: Script
        object_path: WBSsearch = "PRJ "&projNum
    - step:
        id: '2389'
        action: Script
        object_path: If InStr(projNum,"CP") Then
    - step:
        id: '2390'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '2391'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '2392'
        action: Script
        object_path: Next
    - step:
        id: '2393'
        action: Script
        object_path: ElseIf InStr(projNum,"FS") Then
    - step:
        id: '2394'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '2395'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '2396'
        action: Script
        object_path: Next
    - step:
        id: '2397'
        action: Script
        object_path: Else
    - step:
        id: '2398'
        action: Script
        object_path: For e1 = 0 To lengthOfSplit
    - step:
        id: '2399'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '2400'
        action: Script
        object_path: Next
    - step:
        id: '2401'
        action: Script
        object_path: End If
    - step:
        id: '2402'
        action: Script
        object_path: WBSsearch = WBSsearch&";ORD "&ordNum
    - step:
        id: '2403'
        action: Script
        object_path: End Function
    - step:
        id: '2404'
        action: Script
        object_path: '''download excel to find total row count (including not visible)'
    - step:
        id: '2405'
        action: Script
        object_path: Function DownloadExcel
    - step:
        id: '2406'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Download")
        action: Click
    - step:
        id: '2407'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '2408'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '2409'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2410'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '2411'
        action: Script
        object_path: objStartFolder = "C:\Automation Downloads"
    - step:
        id: '2412'
        action: Script
        object_path: Set objFolder = objFSO.GetFolder(objStartFolder)
    - step:
        id: '2413'
        action: Script
        object_path: Set colFiles = objFolder.Files
    - step:
        id: '2414'
        action: Script
        object_path: For Each objFile in colFiles
    - step:
        id: '2415'
        action: Script
        object_path: If Instr(objFile.Name, "Primavera P6 - Activities") > 0 Then
    - step:
        id: '2416'
        action: Script
        object_path: filename = objFile.Name
    - step:
        id: '2417'
        action: Script
        object_path: Exit For
    - step:
        id: '2418'
        action: Script
        object_path: End If
    - step:
        id: '2419'
        action: Script
        object_path: Next
    - step:
        id: '2420'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '2421'
        action: Script
        object_path: Set objFolder = Nothing
    - step:
        id: '2422'
        action: Script
        object_path: Set colFiles = Nothing
    - step:
        id: '2423'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2424'
        object_path: objExcel
        action: visible
        args: = False
    - step:
        id: '2425'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open("C:\Automation Downloads\"&filename)
    - step:
        id: '2426'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '2427'
        action: Script
        object_path: excelRow = objSheet.UsedRange.Rows.Count
    - step:
        id: '2428'
        action: Script
        object_path: lastOrder = objSheet.cells(excelRow,9).value
    - step:
        id: '2429'
        action: Script
        object_path: excelValue = excelRow &","& lastOrder
    - step:
        id: '2430'
        object_path: objWorkbook
        action: close
    - step:
        id: '2431'
        object_path: objExcel
        action: Quit
    - step:
        id: '2432'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '2433'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '2434'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '2435'
        action: Script
        object_path: Set fileSystemObj = createobject("Scripting.FileSystemObject")
    - step:
        id: '2436'
        object_path: fileSystemObj
        action: DeleteFile
        args: '"C:\Automation Downloads\"&filename'
    - step:
        id: '2437'
        action: Script
        object_path: Set fileSystemObj = Nothing
    - step:
        id: '2438'
        action: Script
        object_path: DownloadExcel = excelValue
    - step:
        id: '2439'
        action: Script
        object_path: End Function
    - step:
        id: '2440'
        action: Script
        object_path: '''scroll up and down to reposition J'
    - step:
        id: '2441'
        action: Script
        object_path: Function ScrollTablePosition(counter,visibleRow)
    - step:
        id: '2442'
        action: Script
        object_path: pgdnValue = Int(counter/(visibleRow - 1))
    - step:
        id: '2443'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '2444'
        action: Script
        object_path: '''Print "pgdnValue from Function: " & pgdnValue'
    - step:
        id: '2445'
        action: Script
        object_path: fn_ScrollToTop visibleRow
    - step:
        id: '2446'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '2447'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '2448'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2449'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '2450'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2451'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2452'
        action: Script
        object_path: Next
    - step:
        id: '2453'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2454'
        action: Script
        object_path: End Function
    - step:
        id: '2455'
        action: Script
        object_path: '''scroll function'
    - step:
        id: '2456'
        action: Script
        object_path: Function fn_ScrollToTop(VisibleRows)
    - step:
        id: '2457'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 2
    - step:
        id: '2458'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("WebElement_4")
        action: Click
    - step:
        id: '2459'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2460'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("gantt-0-bar-vertical-scroller")
        action: Click
    - step:
        id: '2461'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2462'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 1
    - step:
        id: '2463'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2464'
        object_path: mySendKeys
        action: SendKeys
        args: '"{Home}"'
    - step:
        id: '2465'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '2466'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '2467'
        action: Script
        object_path: End Function
    - step:
        id: '2468'
        action: Script
        object_path: '''scroll to bottom function'
    - step:
        id: '2469'
        action: Script
        object_path: Function fn_ScrollToBottom
    - step:
        id: '2470'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 2
    - step:
        id: '2471'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("WebElement_4")
        action: Click
    - step:
        id: '2472'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2473'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("gantt-0-bar-vertical-scroller")
        action: Click
    - step:
        id: '2474'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '2475'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 1
    - step:
        id: '2476'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2477'
        object_path: mySendKeys
        action: SendKeys
        args: '"{End}"'
    - step:
        id: '2478'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '2479'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '2480'
        action: Script
        object_path: End Function
    - step:
        id: '2481'
        action: Script
        object_path: '''clear variables'
    - step:
        id: '2482'
        action: Script
        object_path: Function ClearVariables
    - step:
        id: '2483'
        action: Script
        object_path: orderStatus = ""
    - step:
        id: '2484'
        action: Script
        object_path: colKey_plan1 = ""
    - step:
        id: '2485'
        action: Script
        object_path: rowContainingOrdNum = ""
    - step:
        id: '2486'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '2487'
        action: Script
        object_path: WBSrow = ""
    - step:
        id: '2488'
        action: Script
        object_path: emailContent = ""
    - step:
        id: '2489'
        action: Script
        object_path: LabourCostElementGroups = ""
    - step:
        id: '2490'
        action: Script
        object_path: MaterialsCostElementGroups = ""
    - step:
        id: '2491'
        action: Script
        object_path: ServicesCostElementGroups = ""
    - step:
        id: '2492'
        action: Script
        object_path: planVersion = ""
    - step:
        id: '2493'
        action: Script
        object_path: WBS = ""
    - step:
        id: '2494'
        action: Script
        object_path: Count = ""
    - step:
        id: '2495'
        action: Script
        object_path: Found = ""
    - step:
        id: '2496'
        action: Script
        object_path: NodeText = ""
    - step:
        id: '2497'
        action: Script
        object_path: LactualCost = ""
    - step:
        id: '2498'
        action: Script
        object_path: labourActualCost = ""
    - step:
        id: '2499'
        action: Script
        object_path: MactualCost = ""
    - step:
        id: '2500'
        action: Script
        object_path: materialActualCost = ""
    - step:
        id: '2501'
        action: Script
        object_path: SactualCost = ""
    - step:
        id: '2502'
        action: Script
        object_path: servicesActualCost = ""
    - step:
        id: '2503'
        action: Script
        object_path: nodeKey = ""
    - step:
        id: '2504'
        action: Script
        object_path: columnName = ""
    - step:
        id: '2505'
        action: Script
        object_path: itemText = ""
    - step:
        id: '2506'
        action: Script
        object_path: actualProjectCost = ""
    - step:
        id: '2507'
        action: Script
        object_path: labourRow = ""
    - step:
        id: '2508'
        action: Script
        object_path: controlKeyValue = ""
    - step:
        id: '2509'
        action: Script
        object_path: labourHours = ""
    - step:
        id: '2510'
        action: Script
        object_path: totalLabour = ""
    - step:
        id: '2511'
        action: Script
        object_path: employeeR = ""
    - step:
        id: '2512'
        action: Script
        object_path: personnelNo = ""
    - step:
        id: '2513'
        action: Script
        object_path: DateOfTimeEntry = ""
    - step:
        id: '2514'
        action: Script
        object_path: empNumber = ""
    - step:
        id: '2515'
        action: Script
        object_path: empName = ""
    - step:
        id: '2516'
        action: Script
        object_path: empHrs = ""
    - step:
        id: '2517'
        action: Script
        object_path: dateOfEntry = ""
    - step:
        id: '2518'
        action: Script
        object_path: personnelNumber = ""
    - step:
        id: '2519'
        action: Script
        object_path: startDate1 = ""
    - step:
        id: '2520'
        action: Script
        object_path: startDate2 = ""
    - step:
        id: '2521'
        action: Script
        object_path: startDate = ""
    - step:
        id: '2522'
        action: Script
        object_path: newStartDate = ""
    - step:
        id: '2523'
        action: Script
        object_path: newStart = ""
    - step:
        id: '2524'
        action: Script
        object_path: dayDate = ""
    - step:
        id: '2525'
        action: Script
        object_path: monthDate = ""
    - step:
        id: '2526'
        action: Script
        object_path: yearDate = ""
    - step:
        id: '2527'
        action: Script
        object_path: saveVis = ""
    - step:
        id: '2528'
        action: Script
        object_path: ExpandCollapseDock = ""
    - step:
        id: '2529'
        action: Script
        object_path: assignmentVis = ""
    - step:
        id: '2530'
        action: Script
        object_path: employeeHours = ""
    - step:
        id: '2531'
        action: Script
        object_path: rowObj = ""
    - step:
        id: '2532'
        action: Script
        object_path: noEmpHoursFound = ""
    - step:
        id: '2533'
        action: Script
        object_path: WBSelementSplit = ""
    - step:
        id: '2534'
        action: Script
        object_path: systemStatus = ""
    - step:
        id: '2535'
        action: Script
        object_path: Set employeeTableDict = Nothing
    - step:
        id: '2536'
        action: Script
        object_path: Set employeeNameDict = Nothing
    - step:
        id: '2537'
        action: Script
        object_path: Set tree = Nothing
    - step:
        id: '2538'
        action: Script
        object_path: Set TreeObj = Nothing
    - step:
        id: '2539'
        action: Script
        object_path: Set AllValues = Nothing
    - step:
        id: '2540'
        action: Script
        object_path: Set columnNames = Nothing
    - step:
        id: '2541'
        action: Script
        object_path: End Function
  outputs:
  - noOfUpdatedProj:
      robot: true
      value: ${noOfUpdatedProj}
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
      name: Excel
      properties:
      - property:
          value:
            value: Excel
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: XLMAIN
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
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 10 May 2022 2:46:38 PM
      child_objects:
      - object:
          class: WinObject
          name: WinObject
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
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
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WinMenu
              name: WinMenu2
              properties:
              - property:
                  value:
                    value: '2'
                    regular_expression: false
                  name: menuobjtype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinMenu
              name: WinMenu
              properties:
              - property:
                  value:
                    value: '2'
                    regular_expression: false
                  name: menuobjtype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinList
              name: WinMenu
              properties:
              - property:
                  value:
                    value: list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinList
              name: File_2
              properties:
              - property:
                  value:
                    value: list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinList
              name: File
              properties:
              - property:
                  value:
                    value: list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Info
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinButton
              name: Browse
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Browse
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: WinObject
          name: Ribbon
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Ribbon
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WinButton
              name: File Tab
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File Tab
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: WinObject
          name: Message Bars
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Message Bars
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: Static
              name: Enable Editing
              properties:
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Enable Editing
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: text
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Dialog
          name: Save As
          properties:
          - property:
              value:
                value: Save As
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
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
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WinTreeView
              name: WinTreeView
              properties:
              - property:
                  value:
                    value: SysTreeView32
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: SysTreeView32
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinScrollBar
              name: WinScrollBar
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: ScrollBar
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: ScrollBar
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinObject
              name: Items View
              properties:
              - property:
                  value:
                    value: DirectUIHWND
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Items View
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - regexpwndclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: window
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects:
              - object:
                  class: WinList
                  name: Items View
                  properties:
                  - property:
                      value:
                        value: list
                        regular_expression: false
                      name: nativeclass
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: attached text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Items View
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - nativeclass
                    - attached text
                    - acc_name
                    ordinal_identifier: ''
                  smart_identification: ''
                  custom_replay:
                    behavior:
                      value: list
                      name: simclass
                      type: STRING
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 10 May 2022 2:46:38 PM
                  child_objects: []
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinButton
              name: Save
              properties:
              - property:
                  value:
                    value: '&Save'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WinButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
      last_update_time: Tuesday, 10 May 2022 2:46:38 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Set Controlling Area
          properties:
          - property:
              value:
                value: S_ALR_87013534
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '300'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSPO4
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Controlling Area
              properties:
              - property:
                  value:
                    value: SVALD-VALUE
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Selection: Plan 1/plan'
          properties:
          - property:
              value:
                value: S_ALR_87013534
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
                value: GP43KO2KBLC752LFPD0I8S3ZDB4
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: Graphical report output
              properties:
              - property:
                  value:
                    value: Graphical report output
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: CONTROL
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
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
              properties:
              - property:
                  value:
                    value: CN_PROJN-LOW
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Plan version 2
              properties:
              - property:
                  value:
                    value: PAR_04
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Network/order
              properties:
              - property:
                  value:
                    value: CN_NETNR-LOW
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: Transaction
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter
              properties:
              - property:
                  value:
                    value: btn[0]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
          properties:
          - property:
              value:
                value: S_ALR_87013534
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
                value: SAPMSSY0
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Exit Report
          properties:
          - property:
              value:
                value: S_ALR_87013543
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '400'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLGRWF
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: BUTTON_YES
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Execute Drilldown Report
          properties:
          - property:
              value:
                value: S_ALR_87013534
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
                value: SAPLKYPC
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiTree
              name: TableTreeControl
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
                    value: SAPGuiTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '200'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile_2
          properties:
          - property:
              value:
                value: S_ALR_87013543
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '600'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCNIS
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Database prof.
              properties:
              - property:
                  value:
                    value: TCNT-PROF_DB
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile
          properties:
          - property:
              value:
                value: S_ALR_87013534
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '600'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCNIS
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Database prof._2
              properties:
              - property:
                  value:
                    value: TCNT-PROF_DB
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Database prof.
              properties:
              - property:
                  value:
                    value: TCNT-PROF_DB
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display PM Order Confirmation:'
          properties:
          - property:
              value:
                value: IW43
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '3200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCORU
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiElement
              name: Confirmation Data
              properties:
              - property:
                  value:
                    value: RUECKMELDEDATEN
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '62'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/boxRUECKMELDEDATEN
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Order: Initial'
          properties:
          - property:
              value:
                value: IW33
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '101'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCOIH
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Order
              properties:
              - property:
                  value:
                    value: CAUFVD-AUFNR
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Contestable -
          properties:
          - property:
              value:
                value: IW33
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '3000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCOIH
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiTree
              name: TableTreeControl
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
                    value: SAPGuiTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '200'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP
              properties:
              - property:
                  value:
                    value: TABSTRIP
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '90'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TabMenu
              properties:
              - property:
                  value:
                    value: TS_1100
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '90'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: SAPLICO1TCTRL_1110
              properties:
              - property:
                  value:
                    value: SAPLICO1TCTRL_1110
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: OperationsTable
              properties:
              - property:
                  value:
                    value: SAPLCOVGTCTRL_3010
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: columnselectmode
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar_2
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
              - property:
                  value:
                    value: wnd[0]/sbar
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
              properties:
              - property:
                  value:
                    value: No objects were selected
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
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
              basic_identification:
                property_ref:
                - text
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Sys.Status
              properties:
              - property:
                  value:
                    value: CAUFVD-STTXT
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
              - property:
                  value:
                    value: wnd[0]/usr/subSUB_ALL:SAPLCOIH:3001/ssubSUB_LEVEL:SAPLCOIH:1107/subSUB_KOPF:SAPLCOIH:1108/txtCAUFVD-STTXT
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Confirmations List
              properties:
              - property:
                  value:
                    value: BTN_VGRM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Act. Data
              properties:
              - property:
                  value:
                    value: BTN_VGD8
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Confirmations
          properties:
          - property:
              value:
                value: IW33
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: EmployeeTable
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Actual/Plan/Variance
          properties:
          - property:
              value:
                value: S_ALR_87013543
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '120'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSSY0
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: SAPGuiTree
              name: TableTreeControl
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
                    value: SAPGuiTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '200'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Report contains no data
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[0,0]
                    regular_expression: false
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: Report contains no data
                    regular_expression: false
                  name: content
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: ProjPlan
              properties:
              - property:
                  value:
                    value: wnd\[0\]\/usr\/lbl\[62\,[0-9]+\]
                    regular_expression: true
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: ^[ ]*\d*.*\d*.*\d*$
                    regular_expression: true
                  name: content
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Actual
              properties:
              - property:
                  value:
                    value: '279'
                    regular_expression: false
                  name: y
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '372'
                    regular_expression: false
                  name: x
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/lbl[46,13]
                    regular_expression: false
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: content
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Act/Plan/Variance Abs./
          properties:
          - property:
              value:
                value: S_ALR_87013543
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
                value: GP19IKIISXT68SL5787G66QHP8F410
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: to
              properties:
              - property:
                  value:
                    value: _6-KSTAR-HIGH
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
              properties:
              - property:
                  value:
                    value: CN_PROJN-LOW
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Plan Version
              properties:
              - property:
                  value:
                    value: $6-VERP
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Or value(s)
              properties:
              - property:
                  value:
                    value: _6-KSTAR-LOW
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Network/order
              properties:
              - property:
                  value:
                    value: CN_NETNR-LOW
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Cost Element Group
              properties:
              - property:
                  value:
                    value: $6-KSTAR
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
  - object:
      class: Browser
      name: Primavera P6 - Activities
      properties:
      - property:
          value:
            value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF
              Stands (NW-016412) (Deferred to 2021)
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/authorize?client_id=00000003-0000-0ff1-ce00-000000000000&response_mode=form_post&protectedtoken=true&response_type=code+id_token&resource=00000003-0000-0ff1-ce00-000000000000&scope=openid&nonce=EFDA664BEE14CF4D567E6225E5050C33F0DAB75D8955DA0F-D806393BCC380B7E76D2AB726B36E5E071A7BB8BD06F5CC99EA10670435E284F&redirect_uri=https%3a%2f%2fsapowernetworks.sharepoint.com%2f_forms%2fdefault.aspx&claims=%7b%22id_token%22%3a%7b%22xms_cc%22%3a%7b%22values%22%3a%5b%22CP1%22%5d%7d%7d%7d&wsucxt=1&cobrandid=11bd8083-87e0-41b5-bb78-0bc43c8a8e8a&client-request-id=3702a29f-609b-0000-55d3-5f158ce8ed8d&sso_nonce=AwABAAAAAAABAOz_AwD0_-gbbHmaFI7HiglbXtcb9hd3BoFqPdOJDcB6D9SyDrtHfoARQjH1Nmdm3r4y8_kJ4MfUUqYnXpM9I2OaYPTt6AcgAA&mscrid=3702a29f-609b-0000-55d3-5f158ce8ed8d
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Working...
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
            value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF
              Stands (NW-016412) (Deferred to 2021)
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
      last_update_time: Tuesday, 10 May 2022 2:46:38 PM
      child_objects:
      - object:
          class: Page
          name: Primavera P6 - Enterprise_2
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?selectedItem=ARO111_7232
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '20013'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebTable
              name: SA Power Networks
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
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 4
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
              - property:
                  value:
                    value: '0'
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
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
                    value: pgbu-icon pgbu-icon-cog
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
                    value: //TR[@role="row"][6]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/DIV[1]/I[1]
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
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 5
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: No search results found.
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
                    value: No search results found.
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: rowset-message-text
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
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/DIV[1]/SPAN[1]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
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
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[6]/INPUT[1]
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
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
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
                    value: pgbu-input-248
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
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
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
                - placeholder
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Open Project
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
                    value: //LI[@role="menuitem"]/A[normalize-space()="Open Project"]
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
                    value: Open Project
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Open Project
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
                    value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?projectId=12910&wbsId=491866&ProjectName=null&selectedItem=ARO111_515875&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Enterprise
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?selectedItem=ARO111_301732
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '30012'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebMenu
              name: pgbu-dropdown-menu-259
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-dropdown-menu-259
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: dropdown-menu  pull-center disclosure select-menu
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
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: StartDate
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
                    value: ''
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
                    value: cell-renderer
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Reporting Only
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
                    value: Reporting Only
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
                    value: cell-renderer
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"]/TD[@role="rowheader" and normalize-space()="Reporting
                      Only"]/DIV[1]/DIV[2]
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
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: xpath
                  hidden: false
                  read_only: false
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 3grid-row-ARO10_652-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - xpath
                - type
                - role
                - name
                - html tag
                - acc_name
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
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: PlannedFilter
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"][12]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 3grid-row-ARO10_667-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 8
                  type: index
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: ActualsFilter
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"][11]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 3grid-row-ARO10_658-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
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
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
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
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  save-apply-btn
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: FilterSave
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
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
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
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  save-apply-btn
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Filters
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
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button"
                      and normalize-space()="Filters"]
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
                    value: Filters
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn dropdown-toggle filter-error-status-button active
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Filters
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: FilterCancel
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
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]
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
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-dark
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Open Project
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
                    value: //LI[@role="menuitem"]/A[normalize-space()="Open Project"]
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
                    value: Open Project
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Open Project
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Manage Filters...
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
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/UL[@role="menu"]/LI/A[@role="menuitem"
                      and normalize-space()="Manage Filters..."]
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
                    value: Manage Filters...
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: manage-filters-btn
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Close All
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
                    value: //LI[@role="menuitem" and normalize-space()="Close All"]/A[1]
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
                    value: Close All
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
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
                    value: Close All
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
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
                - role
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Activities
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser
                  Upgrade+Cable/TF Stands (NW-016412) (Deferred to 2021)
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebTree
              name: oui-tree-panel-115
              properties:
              - property:
                  value:
                    value: WebTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[@role="tree"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-.*
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
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
                    value: oui-tree-panel-115
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: orcl-widget tree orcl-tree picker fill fluid filtered
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
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceName
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 10
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceAttributes
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 11
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ID_Code_Table
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 4
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ActivityDetails
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 5
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebList
              name: active-resource-view
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
                    value: //BUTTON[@id="active-resource-view"]
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
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: active-resource-view
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
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
                  - items count
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_4
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
                    value: '0'
                    regular_expression: false
                  name: location
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
                    value: pgbu-icon-small pgbu-icon-ent-activity
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
                    value: //TD[@role="gridcell"]/DIV/DIV[normalize-space()="A1190"]/I[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
                - _xpath
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
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_3
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
                    value: ''
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
                    value: toggle-children
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
                    value: //TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]
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
                - class
                - acc_name
                - _xpath
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
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_2
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
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
                    value: pgbu-icon-small pgbu-icon-tree-expanded
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
                    value: //TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]/I[1]
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
                - class
                - acc_name
                - _xpath
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
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
              - property:
                  value:
                    value: '0'
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
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
                    value: pgbu-icon-small pgbu-icon-ent-activity
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
                    value: ''
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
                - class
                - acc_name
                ordinal_identifier:
                  value: 0
                  type: location
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: UA
              properties:
              - property:
                  value:
                    value: '158'
                    regular_expression: false
                  name: width
                  hidden: false
                  read_only: false
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UA.*
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
                    value: cell-renderer
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - width
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
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
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: TitleCell
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
                    value: .*
                    regular_expression: true
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
                    value: cell-renderer
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
                    value: //TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[2]
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
                - class
                - acc_name
                - _xpath
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Schedule... Actions
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
                    value: 'Schedule... Actions    Define Baselines Apply Actuals
                      Check Schedule Dissolve Import Create Import Template Import
                      from Excel Leveler Link Selected Activities Open Dependent Projects
                      Publish Projects Recalculate Assignment Costs Store Period Performance
                      Summarize Projects Views Automation View Select Field: Press
                      Down to show all options or type a letter to filter values.
                      Grid View Gantt View Activity Network View Progress Spotlight
                      (Ctrl+Alt+S) Filters Manage Filters... Clear All Filters Applied
                      Order Number is not empty Recent Full Screen Print Options Print
                      Options Customize View Enter a query to search.No filter applied'
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
                    value: btn-toolbar pane-toolbar
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]
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
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Same resource could not
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
                    value: Same resource could not be added because the project does
                      not permit the same resource to be assigned to an activity more
                      than once
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P
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
                    value: //DIV[@id="alert-modal"]/DIV[2]/P[1]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: oui-calendar-36
              properties:
              - property:
                  value:
                    value: '0'
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
                    value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31
                      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
                      24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
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
                    value: oui-calendar-36
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: calendar dark-theme align-left
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: NoResultFound
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
                    value: No results found
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
                    value: oui-tree-panel-81-no-results
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: no-results
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
                    value: //DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No
                      results found"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: No results found Labour
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
                    value: No results found Labour Labour Resource No results
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
                    value: tree-items no-scroll
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
                    value: //DIV[3]/DIV[@role="tree"][1]/DIV[3]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: master-panel
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Schedule... Actions.*
                    regular_expression: true
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
                    value: master-panel
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
                    value: //DIV[@id="master-panel"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - visible
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
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Labour
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
                    value: Labour
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
                    value: col
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
                    value: //DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: gantt-0-bar-vertical-scroller
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
                    value: ''
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
                    value: gantt-0-bar-vertical-scroller
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pseudo-scroller vertical
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[7]
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
                - class
                - acc_name
                - _xpath
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Download
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Download
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
                    value: grid-status-bar adjust-for-context-menu
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation"
                      and normalize-space()="Download"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - visible
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Calendar
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
                    value: January 2020
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: LABEL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-calendar-label-33
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: title
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading"
                      and normalize-space()="January 2020"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Assignments
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
                    value: Assignments
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: activity-panel
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
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
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: 3grid-scroller-vertical-assignments
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
                    value: ''
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
                    value: 3grid-scroller-vertical-assignmentsRowset
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pseudo-scroller vertical
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[17]
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
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 3
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: WebEdit
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
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
                  hidden: false
                  read_only: false
                  type: BOOL
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '255'
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
                - visible
                - type
                - name
                - html tag
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
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
                    value: //DIV[2]/DIV[1]/INPUT[1]
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
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
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
                    value: oui-typeahead-108
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
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
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
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: ResourceValue
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
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
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 2grid-row-ARO27_577308-col-SyncUnitsFromCost-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: ‹
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: 'Yes'
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
                    value: //DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]
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
                    value: 'Yes'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  proceedModal
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Views
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
                    value: //DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox"
                      and normalize-space()="Automation View"]
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
                    value: Automation View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-input-110
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Views
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Today
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]
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
                    value: Today
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-small btn-blue-light today
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save View
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
                    value: //DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn save-view-button unsaved btn-action
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
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
                  hidden: false
                  read_only: false
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
                    value: button
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action save-button unsaved
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: OK
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
                    value: //DIV/BUTTON[normalize-space()="OK"]
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
                    value: OK
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  proceedModal
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Got It
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
                    value: //BUTTON[@id="okBtn"]
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
                    value: Got It
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Got It
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: okBtn
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel_2
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
                    value: //DIV[@id="lwfactivities"]/DIV[@role="main"][1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/BUTTON[1]
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
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-dark  cancel-button
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
                - visible
                - type
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
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
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
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]
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
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-dark
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign...
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
                    value: //DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button"
                      and normalize-space()="Assign..."]
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
                    value: Assign...
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light dropdown-toggle
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign
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
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]
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
                    value: Assign
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action modal-accept
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Resource
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
                    value: //LI/A[@role="menuitem" and normalize-space()="Resource"]
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
                    value: Resource
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Resource
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: ExpandCollapseDock
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
                    value: //DIV/DIV/A[normalize-space()="Expand Dock"]
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
                    value: .*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Expand Dock
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: collapse-handle
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Details
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
                - innertext
                - html tag
                - html id
                - class
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Download
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation"]/DIV/DIV/A[normalize-space()="Download"]
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
                    value: Download
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Download
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084779&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Automation View
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
                    value: //LI[@role="option"]/A[normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Assignments
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
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
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
                    value: Assignments
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: tab
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assignments
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#assignments-tab
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: activity-panel
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
                - role
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: All Resources
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
                    value: //LI[@id="active-resource-view-AR"]/A[normalize-space()="All
                      Resources"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: All Resources
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM_2
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
                value: '150014'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebButton
              name: Prod - Enerven
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
                    value: //BUTTON[@id="databaseId"]
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
                    value: Prod - Enerven
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Prod - Enerven
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Prod - Field Services
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
                    value: //LI[@role="option"][2]/A[1]
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
                    value: Prod - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Prod - Field Services
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
                    value: https://prvprd612.utilities.etsa.net.au/p6/action/login#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
                value: '60022'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebList
              name: databaseId
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
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
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
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
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
                    value: btn btn-blue-light combo-button combo-value
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
                - role
                - name
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
                  - name
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: QAS - Field Services
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
                    value: //BUTTON[@id="databaseId"]
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
                    value: QAS - Field Services
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Database
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
                    value: //BUTTON[@id="databaseId"]
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
                    value: QAS - Field Services
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
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
                  - type
                  - html id
                  - value
                  - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: QAS - Field Services
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
                    value: //LI[@role="option"]/A[normalize-space()="QAS - Field Services"]
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
                    value: QAS - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Advanced
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
                    value: //A[@id="advancedOptionsToggle"]
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
                    value: Advanced
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Advanced
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
                    value: advancedOptionsToggle
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: accordion-toggle
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
  - object:
      class: Browser
      name: Oracle Primavera P6 EPPM
      properties:
      - property:
          value:
            value: Oracle Primavera P6 EPPM
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://prvqas612.utilities.etsa.net.au/p6/action/login
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Oracle Primavera P6 EPPM
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
            value: Oracle Primavera P6 EPPM
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
      last_update_time: Tuesday, 10 May 2022 2:46:38 PM
      child_objects:
      - object:
          class: Page
          name: Primavera P6 - Enterprise
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?projectId=10083&wbsId=301732&ProjectName=null&checkTabs=true&selectedItem=ARO111_7232
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '20015'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebMenu
              name: Row menu
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 1grid-menu
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Add Project
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: grid-menu grid-root-menu grid-root-menu-down
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row menu
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebMenu
              name: pgbu-dropdown-menu-259
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-dropdown-menu-259
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: dropdown-menu  pull-center disclosure select-menu
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
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: StartDate
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
                    value: ''
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
                    value: cell-renderer
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row_2
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Status - What-If"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 4grid-row-ARO10_117-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 6
                  type: index
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 4grid-row-ARO10_652-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
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
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save_2
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
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
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
                    value: button
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action save-button unsaved
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save View
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
                    value: //DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]
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
                    value: Save View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action save-view-button unsaved
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
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
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  save-apply-btn
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Grid View
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
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[normalize-space()="Grid
                      View"]
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
                    value: Grid View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Grid View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light active
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Filters
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
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button"
                      and normalize-space()="Filters"]
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
                    value: Filters
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn dropdown-toggle filter-error-status-button active
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Filters
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Customize View
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
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/BUTTON[normalize-space()="Customize
                      View"]
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
                    value: Customize View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Customize View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Close
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
                    value: //DIV[@role="dialog"][3]/DIV[1]/A[@role="button"][1]
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
                    value: Close
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
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
                    value: modal-close
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
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
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]
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
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-dark
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Activities
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
                    value: //A[@id="tab_link_ProjectActivities"]
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
                    value: Activities
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Activities
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
                    value: tab_link_ProjectActivities
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Dashboards
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/home
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Dashboards
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
                value: '30039'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: Link
              name: Projects
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
                    value: //LI[@id="menu.section.multiprojects"]/DIV/A[normalize-space()="Projects"]
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
                    value: Projects
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Projects
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projectstartpage?
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Activities
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Activities of 11kV Cable Box Replacement Program
                  2020, 2019 Earth Grid, 2019 Fencing, 38 Currie CBD 11kV
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
                value: '10037'
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebTree
              name: oui-tree-panel-115
              properties:
              - property:
                  value:
                    value: WebTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[@role="tree"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-.*
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
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
                    value: oui-tree-panel-115
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: orcl-widget tree orcl-tree picker fill fluid filtered
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
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTabStrip
              name: GeneralGeneralAssignments
              properties:
              - property:
                  value:
                    value: WebTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[2]/DIV[3]/DIV[1]/DIV[1]/UL[@role="tablist"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: tablist
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: UL
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: General
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: nav nav-tabs content-tabs sort-ready
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
                - role
                - html tag
                - html id
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
                  - html id
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceName
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 10
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceAttributes
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 11
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebTable
              name: ActivityDetails
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
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
                    value: ''
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
                  value: 5
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebMenu
              name: Row menu
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV/UL[@role="menu" and normalize-space()="Delete"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 2grid-menu
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Delete
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: grid-menu grid-root-menu grid-root-menu-down
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row menu
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebList
              name: Views
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
                    value: //DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox"
                      and normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
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
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-input-110
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
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
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Views
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
                - name
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
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebList
              name: active-resource-view
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
                    value: //BUTTON[@id="active-resource-view"]
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
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: active-resource-view
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
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
                  - items count
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: UA
              properties:
              - property:
                  value:
                    value: '158'
                    regular_expression: false
                  name: width
                  hidden: false
                  read_only: false
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UA.*
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
                    value: cell-renderer
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - width
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
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
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: oui-calendar-36
              properties:
              - property:
                  value:
                    value: '0'
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
                    value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31
                      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
                      24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
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
                    value: oui-calendar-36
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: calendar dark-theme align-left
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: NoResultFound
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
                    value: No results found
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
                    value: oui-tree-panel-81-no-results
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: no-results
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
                    value: //DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No
                      results found"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Labour
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
                    value: Labour
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
                    value: col
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
                    value: //DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Calendar
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
                    value: January 2020
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: LABEL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-calendar-label-33
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: title
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading"
                      and normalize-space()="January 2020"]
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebElement
              name: Assignments
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
                    value: Assignments
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: activity-panel
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
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
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
                - class
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: WebEdit
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '255'
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
                - placeholder
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
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
                    value: //DIV[2]/DIV[1]/INPUT[1]
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
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
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
                    value: oui-typeahead-108
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
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
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
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: ResourceValue
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
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
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: ''
                    regular_expression: false
                  name: name
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
                    value: 2grid-row-ARO27_577308-col-SyncUnitsFromCost-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
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
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: ‹
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: 'Yes'
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
                    value: //DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]
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
                    value: 'Yes'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  proceedModal
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Today
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
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]
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
                    value: Today
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-small btn-blue-light today
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
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
                    value: button
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action save-button unsaved
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: OK
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
                    value: //DIV/BUTTON[normalize-space()="OK"]
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
                    value: OK
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action  proceedModal
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Close
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
                    value: //DIV[@id="grid-settings-dialog"]/DIV[1]/DIV[1]/A[@role="button"][1]
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
                    value: Close
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
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
                    value: modal-close
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
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
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]
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
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
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
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-dark
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
                - role
                - name
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign...
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
                    value: //DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button"
                      and normalize-space()="Assign..."]
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
                    value: Assign...
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-blue-light dropdown-toggle
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign
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
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]
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
                    value: Assign
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
                    value: btn btn-action modal-accept
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Resource
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
                    value: //LI/A[@role="menuitem" and normalize-space()="Resource"]
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
                    value: Resource
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Resource
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Manage Views...
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
                    value: //LI[@role="option"]/A[normalize-space()="Manage Views..."]
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
                    value: Manage Views...
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Views...
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: EPS
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
                    value: //A[@id="tab_link_ProjectEPS"]
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
                    value: EPS
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: EPS
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
                    value: tab_link_ProjectEPS
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Automation View
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
                    value: //LI[@role="option"]/A[normalize-space()="Automation View"]
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
                    value: Automation View
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: All Resources
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
                    value: //LI[@id="active-resource-view-AR"]/A[normalize-space()="All
                      Resources"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: All Resources
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
          last_update_time: Tuesday, 10 May 2022 2:46:38 PM
          child_objects:
          - object:
              class: WebList
              name: databaseId
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
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
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
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
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
                    value: btn btn-blue-light combo-button combo-value
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
                - role
                - name
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
                  - name
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Username
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
                    value: //INPUT[@id="username"]
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
                    value: Username
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: username
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
                    value: username
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
                    value: username
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Username
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
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
                    value: //INPUT[@id="password"]
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
                    value: Password
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
                    value: password
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: WebButton
              name: Sign In
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
                    value: //BUTTON[@id="login"]
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
                    value: Sign In
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
                    value: Sign In
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: login
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit btn btn-action btn-huge
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: QAS - Field Services
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
                    value: //LI[@role="option"]/A[normalize-space()="QAS - Field Services"]
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
                    value: QAS - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
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
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
          - object:
              class: Link
              name: Advanced
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
                    value: //A[@id="advancedOptionsToggle"]
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
                    value: Advanced
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Advanced
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
                    value: advancedOptionsToggle
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: accordion-toggle
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
              last_update_time: Tuesday, 10 May 2022 2:46:38 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
