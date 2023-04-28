namespace: SAP_to_Primavera_Integration
operation:
  name: PlannedP6Entry
  inputs:
    - projectNumber:
        required: false
    - orderNumber:
        required: false
    - plannedProjectBudget:
        required: false
    - plannedLabourHours:
        required: false
    - labourBudget:
        required: false
    - materialBudget:
        required: false
    - servicesBudget:
        required: false
    - emailContent:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:SAP_to_Primavera_Integration.PlannedP6Entry:1.0.0'
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
          object_path: 'projNum = Parameter("projectNumber")'
      - step:
          id: '2'
          action: Script
          object_path: 'ordNum = Parameter("orderNumber")'
      - step:
          id: '3'
          action: Script
          object_path: If IsNumeric(ordNum) Then
      - step:
          id: '4'
          action: Script
          object_path: 'plannedProjectBudget = Parameter("plannedProjectBudget")'
      - step:
          id: '5'
          action: Script
          object_path: 'labourPlannedHRS = Parameter("plannedLabourHours")'
      - step:
          id: '6'
          action: Script
          object_path: 'labourPlannedBudget = Parameter("labourBudget")'
      - step:
          id: '7'
          action: Script
          object_path: 'materialPlannedbudget = Parameter("materialBudget")'
      - step:
          id: '8'
          action: Script
          object_path: 'servicesPlannedbudget = Parameter("servicesBudget")'
      - step:
          id: '9'
          action: Script
          object_path: 'emailContent = Parameter("emailContent")'
      - step:
          id: '10'
          object_path: 'Browser("Oracle Primavera P6 EPPM")'
          action: Maximize
      - step:
          id: '11'
          object_path: 'Browser("Oracle Primavera P6 EPPM")'
          action: Highlight
      - step:
          id: '12'
          action: Wait
          args: '"4"'
          default_args: '"1"'
      - step:
          id: '13'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities_2").WebEdit("Search")'
          action: Set
          args: ordNum
      - step:
          id: '14'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '15'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(3,9,"WebElement",0)'
          action: Click
      - step:
          id: '16'
          action: Script
          object_path: "'input planned project budget"
      - step:
          id: '17'
          object_path: Setting
          action: 'WebPackage("ReplayType")'
          args: = 2
      - step:
          id: '18'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(3,9,"WebElement",0)'
          action: DoubleClick
      - step:
          id: '19'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '20'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")'
          action: Set
          args: plannedProjectBudget
      - step:
          id: '21'
          object_path: Setting
          action: 'WebPackage("ReplayType")'
          args: = 1
      - step:
          id: '22'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '23'
          action: Script
          object_path: "'input planned total hours"
      - step:
          id: '24'
          object_path: Setting
          action: 'WebPackage("ReplayType")'
          args: = 2
      - step:
          id: '25'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ActivityDetails").ChildItem(3,11,"WebElement",0)'
          action: DoubleClick
      - step:
          id: '26'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '27'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("WebEdit")'
          action: Set
          args: Round(labourPlannedHRS)
      - step:
          id: '28'
          object_path: Setting
          action: 'WebPackage("ReplayType")'
          args: = 1
      - step:
          id: '29'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '30'
          action: Script
          object_path: "'save"
      - step:
          id: '31'
          action: Script
          object_path: 'If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled = false Then'
      - step:
          id: '32'
          action: Script
          object_path: 'saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").GetROProperty("visible")'
      - step:
          id: '33'
          action: Script
          object_path: If saveVis = True Then
      - step:
          id: '34'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")'
          action: Click
      - step:
          id: '35'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '36'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '37'
          object_path: mySendKeys
          action: SendKeys
          args: '"{F5}"'
      - step:
          id: '38'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '39'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '40'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '41'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '42'
          action: Script
          object_path: End If
      - step:
          id: '43'
          action: Script
          object_path: End If
      - step:
          id: '44'
          action: Script
          object_path: "'expand bottom dock"
      - step:
          id: '45'
          action: Script
          object_path: 'ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")'
      - step:
          id: '46'
          action: Script
          object_path: 'If ExpandCollapseDock = "Expand Dock" Then'
      - step:
          id: '47'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")'
          action: Click
      - step:
          id: '48'
          action: Script
          object_path: End If
      - step:
          id: '49'
          action: Wait
          args: '"5"'
          default_args: '"1"'
      - step:
          id: '50'
          action: Script
          object_path: "' Open Assignments tab, if enabled and visible"
      - step:
          id: '51'
          action: Script
          object_path: 'If Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments").Object.disabled = false Then'
      - step:
          id: '52'
          action: Script
          object_path: 'assignmentVis = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments").GetROProperty("visible")'
      - step:
          id: '53'
          action: Script
          object_path: If assignmentVis = True Then
      - step:
          id: '54'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("Assignments")'
          action: Click
      - step:
          id: '55'
          action: Script
          object_path: "'use functions to add resources and input extractions into p6"
      - step:
          id: '56'
          action: Script
          object_path: 'Call AddLabourResource(labourPlannedHRS, labourPlannedBudget)'
      - step:
          id: '57'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '58'
          action: Script
          object_path: Call AddMaterialResource(materialPlannedbudget)
      - step:
          id: '59'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '60'
          action: Script
          object_path: Call AddServicesResource(servicesPlannedbudget)
      - step:
          id: '61'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '62'
          action: Script
          object_path: 'Else '
          comment: not visible
      - step:
          id: '63'
          action: Script
          object_path: 'emailContent = emailContent& "Assignments tab not visible: Activity Type is not Level of Effort. "'
      - step:
          id: '64'
          action: Script
          object_path: End If
      - step:
          id: '65'
          action: Script
          object_path: End If
      - step:
          id: '66'
          action: Script
          object_path: "'collapse bottom dock"
      - step:
          id: '67'
          action: Script
          object_path: 'ExpandCollapseDock = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock").GetROProperty("innertext")'
      - step:
          id: '68'
          action: Script
          object_path: 'If ExpandCollapseDock = "Collapse Dock" Then'
      - step:
          id: '69'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").Link("ExpandCollapseDock")'
          action: Click
      - step:
          id: '70'
          action: Script
          object_path: End If
      - step:
          id: '71'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '72'
          action: Script
          object_path: Call ClearVariables
      - step:
          id: '73'
          action: Script
          object_path: "'send email to team about project data"
      - step:
          id: '74'
          action: Script
          object_path: If emailContent = Empty Then
      - step:
          id: '75'
          action: Script
          object_path: 'emailContent = "No issues found."'
      - step:
          id: '76'
          action: Script
          object_path: End If
      - step:
          id: '77'
          action: Script
          object_path: 'Call SendEmail(projNum, ordNum, emailContent)'
      - step:
          id: '78'
          action: Script
          object_path: End If
      - step:
          id: '79'
          action: Script
          object_path: 'Function SendEmail(project, order, content)'
      - step:
          id: '80'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '81'
          object_path: MyEmail
          action: Subject
          args: '= "Project "&projNum&" Planned Values Automation Update"'
      - step:
          id: '82'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '83'
          object_path: MyEmail
          action: To
          args: '= "Rick.Irizarry@sapowernetworks.com.au,Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"'
      - step:
          id: '84'
          object_path: MyEmail
          action: TextBody
          args: '= "PROJECT "&project&" ORDER "&order&": "&vbNewLine&"COMMENTS: "&content'
      - step:
          id: '85'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '86'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '87'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '88'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '89'
          object_path: MyEmail
          action: Send
      - step:
          id: '90'
          action: Script
          object_path: Set MyEmail = Nothing
      - step:
          id: '91'
          action: Script
          object_path: End Function
      - step:
          id: '92'
          action: Script
          object_path: 'Function AddLabourResource(labourPlannedHRS,labourPlannedBudget)'
      - step:
          id: '93'
          action: Script
          object_path: scrollcounter2 = 0
      - step:
          id: '94'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '95'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '96'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '97'
          action: Script
          object_path: found = false
      - step:
          id: '98'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '99'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '100'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '101'
          action: Script
          object_path: "'resource found exit loop"
      - step:
          id: '102'
          action: Script
          object_path: 'If inStr(resourceRow,"Labour Resource") > 0 Then'
      - step:
          id: '103'
          action: Script
          object_path: found = true
      - step:
          id: '104'
          action: Script
          object_path: 'labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour Resource")'
      - step:
          id: '105'
          action: Script
          object_path: 'Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '106'
          object_path: labourResource
          action: Click
      - step:
          id: '107'
          action: Script
          object_path: Exit For
      - step:
          id: '108'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '109'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '110'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '111'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '112'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '113'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '114'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '115'
          action: Script
          object_path: Exit For
      - step:
          id: '116'
          action: Script
          object_path: End If
      - step:
          id: '117'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '118'
          action: Script
          object_path: w = 1
      - step:
          id: '119'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '120'
          action: Script
          object_path: Exit For
      - step:
          id: '121'
          action: Script
          object_path: End If
      - step:
          id: '122'
          action: Script
          object_path: End If
      - step:
          id: '123'
          action: Script
          object_path: Next
      - step:
          id: '124'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '125'
          action: Script
          object_path: "'resource found, add values"
      - step:
          id: '126'
          action: Script
          object_path: If found = true Then
      - step:
          id: '127'
          action: Script
          object_path: 'Call AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)'
      - step:
          id: '128'
          action: Script
          object_path: "'add resource"
      - step:
          id: '129'
          action: Script
          object_path: Else
      - step:
          id: '130'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")'
          action: Click
      - step:
          id: '131'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '132'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")'
          action: Click
      - step:
          id: '133'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '134'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")'
          action: Set
          args: '"Labour Resource"'
      - step:
          id: '135'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '136'
          action: Script
          object_path: 'noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")'
      - step:
          id: '137'
          action: Script
          object_path: If noResult = False Then
      - step:
          id: '138'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html tag:=DIV","innertext:=Labour ","title:=Labour","index:=0")'
          action: Click
      - step:
          id: '139'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '140'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")'
          action: Click
      - step:
          id: '141'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '142'
          action: Script
          object_path: 'If Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("Same resource could not").Exist(3) Then'
      - step:
          id: '143'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")'
          action: Click
      - step:
          id: '144'
          action: Script
          object_path: End If
      - step:
          id: '145'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '146'
          action: Script
          object_path: Else
      - step:
          id: '147'
          action: Script
          object_path: labourResourceAdded = False
      - step:
          id: '148'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")'
          action: Click
      - step:
          id: '149'
          action: Script
          object_path: 'emailContent = emailContent& "Labour resource could not be found. "'
      - step:
          id: '150'
          action: Script
          object_path: End If
      - step:
          id: '151'
          action: Script
          object_path: "'find added resource"
      - step:
          id: '152'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '153'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '154'
          action: Script
          object_path: found = false
      - step:
          id: '155'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '156'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '157'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '158'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '159'
          action: Script
          object_path: 'If inStr(resourceRow,"Labour Resource") > 0 Then'
      - step:
          id: '160'
          action: Script
          object_path: found = true
      - step:
          id: '161'
          action: Script
          object_path: 'labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour Resource")'
      - step:
          id: '162'
          action: Script
          object_path: 'Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '163'
          object_path: labourResource
          action: Click
      - step:
          id: '164'
          action: Script
          object_path: Exit For
      - step:
          id: '165'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '166'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '167'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '168'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '169'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '170'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '171'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '172'
          action: Script
          object_path: Exit For
      - step:
          id: '173'
          action: Script
          object_path: End If
      - step:
          id: '174'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '175'
          action: Script
          object_path: w = 1
      - step:
          id: '176'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '177'
          action: Script
          object_path: Exit For
      - step:
          id: '178'
          action: Script
          object_path: End If
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
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '182'
          action: Script
          object_path: "'add values"
      - step:
          id: '183'
          action: Script
          object_path: 'Call AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)'
      - step:
          id: '184'
          action: Script
          object_path: End If
      - step:
          id: '185'
          action: Script
          object_path: "'save"
      - step:
          id: '186'
          action: Script
          object_path: 'If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled = false Then'
      - step:
          id: '187'
          action: Script
          object_path: 'saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").GetROProperty("visible")'
      - step:
          id: '188'
          action: Script
          object_path: If saveVis = True Then
      - step:
          id: '189'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")'
          action: Click
      - step:
          id: '190'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '191'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '192'
          object_path: mySendKeys
          action: SendKeys
          args: '"{F5}"'
      - step:
          id: '193'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '194'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '195'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '196'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '197'
          action: Script
          object_path: End If
      - step:
          id: '198'
          action: Script
          object_path: End If
      - step:
          id: '199'
          action: Script
          object_path: "'scroll back up to top for next resource"
      - step:
          id: '200'
          action: Script
          object_path: For scroll = 0 To scrollcounter2
      - step:
          id: '201'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '202'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveDown)
      - step:
          id: '203'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '204'
          action: Script
          object_path: Next
      - step:
          id: '205'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '206'
          action: Script
          object_path: End Function
      - step:
          id: '207'
          action: Script
          object_path: Function AddMaterialResource(materialPlannedBudget)
      - step:
          id: '208'
          action: Script
          object_path: scrollcounter2 = 0
      - step:
          id: '209'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '210'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '211'
          action: Script
          object_path: found = false
      - step:
          id: '212'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '213'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '214'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '215'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '216'
          action: Script
          object_path: 'If inStr(resourceRow,"Material Resource") > 0 Then'
      - step:
          id: '217'
          action: Script
          object_path: found = true
      - step:
          id: '218'
          action: Script
          object_path: 'materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material Resource")'
      - step:
          id: '219'
          action: Script
          object_path: 'Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '220'
          object_path: materialResource
          action: Click
      - step:
          id: '221'
          action: Script
          object_path: Exit For
      - step:
          id: '222'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '223'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '224'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '225'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '226'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '227'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '228'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '229'
          action: Script
          object_path: Exit For
      - step:
          id: '230'
          action: Script
          object_path: End If
      - step:
          id: '231'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '232'
          action: Script
          object_path: w = 1
      - step:
          id: '233'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '234'
          action: Script
          object_path: Exit For
      - step:
          id: '235'
          action: Script
          object_path: End If
      - step:
          id: '236'
          action: Script
          object_path: End If
      - step:
          id: '237'
          action: Script
          object_path: Next
      - step:
          id: '238'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '239'
          action: Script
          object_path: "'resource found, add values"
      - step:
          id: '240'
          action: Script
          object_path: If found = true Then
      - step:
          id: '241'
          action: Script
          object_path: 'Call AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)'
      - step:
          id: '242'
          action: Script
          object_path: "'add resource"
      - step:
          id: '243'
          action: Script
          object_path: Else
      - step:
          id: '244'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")'
          action: Click
      - step:
          id: '245'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '246'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")'
          action: Click
      - step:
          id: '247'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '248'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")'
          action: Set
          args: '"Material Resource"'
      - step:
          id: '249'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '250'
          action: Script
          object_path: 'noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")'
      - step:
          id: '251'
          action: Script
          object_path: If noResult = False Then
      - step:
          id: '252'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html tag:=DIV","innertext:=Material ","title:=Material","index:=0")'
          action: Click
      - step:
          id: '253'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '254'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")'
          action: Click
      - step:
          id: '255'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '256'
          action: Script
          object_path: 'If Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("Same resource could not").Exist(3) Then'
      - step:
          id: '257'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")'
          action: Click
      - step:
          id: '258'
          action: Script
          object_path: End If
      - step:
          id: '259'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '260'
          action: Script
          object_path: Else
      - step:
          id: '261'
          action: Script
          object_path: materialResourceAdded = False
      - step:
          id: '262'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")'
          action: Click
      - step:
          id: '263'
          action: Script
          object_path: 'emailContent = emailContent& "Material resource could not be found. "'
      - step:
          id: '264'
          action: Script
          object_path: End If
      - step:
          id: '265'
          action: Script
          object_path: "'find added resource"
      - step:
          id: '266'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '267'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '268'
          action: Script
          object_path: found = false
      - step:
          id: '269'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '270'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '271'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '272'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '273'
          action: Script
          object_path: 'If inStr(resourceRow,"Material Resource") > 0 Then'
      - step:
          id: '274'
          action: Script
          object_path: found = true
      - step:
          id: '275'
          action: Script
          object_path: 'materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material Resource")'
      - step:
          id: '276'
          action: Script
          object_path: 'Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '277'
          object_path: materialResource
          action: Click
      - step:
          id: '278'
          action: Script
          object_path: Exit For
      - step:
          id: '279'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '280'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '281'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '282'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '283'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '284'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '285'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '286'
          action: Script
          object_path: Exit For
      - step:
          id: '287'
          action: Script
          object_path: End If
      - step:
          id: '288'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '289'
          action: Script
          object_path: w = 1
      - step:
          id: '290'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '291'
          action: Script
          object_path: Exit For
      - step:
          id: '292'
          action: Script
          object_path: End If
      - step:
          id: '293'
          action: Script
          object_path: End If
      - step:
          id: '294'
          action: Script
          object_path: Next
      - step:
          id: '295'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '296'
          action: Script
          object_path: "'add values"
      - step:
          id: '297'
          action: Script
          object_path: 'Call AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)'
      - step:
          id: '298'
          action: Script
          object_path: End If
      - step:
          id: '299'
          action: Script
          object_path: "'save"
      - step:
          id: '300'
          action: Script
          object_path: 'If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled = false Then'
      - step:
          id: '301'
          action: Script
          object_path: 'saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").GetROProperty("visible")'
      - step:
          id: '302'
          action: Script
          object_path: If saveVis = True Then
      - step:
          id: '303'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")'
          action: Click
      - step:
          id: '304'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '305'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '306'
          object_path: mySendKeys
          action: SendKeys
          args: '"{F5}"'
      - step:
          id: '307'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '308'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '309'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '310'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '311'
          action: Script
          object_path: End If
      - step:
          id: '312'
          action: Script
          object_path: End If
      - step:
          id: '313'
          action: Script
          object_path: "'scroll back up to top for next resource"
      - step:
          id: '314'
          action: Script
          object_path: For scroll = 0 To scrollcounter2
      - step:
          id: '315'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '316'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveDown)
      - step:
          id: '317'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '318'
          action: Script
          object_path: Next
      - step:
          id: '319'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '320'
          action: Script
          object_path: End Function
      - step:
          id: '321'
          action: Script
          object_path: Function AddServicesResource(servicesPlannedBudget)
      - step:
          id: '322'
          action: Script
          object_path: scrollcounter2 = 0
      - step:
          id: '323'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '324'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '325'
          action: Script
          object_path: found = false
      - step:
          id: '326'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '327'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '328'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '329'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '330'
          action: Script
          object_path: 'If inStr(resourceRow,"Services Resource") > 0 Then'
      - step:
          id: '331'
          action: Script
          object_path: found = true
      - step:
          id: '332'
          action: Script
          object_path: 'servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services Resource")'
      - step:
          id: '333'
          action: Script
          object_path: 'Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '334'
          object_path: servicesResource
          action: Click
      - step:
          id: '335'
          action: Script
          object_path: Exit For
      - step:
          id: '336'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '337'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '338'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '339'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '340'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '341'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '342'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '343'
          action: Script
          object_path: Exit For
      - step:
          id: '344'
          action: Script
          object_path: End If
      - step:
          id: '345'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '346'
          action: Script
          object_path: w = 1
      - step:
          id: '347'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '348'
          action: Script
          object_path: Exit For
      - step:
          id: '349'
          action: Script
          object_path: End If
      - step:
          id: '350'
          action: Script
          object_path: End If
      - step:
          id: '351'
          action: Script
          object_path: Next
      - step:
          id: '352'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '353'
          action: Script
          object_path: "'resource found, add values"
      - step:
          id: '354'
          action: Script
          object_path: If found = true Then
      - step:
          id: '355'
          action: Script
          object_path: 'Call AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)'
      - step:
          id: '356'
          action: Script
          object_path: "'add resource"
      - step:
          id: '357'
          action: Script
          object_path: Else
      - step:
          id: '358'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Assign...")'
          action: Click
      - step:
          id: '359'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '360'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").Link("Resource")'
          action: Click
      - step:
          id: '361'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '362'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebEdit("Search")'
          action: Set
          args: '"Services Resource"'
      - step:
          id: '363'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '364'
          action: Script
          object_path: 'noResult = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebElement("NoResultFound").GetROProperty("visible")'
      - step:
          id: '365'
          action: Script
          object_path: If noResult = False Then
      - step:
          id: '366'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("html tag:=DIV","innertext:=Services ","title:=Services","index:=0")'
          action: Click
      - step:
          id: '367'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '368'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("Assign")'
          action: Click
      - step:
          id: '369'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '370'
          action: Script
          object_path: 'If Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebElement("Same resource could not").Exist(3) Then'
      - step:
          id: '371'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebButton("OK")'
          action: Click
      - step:
          id: '372'
          action: Script
          object_path: End If
      - step:
          id: '373'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '374'
          action: Script
          object_path: Else
      - step:
          id: '375'
          action: Script
          object_path: servicesResourceAdded = False
      - step:
          id: '376'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Cancel")'
          action: Click
      - step:
          id: '377'
          action: Script
          object_path: 'emailContent = emailContent& "Services resource could not be found. "'
      - step:
          id: '378'
          action: Script
          object_path: End If
      - step:
          id: '379'
          action: Script
          object_path: "'find added resource"
      - step:
          id: '380'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '381'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '382'
          action: Script
          object_path: found = false
      - step:
          id: '383'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '384'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '385'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '386'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '387'
          action: Script
          object_path: 'If inStr(resourceRow,"Services Resource") > 0 Then'
      - step:
          id: '388'
          action: Script
          object_path: found = true
      - step:
          id: '389'
          action: Script
          object_path: 'servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services Resource")'
      - step:
          id: '390'
          action: Script
          object_path: 'Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '391'
          object_path: servicesResource
          action: Click
      - step:
          id: '392'
          action: Script
          object_path: Exit For
      - step:
          id: '393'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '394'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '395'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '396'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '397'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '398'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '399'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '400'
          action: Script
          object_path: Exit For
      - step:
          id: '401'
          action: Script
          object_path: End If
      - step:
          id: '402'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '403'
          action: Script
          object_path: w = 1
      - step:
          id: '404'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '405'
          action: Script
          object_path: Exit For
      - step:
          id: '406'
          action: Script
          object_path: End If
      - step:
          id: '407'
          action: Script
          object_path: End If
      - step:
          id: '408'
          action: Script
          object_path: Next
      - step:
          id: '409'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '410'
          action: Script
          object_path: "'add values"
      - step:
          id: '411'
          action: Script
          object_path: 'Call AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)'
      - step:
          id: '412'
          action: Script
          object_path: End If
      - step:
          id: '413'
          action: Script
          object_path: "'save"
      - step:
          id: '414'
          action: Script
          object_path: 'If Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").Object.disabled = false Then'
      - step:
          id: '415'
          action: Script
          object_path: 'saveVis = Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save").GetROProperty("visible")'
      - step:
          id: '416'
          action: Script
          object_path: If saveVis = True Then
      - step:
          id: '417'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebButton("Save")'
          action: Click
      - step:
          id: '418'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '419'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '420'
          object_path: mySendKeys
          action: SendKeys
          args: '"{F5}"'
      - step:
          id: '421'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '422'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '423'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '424'
          action: Wait
          args: '"30"'
          default_args: '"1"'
      - step:
          id: '425'
          action: Script
          object_path: End If
      - step:
          id: '426'
          action: Script
          object_path: End If
      - step:
          id: '427'
          action: Script
          object_path: "'scroll back up to top for next resource"
      - step:
          id: '428'
          action: Script
          object_path: For scroll = 0 To scrollcounter2
      - step:
          id: '429'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '430'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveDown)
      - step:
          id: '431'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '432'
          action: Script
          object_path: Next
      - step:
          id: '433'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '434'
          action: Script
          object_path: End Function
      - step:
          id: '435'
          action: Script
          object_path: 'Function AddLabourResourceValues(labourResourceAvail,labourPlannedHRS,labourPlannedBudget)'
      - step:
          id: '436'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '437'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '438'
          action: Script
          object_path: found = false
      - step:
          id: '439'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '440'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '441'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '442'
          action: Script
          object_path: "'resource found exit loop"
      - step:
          id: '443'
          action: Script
          object_path: 'If inStr(resourceRow,"Labour Resource") > 0 Then'
      - step:
          id: '444'
          action: Script
          object_path: found = true
      - step:
          id: '445'
          action: Script
          object_path: 'labourResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Labour Resource")'
      - step:
          id: '446'
          action: Script
          object_path: 'Set labourResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '447'
          object_path: labourResource
          action: Click
      - step:
          id: '448'
          action: Script
          object_path: Exit For
      - step:
          id: '449'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '450'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '451'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '452'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '453'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '454'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '455'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '456'
          action: Script
          object_path: Exit For
      - step:
          id: '457'
          action: Script
          object_path: End If
      - step:
          id: '458'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '459'
          action: Script
          object_path: w = 1
      - step:
          id: '460'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '461'
          action: Script
          object_path: Exit For
      - step:
          id: '462'
          action: Script
          object_path: End If
      - step:
          id: '463'
          action: Script
          object_path: End If
      - step:
          id: '464'
          action: Script
          object_path: Next
      - step:
          id: '465'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '466'
          action: Script
          object_path: 'Set labResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail, 11, "WebCheckBox",0)'
      - step:
          id: '467'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '468'
          object_path: labResWebCheckBox
          action: set
          args: '"OFF"'
      - step:
          id: '469'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '470'
          action: Script
          object_path: Set labResWebCheckBox = Nothing
      - step:
          id: '471'
          action: Script
          object_path: 'If labourPlannedHRS > 0 Then'
      - step:
          id: '472'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '473'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '474'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '475'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: labourPlannedHRS
      - step:
          id: '476'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '477'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '478'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '479'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '480'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '481'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,6, "WebElement",0)'
          action: Click
      - step:
          id: '482'
          action: Script
          object_path: "' Change remaining hours to planned hours if project hasn't started"
      - step:
          id: '483'
          action: Script
          object_path: 'If orderStatus = "Not Started" Then'
      - step:
          id: '484'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '485'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,6, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '486'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '487'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: labourPlannedHRS
      - step:
          id: '488'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '489'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '490'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '491'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '492'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '493'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4, "WebElement",0)'
          action: Click
      - step:
          id: '494'
          action: Script
          object_path: End If
      - step:
          id: '495'
          action: Script
          object_path: End If
      - step:
          id: '496'
          action: Script
          object_path: 'If labourPlannedBudget > 0 Then'
      - step:
          id: '497'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '498'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,9, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '499'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '500'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: labourPlannedBudget
      - step:
          id: '501'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '502'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '503'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '504'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '505'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '506'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(labourResourceAvail,4, "WebElement",0)'
          action: Click
      - step:
          id: '507'
          action: Script
          object_path: End If
      - step:
          id: '508'
          action: Script
          object_path: End Function
      - step:
          id: '509'
          action: Script
          object_path: 'Function AddMaterialResourceValues(materialResourceAvail,materialPlannedBudget)'
      - step:
          id: '510'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '511'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '512'
          action: Script
          object_path: found = false
      - step:
          id: '513'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '514'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '515'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '516'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '517'
          action: Script
          object_path: 'If inStr(resourceRow,"Material Resource") > 0 Then'
      - step:
          id: '518'
          action: Script
          object_path: found = true
      - step:
          id: '519'
          action: Script
          object_path: 'materialResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Material Resource")'
      - step:
          id: '520'
          action: Script
          object_path: 'Set materialResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '521'
          object_path: materialResource
          action: Click
      - step:
          id: '522'
          action: Script
          object_path: Exit For
      - step:
          id: '523'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '524'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '525'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '526'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '527'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '528'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '529'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '530'
          action: Script
          object_path: Exit For
      - step:
          id: '531'
          action: Script
          object_path: End If
      - step:
          id: '532'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '533'
          action: Script
          object_path: w = 1
      - step:
          id: '534'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '535'
          action: Script
          object_path: Exit For
      - step:
          id: '536'
          action: Script
          object_path: End If
      - step:
          id: '537'
          action: Script
          object_path: End If
      - step:
          id: '538'
          action: Script
          object_path: Next
      - step:
          id: '539'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '540'
          action: Script
          object_path: 'Set matResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail, 11, "WebCheckBox",0)'
      - step:
          id: '541'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '542'
          object_path: matResWebCheckBox
          action: set
          args: '"OFF"'
      - step:
          id: '543'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '544'
          action: Script
          object_path: Set matResWebCheckBox = Nothing
      - step:
          id: '545'
          action: Script
          object_path: 'If materialPlannedBudget > 0 Then'
      - step:
          id: '546'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '547'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,9, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '548'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '549'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: materialPlannedBudget
      - step:
          id: '550'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '551'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '552'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '553'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '554'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '555'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,4, "WebElement",0)'
          action: Click
      - step:
          id: '556'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '557'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '558'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,4, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '559'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '560'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: materialPlannedBudget
      - step:
          id: '561'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '562'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '563'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '564'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '565'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '566'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(materialResourceAvail,9, "WebElement",0)'
          action: Click
      - step:
          id: '567'
          action: Script
          object_path: End If
      - step:
          id: '568'
          action: Script
          object_path: End Function
      - step:
          id: '569'
          action: Script
          object_path: 'Function AddServicesResourceValues(servicesResourceAvail,servicesPlannedBudget)'
      - step:
          id: '570'
          action: Script
          object_path: 'resourceRowCount = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").RowCount'
      - step:
          id: '571'
          action: Script
          object_path: "'search table to find resource"
      - step:
          id: '572'
          action: Script
          object_path: found = false
      - step:
          id: '573'
          action: Script
          object_path: For w = 2 To resourceRowCount
      - step:
          id: '574'
          action: Script
          object_path: 'resourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '575'
          action: Script
          object_path: 'If resourceRow <> "ERROR: The specified cell does not exist." Then'
      - step:
          id: '576'
          action: Script
          object_path: "'resource found exit for"
      - step:
          id: '577'
          action: Script
          object_path: 'If inStr(resourceRow,"Services Resource") > 0 Then'
      - step:
          id: '578'
          action: Script
          object_path: found = true
      - step:
          id: '579'
          action: Script
          object_path: 'servicesResourceAvail = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetRowWithCellText("Services Resource")'
      - step:
          id: '580'
          action: Script
          object_path: 'Set servicesResource = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(w, 1, "WebElement", 0)'
      - step:
          id: '581'
          object_path: servicesResource
          action: Click
      - step:
          id: '582'
          action: Script
          object_path: Exit For
      - step:
          id: '583'
          action: Script
          object_path: ElseIf w = resourceRowCount Then
      - step:
          id: '584'
          action: Script
          object_path: "'end of visible rows, scroll down and start again"
      - step:
          id: '585'
          action: Script
          object_path: On Error Resume Next
      - step:
          id: '586'
          object_path: 'Browser("Oracle Primavera P6 EPPM").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Swipe(moveUp)
      - step:
          id: '587'
          action: Script
          object_path: scrollcounter2 = scrollcounter2 + 1
      - step:
          id: '588'
          action: Script
          object_path: 'newResourceRow = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").GetCellData(w, 1)'
      - step:
          id: '589'
          action: Script
          object_path: If newResourceRow = resourceRow Then
      - step:
          id: '590'
          action: Script
          object_path: Exit For
      - step:
          id: '591'
          action: Script
          object_path: End If
      - step:
          id: '592'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '593'
          action: Script
          object_path: w = 1
      - step:
          id: '594'
          action: Script
          object_path: 'ElseIf w = resourceRowCount and resourceRow = "ERROR: The specified cell does not exist." Then'
      - step:
          id: '595'
          action: Script
          object_path: Exit For
      - step:
          id: '596'
          action: Script
          object_path: End If
      - step:
          id: '597'
          action: Script
          object_path: End If
      - step:
          id: '598'
          action: Script
          object_path: Next
      - step:
          id: '599'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '600'
          action: Script
          object_path: 'Set serResWebCheckBox = Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail, 11, "WebCheckBox",0)'
      - step:
          id: '601'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '602'
          object_path: serResWebCheckBox
          action: set
          args: '"OFF"'
      - step:
          id: '603'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '604'
          action: Script
          object_path: Set serResWebCheckBox = Nothing
      - step:
          id: '605'
          action: Script
          object_path: 'If servicesPlannedBudget > 0 Then'
      - step:
          id: '606'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '607'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,9, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '608'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '609'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: servicesPlannedBudget
      - step:
          id: '610'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '611'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '612'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '613'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '614'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '615'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,4, "WebElement",0)'
          action: Click
      - step:
          id: '616'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '617'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes")'
          action: Highlight
      - step:
          id: '618'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,4, "WebElement",0)'
          action: DoubleClick
      - step:
          id: '619'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '620'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebEdit("ResourceValue")'
          action: Set
          args: servicesPlannedBudget
      - step:
          id: '621'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '622'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '623'
          object_path: mySendKeys
          action: SendKeys
          args: '"{ENTER}"'
      - step:
          id: '624'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '625'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '626'
          object_path: 'Browser("Primavera P6 - Activities").Page("Primavera P6 - Activities").WebTable("ResourceAttributes").ChildItem(servicesResourceAvail,9, "WebElement",0)'
          action: Click
      - step:
          id: '627'
          action: Script
          object_path: End If
      - step:
          id: '628'
          action: Script
          object_path: End Function
      - step:
          id: '629'
          action: Script
          object_path: Function ClearVariables
      - step:
          id: '630'
          action: Script
          object_path: 'orderStatus = ""'
      - step:
          id: '631'
          action: Script
          object_path: 'colKey_plan1 = ""'
      - step:
          id: '632'
          action: Script
          object_path: 'rowContainingOrdNum = ""'
      - step:
          id: '633'
          action: Script
          object_path: 'WBSelement = ""'
      - step:
          id: '634'
          action: Script
          object_path: 'WBSrow = ""'
      - step:
          id: '635'
          action: Script
          object_path: 'emailContent = ""'
      - step:
          id: '636'
          action: Script
          object_path: 'LabourCostElementGroups = ""'
      - step:
          id: '637'
          action: Script
          object_path: 'MaterialsCostElementGroups = ""'
      - step:
          id: '638'
          action: Script
          object_path: 'ServicesCostElementGroups = ""'
      - step:
          id: '639'
          action: Script
          object_path: 'planVersion = ""'
      - step:
          id: '640'
          action: Script
          object_path: 'WBS = ""'
      - step:
          id: '641'
          action: Script
          object_path: 'Count = ""'
      - step:
          id: '642'
          action: Script
          object_path: 'Found = ""'
      - step:
          id: '643'
          action: Script
          object_path: 'NodeText = ""'
      - step:
          id: '644'
          action: Script
          object_path: 'labourPlannedHRS = ""'
      - step:
          id: '645'
          action: Script
          object_path: 'labourPlannedHRS1 = ""'
      - step:
          id: '646'
          action: Script
          object_path: 'Lplannedbudget = ""'
      - step:
          id: '647'
          action: Script
          object_path: 'labourPlannedBudget = ""'
      - step:
          id: '648'
          action: Script
          object_path: 'Mplannedbudget = ""'
      - step:
          id: '649'
          action: Script
          object_path: 'materialPlannedbudget = ""'
      - step:
          id: '650'
          action: Script
          object_path: 'Splannedbudget = ""'
      - step:
          id: '651'
          action: Script
          object_path: 'servicesPlannedbudget = ""'
      - step:
          id: '652'
          action: Script
          object_path: 'nodeKey = ""'
      - step:
          id: '653'
          action: Script
          object_path: 'columnName = ""'
      - step:
          id: '654'
          action: Script
          object_path: 'itemText = ""'
      - step:
          id: '655'
          action: Script
          object_path: 'plannedProjectBudget = ""'
      - step:
          id: '656'
          action: Script
          object_path: 'labourRow = ""'
      - step:
          id: '657'
          action: Script
          object_path: 'controlKeyValue = ""'
      - step:
          id: '658'
          action: Script
          object_path: 'saveVis = ""'
      - step:
          id: '659'
          action: Script
          object_path: 'ExpandCollapseDock = ""'
      - step:
          id: '660'
          action: Script
          object_path: 'assignmentVis = ""'
      - step:
          id: '661'
          action: Script
          object_path: 'employeeHours = ""'
      - step:
          id: '662'
          action: Script
          object_path: 'rowObj = ""'
      - step:
          id: '663'
          action: Script
          object_path: 'noEmpHoursFound = ""'
      - step:
          id: '664'
          action: Script
          object_path: 'WBSelementSplit = ""'
      - step:
          id: '665'
          action: Script
          object_path: 'systemStatus = ""'
      - step:
          id: '666'
          action: Script
          object_path: Set employeeTableDict = Nothing
      - step:
          id: '667'
          action: Script
          object_path: Set employeeNameDict = Nothing
      - step:
          id: '668'
          action: Script
          object_path: Set tree = Nothing
      - step:
          id: '669'
          action: Script
          object_path: Set TreeObj = Nothing
      - step:
          id: '670'
          action: Script
          object_path: Set AllValues = Nothing
      - step:
          id: '671'
          action: Script
          object_path: Set columnNames = Nothing
      - step:
          id: '672'
          action: Script
          object_path: End Function
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: SAP Easy Access  -  User
              child_objects: []
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
                      value: 'wnd[0]'
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
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'ses[0]'
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
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
                value: '/app/con[0]/ses[0]'
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
        comments: ''
        custom_replay: ''
        class: SAPGuiSession
        visual_relations: ''
        last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
    - object:
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
        name: Primavera P6 - Activities
        child_objects:
          - object:
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
              name: SmartInstall
              child_objects:
                - object:
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
                    name: __list1-listUl
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/UL[@role="listbox"][1]'
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
                            value: 'ExpandINVERTER 1Verify(ABB) Power-One Italy S.p.AREACT2-UNO-5.0-TLQuantity: 1ExpandPV PANELSVerifyAblytek Co Ltd6MN5A215Quantity: 30ExpandBATTERYVerifyTesla Motors Australia Pty LtdAC PowerwallQuantity: 1'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: __button15-__list1-0-img
                    child_objects: []
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
                            value: sapUiIcon sapUiIconMirrorInRTL sapMBtnCustomIcon sapMBtnIcon sapMBtnIconLeft
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
                            value: '//DIV[@id="application-install-display-component---Installer"]/DIV[1]/DIV[2]/SECTION[1]/DIV[1]/DIV[2]/DIV[1]/UL[@role="listbox"][1]/LI[@role="option"][1]/DIV[1]/DIV[@role="form"][1]/DIV[@role="toolbar"][1]/BUTTON[1]/SPAN[1]/SPAN[@role="presentation"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
                    smart_identification: ''
                    name: SAPUIToolbar
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPUIToolbar
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - name
                        - html tag
                      ordinal_identifier:
                        value: 1
                        type: index
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
                      value: 'https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Enterprise_2
              child_objects:
                - object:
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
                    name: SA Power Networks
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: WebElement
                    child_objects: []
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
                            value: '//TR[@role="row"][6]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/DIV[1]/I[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: No search results found.
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/DIV[1]/SPAN[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: 1grid-viewport-rowset-EPSRowset-gro
                    child_objects: []
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
                            value: SA Power Networks SA Power Networks Field Services/Network Management Field Services/Network Management Field Services Projects Field Services Projects 2021 2021 Year of Construction 2021 Circuit Breaker 2021 Circuit Breaker NW-017526 Bordertown Substation CB Replacement
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
                            value: viewport viewport-fixed viewport-EPSRowset viewport-fixed last-viewport-fixed
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
                            value: '//DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Search
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[6]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: PlannedFilter
                    child_objects: []
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
                            value: '//TR[@role="row"][12]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ActualsFilter
                    child_objects: []
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
                            value: '//TR[@role="row"][11]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Save View
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: FilterSave
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Cancel
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Open Project
                    child_objects: []
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
                            value: '//LI[@role="menuitem"]/A[normalize-space()="Open Project"]'
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
                            value: 'https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?projectId=12910&wbsId=491866&ProjectName=null&selectedItem=ARO111_515875&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?projectId=12910&wbsId=491866&ProjectName=null&selectedItem=ARO111_7232&checkTabs=true'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Enterprise
              child_objects:
                - object:
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
                    name: pgbu-dropdown-menu-259
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebMenu
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
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
                    name: StartDate
                    child_objects: []
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
                            value: '//TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Reporting Only
                    child_objects: []
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
                            value: '//TR[@role="row"]/TD[@role="rowheader" and normalize-space()="Reporting Only"]/DIV[1]/DIV[2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Row
                    child_objects: []
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
                            value: '//TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Save
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Filters
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button" and normalize-space()="Filters"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Open Project
                    child_objects: []
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
                            value: '//LI[@role="menuitem"]/A[normalize-space()="Open Project"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Manage Filters...
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/UL[@role="menu"]/LI/A[@role="menuitem" and normalize-space()="Manage Filters..."]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Close All
                    child_objects: []
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
                            value: '//LI[@role="menuitem" and normalize-space()="Close All"]/A[1]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - role
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?selectedItem=ARO111_301732'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Activities
              child_objects:
                - object:
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
                    name: oui-tree-panel-115
                    child_objects: []
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
                            value: '//DIV[3]/DIV[@role="tree"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'oui-tree-panel-.*'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebTree
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - name
                      ordinal_identifier: ''
                - object:
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
                    name: ResourceName
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ResourceAttributes
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ID_Code_Table
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ActivityDetails
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: active-resource-view
                    child_objects: []
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
                            value: '//BUTTON[@id="active-resource-view"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: WebElement_4
                    child_objects: []
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
                            value: '//TD[@role="gridcell"]/DIV/DIV[normalize-space()="A1190"]/I[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier:
                        value: 0
                        type: index
                - object:
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
                    name: WebElement_3
                    child_objects: []
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
                            value: '//TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: WebElement_2
                    child_objects: []
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
                            value: '//TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]/I[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: WebElement
                    child_objects: []
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: UA
                    child_objects: []
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
                            value: 'UA.*'
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: WebElement
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: TitleCell
                    child_objects: []
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
                            value: '.*'
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
                            value: '//TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Schedule... Actions
                    child_objects: []
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
                            value: 'Schedule... Actions    Define Baselines Apply Actuals Check Schedule Dissolve Import Create Import Template Import from Excel Leveler Link Selected Activities Open Dependent Projects Publish Projects Recalculate Assignment Costs Store Period Performance Summarize Projects Views Automation View Select Field: Press Down to show all options or type a letter to filter values. Grid View Gantt View Activity Network View Progress Spotlight (Ctrl+Alt+S) Filters Manage Filters... Clear All Filters Applied Order Number is not empty Recent Full Screen Print Options Print Options Customize View Enter a query to search.No filter applied'
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
                            value: '//DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Same resource could not
                    child_objects: []
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
                            value: Same resource could not be added because the project does not permit the same resource to be assigned to an activity more than once
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
                            value: '//DIV[@id="alert-modal"]/DIV[2]/P[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: oui-calendar-36
                    child_objects: []
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
                            value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: NoResultFound
                    child_objects: []
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
                            value: '//DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No results found"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: No results found Labour
                    child_objects: []
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
                            value: '//DIV[3]/DIV[@role="tree"][1]/DIV[3]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: master-panel
                    child_objects: []
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
                            value: 'Schedule... Actions.*'
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
                            value: '//DIV[@id="master-panel"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - visible
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Labour
                    child_objects: []
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
                            value: '//DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: gantt-0-bar-vertical-scroller
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[7]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Download
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation" and normalize-space()="Download"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: WebElement
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - visible
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Calendar
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading" and normalize-space()="January 2020"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Assignments
                    child_objects: []
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
                            value: '//LI/A[@role="tab" and normalize-space()="Assignments"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: 3grid-scroller-vertical-assignments
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[17]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: WebEdit
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Search
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ResourceValue
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Row
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ‹
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: 'Yes'
                    child_objects: []
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
                            value: '//DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Views
                    child_objects: []
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
                            value: '//DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox" and normalize-space()="Automation View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Today
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Save View
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Save
                    child_objects: []
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
                            value: '//DIV/DIV/BUTTON[normalize-space()="Save"]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: OK
                    child_objects: []
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
                            value: '//DIV/BUTTON[normalize-space()="OK"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Got It
                    child_objects: []
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
                            value: '//BUTTON[@id="okBtn"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Cancel_2
                    child_objects: []
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
                            value: '//DIV[@id="lwfactivities"]/DIV[@role="main"][1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/BUTTON[1]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: WebButton
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - visible
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Cancel
                    child_objects: []
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
                            value: '//DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Assign...
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button" and normalize-space()="Assign..."]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Assign
                    child_objects: []
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
                            value: '//DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Resource
                    child_objects: []
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
                            value: '//LI/A[@role="menuitem" and normalize-space()="Resource"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: ExpandCollapseDock
                    child_objects: []
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
                            value: '//DIV/DIV/A[normalize-space()="Expand Dock"]'
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
                            value: '.*'
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
                            value: '.*'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=&checkTabs=true#'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: Link
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Download
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation"]/DIV/DIV/A[normalize-space()="Download"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084779&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Automation View
                    child_objects: []
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
                            value: '//LI[@role="option"]/A[normalize-space()="Automation View"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Assignments
                    child_objects: []
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
                            value: '//LI/A[@role="tab" and normalize-space()="Assignments"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#assignments-tab'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - role
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: All Resources
                    child_objects: []
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
                            value: '//LI[@id="active-resource-view-AR"]/A[normalize-space()="All Resources"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF Stands (NW-016412) (Deferred to 2021)
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Oracle Primavera P6 EPPM_2
              child_objects:
                - object:
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
                    name: databaseId
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Dropdown menu
                    child_objects: []
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
                            value: '//UL[@id="databaseId-menu"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Prod - Enerven
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Database
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Prod - Field Services
                    child_objects: []
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
                            value: '//LI[@role="option"][2]/A[1]'
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
                            value: 'https://prvprd612.utilities.etsa.net.au/p6/action/login#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Advanced
                    child_objects: []
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
                            value: '//A[@id="advancedOptionsToggle"]'
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
                            value: 'https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/login'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/login'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Oracle Primavera P6 EPPM
              child_objects:
                - object:
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
                    name: databaseId
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: QAS - Field Services
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: QAS - Field Services
                    child_objects: []
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
                            value: '//LI[@role="option"]/A[normalize-space()="QAS - Field Services"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Advanced
                    child_objects: []
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
                            value: '//A[@id="advancedOptionsToggle"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF Stands (NW-016412) (Deferred to 2021)
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/authorize?client_id=00000003-0000-0ff1-ce00-000000000000&response_mode=form_post&protectedtoken=true&response_type=code+id_token&resource=00000003-0000-0ff1-ce00-000000000000&scope=openid&nonce=EFDA664BEE14CF4D567E6225E5050C33F0DAB75D8955DA0F-D806393BCC380B7E76D2AB726B36E5E071A7BB8BD06F5CC99EA10670435E284F&redirect_uri=https%3a%2f%2fsapowernetworks.sharepoint.com%2f_forms%2fdefault.aspx&claims=%7b%22id_token%22%3a%7b%22xms_cc%22%3a%7b%22values%22%3a%5b%22CP1%22%5d%7d%7d%7d&wsucxt=1&cobrandid=11bd8083-87e0-41b5-bb78-0bc43c8a8e8a&client-request-id=3702a29f-609b-0000-55d3-5f158ce8ed8d&sso_nonce=AwABAAAAAAABAOz_AwD0_-gbbHmaFI7HiglbXtcb9hd3BoFqPdOJDcB6D9SyDrtHfoARQjH1Nmdm3r4y8_kJ4MfUUqYnXpM9I2OaYPTt6AcgAA&mscrid=3702a29f-609b-0000-55d3-5f158ce8ed8d'
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
                value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF Stands (NW-016412) (Deferred to 2021)
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
        comments:
          comment:
            - value: ''
              name: miccommentproperty
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 0
            type: creationtime
    - object:
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
        name: Oracle Primavera P6 EPPM
        child_objects:
          - object:
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
              name: SmartInstall
              child_objects:
                - object:
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
                    name: __list1-listUl
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/UL[@role="listbox"][1]'
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
                            value: 'ExpandINVERTER 1Verify(ABB) Power-One Italy S.p.AREACT2-UNO-5.0-TLQuantity: 1ExpandPV PANELSVerifyAblytek Co Ltd6MN5A215Quantity: 30ExpandBATTERYVerifyTesla Motors Australia Pty LtdAC PowerwallQuantity: 1'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
                    smart_identification: ''
                    name: SAPUIList
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPUIList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - name
                        - html tag
                      ordinal_identifier:
                        value: 1
                        type: index
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
                      value: 'https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://nonprod-generation.sapowernetworks.com.au/sites#install-display&/Installer/%7B%7D'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Enterprise
              child_objects:
                - object:
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
                    name: Row menu
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/UL[@role="menu"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebMenu
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
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
                    name: pgbu-dropdown-menu-259
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebMenu
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
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
                    name: StartDate
                    child_objects: []
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
                            value: '//TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Row_2
                    child_objects: []
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
                            value: '//TR[@role="row" and normalize-space()="Status - What-If"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Row
                    child_objects: []
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
                            value: '//TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Save_2
                    child_objects: []
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
                            value: '//DIV/DIV/BUTTON[normalize-space()="Save"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Save View
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Save
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Grid View
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[normalize-space()="Grid View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Filters
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button" and normalize-space()="Filters"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Customize View
                    child_objects: []
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
                            value: '//DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/BUTTON[normalize-space()="Customize View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Close
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[1]/A[@role="button"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Cancel
                    child_objects: []
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
                            value: '//DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Activities
                    child_objects: []
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
                            value: '//A[@id="tab_link_ProjectActivities"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?projectId=10083&wbsId=301732&ProjectName=null&checkTabs=true&selectedItem=ARO111_7232'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Dashboards
              child_objects:
                - object:
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
                    name: Projects
                    child_objects: []
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
                            value: '//LI[@id="menu.section.multiprojects"]/DIV/A[normalize-space()="Projects"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projectstartpage?'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/home'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/home'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Activities_2
              child_objects:
                - object:
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
                    name: Search
                    child_objects: []
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
                            value: '//DIV[1]/DIV[@role="toolbar"][1]/DIV[8]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '206'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '156'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '682'
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
                            value: pgbu-input-107
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '28'
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
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '259'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '682'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - placeholder
                        - name
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/pm/activities'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvprd612.utilities.etsa.net.au/p6/action/pm/activities?projectId=14335&wbsId=566869&ProjectName=null&selectedItem=&checkTabs=true'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Primavera P6 - Activities of McLaren Vale 33kV Recloser R5202 Replacement
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
                      value: '10054'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Primavera P6 - Activities
              child_objects:
                - object:
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
                    name: oui-tree-panel-115
                    child_objects: []
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
                            value: '//DIV[3]/DIV[@role="tree"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'oui-tree-panel-.*'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebTree
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - name
                      ordinal_identifier: ''
                - object:
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
                    name: GeneralGeneralAssignments
                    child_objects: []
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
                            value: '//DIV[2]/DIV[2]/DIV[3]/DIV[1]/DIV[1]/UL[@role="tablist"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTabStrip
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ResourceName
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ResourceAttributes
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ActivityDetails
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Row menu
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV/UL[@role="menu" and normalize-space()="Delete"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebMenu
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
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
                    name: Views
                    child_objects: []
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
                            value: '//DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox" and normalize-space()="Automation View"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - role
                        - name
                        - html tag
                        - acc_name
                      ordinal_identifier: ''
                - object:
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
                    name: active-resource-view
                    child_objects: []
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
                            value: '//BUTTON[@id="active-resource-view"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: UA
                    child_objects: []
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
                            value: 'UA.*'
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: WebElement
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: oui-calendar-36
                    child_objects: []
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
                            value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: NoResultFound
                    child_objects: []
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
                            value: '//DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No results found"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Labour
                    child_objects: []
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
                            value: '//DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Calendar
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading" and normalize-space()="January 2020"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: Assignments
                    child_objects: []
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
                            value: '//LI/A[@role="tab" and normalize-space()="Assignments"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
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
                    name: WebEdit
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Search
                    child_objects: []
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
                            value: '//DIV[2]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ResourceValue
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Row
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: ‹
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: 'Yes'
                    child_objects: []
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
                            value: '//DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Today
                    child_objects: []
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
                            value: '//DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Save
                    child_objects: []
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
                            value: '//DIV/DIV/BUTTON[normalize-space()="Save"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: OK
                    child_objects: []
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
                            value: '//DIV/BUTTON[normalize-space()="OK"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Close
                    child_objects: []
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
                            value: '//DIV[@id="grid-settings-dialog"]/DIV[1]/DIV[1]/A[@role="button"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Cancel
                    child_objects: []
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
                            value: '//DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Assign...
                    child_objects: []
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
                            value: '//DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button" and normalize-space()="Assign..."]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Assign
                    child_objects: []
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
                            value: '//DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Resource
                    child_objects: []
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
                            value: '//LI/A[@role="menuitem" and normalize-space()="Resource"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Manage Views...
                    child_objects: []
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
                            value: '//LI[@role="option"]/A[normalize-space()="Manage Views..."]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: EPS
                    child_objects: []
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
                            value: '//A[@id="tab_link_ProjectEPS"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Automation View
                    child_objects: []
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
                            value: '//LI[@role="option"]/A[normalize-space()="Automation View"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: All Resources
                    child_objects: []
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
                            value: '//LI[@id="active-resource-view-AR"]/A[normalize-space()="All Resources"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'Primavera P6 - Activities of 11kV Cable Box Replacement Program 2020, 2019 Earth Grid, 2019 Fencing, 38 Currie CBD 11kV'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Oracle Primavera P6 EPPM
              child_objects:
                - object:
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
                    name: databaseId
                    child_objects: []
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
                            value: '//BUTTON[@id="databaseId"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
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
                - object:
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
                    name: Username
                    child_objects: []
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
                            value: '//INPUT[@id="username"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: password
                    child_objects: []
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
                            value: '//INPUT[@id="password"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Sign In
                    child_objects: []
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
                            value: '//BUTTON[@id="login"]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: QAS - Field Services
                    child_objects: []
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
                            value: '//LI[@role="option"]/A[normalize-space()="QAS - Field Services"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                    name: Advanced
                    child_objects: []
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
                            value: '//A[@id="advancedOptionsToggle"]'
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
                            value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions'
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
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
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
                value: 'https://prvqas612.utilities.etsa.net.au/p6/action/login'
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
        comments:
          comment:
            - value: ''
              name: miccommentproperty
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: 'Tuesday, 10 May 2022 4:33:50 PM'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 1
            type: creationtime
  check_points_and_outputs: []
  parameters: []
