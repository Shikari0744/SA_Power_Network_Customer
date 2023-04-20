namespace: HighRiskLicenseUpdates
operation:
  name: HighRiskLicense
  inputs:
  - sf_user: svcrobotest
  - sf_pass: SuccessFactors@2022
  sequential_action:
    gav: com.microfocus.seq:HighRiskLicenseUpdates.HighRiskLicense:1.0.0
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
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '2'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '3'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '4'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\High Risk License\High Risk Licence Task.xlsx")
    - step:
        id: '5'
        action: Script
        object_path: '''Set objWorkbook = objExcel.Workbooks.open("C:\Users\haasj0\OneDrive
          - SA Power Networks\Documents\Process Automation\High Risk Licenses\High
          Risk Licence Task.xlsx")'
    - step:
        id: '6'
        action: Script
        object_path: sheetCount = objWorkbook.Worksheets.Count
    - step:
        id: '7'
        action: Script
        object_path: For sheet = 1 To sheetCount
    - step:
        id: '8'
        action: Script
        object_path: sheetName = objWorkbook.Worksheets(sheet).Name
    - step:
        id: '9'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(sheetName)
    - step:
        id: '10'
        action: Script
        object_path: rowCount = objSheet.usedrange.Rows.Count
    - step:
        id: '11'
        action: Script
        object_path: For i = 3 To rowCount
    - step:
        id: '12'
        action: Script
        object_path: updateCheck = objSheet.cells(i,20).value
    - step:
        id: '13'
        action: Script
        object_path: If updateCheck = "" Then
    - step:
        id: '14'
        action: Script
        object_path: highRisk = ""
    - step:
        id: '15'
        action: Script
        object_path: first = objSheet.cells(i,1).value
    - step:
        id: '16'
        action: Script
        object_path: If first = "" Then
    - step:
        id: '17'
        action: Script
        object_path: Exit For
    - step:
        id: '18'
        action: Script
        object_path: End If
    - step:
        id: '19'
        action: Script
        object_path: last = objSheet.cells(i,2).value
    - step:
        id: '20'
        action: Script
        object_path: fullname = first & " " & last
    - step:
        id: '21'
        action: Script
        object_path: lf = objSheet.cells(i,6).value
    - step:
        id: '22'
        action: Script
        object_path: If lf <> "" Then
    - step:
        id: '23'
        action: Script
        object_path: highRisk = highRisk & " LF"
    - step:
        id: '24'
        action: Script
        object_path: End If
    - step:
        id: '25'
        action: Script
        object_path: c1 = objSheet.cells(i,7).value
    - step:
        id: '26'
        action: Script
        object_path: If c1 <> "" Then
    - step:
        id: '27'
        action: Script
        object_path: highRisk = highRisk & " C1"
    - step:
        id: '28'
        action: Script
        object_path: End If
    - step:
        id: '29'
        action: Script
        object_path: c2 = objSheet.cells(i,8).value
    - step:
        id: '30'
        action: Script
        object_path: If c2 <> "" Then
    - step:
        id: '31'
        action: Script
        object_path: highRisk = highRisk & " C2"
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: cv = objSheet.cells(i,9).value
    - step:
        id: '34'
        action: Script
        object_path: If cv <> "" Then
    - step:
        id: '35'
        action: Script
        object_path: highRisk = highRisk & " CV"
    - step:
        id: '36'
        action: Script
        object_path: End If
    - step:
        id: '37'
        action: Script
        object_path: cb = objSheet.cells(i,10).value
    - step:
        id: '38'
        action: Script
        object_path: If cb <> "" Then
    - step:
        id: '39'
        action: Script
        object_path: highRisk = highRisk & " CB"
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: cn = objSheet.cells(i,11).value
    - step:
        id: '42'
        action: Script
        object_path: If cn <> "" Then
    - step:
        id: '43'
        action: Script
        object_path: highRisk = highRisk & " CN"
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: c6 = objSheet.cells(i,12).value
    - step:
        id: '46'
        action: Script
        object_path: If c6 <> "" Then
    - step:
        id: '47'
        action: Script
        object_path: highRisk = highRisk & " C6"
    - step:
        id: '48'
        action: Script
        object_path: End If
    - step:
        id: '49'
        action: Script
        object_path: c0 = objSheet.cells(i,13).value
    - step:
        id: '50'
        action: Script
        object_path: If c0 <> "" Then
    - step:
        id: '51'
        action: Script
        object_path: highRisk = highRisk & " C0"
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: wp = objSheet.cells(i,14).value
    - step:
        id: '54'
        action: Script
        object_path: If wp <> "" Then
    - step:
        id: '55'
        action: Script
        object_path: highRisk = highRisk & " WP"
    - step:
        id: '56'
        action: Script
        object_path: End If
    - step:
        id: '57'
        action: Script
        object_path: rb = objSheet.cells(i,15).value
    - step:
        id: '58'
        action: Script
        object_path: If rb <> "" Then
    - step:
        id: '59'
        action: Script
        object_path: highRisk = highRisk & " RB"
    - step:
        id: '60'
        action: Script
        object_path: End If
    - step:
        id: '61'
        action: Script
        object_path: dg = objSheet.cells(i,16).value
    - step:
        id: '62'
        action: Script
        object_path: If dg <> "" Then
    - step:
        id: '63'
        action: Script
        object_path: highRisk = highRisk & " DG"
    - step:
        id: '64'
        action: Script
        object_path: End If
    - step:
        id: '65'
        action: Script
        object_path: highRisk = Trim(highRisk)
    - step:
        id: '66'
        action: Script
        object_path: If highRisk <> "" Then
    - step:
        id: '67'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '68'
        object_path: 'Browser("SuccessFactors: People").Page("Home").WebEdit("Search
          for actions or")'
        action: Set
        args: fullname
    - step:
        id: '69'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '70'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '71'
        action: Script
        object_path: 'listItems = Browser("SuccessFactors: People").Page("Home").WebList("Employee
          Search List").GetROProperty("items count")'
    - step:
        id: '72'
        action: Script
        object_path: If listItems = 1 Then
    - step:
        id: '73'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '74'
        action: Script
        object_path: On error resume next
    - step:
        id: '75'
        object_path: 'Browser("SuccessFactors: People").Page("Home").WebList("Employee
          Search List")'
        action: Select
        args: '"#0"'
    - step:
        id: '76'
        action: Script
        object_path: On error goto 0
    - step:
        id: '77'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '78'
        action: Script
        object_path: 'If Browser("SuccessFactors: People").Page("SuccessFactors: People_2").WebButton("Open
          Menu").Exist(3) Then'
    - step:
        id: '79'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People_2").WebButton("Open
          Menu")'
        action: Click
    - step:
        id: '80'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '81'
        action: Script
        object_path: 'allItems = Browser("SuccessFactors: People").Page("SuccessFactors:
          People_2").WebMenu("User Information Personal").GetROProperty("innertext")'
    - step:
        id: '82'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").WebElement("Dropdown")'
        action: Click
    - step:
        id: '83'
        object_path: '''Browser("Login - SAP SuccessFactors").Page("SuccessFactors:
          People").WebElement("__select0")'
        action: Click
        snapshot: .\Snapshots\ssf16.html
        highlight_id: '10000000'
    - step:
        id: '84'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '85'
        object_path: '''Browser("Login - SAP SuccessFactors").Page("SuccessFactors:
          People").WebList("__list0")'
        action: Select
        args: '"License Details"'
        snapshot: .\Snapshots\ssf17.html
        highlight_id: '10000000'
    - step:
        id: '86'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '87'
        action: Script
        object_path: '''allitems = Browser("SuccessFactors: People").Page("SuccessFactors:
          People").WebList("Dropdown List").GetROProperty("all items")'
    - step:
        id: '88'
        action: Script
        object_path: If InStr(allitems, "License Details") > 0 Then
    - step:
        id: '89'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People_2").WebElement("__xmlview0--objectPage-anchBar")'
        action: Click
    - step:
        id: '90'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").WebList("Dropdown
          List")'
        action: Select
        args: '"License Details"'
    - step:
        id: '91'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '92'
        action: Script
        object_path: 'If Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("License
          Detail").Exist(3) Then'
    - step:
        id: '93'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("License
          Detail")'
        action: Highlight
    - step:
        id: '94'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("License
          Detail")'
        action: Click
    - step:
        id: '95'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '96'
        action: Script
        object_path: Set myElement = Description.Create
    - step:
        id: '97'
        object_path: myElement("micclass")
        action: value
        args: = "WebElement"
    - step:
        id: '98'
        object_path: myElement("role")
        action: Value
        args: = "toolbar"
    - step:
        id: '99'
        object_path: myElement("acc_name")
        action: Value
        args: = "License Detail"
    - step:
        id: '100'
        object_path: myElement("html tag")
        action: Value
        args: = "DIV"
    - step:
        id: '101'
        action: Script
        object_path: 'count = Browser("SuccessFactors: People").Page("SuccessFactors:
          People").ChildObjects(myElement).Count'
    - step:
        id: '102'
        action: Script
        object_path: highRiskFound = false
    - step:
        id: '103'
        action: Script
        object_path: For p = 1 to count
    - step:
        id: '104'
        action: Script
        object_path: 'highriskLicence = Browser("SuccessFactors: People").Page("SuccessFactors:
          People").WebEdit("acc_name:=Licence Type","html tag:=INPUT","class:=sapMInputBaseInner
          sapMComboBoxInner","index:="&p-1).GetROProperty("default value")'
    - step:
        id: '105'
        action: Script
        object_path: If highriskLicence = "High Risk" Then
    - step:
        id: '106'
        action: Script
        object_path: highRiskFound = true
    - step:
        id: '107'
        action: Script
        object_path: 'licenceKeyNumber = Browser("SuccessFactors: People").Page("SuccessFactors:
          People").WebEdit("acc_name:=Key Number","html tag:=INPUT","class:=sapMInputBaseInner","index:="&p-1).GetROProperty("default
          value")'
    - step:
        id: '108'
        action: Script
        object_path: newKeyNumber = licenceKeyNumber & " (" & highRisk & ")"
    - step:
        id: '109'
        action: Script
        object_path: If IsNumeric(licenceKeyNumber) Then
    - step:
        id: '110'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '111'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebEdit("acc_name:=Key
          Number","html tag:=INPUT","class:=sapMInputBaseInner","index:="&p-1)'
        action: Set
        args: newKeyNumber
    - step:
        id: '112'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '113'
        object_path: mySendKeys
        action: SendKeys
        args: '"{TAB}"'
    - step:
        id: '114'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '115'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("SaveSave")'
        action: Click
    - step:
        id: '116'
        action: Script
        object_path: 'If Browser("SuccessFactors: People").Page("SuccessFactors: People").WebElement("Error").Exist(1)
          Then'
    - step:
        id: '117'
        action: Script
        object_path: 'errorfound = Browser("SuccessFactors: People").Page("SuccessFactors:
          People").WebElement("Error").GetROProperty("innertext")'
    - step:
        id: '118'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("Close")'
        action: Click
    - step:
        id: '119'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("CancelCancel")'
        action: Click
    - step:
        id: '120'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("Don’t
          Save")'
        action: Click
    - step:
        id: '121'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("Home
          Image")'
        action: Click
    - step:
        id: '122'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("SA
          Power Networks Logo")'
        action: Click
    - step:
        id: '123'
        object_path: objSheet.cells(i,19)
        action: value
        args: = newKeyNumber
    - step:
        id: '124'
        object_path: objSheet.cells(i,20)
        action: value
        args: = errorfound
    - step:
        id: '125'
        action: Script
        object_path: Else
    - step:
        id: '126'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("Home
          Image")'
        action: Click
    - step:
        id: '127'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("SA
          Power Networks Logo")'
        action: Click
    - step:
        id: '128'
        object_path: objSheet.cells(i,19)
        action: value
        args: = newKeyNumber
    - step:
        id: '129'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "Updated successfully"
    - step:
        id: '130'
        action: Script
        object_path: End If
    - step:
        id: '131'
        action: Script
        object_path: Else
    - step:
        id: '132'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("CancelCancel")'
        action: Click
    - step:
        id: '133'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("Home
          Image")'
        action: Click
    - step:
        id: '134'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("SA
          Power Networks Logo")'
        action: Click
    - step:
        id: '135'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '136'
        object_path: objSheet.cells(i,20)
        action: value
        args: '= "High Risk License not numeric - already contained characters: "&licenceKeyNumber'
    - step:
        id: '137'
        action: Script
        object_path: End If
    - step:
        id: '138'
        action: Script
        object_path: Exit For
    - step:
        id: '139'
        action: Script
        object_path: End If
    - step:
        id: '140'
        action: Script
        object_path: Next
    - step:
        id: '141'
        action: Script
        object_path: If highRiskFound = false Then
    - step:
        id: '142'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").WebButton("CancelCancel")'
        action: Click
    - step:
        id: '143'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("Home
          Image")'
        action: Click
    - step:
        id: '144'
        object_path: 'Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("SA
          Power Networks Logo")'
        action: Click
    - step:
        id: '145'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '146'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "High Risk License not found"
    - step:
        id: '147'
        action: Script
        object_path: End If
    - step:
        id: '148'
        action: Script
        object_path: Else
    - step:
        id: '149'
        object_path: '''Browser("SuccessFactors: People").Page("SuccessFactors: People").Image("SA
          Power Networks Logo")'
        action: Click
    - step:
        id: '150'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '151'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "High Risk License not found"
    - step:
        id: '152'
        action: Script
        object_path: End If
    - step:
        id: '153'
        action: Script
        object_path: Else
    - step:
        id: '154'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '155'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "No License Details found"
    - step:
        id: '156'
        action: Script
        object_path: End If
    - step:
        id: '157'
        action: Script
        object_path: Else
    - step:
        id: '158'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '159'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "No License Details found"
    - step:
        id: '160'
        action: Script
        object_path: End If
    - step:
        id: '161'
        action: Script
        object_path: ElseIf listItems > 1  Then
    - step:
        id: '162'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '163'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "Multiple employees found"
    - step:
        id: '164'
        action: Script
        object_path: Else
    - step:
        id: '165'
        object_path: objSheet.cells(i,19)
        action: value
        args: = "(" & highRisk & ")"
    - step:
        id: '166'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "Employee not found"
    - step:
        id: '167'
        action: Script
        object_path: End If
    - step:
        id: '168'
        action: Script
        object_path: Else
    - step:
        id: '169'
        object_path: objSheet.cells(i,19)
        action: value
        args: = ""
    - step:
        id: '170'
        object_path: objSheet.cells(i,20)
        action: value
        args: = "No values to update"
    - step:
        id: '171'
        action: Script
        object_path: End If
    - step:
        id: '172'
        action: Script
        object_path: highRisk = ""
    - step:
        id: '173'
        action: Script
        object_path: licenceKeyNumber = ""
    - step:
        id: '174'
        action: Script
        object_path: newKeyNumber = ""
    - step:
        id: '175'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '176'
        object_path: mySendKeys
        action: SendKeys
        args: '"^(r)"'
    - step:
        id: '177'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '178'
        action: Wait
        args: '"5"'
        default_args: '"1"'
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
        object_path: objWorkbook
        action: save
    - step:
        id: '182'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '183'
        action: Script
        object_path: Next
    - step:
        id: '184'
        object_path: objWorkbook
        action: save
    - step:
        id: '185'
        object_path: objWorkbook
        action: close
    - step:
        id: '186'
        object_path: objExcel
        action: Quit
    - step:
        id: '187'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '188'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '189'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '190'
        action: Script
        object_path: '''If Browser("SuccessFactors: People").Page("Home_2").SAPEdit("appCanvas").exist(2)
          Then'
    - step:
        id: '191'
        action: Script
        object_path: "'\tBrowser(\"SuccessFactors: People\").Page(\"Home_2\").WebButton(\"\
          Close\").Click"
    - step:
        id: '192'
        action: Script
        object_path: '''End If'
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
      class: Browser
      name: 'SuccessFactors: People'
      properties:
      - property:
          value:
            value: 'SuccessFactors: People Profile'
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://hcm10preview.sapsf.com/sf/start/#/login
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Login - SAP SuccessFactors
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
            value: 'SuccessFactors: People Profile'
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
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 2 June 2022 12:34:19 PM
      child_objects:
      - object:
          class: Page
          name: 'SuccessFactors: People_2'
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
                value: https://performancemanager10.successfactors.com/xi/ui/pages/empfile/liveprofile.xhtml
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://performancemanager10.successfactors.com/xi/ui/pages/empfile/liveprofile.xhtml?selected_user=00941972&_s.crb=II6odbkhfZH3vFrUJLZ8q5CbEfsSde2vrljUbBXpjlY%3d
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'SuccessFactors: People Profile'
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
                value: '100025'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebMenu
              name: User Information Personal
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
                    value: //DIV[@id="sap-ui-static"]/DIV[2]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
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
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: User Information
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUiMnuLst sapUiMnuNoIco sapUiMnuNoSbMnu
                    regular_expression: false
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
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebElement
              name: __xmlview0--objectPage-anchBar
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
                    value: License Details
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
                    value: __xmlview0--objectPage-anchBar-__section0-__section1-__xmlview0--objectPage-0-5-anchor-unifiedmenu-txt
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUiMnuItmTxt
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
                    value: //LI[@role="menuitem" and normalize-space()="License Details"]/DIV[2]
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: Open Menu
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
                    value: //DIV[2]/DIV[@role="listbox"][1]/DIV[1]/DIV[@role="option"][1]/DIV[1]/BUTTON[@role="none"][2]
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
                    value: Open Menu
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
                    value: none
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Open Menu
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
                    value: __button53
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMSBArrow
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Open Menu
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: 'SuccessFactors: People'
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
                value: https://hcm10preview.sapsf.com/xi/ui/pages/empfile/liveprofile.xhtml
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://hcm10preview.sapsf.com/xi/ui/pages/empfile/liveprofile.xhtml?selected_user=00941972&_s.crb=oRMkNyWz4%2fPd9xth1OJU52xYxgFoMQcepDzeQzRx4ME%3d
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'SuccessFactors: People Profile'
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
                value: '10052'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebList
              name: Dropdown List
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
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '49'
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
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '49'
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
                    value: __list0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: General Information
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
                    value: sapMSelectList sapMSltList-CTX
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebElement
              name: Error
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
                    value: 'Error : Attachment is mandatory, Please attach the relevant
                      document'
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
                    value: __html0
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebElement
              name: Dropdown
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
                    value: More
                    regular_expression: false
                  name: title
                  hidden: false
                  read_only: false
                  type: STRING
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
                    value: General Information
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
                    value: __select0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUxAPHierarchicalSelect sapMSlt sapMSltIconOnly sapMSltAutoAdjustedWidth
                      sapMSltWithIcon sapMSltHoverable sapMSltWithArrow sapUxAPHierarchicalSelectUpperCase
                      sapMBarChild
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
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - title
                - micclass
                - innertext
                - html tag
                - class
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: SaveSave
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
                    value: ''
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
                    value: SaveSave
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
                    value: SaveSave
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
                    value: __button140
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBtnInverted sapMBarChild
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: License Detail
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
                    value: ''
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
                    value: Edit License Detail
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
                    value: Edit License Detail
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
                    value: __button122
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapExtentUilibFormPatternActionButton
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: License Detail
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: Don’t Save
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
                    value: ''
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
                    value: Don’t Save
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
                    value: Don’t Save
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
                    value: __mbox-btn-2
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBarChild
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
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
                    value: ''
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
                    value: submit
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
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: __mbox-btn-0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBtnInverted sapMBarChild
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: CancelCancel
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
                    value: ''
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
                    value: CancelCancel
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
                    value: CancelCancel
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
                    value: __button147
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBarChild
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: Image
              name: SA Power Networks Logo
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
                    value: //DIV[@id="bizXHeaderCompanyLogo"]/IMG[1]
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
                    value: Plain Image
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
                    value: __image2
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ?companyId=sapowernetT1&mod=1649897569303
                    regular_expression: false
                  name: file name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMImg sapMImgFocusable globalLogoPrimaryImage sapMBtnHoverable
                      sapMFocusable
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: SA Power Networks Logo
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: Image
              name: Home Image
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
                    value: ''
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
                    value: Plain Image
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
                    value: __image2
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ?companyId=sapowernetT1&mod=1637811175442
                    regular_expression: false
                  name: file name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMImg globalLogoPrimaryImage sapMBtnHoverable sapMFocusable
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: alt
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - image type
                - html tag
                - alt
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: Sign in to your account
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
                value: https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/saml2
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/saml2?SAMLRequest=fZJdb5swFIb%2fiuV7gyGGghVSZYuqRdpHtLJd7GZyzKG1ZGzmY8b270dJOnUX66193o%2fz2NvbX4MlPyGg8a6hWcIpAad9Z9xDQ7%2b0d6yit7stqsHmo9xP8dF9hh8TYCSL0KG83DR0Ck56hQalUwOgjFre7z%2b8l3nC5Rh89NpbSg6L0DgV17DHGEeUaWr9g3HJYHTw6PvonTUOEu2HtNL1mZcdZ%2fosFBOKb9hZiJplfaHyQlSqzni6NqDkzgcNa8GG9soiUHI8NPR7nW%2fqvrypWC%2b6xaMuOlaV5YaVoq4Fr7qi4Iv6iDjB0WFULjY053nOeME2vOU3kuey4Imoy2%2bUnK6rvDHugui1vc%2bXIZTv2vbETp%2fuW0q%2bPqNeBugVrFzTw0uirxsrRAhPEOnuGeI8zwlOWgNir3T0AVeCqEY%2fQ3AQt%2bnLrL9P%2bnExPx5O3hr9m%2byt9fPbACpCQ2OYYMU6qPj%2fOlmSrSemY%2f06KieHI2jTG%2bhourvG%2fvt3dn8A&RelayState=%2flogin&SigAlg=http%3a%2f%2fwww.w3.org%2f2000%2f09%2fxmldsig%23rsa-sha1&Signature=Kqwq%2fb6VLiFrg3HCYPC8jXOxndAbBnuneHTIoMdbv5okE3HCkSeImCOMohVuXISNFQ225mQSYqno%2by96xPDS70Q0L3wOxggIE0eMS3M%2fqsAS5tbw19gbAiXjmfLj3kWn%2fGeeSELROnGDp%2bSs8h6faH%2f41T0FVuux5lTJnUbCDIM%3d&client-request-id=04ef48ee-6366-48d0-954f-5159842d8f63&sso_reload=True
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Sign in to your account
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
                value: '80024'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebEdit
              name: Enter your email address,
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
                    value: //DIV[2]/DIV[2]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: email
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
                    value: Email address, phone number or Skype
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: loginfmt
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '113'
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
                    value: i0116
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
                    value: form-control ltr_override input ext-input text-box ext-text-box
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Enter your email address, phone number or Skype.
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: Use another account
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
                    value: //DIV[@id="otherTile"]
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
                    value: Use another account
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
                    value: Use another account
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
              - property:
                  value:
                    value: otherTile
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: table
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Use another account
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: Next
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
                    value: //DIV[4]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
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
                    value: Next
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
                    value: Next
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
                    value: idSIButton9
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: win-button button_primary button ext-button primary ext-primary
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: Home_2
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
                value: https://performancemanager10.successfactors.com/sf/home
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://performancemanager10.successfactors.com/sf/home?bplte_company=sapowernet&_s.crb=nfMngF%252fsIEZyMMnkj7NY3eJJuKN0%252bkMF0EOeyX5GJy0%253d#Shell-home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Home
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
                value: '100025'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
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
                    value: //DIV[@id="sap-ui-static"]/DIV[@role="dialog"][1]/FOOTER[1]/DIV[@role="toolbar"][1]/BUTTON[1]
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
                    value: submit
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
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: __button13
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBarChild
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: SAPEdit
              name: appCanvas
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
                    value: appCanvas
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
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: Home
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
                value: https://hcm10preview.sapsf.com/sf/home
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://hcm10preview.sapsf.com/sf/home?bplte_company=sapowernetT1&_s.crb=oRMkNyWz4%252fPd9xth1OJU52xYxgFoMQcepDzeQzRx4ME%253d#Shell-home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Home
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
                value: '10053'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebList
              name: Employee Search List
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
                    value: ''
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
                    value: '1'
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
                    value: __list4
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: 0403582299Alan Scapens ‎(SCAPA0)‎Trade Skilled Worker Powerline
                      (50001107)
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
                    value: sapMSuL sapMSelectList
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search for actions or
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
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: search
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
                    value: Search for actions or people
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
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
                    value: bizXSearchField-I
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
                    value: sapMSFI
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search for actions or people
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: Link
              name: Employee Directory
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
                    value: ''
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
                    value: Employee Directory
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Employee Directory
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
                    value: __link0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://hcm10preview.sapsf.com/sf/home?bplte_company=sapowernetT1&_s.crb=oRMkNyWz4%2fPd9xth1OJU52xYxgFoMQcepDzeQzRx4ME%3d
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMLnk sapMLnkMaxWidth bizXSuggestExternalSearch
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: Employee Directory - SuccessFa
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
                value: https://hcm10preview.sapsf.com/sf/directory
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://hcm10preview.sapsf.com/sf/directory?peopleSearchString=alan%20scapens&_s.crb=oRMkNyWz4%2fPd9xth1OJU52xYxgFoMQcepDzeQzRx4ME%3d
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Employee Directory - SuccessFactors
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: Link
              name: Employee
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
                    value: ''
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
                    value: Alan Scapens
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
                    value: __link0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://hcm10preview.sapsf.com/sf/liveprofile?selected_user=00941972&_s.crb=oRMkNyWz4%2fPd9xth1OJU52xYxgFoMQcepDzeQzRx4ME%3d
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMLnk sapMLnkWrapping sapMLnkMaxWidth usernamelink
                    regular_expression: false
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
  - object:
      class: Browser
      name: Login - SAP SuccessFactors
      properties:
      - property:
          value:
            value: Login - SAP SuccessFactors
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://hcm10preview.sapsf.com/sf/start/#/login
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Login - SAP SuccessFactors
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
            value: Login - SAP SuccessFactors
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
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 2 June 2022 12:34:19 PM
      child_objects:
      - object:
          class: Page
          name: 'SuccessFactors: People'
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
                value: https://hcm10preview.sapsf.com/xi/ui/pages/empfile/liveprofile.xhtml
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://hcm10preview.sapsf.com/xi/ui/pages/empfile/liveprofile.xhtml?selected_user=00941972&_s.crb=KLTF8KDYW3aM0%2b2g%2bz0%2fu07UOh2HeswJ%2fb7aaWS%2frpc%3d
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'SuccessFactors: People Profile'
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
                value: '40019'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebList
              name: __list0
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
                    value: //DIV[@id="sap-ui-static"]/DIV[@role="dialog"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/UL[@role="listbox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '322'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '48'
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
                    value: '-50'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1283'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: '49'
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
                    value: __list0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '2110'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: General Information
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
                    value: sapMSelectList sapMSltList-CTX
                    regular_expression: false
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
                    value: '53.5'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: R8
              - property:
                  value:
                    value: '1283.5'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: R8
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebElement
              name: __text6
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
                    value: You do not have permission to view this profile.
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
                    value: __text6
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextMaxWidth
                    regular_expression: false
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
                    value: //SECTION[@id="mainContent"]/DIV[@role="note"][1]/DIV[2]/SPAN[1]
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebElement
              name: __select0
              properties:
              - property:
                  value:
                    value: '29'
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
                    value: '411'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1574'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: General Information
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
                    value: __select0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: sapUxAPHierarchicalSelect sapMSlt sapMSltIconOnly sapMSltAutoAdjustedWidth
                      sapMSltWithIcon sapMSltHoverable sapMSltWithArrow sapUxAPHierarchicalSelectUpperCase
                      sapMBarChild sapMSltFocused
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
                    value: '514.5'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: R8
              - property:
                  value:
                    value: '1574.5'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: R8
              - property:
                  value:
                    value: //DIV[@id="main--APP"]/DIV[2]/DIV[@role="main"][1]/DIV[3]/DIV[1]/SECTION[@role="navigation"][1]/DIV[@role="none"][1]/DIV[4]
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Key Number
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
                    value: //DIV[@id="sap-ui-static"]/DIV[@role="dialog"][2]/SECTION[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/SECTION[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[@role="form"][1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: '256'
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
                    value: __input6-inner
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '479217'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMInputBaseInner
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Key Number
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: Image
              name: SA Power Networks Logo
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
                    value: //DIV[@id="bizXHeaderCompanyLogo"]/IMG[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '161'
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
                    value: '2'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '86'
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
                    value: Plain Image
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
                    value: __image2
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ?companyId=sapowernetT1&mod=1649897569303
                    regular_expression: false
                  name: file name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMImg sapMImgFocusable globalLogoPrimaryImage sapMBtnHoverable
                      sapMFocusable
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: SA Power Networks Logo
                    regular_expression: false
                  name: alt
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '105'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '86'
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
      - object:
          class: Page
          name: Login - SAP SuccessFactors
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
                value: https://hcm10preview.sapsf.com/sf/start/#/login
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://hcm10preview.sapsf.com/sf/start/#/login
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Login - SAP SuccessFactors
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
                value: '10013'
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
          last_update_time: Thursday, 2 June 2022 12:34:19 PM
          child_objects:
          - object:
              class: WebEdit
              name: username
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
                    value: //FORM[@id="loginForm"]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: __input1-inner
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
                    value: sapMInputBaseInner
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
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
                    value: //FORM[@id="loginForm"]/DIV[1]/DIV[2]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter Password
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
                    value: __input2-inner
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
                    value: sapMInputBaseInner
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Enter Company ID
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
                    value: //DIV/DIV[normalize-space()="Submit"]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter Company ID
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
                    value: __input0-inner
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
                    value: sapMInputBaseInner
                    regular_expression: false
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
                - placeholder
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
          - object:
              class: WebButton
              name: Log in
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
                    value: //FORM[@id="loginForm"]/BUTTON[normalize-space()="Log in"]
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
                    value: Log in
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
                    value: Log in
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
                    value: __button2
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBtnInverted fullButton
                    regular_expression: false
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
              last_update_time: Thursday, 2 June 2022 12:34:19 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
