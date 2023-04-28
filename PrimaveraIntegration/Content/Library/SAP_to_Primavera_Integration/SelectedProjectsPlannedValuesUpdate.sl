namespace: SAP_to_Primavera_Integration
operation:
  name: SelectedProjectsPlannedValuesUpdate
  inputs:
  - projectID
  - prima_user
  - prima_pass
  sequential_action:
    gav: com.microfocus.seq:SAP_to_Primavera_Integration.SelectedProjectsPlannedValuesUpdate:1.0.0
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
          Enterprise_2").WebCheckBox("PlannedFilter")'
        action: Set
        args: '"ON"'
    - step:
        id: '27'
        object_path: '''Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Enterprise_2").WebCheckBox("ActualsFilter")'
        action: Set
        args: '"OFF"'
    - step:
        id: '28'
        action: Script
        object_path: ''''' Check if save button is disabled. If so, click cancel.
          Otherwise this throws an error.'
    - step:
        id: '29'
        action: Script
        object_path: '''If Browser("Primavera P6 - Activities").Page("Primavera P6
          - Enterprise_2").WebButton("FilterSave").Object.disabled = false Then'
    - step:
        id: '30'
        action: Script
        object_path: "'\tsaveFilterVis = Browser(\"Primavera P6 - Activities\").Page(\"\
          Primavera P6 - Enterprise_2\").WebButton(\"FilterSave\").GetROProperty(\"\
          visible\")"
    - step:
        id: '31'
        action: Script
        object_path: "'\tIf saveFilterVis = True Then"
    - step:
        id: '32'
        action: Script
        object_path: "'\t\tBrowser(\"Primavera P6 - Activities\").Page(\"Primavera\
          \ P6 - Enterprise_2\").WebButton(\"FilterSave\").Click"
    - step:
        id: '33'
        action: Script
        object_path: "'\t\tWait 30"
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
        object_path: "'\t\tWait 30"
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
          \ - Enterprise_2\").WebButton(\"Cancel\").Click"
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
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
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
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,DL_ITAutomationTeam@sapowernetworks.com.au"
    - step:
        id: '158'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Error thrown while trying to load Activities page: ''Project(s)
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
        object_path: ''' Download excel document, get excelRow count and lastOrder
          number in excel, use with counter to exit at the end of the table'
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
        object_path: '''Print "Actual Row Count: " & actDetailsRow'
    - step:
        id: '212'
        action: Script
        object_path: '''Print "Excel Row Count: " & excelRow'
    - step:
        id: '213'
        action: Script
        object_path: today = date ()
    - step:
        id: '214'
        action: Script
        object_path: today = cStr(today)
    - step:
        id: '215'
        action: Script
        object_path: today = Replace(today,"/","-")
    - step:
        id: '216'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '217'
        action: Script
        object_path: 'contents = "Actual row count" & actDetailsRow & ", Excel row
          count: " & excelRow'
    - step:
        id: '218'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '219'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '220'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '221'
        object_path: f
        action: Close
    - step:
        id: '222'
        action: Script
        object_path: Else
    - step:
        id: '223'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '224'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '225'
        object_path: textFile
        action: Close
    - step:
        id: '226'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '229'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '230'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '231'
        action: Script
        object_path: If excelRow > actDetailsRow Then
    - step:
        id: '232'
        action: Script
        object_path: actDetailsRow = actDetailsRow - 3
    - step:
        id: '233'
        action: Script
        object_path: End If
    - step:
        id: '234'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '235'
        action: Script
        object_path: contents = "row number, project name, order number"
    - step:
        id: '236'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '237'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '238'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '239'
        object_path: f
        action: Close
    - step:
        id: '240'
        action: Script
        object_path: Else
    - step:
        id: '241'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '242'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '243'
        object_path: textFile
        action: Close
    - step:
        id: '244'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '245'
        action: Script
        object_path: End If
    - step:
        id: '246'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '247'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '248'
        action: Script
        object_path: ''' Iterate through rows until order number column is not empty'
    - step:
        id: '249'
        action: Script
        object_path: For j = 1 To actDetailsRow
    - step:
        id: '250'
        action: Script
        object_path: counter = counter + 1
    - step:
        id: '251'
        action: Script
        object_path: cnt = cnt + 1
    - step:
        id: '252'
        action: Script
        object_path: '''Print "Current Counts(counter): " & counter'
    - step:
        id: '253'
        action: Script
        object_path: '''Print "Current Iterations (j): " & j'
    - step:
        id: '254'
        action: Script
        object_path: ''' Scroll down table'
    - step:
        id: '255'
        action: Script
        object_path: If excelRow - counter < actDetailsRow And noScroll Then
    - step:
        id: '256'
        action: Script
        object_path: actDetailsRow = actDetailsRow + 3
    - step:
        id: '257'
        action: Script
        object_path: fn_ScrollToBottom
    - step:
        id: '258'
        action: Script
        object_path: For jj = 2 to actDetailsRow - 1
    - step:
        id: '259'
        action: Script
        object_path: fn_ScrollToBottom
    - step:
        id: '260'
        action: Script
        object_path: projNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 7)
    - step:
        id: '261'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 6)
    - step:
        id: '262'
        action: Script
        object_path: '''Print "JJ: " & jj'
    - step:
        id: '263'
        action: Script
        object_path: '''Print "Project: " & projNum'
    - step:
        id: '264'
        action: Script
        object_path: '''Print "Order: "& ordNum'
    - step:
        id: '265'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '266'
        action: Script
        object_path: contents = jj & "," & projNum & "," & ordNum
    - step:
        id: '267'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '268'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '269'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '270'
        object_path: f
        action: Close
    - step:
        id: '271'
        action: Script
        object_path: Else
    - step:
        id: '272'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '273'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '274'
        object_path: textFile
        action: Close
    - step:
        id: '275'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '276'
        action: Script
        object_path: End If
    - step:
        id: '277'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '278'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '279'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '280'
        action: Script
        object_path: If inStr(ordNum,",") Then
    - step:
        id: '281'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '282'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '283'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '284'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '285'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Multiple order numbers found in single row for Project
          "&projNum&" Order: "&ordNum'
    - step:
        id: '286'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '287'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '288'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '289'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '290'
        object_path: MyEmail
        action: Send
    - step:
        id: '291'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '292'
        action: Script
        object_path: ElseIf projNum <> "" and len(ordNum) <> 9 Then
    - step:
        id: '293'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '294'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '295'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '296'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '297'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Incomplete order number found for Project "&projNum&" Order:
          "&ordNum'
    - step:
        id: '298'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '299'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '300'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '301'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '302'
        object_path: MyEmail
        action: Send
    - step:
        id: '303'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '304'
        action: Script
        object_path: ElseIf projNum <> "" Then
    - step:
        id: '305'
        action: Script
        object_path: Flag = True
    - step:
        id: '306'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(jj, 6, "WebElement",
          0)
    - step:
        id: '307'
        object_path: rowObj
        action: Click
    - step:
        id: '308'
        action: Script
        object_path: Flag = True
    - step:
        id: '309'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(jj, 6, "WebElement",
          0)
    - step:
        id: '310'
        object_path: rowObj
        action: Click
    - step:
        id: '311'
        action: Script
        object_path: orderStatus = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(jj, 12)
    - step:
        id: '312'
        action: Script
        object_path: emailContent = Empty
    - step:
        id: '313'
        action: Script
        object_path: plannedProjectBudget = 0
    - step:
        id: '314'
        action: Script
        object_path: labourPlannedBudget = 0
    - step:
        id: '315'
        action: Script
        object_path: labourPlannedHRS = 0
    - step:
        id: '316'
        action: Script
        object_path: labourPlannedHRS1 = 0
    - step:
        id: '317'
        action: Script
        object_path: materialPlannedbudget = 0
    - step:
        id: '318'
        action: Script
        object_path: servicesPlannedbudget = 0
    - step:
        id: '319'
        action: Script
        object_path: '''*********************************************************SAP
          STARTS HERE***************************************************************************************'
    - step:
        id: '320'
        action: Script
        object_path: '''PLANNED PROJECT BUDGET'
    - step:
        id: '321'
        action: Script
        object_path: '''go to transaction S_ALR_87013534, set up form, and open project'
    - step:
        id: '322'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '323'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '324'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '325'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '326'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '327'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(3) Then
    - step:
        id: '328'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '329'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '330'
        action: Script
        object_path: End If
    - step:
        id: '331'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '332'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '333'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '334'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '335'
        action: Script
        object_path: End If
    - step:
        id: '336'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '337'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projNum
    - step:
        id: '338'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '339'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '340'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '341'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '342'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '343'
        action: Script
        object_path: set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '344'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projNum,"PRJ "&projNum'
    - step:
        id: '345'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '346'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projNum'
    - step:
        id: '347'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '348'
        action: Script
        object_path: rowContainingOrdNum = findBudget(tree, ordNum)
    - step:
        id: '349'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '350'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '351'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '352'
        action: Script
        object_path: If WBSrow <> "" Then
    - step:
        id: '353'
        action: Script
        object_path: plannedProjectBudget = tree.Object.GetItemText(tree.Object.GetAllNodeKeys(WBSrow),
          colKey_plan1)
    - step:
        id: '354'
        action: Script
        object_path: End If
    - step:
        id: '355'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '356'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '357'
        action: Script
        object_path: plannedProjectBudget = "0"
    - step:
        id: '358'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project planned budget, Labour planned budget, Material
          planned budget or Services planned budget could not be extracted). "
    - step:
        id: '359'
        action: Script
        object_path: Else
    - step:
        id: '360'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '361'
        action: Script
        object_path: plannedProjectBudget = "0"
    - step:
        id: '362'
        action: Script
        object_path: emailContent = emailContent& "Multiple order numbers associated
          with WBS element (Project planned budget, Labour planned budget, Material
          planned budget or Services planned budget could not be extracted). "
    - step:
        id: '363'
        action: Script
        object_path: End If
    - step:
        id: '364'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '365'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '366'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '367'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(3) Then
    - step:
        id: '368'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '369'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '370'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '371'
        action: Script
        object_path: End If
    - step:
        id: '372'
        action: Script
        object_path: '''PLANNED LABOUR, MATERIALS AND SERVICES'
    - step:
        id: '373'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '374'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '375'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '376'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '377'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '378'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '379'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '380'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '381'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '382'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '383'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '384'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '385'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '386'
        action: Script
        object_path: Else
    - step:
        id: '387'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '388'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '389'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '390'
        action: Script
        object_path: Found = 0
    - step:
        id: '391'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '392'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '393'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '394'
        action: Script
        object_path: Found = 1
    - step:
        id: '395'
        action: Script
        object_path: Exit For
    - step:
        id: '396'
        action: Script
        object_path: End if
    - step:
        id: '397'
        action: Script
        object_path: Next
    - step:
        id: '398'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '399'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '400'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '401'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '402'
        action: Script
        object_path: Lplannedbudget = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '403'
        action: Script
        object_path: If Lplannedbudget <> "" Then
    - step:
        id: '404'
        action: Script
        object_path: Lplannedbudget = CDbl(Lplannedbudget)
    - step:
        id: '405'
        action: Script
        object_path: labourPlannedBudget = labourPlannedBudget + Lplannedbudget
    - step:
        id: '406'
        action: Script
        object_path: End If
    - step:
        id: '407'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '408'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '409'
        action: Script
        object_path: Else
    - step:
        id: '410'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '411'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '412'
        action: Script
        object_path: End  If
    - step:
        id: '413'
        action: Script
        object_path: End  If
    - step:
        id: '414'
        action: Script
        object_path: Next
    - step:
        id: '415'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '416'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '417'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '418'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '419'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '420'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '421'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '422'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '423'
        action: Script
        object_path: Else
    - step:
        id: '424'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '425'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '426'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '427'
        action: Script
        object_path: Found = 0
    - step:
        id: '428'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '429'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '430'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '431'
        action: Script
        object_path: Found = 1
    - step:
        id: '432'
        action: Script
        object_path: Exit For
    - step:
        id: '433'
        action: Script
        object_path: End if
    - step:
        id: '434'
        action: Script
        object_path: Next
    - step:
        id: '435'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '436'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '437'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '438'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '439'
        action: Script
        object_path: Mplannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '440'
        action: Script
        object_path: If Mplannedbudget <> "" Then
    - step:
        id: '441'
        action: Script
        object_path: Mplannedbudget = CDbl(Mplannedbudget)
    - step:
        id: '442'
        action: Script
        object_path: materialPlannedbudget = materialPlannedbudget + Mplannedbudget
    - step:
        id: '443'
        action: Script
        object_path: End If
    - step:
        id: '444'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '445'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '446'
        action: Script
        object_path: Else
    - step:
        id: '447'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '448'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '449'
        action: Script
        object_path: End If
    - step:
        id: '450'
        action: Script
        object_path: End If
    - step:
        id: '451'
        action: Script
        object_path: Next
    - step:
        id: '452'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '453'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '454'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '455'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '456'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '457'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '458'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '459'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '460'
        action: Script
        object_path: Else
    - step:
        id: '461'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '462'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '463'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '464'
        action: Script
        object_path: Found = 0
    - step:
        id: '465'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '466'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '467'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '468'
        action: Script
        object_path: Found = 1
    - step:
        id: '469'
        action: Script
        object_path: Exit For
    - step:
        id: '470'
        action: Script
        object_path: End if
    - step:
        id: '471'
        action: Script
        object_path: Next
    - step:
        id: '472'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '473'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '474'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '475'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '476'
        action: Script
        object_path: Splannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '477'
        action: Script
        object_path: If Splannedbudget <> "" Then
    - step:
        id: '478'
        action: Script
        object_path: Splannedbudget = CDbl(Splannedbudget)
    - step:
        id: '479'
        action: Script
        object_path: servicesPlannedbudget = servicesPlannedbudget + Splannedbudget
    - step:
        id: '480'
        action: Script
        object_path: End If
    - step:
        id: '481'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '482'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '483'
        action: Script
        object_path: Else
    - step:
        id: '484'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '485'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '486'
        action: Script
        object_path: End  If
    - step:
        id: '487'
        action: Script
        object_path: End  If
    - step:
        id: '488'
        action: Script
        object_path: Next
    - step:
        id: '489'
        action: Script
        object_path: If labourPlannedBudget = 0 Then
    - step:
        id: '490'
        action: Script
        object_path: emailContent = emailContent& "Labour planned budget not found.
          "
    - step:
        id: '491'
        action: Script
        object_path: End If
    - step:
        id: '492'
        action: Script
        object_path: If materialPlannedbudget = 0 Then
    - step:
        id: '493'
        action: Script
        object_path: emailContent = emailContent& "Material planned budget not found.
          "
    - step:
        id: '494'
        action: Script
        object_path: End If
    - step:
        id: '495'
        action: Script
        object_path: If servicesPlannedbudget = 0 Then
    - step:
        id: '496'
        action: Script
        object_path: emailContent = emailContent& "Services planned budget not found.
          "
    - step:
        id: '497'
        action: Script
        object_path: End If
    - step:
        id: '498'
        action: Script
        object_path: End  If
    - step:
        id: '499'
        action: Script
        object_path: '''LABOUR PLANNED HOURS'
    - step:
        id: '500'
        action: Script
        object_path: '''extract labour actual and planned hours from only INSU SOPL
          EXSV control keys'
    - step:
        id: '501'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '502'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '503'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: ordNum
    - step:
        id: '504'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '505'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '506'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '507'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '508'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '509'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '510'
        action: Script
        object_path: If controlKeyValue = "INSU" Then
    - step:
        id: '511'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '512'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '513'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '514'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '515'
        action: Script
        object_path: ElseIf controlKeyValue = "SOPL" Then
    - step:
        id: '516'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '517'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '518'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '519'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '520'
        action: Script
        object_path: ElseIf controlKeyValue = "EXSV"  Then
    - step:
        id: '521'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '522'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '523'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '524'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '525'
        action: Script
        object_path: End If
    - step:
        id: '526'
        action: Script
        object_path: End  If
    - step:
        id: '527'
        action: Script
        object_path: Next
    - step:
        id: '528'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '529'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) Then
    - step:
        id: '530'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '531'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '532'
        action: Script
        object_path: Else
    - step:
        id: '533'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '534'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '535'
        action: Script
        object_path: End If
    - step:
        id: '536'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '537'
        action: Script
        object_path: '''*********************************************************SAP
          ENDS HERE***************************************************************************************'
    - step:
        id: '538'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '539'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '540'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '541'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,9,"WebElement",0)
        action: Click
    - step:
        id: '542'
        action: Script
        object_path: '''input planned project budget'
    - step:
        id: '543'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '544'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,9,"WebElement",0)
        action: DoubleClick
    - step:
        id: '545'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '546'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: plannedProjectBudget
    - step:
        id: '547'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '548'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '549'
        action: Script
        object_path: '''input planned total hours'
    - step:
        id: '550'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '551'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(jj,11,"WebElement",0)
        action: DoubleClick
    - step:
        id: '552'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '553'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: Round(labourPlannedHRS)
    - step:
        id: '554'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '555'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '556'
        action: Script
        object_path: '''save'
    - step:
        id: '557'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '558'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '559'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '560'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '561'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '562'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '563'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '564'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '565'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '566'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '567'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '568'
        action: Script
        object_path: End If
    - step:
        id: '569'
        action: Script
        object_path: End If
    - step:
        id: '570'
        action: Script
        object_path: '''expand bottom dock'
    - step:
        id: '571'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '572'
        action: Script
        object_path: If ExpandCollapseDock = "Expand Dock" Then
    - step:
        id: '573'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '574'
        action: Script
        object_path: End If
    - step:
        id: '575'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '576'
        action: Script
        object_path: ''' Open Assignments tab, if enabled and visible'
    - step:
        id: '577'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").Link("Assignments").Object.disabled = false Then
    - step:
        id: '578'
        action: Script
        object_path: assignmentVis = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("Assignments").GetROProperty("visible")
    - step:
        id: '579'
        action: Script
        object_path: If assignmentVis = True Then
    - step:
        id: '580'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments")
        action: Click
    - step:
        id: '581'
        action: Script
        object_path: '''use functions to add resources and input extractions into
          p6'
    - step:
        id: '582'
        action: Script
        object_path: Call AddLabourResource(labourPlannedHRS, labourPlannedBudget)
    - step:
        id: '583'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '584'
        action: Script
        object_path: Call AddMaterialResource(materialPlannedbudget)
    - step:
        id: '585'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '586'
        action: Script
        object_path: Call AddServicesResource(servicesPlannedbudget)
    - step:
        id: '587'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '588'
        action: Script
        object_path: "'\t\t\t\t\t\t'save"
    - step:
        id: '589'
        action: Script
        object_path: "'\t\t\t\t\t\tIf Browser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Object.disabled = false\
          \ Then"
    - step:
        id: '590'
        action: Script
        object_path: "'\t\t\t\t\t\t\tsaveVis = Browser(\"Oracle Primavera P6 EPPM\"\
          ).Page(\"Primavera P6 - Activities\").WebButton(\"Save\").GetROProperty(\"\
          visible\")"
    - step:
        id: '591'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf saveVis = True Then"
    - step:
        id: '592'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tBrowser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Click"
    - step:
        id: '593'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '594'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tSet mySendKeys = CreateObject(\"WScript.Shell\"\
          )"
    - step:
        id: '595'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tmySendKeys.SendKeys \"{F5}\""
    - step:
        id: '596'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tSet mySendKeys = NOTHING"
    - step:
        id: '597'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tWait 30"
    - step:
        id: '598'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '599'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '600'
        action: Script
        object_path: 'Else '
        comment: not visible
    - step:
        id: '601'
        action: Script
        object_path: 'emailContent = emailContent& "Assignments tab not visible: Activity
          Type is not Level of Effort. "'
    - step:
        id: '602'
        action: Script
        object_path: End If
    - step:
        id: '603'
        action: Script
        object_path: End If
    - step:
        id: '604'
        action: Script
        object_path: '''send email to team about project data'
    - step:
        id: '605'
        action: Script
        object_path: If emailContent = Empty Then
    - step:
        id: '606'
        action: Script
        object_path: emailContent = "No issues found."
    - step:
        id: '607'
        action: Script
        object_path: End If
    - step:
        id: '608'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '609'
        object_path: MyEmail
        action: Subject
        args: = "Project "&projNum&" Planned Values Automation Update"
    - step:
        id: '610'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '611'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '612'
        object_path: MyEmail
        action: TextBody
        args: '= "PROJECT "&projNum&" ORDER "&ordNum&": "&vbNewLine&"COMMENTS: "&emailContent'
    - step:
        id: '613'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '614'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '615'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '616'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '617'
        object_path: MyEmail
        action: Send
    - step:
        id: '618'
        action: Script
        object_path: '''collapse bottom dock'
    - step:
        id: '619'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '620'
        action: Script
        object_path: If ExpandCollapseDock = "Collapse Dock" Then
    - step:
        id: '621'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '622'
        action: Script
        object_path: End If
    - step:
        id: '623'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '624'
        action: Script
        object_path: '''scroll up and down again to reposition table correctly'
    - step:
        id: '625'
        action: Script
        object_path: Call ScrollTablePosition(counter,actDetailsRow)
    - step:
        id: '626'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '627'
        action: Script
        object_path: contents = "$" & plannedProjectBudget & "," & labourPlannedHRS
          & "hrs,$" & labourPlannedBudget & ",$" & materialPlannedbudget & ",$" &
          servicesPlannedbudget
    - step:
        id: '628'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '629'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '630'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '631'
        object_path: f
        action: Close
    - step:
        id: '632'
        action: Script
        object_path: Else
    - step:
        id: '633'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '634'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '635'
        object_path: textFile
        action: Close
    - step:
        id: '636'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '637'
        action: Script
        object_path: End If
    - step:
        id: '638'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '639'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '640'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '641'
        action: Script
        object_path: End If
    - step:
        id: '642'
        action: Script
        object_path: Next
    - step:
        id: '643'
        action: Script
        object_path: Exit For
    - step:
        id: '644'
        action: Script
        object_path: Else
    - step:
        id: '645'
        action: Script
        object_path: If j = 2 And counter > 3 Then
    - step:
        id: '646'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '647'
        action: Script
        object_path: divisor = actDetailsRow
    - step:
        id: '648'
        action: Script
        object_path: pgdnValue = Int(cnt/divisor)
    - step:
        id: '649'
        action: Script
        object_path: '''Print "pgdnValue from line 285: " & pgdnValue'
    - step:
        id: '650'
        action: Script
        object_path: '''Print "Divisor: " & divisor'
    - step:
        id: '651'
        action: Script
        object_path: '''print "Counter: " & counter'
    - step:
        id: '652'
        action: Script
        object_path: '''print "cnt: " & cnt'
    - step:
        id: '653'
        action: Script
        object_path: divisor = EMPTY
    - step:
        id: '654'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '655'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '656'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '657'
        action: Script
        object_path: For t = 1 To pgdnValue - 1
    - step:
        id: '658'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '659'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '660'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '661'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '662'
        action: Script
        object_path: Next
    - step:
        id: '663'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '664'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(actDetailsRow,
          7)
    - step:
        id: '665'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(actDetailsRow,
          6)
    - step:
        id: '666'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '667'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '668'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '669'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '670'
        action: Script
        object_path: Else
    - step:
        id: '671'
        action: Script
        object_path: If j <> 1 And Flag = True Then
    - step:
        id: '672'
        action: Script
        object_path: pgdnValue = EMPTY
    - step:
        id: '673'
        action: Script
        object_path: divisor = actDetailsRow
    - step:
        id: '674'
        action: Script
        object_path: If noScroll Then
    - step:
        id: '675'
        action: Script
        object_path: pgdnValue = Int(cnt/divisor)
    - step:
        id: '676'
        action: Script
        object_path: End If
    - step:
        id: '677'
        action: Script
        object_path: divisor = EMPTY
    - step:
        id: '678'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '679'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '680'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '681'
        action: Script
        object_path: If counter <= actDetailsRow And noScroll Then
    - step:
        id: '682'
        action: Script
        object_path: pgdnValue = pgdnValue - 1
    - step:
        id: '683'
        action: Script
        object_path: End If
    - step:
        id: '684'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '685'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '686'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '687'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '688'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '689'
        action: Script
        object_path: Next
    - step:
        id: '690'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 7)
    - step:
        id: '691'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 6)
    - step:
        id: '692'
        action: Script
        object_path: Flag = False
    - step:
        id: '693'
        action: Script
        object_path: ElseIf j<> 1 Then
    - step:
        id: '694'
        action: Script
        object_path: projNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 7)
    - step:
        id: '695'
        action: Script
        object_path: ordNumCheck = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j-1, 6)
    - step:
        id: '696'
        action: Script
        object_path: End If
    - step:
        id: '697'
        action: Script
        object_path: End If
    - step:
        id: '698'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '699'
        action: Script
        object_path: If j <> 1 and Not(projNumCheck =  projNum And ordNumCheck = ordNum)
          Then
    - step:
        id: '700'
        object_path: Reporter
        action: ReportEvent
        args: 'micFail, "Checking previous row is having correct Project Number: "
          & projNum & " and Order Number: " & ordNum,"Didn''t find the match; hence
          exiting this execution"'
    - step:
        id: '701'
        object_path: Reporter
        action: ReportEvent
        args: 'micWarning, "Found previous Record has got Project Number: " & projNumCheck
          & " and Order Number: " & ordNumCheck,"Not pointing to correct row in the
          activity table"'
    - step:
        id: '702'
        action: Script
        object_path: '''send email to team'
    - step:
        id: '703'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '704'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '705'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '706'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,DL_ITAutomationteam@sapowernetworks.com.au"
    - step:
        id: '707'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Previous row check failed, process exited. Expected: "&projNumCheck&"
          "&ordNumCheck&", Actual: "&projNum&" "&ordNum'
    - step:
        id: '708'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '709'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '710'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '711'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '712'
        object_path: MyEmail
        action: Send
    - step:
        id: '713'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '714'
        action: Script
        object_path: ExitTest
    - step:
        id: '715'
        action: Script
        object_path: End If
    - step:
        id: '716'
        action: Script
        object_path: '''Print "Project_Prev: " & projNumCheck'
    - step:
        id: '717'
        action: Script
        object_path: '''Print "Order_Prev: " & ordNumCheck'
    - step:
        id: '718'
        action: Script
        object_path: projNumCheck = EMPTY
    - step:
        id: '719'
        action: Script
        object_path: ordNumCheck = EMPTY
    - step:
        id: '720'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '721'
        action: Script
        object_path: projNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 7)
    - step:
        id: '722'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 6)
    - step:
        id: '723'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '724'
        action: Script
        object_path: '''Print "J: " & j'
    - step:
        id: '725'
        action: Script
        object_path: '''Print "Project: " & projNum'
    - step:
        id: '726'
        action: Script
        object_path: '''Print "Order: " & ordNum'
    - step:
        id: '727'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '728'
        action: Script
        object_path: contents = j & "," & projNum & "," & ordNum
    - step:
        id: '729'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '730'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '731'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '732'
        object_path: f
        action: Close
    - step:
        id: '733'
        action: Script
        object_path: Else
    - step:
        id: '734'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '735'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '736'
        object_path: textFile
        action: Close
    - step:
        id: '737'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '738'
        action: Script
        object_path: End If
    - step:
        id: '739'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '740'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '741'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '742'
        action: Script
        object_path: If inStr(ordNum,",") Then
    - step:
        id: '743'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '744'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '745'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '746'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '747'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Multiple order numbers found in single row for Project
          "&projNum&" Order: "&ordNum'
    - step:
        id: '748'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '749'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '750'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '751'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '752'
        object_path: MyEmail
        action: Send
    - step:
        id: '753'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '754'
        action: Script
        object_path: ElseIf projNum <> "" and len(ordNum) <> 9 Then
    - step:
        id: '755'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '756'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '757'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '758'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au,Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '759'
        object_path: MyEmail
        action: TextBody
        args: '= "FAILURE: Incomplete order number found for Project "&projNum&" Order:
          "&ordNum'
    - step:
        id: '760'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '761'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '762'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '763'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '764'
        object_path: MyEmail
        action: Send
    - step:
        id: '765'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '766'
        action: Script
        object_path: ElseIf projNum <> "" Then
    - step:
        id: '767'
        action: Script
        object_path: Flag = True
    - step:
        id: '768'
        action: Script
        object_path: Set rowObj = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").ChildItem(j, 6, "WebElement",
          0)
    - step:
        id: '769'
        object_path: rowObj
        action: Click
    - step:
        id: '770'
        action: Script
        object_path: orderStatus = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 12)
    - step:
        id: '771'
        action: Script
        object_path: emailContent = Empty
    - step:
        id: '772'
        action: Script
        object_path: plannedProjectBudget = 0
    - step:
        id: '773'
        action: Script
        object_path: labourPlannedBudget = 0
    - step:
        id: '774'
        action: Script
        object_path: labourPlannedHRS = 0
    - step:
        id: '775'
        action: Script
        object_path: labourPlannedHRS1 = 0
    - step:
        id: '776'
        action: Script
        object_path: materialPlannedbudget = 0
    - step:
        id: '777'
        action: Script
        object_path: servicesPlannedbudget = 0
    - step:
        id: '778'
        action: Script
        object_path: '''***********************************************SAP STARTS
          HERE*****************************************************************'
    - step:
        id: '779'
        action: Script
        object_path: '''PLANNED PROJECT BUDGET'
    - step:
        id: '780'
        action: Script
        object_path: '''go to transaction S_ALR_87013534, set up form, and open project'
    - step:
        id: '781'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '782'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '783'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '784'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '785'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '786'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(3) Then
    - step:
        id: '787'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '788'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '789'
        action: Script
        object_path: End If
    - step:
        id: '790'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '791'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '792'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '793'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '794'
        action: Script
        object_path: End If
    - step:
        id: '795'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '796'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projNum
    - step:
        id: '797'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '798'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '799'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '800'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '801'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '802'
        action: Script
        object_path: set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '803'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projNum,"PRJ "&projNum'
    - step:
        id: '804'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '805'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projNum'
    - step:
        id: '806'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '807'
        action: Script
        object_path: rowContainingOrdNum = findBudget(tree, ordNum)
    - step:
        id: '808'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '809'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '810'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '811'
        action: Script
        object_path: If WBSrow <> "" Then
    - step:
        id: '812'
        action: Script
        object_path: plannedProjectBudget = tree.Object.GetItemText(tree.Object.GetAllNodeKeys(WBSrow),
          colKey_plan1)
    - step:
        id: '813'
        action: Script
        object_path: End If
    - step:
        id: '814'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '815'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '816'
        action: Script
        object_path: plannedProjectBudget = "0"
    - step:
        id: '817'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project planned budget, Labour planned budget, Material
          planned budget or Services planned budget could not be extracted). "
    - step:
        id: '818'
        action: Script
        object_path: Else
    - step:
        id: '819'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '820'
        action: Script
        object_path: plannedProjectBudget = "0"
    - step:
        id: '821'
        action: Script
        object_path: emailContent = emailContent& "Multiple order numbers associated
          with WBS element (Project planned budget, Labour planned budget, Material
          planned budget or Services planned budget could not be extracted). "
    - step:
        id: '822'
        action: Script
        object_path: End If
    - step:
        id: '823'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '824'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '825'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '826'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(3) Then
    - step:
        id: '827'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '828'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '829'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '830'
        action: Script
        object_path: End If
    - step:
        id: '831'
        action: Script
        object_path: '''PLANNED LABOUR, MATERIALS AND SERVICES'
    - step:
        id: '832'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '833'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '834'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '835'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '836'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '837'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '838'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '839'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '840'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '841'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '842'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '843'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '844'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '845'
        action: Script
        object_path: Else
    - step:
        id: '846'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '847'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '848'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '849'
        action: Script
        object_path: Found = 0
    - step:
        id: '850'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '851'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '852'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '853'
        action: Script
        object_path: Found = 1
    - step:
        id: '854'
        action: Script
        object_path: Exit For
    - step:
        id: '855'
        action: Script
        object_path: End if
    - step:
        id: '856'
        action: Script
        object_path: Next
    - step:
        id: '857'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '858'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '859'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '860'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '861'
        action: Script
        object_path: Lplannedbudget = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '862'
        action: Script
        object_path: If Lplannedbudget <> "" Then
    - step:
        id: '863'
        action: Script
        object_path: Lplannedbudget = CDbl(Lplannedbudget)
    - step:
        id: '864'
        action: Script
        object_path: labourPlannedBudget = labourPlannedBudget + Lplannedbudget
    - step:
        id: '865'
        action: Script
        object_path: End If
    - step:
        id: '866'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '867'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '868'
        action: Script
        object_path: Else
    - step:
        id: '869'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '870'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '871'
        action: Script
        object_path: End  If
    - step:
        id: '872'
        action: Script
        object_path: End  If
    - step:
        id: '873'
        action: Script
        object_path: Next
    - step:
        id: '874'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '875'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '876'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '877'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '878'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '879'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '880'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '881'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '882'
        action: Script
        object_path: Else
    - step:
        id: '883'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '884'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '885'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '886'
        action: Script
        object_path: Found = 0
    - step:
        id: '887'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '888'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '889'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '890'
        action: Script
        object_path: Found = 1
    - step:
        id: '891'
        action: Script
        object_path: Exit For
    - step:
        id: '892'
        action: Script
        object_path: End if
    - step:
        id: '893'
        action: Script
        object_path: Next
    - step:
        id: '894'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '895'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '896'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '897'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '898'
        action: Script
        object_path: Mplannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '899'
        action: Script
        object_path: If Mplannedbudget <> "" Then
    - step:
        id: '900'
        action: Script
        object_path: Mplannedbudget = CDbl(Mplannedbudget)
    - step:
        id: '901'
        action: Script
        object_path: materialPlannedbudget = materialPlannedbudget + Mplannedbudget
    - step:
        id: '902'
        action: Script
        object_path: End If
    - step:
        id: '903'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '904'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '905'
        action: Script
        object_path: Else
    - step:
        id: '906'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '907'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '908'
        action: Script
        object_path: End If
    - step:
        id: '909'
        action: Script
        object_path: End If
    - step:
        id: '910'
        action: Script
        object_path: Next
    - step:
        id: '911'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '912'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
    - step:
        id: '913'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '914'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '915'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '916'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '917'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(3) Then
    - step:
        id: '918'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '919'
        action: Script
        object_path: Else
    - step:
        id: '920'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '921'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '922'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '923'
        action: Script
        object_path: Found = 0
    - step:
        id: '924'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '925'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '926'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '927'
        action: Script
        object_path: Found = 1
    - step:
        id: '928'
        action: Script
        object_path: Exit For
    - step:
        id: '929'
        action: Script
        object_path: End if
    - step:
        id: '930'
        action: Script
        object_path: Next
    - step:
        id: '931'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '932'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '933'
        action: Script
        object_path: '''collapses table to only have totals row'
    - step:
        id: '934'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '935'
        action: Script
        object_path: Splannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '936'
        action: Script
        object_path: If Splannedbudget <> "" Then
    - step:
        id: '937'
        action: Script
        object_path: Splannedbudget = CDbl(Splannedbudget)
    - step:
        id: '938'
        action: Script
        object_path: servicesPlannedbudget = servicesPlannedbudget + Splannedbudget
    - step:
        id: '939'
        action: Script
        object_path: End If
    - step:
        id: '940'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '941'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '942'
        action: Script
        object_path: Else
    - step:
        id: '943'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '944'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '945'
        action: Script
        object_path: End  If
    - step:
        id: '946'
        action: Script
        object_path: End  If
    - step:
        id: '947'
        action: Script
        object_path: Next
    - step:
        id: '948'
        action: Script
        object_path: If labourPlannedBudget = 0 Then
    - step:
        id: '949'
        action: Script
        object_path: emailContent = emailContent& "Labour planned budget not found.
          "
    - step:
        id: '950'
        action: Script
        object_path: End If
    - step:
        id: '951'
        action: Script
        object_path: If materialPlannedbudget = 0 Then
    - step:
        id: '952'
        action: Script
        object_path: emailContent = emailContent& "Material planned budget not found.
          "
    - step:
        id: '953'
        action: Script
        object_path: End If
    - step:
        id: '954'
        action: Script
        object_path: If servicesPlannedbudget = 0 Then
    - step:
        id: '955'
        action: Script
        object_path: emailContent = emailContent& "Services planned budget not found.
          "
    - step:
        id: '956'
        action: Script
        object_path: End If
    - step:
        id: '957'
        action: Script
        object_path: End  If
    - step:
        id: '958'
        action: Script
        object_path: '''LABOUR PLANNED HOURS'
    - step:
        id: '959'
        action: Script
        object_path: '''extract labour actual and planned hours from only INSU SOPL
          EXSV control keys'
    - step:
        id: '960'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '961'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '962'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: ordNum
    - step:
        id: '963'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '964'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '965'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '966'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '967'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '968'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '969'
        action: Script
        object_path: If controlKeyValue = "INSU" Then
    - step:
        id: '970'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '971'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '972'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '973'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '974'
        action: Script
        object_path: ElseIf controlKeyValue = "SOPL" Then
    - step:
        id: '975'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '976'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '977'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '978'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '979'
        action: Script
        object_path: ElseIf controlKeyValue = "EXSV"  Then
    - step:
        id: '980'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '981'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '982'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '983'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '984'
        action: Script
        object_path: End If
    - step:
        id: '985'
        action: Script
        object_path: End  If
    - step:
        id: '986'
        action: Script
        object_path: Next
    - step:
        id: '987'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '988'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(3) Then
    - step:
        id: '989'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '990'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '991'
        action: Script
        object_path: Else
    - step:
        id: '992'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '993'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '994'
        action: Script
        object_path: End If
    - step:
        id: '995'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '996'
        action: Script
        object_path: '''************************************************************SAP
          ENDS HERE*********************************************************************'
    - step:
        id: '997'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '998'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '999'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '1000'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,9,"WebElement",0)
        action: Click
    - step:
        id: '1001'
        action: Script
        object_path: '''input planned project budget'
    - step:
        id: '1002'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '1003'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,9,"WebElement",0)
        action: DoubleClick
    - step:
        id: '1004'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1005'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: plannedProjectBudget
    - step:
        id: '1006'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '1007'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1008'
        action: Script
        object_path: '''input planned total hours'
    - step:
        id: '1009'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '1010'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(j,11,"WebElement",0)
        action: DoubleClick
    - step:
        id: '1011'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1012'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")
        action: Set
        args: Round(labourPlannedHRS)
    - step:
        id: '1013'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '1014'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1015'
        action: Script
        object_path: '''save'
    - step:
        id: '1016'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1017'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1018'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1019'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1020'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1021'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1022'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1023'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1024'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1025'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1026'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1027'
        action: Script
        object_path: End If
    - step:
        id: '1028'
        action: Script
        object_path: End If
    - step:
        id: '1029'
        action: Script
        object_path: '''expand bottom dock'
    - step:
        id: '1030'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '1031'
        action: Script
        object_path: If ExpandCollapseDock = "Expand Dock" Then
    - step:
        id: '1032'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '1033'
        action: Script
        object_path: End If
    - step:
        id: '1034'
        action: Script
        object_path: ''' Open Assignments tab, if enabled and visible'
    - step:
        id: '1035'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").Link("Assignments").Object.disabled = false Then
    - step:
        id: '1036'
        action: Script
        object_path: assignmentVis = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("Assignments").GetROProperty("visible")
    - step:
        id: '1037'
        action: Script
        object_path: If assignmentVis = True Then
    - step:
        id: '1038'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments")
        action: Click
    - step:
        id: '1039'
        action: Script
        object_path: '''use functions to add resources and input extractions into
          p6'
    - step:
        id: '1040'
        action: Script
        object_path: Call AddLabourResource(labourPlannedHRS, labourPlannedBudget)
    - step:
        id: '1041'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1042'
        action: Script
        object_path: Call AddMaterialResource(materialPlannedbudget)
    - step:
        id: '1043'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1044'
        action: Script
        object_path: Call AddServicesResource(servicesPlannedbudget)
    - step:
        id: '1045'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1046'
        action: Script
        object_path: '''save'
    - step:
        id: '1047'
        action: Script
        object_path: "'\t\t\t\t\tIf Browser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Object.disabled = false\
          \ Then"
    - step:
        id: '1048'
        action: Script
        object_path: "'\t\t\t\t\t\tsaveVis = Browser(\"Oracle Primavera P6 EPPM\"\
          ).Page(\"Primavera P6 - Activities\").WebButton(\"Save\").GetROProperty(\"\
          visible\")"
    - step:
        id: '1049'
        action: Script
        object_path: "'\t\t\t\t\t\tIf saveVis = True Then"
    - step:
        id: '1050'
        action: Script
        object_path: "'\t\t\t\t\t\t\tBrowser(\"Oracle Primavera P6 EPPM\").Page(\"\
          Primavera P6 - Activities\").WebButton(\"Save\").Click"
    - step:
        id: '1051'
        action: Script
        object_path: "'\t\t\t\t\t\t\tWait 30"
    - step:
        id: '1052'
        action: Script
        object_path: "'\t\t\t\t\t\t\tSet mySendKeys = CreateObject(\"WScript.Shell\"\
          )"
    - step:
        id: '1053'
        action: Script
        object_path: "'\t\t\t\t\t\t\tmySendKeys.SendKeys \"{F5}\""
    - step:
        id: '1054'
        action: Script
        object_path: "'\t\t\t\t\t\t\tSet mySendKeys = NOTHING"
    - step:
        id: '1055'
        action: Script
        object_path: "'\t\t\t\t\t\t\tWait 30"
    - step:
        id: '1056'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '1057'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '1058'
        action: Script
        object_path: 'Else '
        comment: not visible
    - step:
        id: '1059'
        action: Script
        object_path: 'emailContent = emailContent& "Assignments tab not visible: Activity
          Type is not Level of Effort. "'
    - step:
        id: '1060'
        action: Script
        object_path: End If
    - step:
        id: '1061'
        action: Script
        object_path: End If
    - step:
        id: '1062'
        action: Script
        object_path: '''send email to team about project data'
    - step:
        id: '1063'
        action: Script
        object_path: If emailContent = Empty Then
    - step:
        id: '1064'
        action: Script
        object_path: emailContent = "No issues found."
    - step:
        id: '1065'
        action: Script
        object_path: End If
    - step:
        id: '1066'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '1067'
        object_path: MyEmail
        action: Subject
        args: = "Project "&projNum&" Planned Values Automation Update"
    - step:
        id: '1068'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '1069'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '1070'
        object_path: MyEmail
        action: TextBody
        args: '= "PROJECT "&projNum&" ORDER "&ordNum&": "&vbNewLine&"COMMENTS: "&emailContent'
    - step:
        id: '1071'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '1072'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '1073'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '1074'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '1075'
        object_path: MyEmail
        action: Send
    - step:
        id: '1076'
        action: Script
        object_path: '''collapse bottom dock'
    - step:
        id: '1077'
        action: Script
        object_path: ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")
    - step:
        id: '1078'
        action: Script
        object_path: If ExpandCollapseDock = "Collapse Dock" Then
    - step:
        id: '1079'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")
        action: Click
    - step:
        id: '1080'
        action: Script
        object_path: End If
    - step:
        id: '1081'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1082'
        action: Script
        object_path: '''scroll up and down again to reposition table correctly'
    - step:
        id: '1083'
        action: Script
        object_path: Call ScrollTablePosition(counter,actDetailsRow)
    - step:
        id: '1084'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '1085'
        action: Script
        object_path: contents = "$" & plannedProjectBudget & "," & labourPlannedHRS
          & "hrs,$" & labourPlannedBudget & ",$" & materialPlannedbudget & ",$" &
          servicesPlannedbudget
    - step:
        id: '1086'
        action: Script
        object_path: If fso.FileExists("C:\temp\Primavera Planned Log "&today&".txt")
          Then
    - step:
        id: '1087'
        action: Script
        object_path: Set f = fso.openTextFile("C:\temp\Primavera Planned Log "&today&".txt",8)
    - step:
        id: '1088'
        object_path: f
        action: WriteLine
        args: (contents)
    - step:
        id: '1089'
        object_path: f
        action: Close
    - step:
        id: '1090'
        action: Script
        object_path: Else
    - step:
        id: '1091'
        action: Script
        object_path: Set textFile = fso.CreateTextFile("C:\temp\Primavera Planned
          Log "&today&".txt", true)
    - step:
        id: '1092'
        object_path: textFile
        action: WriteLine
        args: (contents)
    - step:
        id: '1093'
        object_path: textFile
        action: Close
    - step:
        id: '1094'
        action: Script
        object_path: Set textFile = nothing
    - step:
        id: '1095'
        action: Script
        object_path: End If
    - step:
        id: '1096'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '1097'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '1098'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '1099'
        action: Script
        object_path: End If
    - step:
        id: '1100'
        action: Script
        object_path: End If
    - step:
        id: '1101'
        action: Script
        object_path: If j Mod actDetailsRow = 0 And excelRow <> actDetailsRow And
          noScroll Then
    - step:
        id: '1102'
        action: Script
        object_path: iteration = iteration + 1
    - step:
        id: '1103'
        action: Script
        object_path: pgdnValue = Int(counter/(actDetailsRow - 1))
    - step:
        id: '1104'
        action: Script
        object_path: '''Print "pgdnValue from line 370: " & pgdnValue'
    - step:
        id: '1105'
        action: Script
        object_path: '''Function for scrolling to Top'
    - step:
        id: '1106'
        action: Script
        object_path: fn_ScrollToTop actDetailsRow
    - step:
        id: '1107'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1108'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '1109'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1110'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '1111'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1112'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1113'
        action: Script
        object_path: Next
    - step:
        id: '1114'
        action: Script
        object_path: j = 1
    - step:
        id: '1115'
        action: Script
        object_path: cnt = cnt + 2
    - step:
        id: '1116'
        action: Script
        object_path: End If
    - step:
        id: '1117'
        action: Script
        object_path: ordNum = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebTable("ActivityDetails").GetCellData(j, 6)
    - step:
        id: '1118'
        action: Script
        object_path: If counter = excelRow or ordNum = lastOrder Then
    - step:
        id: '1119'
        action: Script
        object_path: Exit For
    - step:
        id: '1120'
        action: Script
        object_path: End If
    - step:
        id: '1121'
        action: Script
        object_path: Next
    - step:
        id: '1122'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '1123'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '1124'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"UFT.Edge.NativeMessagingHost.exe"'
    - step:
        id: '1125'
        action: Script
        object_path: '''send email about completion of process'
    - step:
        id: '1126'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '1127'
        object_path: MyEmail
        action: Subject
        args: = "Primavera Automation Update"
    - step:
        id: '1128'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '1129'
        object_path: MyEmail
        action: To
        args: = "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '1130'
        object_path: MyEmail
        action: TextBody
        args: '= "UPDATE: Successful completion of process. All specified projects
          have been updated with Planned values. "'
    - step:
        id: '1131'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '1132'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '1133'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '1134'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '1135'
        object_path: MyEmail
        action: Send
    - step:
        id: '1136'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '1137'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1138'
        action: Script
        object_path: '''****************************************************************FUNCTIONS*********************************************************************'''
    - step:
        id: '1139'
        action: Script
        object_path: '''expand sap trees'
    - step:
        id: '1140'
        action: Script
        object_path: Function getColNameFromTitle(tree, title)
    - step:
        id: '1141'
        action: Script
        object_path: Set colNames = tree.Object.GetColumnNames
    - step:
        id: '1142'
        action: Script
        object_path: For i = 1 To (colNames.length-1)
    - step:
        id: '1143'
        action: Script
        object_path: selectedColTitle = tree.Object.GetColumnTitleFromName(colNames(i))
    - step:
        id: '1144'
        action: Script
        object_path: If selectedColTitle = title Then
    - step:
        id: '1145'
        action: Script
        object_path: getColNameFromTitle = colNames(i)
    - step:
        id: '1146'
        action: Script
        object_path: Exit For
    - step:
        id: '1147'
        action: Script
        object_path: End If
    - step:
        id: '1148'
        action: Script
        object_path: Next
    - step:
        id: '1149'
        action: Script
        object_path: End Function
    - step:
        id: '1150'
        action: Script
        object_path: '''find order number'
    - step:
        id: '1151'
        action: Script
        object_path: Function findBudget(tree, ordNum)
    - step:
        id: '1152'
        action: Script
        object_path: rowContainingOrdNum = Array()
    - step:
        id: '1153'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '1154'
        action: Script
        object_path: set columnKeys = tree.Object.GetColumnCol(columnNames(0))
    - step:
        id: '1155'
        action: Script
        object_path: For i = 1 To (columnKeys.length-1)
    - step:
        id: '1156'
        action: Script
        object_path: If InStr(columnKeys(i), ordNum) > 0 Then
    - step:
        id: '1157'
        action: Script
        object_path: If InStr(columnKeys(i-1), "WBS") > 0 Then
    - step:
        id: '1158'
        action: Script
        object_path: If InStr(columnKeys(i+1), "WBS") > 0 or InStr(columnKeys(i+1),
          "Result") > 0 Then
    - step:
        id: '1159'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '1160'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1161'
        action: Script
        object_path: AddItem rowContainingOrdNum, i-1
    - step:
        id: '1162'
        action: Script
        object_path: Exit For
    - step:
        id: '1163'
        action: Script
        object_path: ElseIf InStr(columnKeys(i+1), "ORD") > 0 Then
    - step:
        id: '1164'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '1165'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1166'
        action: Script
        object_path: End If
    - step:
        id: '1167'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-1), "ORD") > 0 Then
    - step:
        id: '1168'
        action: Script
        object_path: If InStr(columnKeys(i-2), "WBS") > 0 Then
    - step:
        id: '1169'
        action: Script
        object_path: WBSelement = columnKeys(i-2)
    - step:
        id: '1170'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1171'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-3), "WBS") > 0 Then
    - step:
        id: '1172'
        action: Script
        object_path: WBSelement = columnKeys(i-3)
    - step:
        id: '1173'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1174'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-4), "WBS") > 0 Then
    - step:
        id: '1175'
        action: Script
        object_path: WBSelement = columnKeys(i-4)
    - step:
        id: '1176'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '1177'
        action: Script
        object_path: End If
    - step:
        id: '1178'
        action: Script
        object_path: End If
    - step:
        id: '1179'
        action: Script
        object_path: End If
    - step:
        id: '1180'
        action: Script
        object_path: Next
    - step:
        id: '1181'
        action: Script
        object_path: findBudget = rowContainingOrdNum
    - step:
        id: '1182'
        action: Script
        object_path: End Function
    - step:
        id: '1183'
        action: Script
        object_path: Function AddItem(arr, val)
    - step:
        id: '1184'
        action: Script
        object_path: ReDim Preserve arr(UBound(arr) + 1)
    - step:
        id: '1185'
        action: Script
        object_path: arr(UBound(arr)) = val
    - step:
        id: '1186'
        action: Script
        object_path: AddItem = arr
    - step:
        id: '1187'
        action: Script
        object_path: End Function
    - step:
        id: '1188'
        action: Script
        object_path: '''add labour resource'
    - step:
        id: '1189'
        action: Script
        object_path: Function AddLabourResource(labourPlannedHRS,labourPlannedBudget)
    - step:
        id: '1190'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1191'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1192'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1193'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1194'
        action: Script
        object_path: found = false
    - step:
        id: '1195'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1196'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1197'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1198'
        action: Script
        object_path: '''resource found exit loop'
    - step:
        id: '1199'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '1200'
        action: Script
        object_path: found = true
    - step:
        id: '1201'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '1202'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1203'
        object_path: labourResource
        action: Click
    - step:
        id: '1204'
        action: Script
        object_path: Exit For
    - step:
        id: '1205'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1206'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1207'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1208'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1209'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1210'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1211'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1212'
        action: Script
        object_path: Exit For
    - step:
        id: '1213'
        action: Script
        object_path: End If
    - step:
        id: '1214'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1215'
        action: Script
        object_path: w = 1
    - step:
        id: '1216'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1217'
        action: Script
        object_path: Exit For
    - step:
        id: '1218'
        action: Script
        object_path: End If
    - step:
        id: '1219'
        action: Script
        object_path: End If
    - step:
        id: '1220'
        action: Script
        object_path: Next
    - step:
        id: '1221'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1222'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1223'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1224'
        action: Script
        object_path: Call AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)
    - step:
        id: '1225'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1226'
        action: Script
        object_path: Else
    - step:
        id: '1227'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1228'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1229'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1230'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1231'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Labour Resource"'
    - step:
        id: '1232'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1233'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1234'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1235'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Labour ","title:=Labour","index:=0")
        action: Click
    - step:
        id: '1236'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1237'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1238'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1239'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1240'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '1241'
        action: Script
        object_path: End If
    - step:
        id: '1242'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1243'
        action: Script
        object_path: Else
    - step:
        id: '1244'
        action: Script
        object_path: labourResourceAdded = False
    - step:
        id: '1245'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1246'
        action: Script
        object_path: emailContent = emailContent& "Labour resource could not be found.
          "
    - step:
        id: '1247'
        action: Script
        object_path: End If
    - step:
        id: '1248'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1249'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1250'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1251'
        action: Script
        object_path: found = false
    - step:
        id: '1252'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1253'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1254'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1255'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1256'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '1257'
        action: Script
        object_path: found = true
    - step:
        id: '1258'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '1259'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1260'
        object_path: labourResource
        action: Click
    - step:
        id: '1261'
        action: Script
        object_path: Exit For
    - step:
        id: '1262'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1263'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1264'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1265'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1266'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1267'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1268'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1269'
        action: Script
        object_path: Exit For
    - step:
        id: '1270'
        action: Script
        object_path: End If
    - step:
        id: '1271'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1272'
        action: Script
        object_path: w = 1
    - step:
        id: '1273'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1274'
        action: Script
        object_path: Exit For
    - step:
        id: '1275'
        action: Script
        object_path: End If
    - step:
        id: '1276'
        action: Script
        object_path: End If
    - step:
        id: '1277'
        action: Script
        object_path: Next
    - step:
        id: '1278'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1279'
        action: Script
        object_path: '''add values'
    - step:
        id: '1280'
        action: Script
        object_path: Call AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)
    - step:
        id: '1281'
        action: Script
        object_path: End If
    - step:
        id: '1282'
        action: Script
        object_path: '''save'
    - step:
        id: '1283'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1284'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1285'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1286'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1287'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1288'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1289'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1290'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1291'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1292'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1293'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1294'
        action: Script
        object_path: End If
    - step:
        id: '1295'
        action: Script
        object_path: End If
    - step:
        id: '1296'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1297'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1298'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1299'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1300'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1301'
        action: Script
        object_path: Next
    - step:
        id: '1302'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1303'
        action: Script
        object_path: End Function
    - step:
        id: '1304'
        action: Script
        object_path: '''add material resource'
    - step:
        id: '1305'
        action: Script
        object_path: Function AddMaterialResource(materialPlannedBudget)
    - step:
        id: '1306'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1307'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1308'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1309'
        action: Script
        object_path: found = false
    - step:
        id: '1310'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1311'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1312'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1313'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1314'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '1315'
        action: Script
        object_path: found = true
    - step:
        id: '1316'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '1317'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1318'
        object_path: materialResource
        action: Click
    - step:
        id: '1319'
        action: Script
        object_path: Exit For
    - step:
        id: '1320'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1321'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1322'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1323'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1324'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1325'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1326'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1327'
        action: Script
        object_path: Exit For
    - step:
        id: '1328'
        action: Script
        object_path: End If
    - step:
        id: '1329'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1330'
        action: Script
        object_path: w = 1
    - step:
        id: '1331'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1332'
        action: Script
        object_path: Exit For
    - step:
        id: '1333'
        action: Script
        object_path: End If
    - step:
        id: '1334'
        action: Script
        object_path: End If
    - step:
        id: '1335'
        action: Script
        object_path: Next
    - step:
        id: '1336'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1337'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1338'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1339'
        action: Script
        object_path: Call AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)
    - step:
        id: '1340'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1341'
        action: Script
        object_path: Else
    - step:
        id: '1342'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1343'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1344'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1345'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1346'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Material Resource"'
    - step:
        id: '1347'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1348'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1349'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1350'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Material ","title:=Material","index:=0")
        action: Click
    - step:
        id: '1351'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1352'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1353'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1354'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1355'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
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
        object_path: Else
    - step:
        id: '1359'
        action: Script
        object_path: materialResourceAdded = False
    - step:
        id: '1360'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1361'
        action: Script
        object_path: emailContent = emailContent& "Material resource could not be
          found. "
    - step:
        id: '1362'
        action: Script
        object_path: End If
    - step:
        id: '1363'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1364'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1365'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1366'
        action: Script
        object_path: found = false
    - step:
        id: '1367'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1368'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1369'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1370'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1371'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '1372'
        action: Script
        object_path: found = true
    - step:
        id: '1373'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '1374'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1375'
        object_path: materialResource
        action: Click
    - step:
        id: '1376'
        action: Script
        object_path: Exit For
    - step:
        id: '1377'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1378'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1379'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1380'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1381'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1382'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1383'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1384'
        action: Script
        object_path: Exit For
    - step:
        id: '1385'
        action: Script
        object_path: End If
    - step:
        id: '1386'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1387'
        action: Script
        object_path: w = 1
    - step:
        id: '1388'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1389'
        action: Script
        object_path: Exit For
    - step:
        id: '1390'
        action: Script
        object_path: End If
    - step:
        id: '1391'
        action: Script
        object_path: End If
    - step:
        id: '1392'
        action: Script
        object_path: Next
    - step:
        id: '1393'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1394'
        action: Script
        object_path: '''add values'
    - step:
        id: '1395'
        action: Script
        object_path: Call AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)
    - step:
        id: '1396'
        action: Script
        object_path: End If
    - step:
        id: '1397'
        action: Script
        object_path: '''save'
    - step:
        id: '1398'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1399'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1400'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1401'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1402'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1403'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1404'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1405'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1406'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1407'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1408'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1409'
        action: Script
        object_path: End If
    - step:
        id: '1410'
        action: Script
        object_path: End If
    - step:
        id: '1411'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1412'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1413'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1414'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1415'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1416'
        action: Script
        object_path: Next
    - step:
        id: '1417'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1418'
        action: Script
        object_path: End Function
    - step:
        id: '1419'
        action: Script
        object_path: '''add services resource'
    - step:
        id: '1420'
        action: Script
        object_path: Function AddServicesResource(servicesPlannedBudget)
    - step:
        id: '1421'
        action: Script
        object_path: scrollcounter2 = 0
    - step:
        id: '1422'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1423'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1424'
        action: Script
        object_path: found = false
    - step:
        id: '1425'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1426'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1427'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1428'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1429'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '1430'
        action: Script
        object_path: found = true
    - step:
        id: '1431'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '1432'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1433'
        object_path: servicesResource
        action: Click
    - step:
        id: '1434'
        action: Script
        object_path: Exit For
    - step:
        id: '1435'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1436'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1437'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1438'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1439'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1440'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1441'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1442'
        action: Script
        object_path: Exit For
    - step:
        id: '1443'
        action: Script
        object_path: End If
    - step:
        id: '1444'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1445'
        action: Script
        object_path: w = 1
    - step:
        id: '1446'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1447'
        action: Script
        object_path: Exit For
    - step:
        id: '1448'
        action: Script
        object_path: End If
    - step:
        id: '1449'
        action: Script
        object_path: End If
    - step:
        id: '1450'
        action: Script
        object_path: Next
    - step:
        id: '1451'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1452'
        action: Script
        object_path: '''resource found, add values'
    - step:
        id: '1453'
        action: Script
        object_path: If found = true Then
    - step:
        id: '1454'
        action: Script
        object_path: Call AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)
    - step:
        id: '1455'
        action: Script
        object_path: '''add resource'
    - step:
        id: '1456'
        action: Script
        object_path: Else
    - step:
        id: '1457'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")
        action: Click
    - step:
        id: '1458'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1459'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")
        action: Click
    - step:
        id: '1460'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1461'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")
        action: Set
        args: '"Services Resource"'
    - step:
        id: '1462'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1463'
        action: Script
        object_path: noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")
    - step:
        id: '1464'
        action: Script
        object_path: If noResult = False Then
    - step:
        id: '1465'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html
          tag:=DIV","innertext:=Services ","title:=Services","index:=0")
        action: Click
    - step:
        id: '1466'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1467'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")
        action: Click
    - step:
        id: '1468'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1469'
        action: Script
        object_path: If Browser("Primavera P6 - Activities").Page("Primavera P6 -
          Activities").WebElement("Same resource could not").Exist(3) Then
    - step:
        id: '1470'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")
        action: Click
    - step:
        id: '1471'
        action: Script
        object_path: End If
    - step:
        id: '1472'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1473'
        action: Script
        object_path: Else
    - step:
        id: '1474'
        action: Script
        object_path: servicesResourceAdded = False
    - step:
        id: '1475'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")
        action: Click
    - step:
        id: '1476'
        action: Script
        object_path: emailContent = emailContent& "Services resource could not be
          found. "
    - step:
        id: '1477'
        action: Script
        object_path: End If
    - step:
        id: '1478'
        action: Script
        object_path: '''find added resource'
    - step:
        id: '1479'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1480'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1481'
        action: Script
        object_path: found = false
    - step:
        id: '1482'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1483'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1484'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1485'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1486'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '1487'
        action: Script
        object_path: found = true
    - step:
        id: '1488'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '1489'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1490'
        object_path: servicesResource
        action: Click
    - step:
        id: '1491'
        action: Script
        object_path: Exit For
    - step:
        id: '1492'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1493'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1494'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1495'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1496'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1497'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1498'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1499'
        action: Script
        object_path: Exit For
    - step:
        id: '1500'
        action: Script
        object_path: End If
    - step:
        id: '1501'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1502'
        action: Script
        object_path: w = 1
    - step:
        id: '1503'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1504'
        action: Script
        object_path: Exit For
    - step:
        id: '1505'
        action: Script
        object_path: End If
    - step:
        id: '1506'
        action: Script
        object_path: End If
    - step:
        id: '1507'
        action: Script
        object_path: Next
    - step:
        id: '1508'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1509'
        action: Script
        object_path: '''add values'
    - step:
        id: '1510'
        action: Script
        object_path: Call AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)
    - step:
        id: '1511'
        action: Script
        object_path: End If
    - step:
        id: '1512'
        action: Script
        object_path: '''save'
    - step:
        id: '1513'
        action: Script
        object_path: If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled
          = false Then
    - step:
        id: '1514'
        action: Script
        object_path: saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera
          P6 - Activities").WebButton("Save").GetROProperty("visible")
    - step:
        id: '1515'
        action: Script
        object_path: If saveVis = True Then
    - step:
        id: '1516'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")
        action: Click
    - step:
        id: '1517'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1518'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1519'
        object_path: mySendKeys
        action: SendKeys
        args: '"{F5}"'
    - step:
        id: '1520'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '1521'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1522'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1523'
        action: Wait
        args: '"30"'
        default_args: '"1"'
    - step:
        id: '1524'
        action: Script
        object_path: End If
    - step:
        id: '1525'
        action: Script
        object_path: End If
    - step:
        id: '1526'
        action: Script
        object_path: '''scroll back up to top for next resource'
    - step:
        id: '1527'
        action: Script
        object_path: For scroll = 0 To scrollcounter2
    - step:
        id: '1528'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1529'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveDown)
    - step:
        id: '1530'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1531'
        action: Script
        object_path: Next
    - step:
        id: '1532'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1533'
        action: Script
        object_path: End Function
    - step:
        id: '1534'
        action: Script
        object_path: '''add labour values (called from within the AddLabourResource
          function)'
    - step:
        id: '1535'
        action: Script
        object_path: Function AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)
    - step:
        id: '1536'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1537'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1538'
        action: Script
        object_path: found = false
    - step:
        id: '1539'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1540'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1541'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1542'
        action: Script
        object_path: '''resource found exit loop'
    - step:
        id: '1543'
        action: Script
        object_path: If inStr(resourceRow,"Labour Resource") > 0 Then
    - step:
        id: '1544'
        action: Script
        object_path: found = true
    - step:
        id: '1545'
        action: Script
        object_path: labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour
          Resource")
    - step:
        id: '1546'
        action: Script
        object_path: Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1547'
        object_path: labourResource
        action: Click
    - step:
        id: '1548'
        action: Script
        object_path: Exit For
    - step:
        id: '1549'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1550'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1551'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1552'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1553'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1554'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1555'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1556'
        action: Script
        object_path: Exit For
    - step:
        id: '1557'
        action: Script
        object_path: End If
    - step:
        id: '1558'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1559'
        action: Script
        object_path: w = 1
    - step:
        id: '1560'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1561'
        action: Script
        object_path: Exit For
    - step:
        id: '1562'
        action: Script
        object_path: End If
    - step:
        id: '1563'
        action: Script
        object_path: End If
    - step:
        id: '1564'
        action: Script
        object_path: Next
    - step:
        id: '1565'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1566'
        action: Script
        object_path: Set labResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '1567'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1568'
        object_path: labResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '1569'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1570'
        action: Script
        object_path: Set labResWebCheckBox = Nothing
    - step:
        id: '1571'
        action: Script
        object_path: If labourPlannedHRS > 0 Then
    - step:
        id: '1572'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1573'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1574'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1575'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: labourPlannedHRS
    - step:
        id: '1576'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1577'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1578'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1579'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1580'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1581'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,6,
          "WebElement",0)
        action: Click
    - step:
        id: '1582'
        action: Script
        object_path: ''' Change remaining hours to planned hours if project hasn''t
          started'
    - step:
        id: '1583'
        action: Script
        object_path: If orderStatus = "Not Started" Then
    - step:
        id: '1584'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1585'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,6,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1586'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1587'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: labourPlannedHRS
    - step:
        id: '1588'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1589'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1590'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1591'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1592'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1593'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '1594'
        action: Script
        object_path: End If
    - step:
        id: '1595'
        action: Script
        object_path: End If
    - step:
        id: '1596'
        action: Script
        object_path: If labourPlannedBudget > 0 Then
    - step:
        id: '1597'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1598'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,9,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1599'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1600'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: labourPlannedBudget
    - step:
        id: '1601'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1602'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1603'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1604'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1605'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1606'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '1607'
        action: Script
        object_path: End If
    - step:
        id: '1608'
        action: Script
        object_path: End Function
    - step:
        id: '1609'
        action: Script
        object_path: '''add material values (called from within the AddMaterialResource
          function)'
    - step:
        id: '1610'
        action: Script
        object_path: Function AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)
    - step:
        id: '1611'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1612'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1613'
        action: Script
        object_path: found = false
    - step:
        id: '1614'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1615'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1616'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1617'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1618'
        action: Script
        object_path: If inStr(resourceRow,"Material Resource") > 0 Then
    - step:
        id: '1619'
        action: Script
        object_path: found = true
    - step:
        id: '1620'
        action: Script
        object_path: materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material
          Resource")
    - step:
        id: '1621'
        action: Script
        object_path: Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1622'
        object_path: materialResource
        action: Click
    - step:
        id: '1623'
        action: Script
        object_path: Exit For
    - step:
        id: '1624'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1625'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1626'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1627'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1628'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1629'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1630'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1631'
        action: Script
        object_path: Exit For
    - step:
        id: '1632'
        action: Script
        object_path: End If
    - step:
        id: '1633'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1634'
        action: Script
        object_path: w = 1
    - step:
        id: '1635'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1636'
        action: Script
        object_path: Exit For
    - step:
        id: '1637'
        action: Script
        object_path: End If
    - step:
        id: '1638'
        action: Script
        object_path: End If
    - step:
        id: '1639'
        action: Script
        object_path: Next
    - step:
        id: '1640'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1641'
        action: Script
        object_path: Set matResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '1642'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1643'
        object_path: matResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '1644'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1645'
        action: Script
        object_path: Set matResWebCheckBox = Nothing
    - step:
        id: '1646'
        action: Script
        object_path: If materialPlannedBudget > 0 Then
    - step:
        id: '1647'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1648'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,9,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1649'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1650'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: materialPlannedBudget
    - step:
        id: '1651'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1652'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1653'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1654'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1655'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1656'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '1657'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1658'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1659'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,4,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1660'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1661'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: materialPlannedBudget
    - step:
        id: '1662'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1663'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1664'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1665'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1666'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1667'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,9,
          "WebElement",0)
        action: Click
    - step:
        id: '1668'
        action: Script
        object_path: End If
    - step:
        id: '1669'
        action: Script
        object_path: End Function
    - step:
        id: '1670'
        action: Script
        object_path: '''add services values (called from within the AddServicesResource
          function)'
    - step:
        id: '1671'
        action: Script
        object_path: Function AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)
    - step:
        id: '1672'
        action: Script
        object_path: resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").RowCount
    - step:
        id: '1673'
        action: Script
        object_path: '''search table to find resource'
    - step:
        id: '1674'
        action: Script
        object_path: found = false
    - step:
        id: '1675'
        action: Script
        object_path: For w = 2 To resourceRowCount
    - step:
        id: '1676'
        action: Script
        object_path: resourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1677'
        action: Script
        object_path: 'If resourceRow <> "ERROR: The specified cell does not exist."
          Then'
    - step:
        id: '1678'
        action: Script
        object_path: '''resource found exit for'
    - step:
        id: '1679'
        action: Script
        object_path: If inStr(resourceRow,"Services Resource") > 0 Then
    - step:
        id: '1680'
        action: Script
        object_path: found = true
    - step:
        id: '1681'
        action: Script
        object_path: servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services
          Resource")
    - step:
        id: '1682'
        action: Script
        object_path: Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement",
          0)
    - step:
        id: '1683'
        object_path: servicesResource
        action: Click
    - step:
        id: '1684'
        action: Script
        object_path: Exit For
    - step:
        id: '1685'
        action: Script
        object_path: ElseIf w = resourceRowCount Then
    - step:
        id: '1686'
        action: Script
        object_path: '''end of visible rows, scroll down and start again'
    - step:
        id: '1687'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '1688'
        object_path: Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Swipe(moveUp)
    - step:
        id: '1689'
        action: Script
        object_path: scrollcounter2 = scrollcounter2 + 1
    - step:
        id: '1690'
        action: Script
        object_path: newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)
    - step:
        id: '1691'
        action: Script
        object_path: If newResourceRow = resourceRow Then
    - step:
        id: '1692'
        action: Script
        object_path: Exit For
    - step:
        id: '1693'
        action: Script
        object_path: End If
    - step:
        id: '1694'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1695'
        action: Script
        object_path: w = 1
    - step:
        id: '1696'
        action: Script
        object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified
          cell does not exist." Then'
    - step:
        id: '1697'
        action: Script
        object_path: Exit For
    - step:
        id: '1698'
        action: Script
        object_path: End If
    - step:
        id: '1699'
        action: Script
        object_path: End If
    - step:
        id: '1700'
        action: Script
        object_path: Next
    - step:
        id: '1701'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1702'
        action: Script
        object_path: Set serResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera
          P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,
          11, "WebCheckBox",0)
    - step:
        id: '1703'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1704'
        object_path: serResWebCheckBox
        action: set
        args: '"OFF"'
    - step:
        id: '1705'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1706'
        action: Script
        object_path: Set serResWebCheckBox = Nothing
    - step:
        id: '1707'
        action: Script
        object_path: If servicesPlannedBudget > 0 Then
    - step:
        id: '1708'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1709'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,9,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1710'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1711'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: servicesPlannedBudget
    - step:
        id: '1712'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1713'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1714'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1715'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1716'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1717'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,4,
          "WebElement",0)
        action: Click
    - step:
        id: '1718'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1719'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")
        action: Highlight
    - step:
        id: '1720'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,4,
          "WebElement",0)
        action: DoubleClick
    - step:
        id: '1721'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1722'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")
        action: Set
        args: servicesPlannedBudget
    - step:
        id: '1723'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1724'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1725'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '1726'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1727'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1728'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,9,
          "WebElement",0)
        action: Click
    - step:
        id: '1729'
        action: Script
        object_path: End If
    - step:
        id: '1730'
        action: Script
        object_path: End Function
    - step:
        id: '1731'
        action: Script
        object_path: '''sort the array of time entries'
    - step:
        id: '1732'
        action: Script
        object_path: Function BubbleSort(DateOfEntry)
    - step:
        id: '1733'
        action: Script
        object_path: Dim j, k, Temp
    - step:
        id: '1734'
        action: Script
        object_path: For j = LBound(DateOfEntry) To UBound(DateOfEntry)
    - step:
        id: '1735'
        action: Script
        object_path: For k = j + 1 To UBound(DateOfEntry)
    - step:
        id: '1736'
        action: Script
        object_path: If (DateOfEntry(j) > DateOfEntry(k)) Then
    - step:
        id: '1737'
        action: Script
        object_path: Temp = DateOfEntry(j)
    - step:
        id: '1738'
        action: Script
        object_path: DateOfEntry(j) = DateOfEntry(k)
    - step:
        id: '1739'
        action: Script
        object_path: DateOfEntry(k) = Temp
    - step:
        id: '1740'
        action: Script
        object_path: End If
    - step:
        id: '1741'
        action: Script
        object_path: Next
    - step:
        id: '1742'
        action: Script
        object_path: Next
    - step:
        id: '1743'
        action: Script
        object_path: DateOfTimeEntry = DateOfEntry
    - step:
        id: '1744'
        action: Script
        object_path: End Function
    - step:
        id: '1745'
        action: Script
        object_path: '''get WBS search for table'
    - step:
        id: '1746'
        action: Script
        object_path: Function WBSsearch(WBSelement)
    - step:
        id: '1747'
        action: Script
        object_path: WBSelementSplit = Split(WBSelement,"-")
    - step:
        id: '1748'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '1749'
        action: Script
        object_path: For e = 1 to lengthOfSplit
    - step:
        id: '1750'
        action: Script
        object_path: WBSelementSplit(e) = WBSelementSplit(e-1)&"-"&WBSelementSplit(e)
    - step:
        id: '1751'
        action: Script
        object_path: Next
    - step:
        id: '1752'
        action: Script
        object_path: Const removalIndex = 0
    - step:
        id: '1753'
        action: Script
        object_path: For x=removalIndex To UBound(WBSelementSplit)-1
    - step:
        id: '1754'
        action: Script
        object_path: WBSelementSplit(x) = WBSelementSplit(x + 1)
    - step:
        id: '1755'
        action: Script
        object_path: Next
    - step:
        id: '1756'
        action: Script
        object_path: ReDim Preserve WBSelementSplit(UBound(WBSelementSplit) - 1)
    - step:
        id: '1757'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1758'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '1759'
        action: Script
        object_path: WBSsearch = "PRJ "&projNum
    - step:
        id: '1760'
        action: Script
        object_path: If InStr(projNum,"CP") Then
    - step:
        id: '1761'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '1762'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '1763'
        action: Script
        object_path: Next
    - step:
        id: '1764'
        action: Script
        object_path: ElseIf InStr(projNum,"FS") Then
    - step:
        id: '1765'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '1766'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '1767'
        action: Script
        object_path: Next
    - step:
        id: '1768'
        action: Script
        object_path: Else
    - step:
        id: '1769'
        action: Script
        object_path: For e1 = 0 To lengthOfSplit
    - step:
        id: '1770'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '1771'
        action: Script
        object_path: Next
    - step:
        id: '1772'
        action: Script
        object_path: End If
    - step:
        id: '1773'
        action: Script
        object_path: WBSsearch = WBSsearch
    - step:
        id: '1774'
        action: Script
        object_path: End Function
    - step:
        id: '1775'
        action: Script
        object_path: '''download excel to find total row count (including not visible)'
    - step:
        id: '1776'
        action: Script
        object_path: Function DownloadExcel
    - step:
        id: '1777'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Download")
        action: Click
    - step:
        id: '1778'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '1779'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '1780'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1781'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '1782'
        action: Script
        object_path: objStartFolder = "C:\Automation Downloads"
    - step:
        id: '1783'
        action: Script
        object_path: Set objFolder = objFSO.GetFolder(objStartFolder)
    - step:
        id: '1784'
        action: Script
        object_path: Set colFiles = objFolder.Files
    - step:
        id: '1785'
        action: Script
        object_path: For Each objFile in colFiles
    - step:
        id: '1786'
        action: Script
        object_path: If Instr(objFile.Name, "Primavera P6 - Activities") > 0 Then
    - step:
        id: '1787'
        action: Script
        object_path: filename = objFile.Name
    - step:
        id: '1788'
        action: Script
        object_path: Exit For
    - step:
        id: '1789'
        action: Script
        object_path: End If
    - step:
        id: '1790'
        action: Script
        object_path: Next
    - step:
        id: '1791'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '1792'
        action: Script
        object_path: Set objFolder = Nothing
    - step:
        id: '1793'
        action: Script
        object_path: Set colFiles = Nothing
    - step:
        id: '1794'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '1795'
        object_path: objExcel
        action: visible
        args: = False
    - step:
        id: '1796'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open("C:\Automation Downloads\"&filename)
    - step:
        id: '1797'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '1798'
        action: Script
        object_path: excelRow = objSheet.UsedRange.Rows.Count
    - step:
        id: '1799'
        action: Script
        object_path: lastOrder = objSheet.cells(excelRow,9).value
    - step:
        id: '1800'
        action: Script
        object_path: excelValue = excelRow &","& lastOrder
    - step:
        id: '1801'
        object_path: objWorkbook
        action: close
    - step:
        id: '1802'
        object_path: objExcel
        action: Quit
    - step:
        id: '1803'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '1804'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '1805'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '1806'
        action: Script
        object_path: Set fileSystemObj = createobject("Scripting.FileSystemObject")
    - step:
        id: '1807'
        object_path: fileSystemObj
        action: DeleteFile
        args: '"C:\Automation Downloads\"&filename'
    - step:
        id: '1808'
        action: Script
        object_path: Set fileSystemObj = Nothing
    - step:
        id: '1809'
        action: Script
        object_path: DownloadExcel = excelValue
    - step:
        id: '1810'
        action: Script
        object_path: End Function
    - step:
        id: '1811'
        action: Script
        object_path: '''scroll up and down to reposition J'
    - step:
        id: '1812'
        action: Script
        object_path: Function ScrollTablePosition(counter,visibleRow)
    - step:
        id: '1813'
        action: Script
        object_path: pgdnValue = Int(counter/(visibleRow - 1))
    - step:
        id: '1814'
        object_path: Browser("Oracle Primavera P6 EPPM")
        action: Highlight
    - step:
        id: '1815'
        action: Script
        object_path: '''Print "pgdnValue from Function: " & pgdnValue'
    - step:
        id: '1816'
        action: Script
        object_path: fn_ScrollToTop visibleRow
    - step:
        id: '1817'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '1818'
        action: Script
        object_path: For t = 1 To pgdnValue
    - step:
        id: '1819'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1820'
        object_path: mySendKeys
        action: SendKeys
        args: '"{PgDn}"'
    - step:
        id: '1821'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1822'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1823'
        action: Script
        object_path: Next
    - step:
        id: '1824'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1825'
        action: Script
        object_path: End Function
    - step:
        id: '1826'
        action: Script
        object_path: '''scroll to top function'
    - step:
        id: '1827'
        action: Script
        object_path: Function fn_ScrollToTop(VisibleRows)
    - step:
        id: '1828'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1829'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 2
    - step:
        id: '1830'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("WebElement_4")
        action: Click
    - step:
        id: '1831'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1832'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("gantt-0-bar-vertical-scroller")
        action: Click
    - step:
        id: '1833'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1834'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 1
    - step:
        id: '1835'
        object_path: mySendKeys
        action: SendKeys
        args: '"{Home}"'
    - step:
        id: '1836'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1837'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '1838'
        action: Script
        object_path: End Function
    - step:
        id: '1839'
        action: Script
        object_path: '''scroll to bottom function'
    - step:
        id: '1840'
        action: Script
        object_path: Function fn_ScrollToBottom
    - step:
        id: '1841'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '1842'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 2
    - step:
        id: '1843'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("WebElement_4")
        action: Click
    - step:
        id: '1844'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1845'
        object_path: Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("gantt-0-bar-vertical-scroller")
        action: Click
    - step:
        id: '1846'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '1847'
        object_path: Setting
        action: WebPackage("ReplyType")
        args: = 1
    - step:
        id: '1848'
        object_path: mySendKeys
        action: SendKeys
        args: '"{End}"'
    - step:
        id: '1849'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '1850'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '1851'
        action: Script
        object_path: End Function
    - step:
        id: '1852'
        action: Script
        object_path: '''clear variables'
    - step:
        id: '1853'
        action: Script
        object_path: Function ClearVariables
    - step:
        id: '1854'
        action: Script
        object_path: orderStatus = ""
    - step:
        id: '1855'
        action: Script
        object_path: colKey_plan1 = ""
    - step:
        id: '1856'
        action: Script
        object_path: rowContainingOrdNum = ""
    - step:
        id: '1857'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '1858'
        action: Script
        object_path: WBSrow = ""
    - step:
        id: '1859'
        action: Script
        object_path: emailContent = ""
    - step:
        id: '1860'
        action: Script
        object_path: LabourCostElementGroups = ""
    - step:
        id: '1861'
        action: Script
        object_path: MaterialsCostElementGroups = ""
    - step:
        id: '1862'
        action: Script
        object_path: ServicesCostElementGroups = ""
    - step:
        id: '1863'
        action: Script
        object_path: planVersion = ""
    - step:
        id: '1864'
        action: Script
        object_path: WBS = ""
    - step:
        id: '1865'
        action: Script
        object_path: Count = ""
    - step:
        id: '1866'
        action: Script
        object_path: Found = ""
    - step:
        id: '1867'
        action: Script
        object_path: NodeText = ""
    - step:
        id: '1868'
        action: Script
        object_path: labourPlannedHRS = ""
    - step:
        id: '1869'
        action: Script
        object_path: labourPlannedHRS1 = ""
    - step:
        id: '1870'
        action: Script
        object_path: Lplannedbudget = ""
    - step:
        id: '1871'
        action: Script
        object_path: labourPlannedBudget = ""
    - step:
        id: '1872'
        action: Script
        object_path: Mplannedbudget = ""
    - step:
        id: '1873'
        action: Script
        object_path: materialPlannedbudget = ""
    - step:
        id: '1874'
        action: Script
        object_path: Splannedbudget = ""
    - step:
        id: '1875'
        action: Script
        object_path: servicesPlannedbudget = ""
    - step:
        id: '1876'
        action: Script
        object_path: nodeKey = ""
    - step:
        id: '1877'
        action: Script
        object_path: columnName = ""
    - step:
        id: '1878'
        action: Script
        object_path: itemText = ""
    - step:
        id: '1879'
        action: Script
        object_path: plannedProjectBudget = ""
    - step:
        id: '1880'
        action: Script
        object_path: labourRow = ""
    - step:
        id: '1881'
        action: Script
        object_path: controlKeyValue = ""
    - step:
        id: '1882'
        action: Script
        object_path: saveVis = ""
    - step:
        id: '1883'
        action: Script
        object_path: ExpandCollapseDock = ""
    - step:
        id: '1884'
        action: Script
        object_path: assignmentVis = ""
    - step:
        id: '1885'
        action: Script
        object_path: employeeHours = ""
    - step:
        id: '1886'
        action: Script
        object_path: rowObj = ""
    - step:
        id: '1887'
        action: Script
        object_path: noEmpHoursFound = ""
    - step:
        id: '1888'
        action: Script
        object_path: WBSelementSplit = ""
    - step:
        id: '1889'
        action: Script
        object_path: systemStatus = ""
    - step:
        id: '1890'
        action: Script
        object_path: Set employeeTableDict = Nothing
    - step:
        id: '1891'
        action: Script
        object_path: Set employeeNameDict = Nothing
    - step:
        id: '1892'
        action: Script
        object_path: Set tree = Nothing
    - step:
        id: '1893'
        action: Script
        object_path: Set TreeObj = Nothing
    - step:
        id: '1894'
        action: Script
        object_path: Set AllValues = Nothing
    - step:
        id: '1895'
        action: Script
        object_path: Set columnNames = Nothing
    - step:
        id: '1896'
        action: Script
        object_path: End Function
    - step:
        id: '1897'
        action: Script
        object_path: '''************************************************************DEBUGGING*************************************************************************'
  outputs:
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
      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          visual_relations:
            visual_relation: []
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                  last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
  - object:
      class: SAPGuiSession
      name: Session_2
      properties:
      - property:
          value:
            value: ses[1]
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
      - property:
          value:
            value: /app/con[0]/ses[1]
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
      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Customer Notification
          properties:
          - property:
              value:
                value: ZCNS
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
                value: SAPLWDY_PRGN_NODES
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
          child_objects:
          - object:
              class: Page
              name: Customer Notification
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
                    value: https://lbvssaphanaqas.utilities.etsa.net.au:2080/sap/bc/webdynpro/etsa/cns
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://lbvssaphanaqas.utilities.etsa.net.au:2080/sap/bc/webdynpro/etsa/cns?sap-language=EN&sap-wd-sapgui=X#
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Customer Notification System
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
                    value: '30'
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
                    value: '7326'
                    regular_expression: false
                  name: document size
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects:
              - object:
                  class: SAPFrame
                  name: Customer Notification
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
                        value: https://lbvssaphanaqas.utilities.etsa.net.au:2080/sap/bc/webdynpro/etsa/cns
                        regular_expression: false
                      name: url without form data
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
                        value: SAPFrame
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
                        value: '7861'
                        regular_expression: false
                      name: document size
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: all data in get method
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
                        value: Customer Notification System
                        regular_expression: false
                      name: title
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - title
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                    optional_filter:
                      property_ref:
                      - title
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 10 May 2022 2:26:04 PM
                  child_objects:
                  - object:
                      class: SAPButton
                      name: Close
                      properties:
                      - property:
                          value:
                            value: SAPButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
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
                            value: '0'
                            regular_expression: false
                          name: disabled
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: urPWCloseHover urPWCloseIcon urPWBtnIcon urPWBtnIconHover
                              urPWButton
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      basic_identification:
                        property_ref:
                        - micclass
                        - name
                        ordinal_identifier: ''
                      smart_identification:
                        base_filter:
                          property_ref:
                          - micclass
                        optional_filter:
                          property_ref:
                          - class
                          - disabled
                        algorithm: Mercury.TolerantPriority
                        active: true
                      custom_replay: ''
                      comments: ''
                      visual_relations: ''
                      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
                      child_objects: []
              - object:
                  class: SAPEdit
                  name: CNS ID
                  properties:
                  - property:
                      value:
                        value: SAPEdit
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
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
                        value: CNS ID
                        regular_expression: false
                      name: sap attached text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '0'
                        regular_expression: false
                      name: readonly
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: WD51
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '12'
                        regular_expression: false
                      name: max length
                      hidden: true
                      read_only: true
                      type: NUMBER
                  basic_identification:
                    property_ref:
                    - micclass
                    - type
                    - sap attached text
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                    optional_filter:
                      property_ref:
                      - max length
                      - readonly
                      - name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
      child_objects:
      - object:
          class: Page
          name: SmartInstall
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
                value: https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: SmartInstall
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
                value: '120031'
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
          child_objects:
          - object:
              class: WebList
              name: __list1-listUl
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
                    value: //DIV[2]/DIV[1]/UL[@role="listbox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '10'
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
                    value: listbox
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
                    value: '10'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: __list1-listUl
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: 'ExpandINVERTER 1Verify(ABB) Power-One Italy S.p.AREACT2-UNO-5.0-TLQuantity:
                      1ExpandPV PANELSVerifyAblytek Co Ltd6MN5A215Quantity: 30ExpandBATTERYVerifyTesla
                      Motors Australia Pty LtdAC PowerwallQuantity: 1'
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMListItems sapMListUl sapMListShowSeparatorsAll sapMListModeNone
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: WebElement
              name: __button15-__list1-0-img
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
                    value: SPAN
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: __button15-__list1-0-img
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUiIcon sapUiIconMirrorInRTL sapMBtnCustomIcon sapMBtnIcon
                      sapMBtnIconLeft
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
                    value: //DIV[@id="application-install-display-component---Installer"]/DIV[1]/DIV[2]/SECTION[1]/DIV[1]/DIV[2]/DIV[1]/UL[@role="listbox"][1]/LI[@role="option"][1]/DIV[1]/DIV[@role="form"][1]/DIV[@role="toolbar"][1]/BUTTON[1]/SPAN[1]/SPAN[@role="presentation"][1]
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
                  value: 15
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: SAPUIToolbar
              name: SAPUIToolbar
              properties:
              - property:
                  value:
                    value: SAPUIToolbar
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
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
              basic_identification:
                property_ref:
                - micclass
                - name
                - html tag
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?projectId=12910&wbsId=491866&ProjectName=null&selectedItem=ARO111_7232&checkTabs=true
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
                value: '130033'
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: WebElement
              name: 1grid-viewport-rowset-EPSRowset-gro
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
                    value: SA Power Networks SA Power Networks Field Services/Network
                      Management Field Services/Network Management Field Services
                      Projects Field Services Projects 2021 2021 Year of Construction
                      2021 Circuit Breaker 2021 Circuit Breaker NW-017526 Bordertown
                      Substation CB Replacement
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
                    value: 1grid-viewport-rowset-EPSRowset-group-fixed
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: viewport viewport-fixed viewport-EPSRowset viewport-fixed
                      last-viewport-fixed
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
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                    value: 6grid-row-ARO10_667-col-selected-input
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                    value: 6grid-row-ARO10_658-col-selected-input
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login
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
                value: '130033'
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                  - items count
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: WebElement
              name: Dropdown menu
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
                    value: Prod - Enerven Prod - Field Services
                    regular_expression: false
                  name: innertext
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
                    value: databaseId-menu
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: combo-dropdown-menu align-left grow-to-text
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Dropdown menu
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //UL[@id="databaseId-menu"]
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                    value: Prod - Field Services
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
                    value: Prod - Field Services
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                    value: '0'
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
                    value: https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
      last_update_time: Tuesday, 10 May 2022 2:26:04 PM
      child_objects:
      - object:
          class: Page
          name: SmartInstall
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
                value: https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: SmartInstall
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
                value: '120030'
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
          child_objects:
          - object:
              class: WebList
              name: __list1-listUl
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
                    value: //DIV[2]/DIV[1]/UL[@role="listbox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '10'
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
                    value: listbox
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
                    value: '10'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: __list1-listUl
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: 'ExpandINVERTER 1Verify(ABB) Power-One Italy S.p.AREACT2-UNO-5.0-TLQuantity:
                      1ExpandPV PANELSVerifyAblytek Co Ltd6MN5A215Quantity: 30ExpandBATTERYVerifyTesla
                      Motors Australia Pty LtdAC PowerwallQuantity: 1'
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMListItems sapMListUl sapMListShowSeparatorsAll sapMListModeNone
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
                  - items count
                  - visible items
                  - visible
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
          - object:
              class: SAPUIList
              name: SAPUIList
              properties:
              - property:
                  value:
                    value: SAPUIList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
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
              basic_identification:
                property_ref:
                - micclass
                - name
                - html tag
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
          last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
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
              last_update_time: Tuesday, 10 May 2022 2:26:04 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
