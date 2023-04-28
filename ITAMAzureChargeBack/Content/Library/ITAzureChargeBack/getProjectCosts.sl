namespace: ITAzureChargeBack
operation:
  name: getProjectCosts
  inputs:
  - projectName: informatica
  - filelocation: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM Azure Cost
      Management\
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.getProjectCosts:1.2.0
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
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '2'
        action: Script
        object_path: If fso.FileExists("C:\Automation Downloads\costanalysis_charts.png")
          Then
    - step:
        id: '3'
        object_path: fso
        action: DeleteFile("C:\Automation
        args: Downloads\costanalysis_charts.png")
    - step:
        id: '4'
        action: Script
        object_path: End If
    - step:
        id: '5'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '6'
        action: Script
        object_path: project = Parameter("projectName")
    - step:
        id: '7'
        action: Script
        object_path: filelocation = Parameter("filelocation")
    - step:
        id: '8'
        action: Script
        object_path: 'scope = Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Scope:").GetROProperty("innertext")'
    - step:
        id: '9'
        action: Script
        object_path: '''If scope is not SA Power Networks, change'
    - step:
        id: '10'
        action: Script
        object_path: 'If scope <> "Scope: SA Power Networks" Then'
    - step:
        id: '11'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Scope:")'
        action: Click
    - step:
        id: '12'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Back").Exist(1) Then'
    - step:
        id: '13'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Back")'
        action: Click
    - step:
        id: '14'
        action: Script
        object_path: End If
    - step:
        id: '15'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Back").Exist(1) Then'
    - step:
        id: '16'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Back")'
        action: Click
    - step:
        id: '17'
        action: Script
        object_path: End If
    - step:
        id: '18'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Link("Hutchison International")'
        action: Click
    - step:
        id: '19'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebElement("SA Power Networks")'
        action: Click
    - step:
        id: '20'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("_weave_e_538")'
        action: Click
    - step:
        id: '21'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Wait
        args: '"8"'
        default_args: '"1"'
    - step:
        id: '24'
        action: Script
        object_path: '''Set filter to project'
    - step:
        id: '25'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Add filter")'
        action: Click
    - step:
        id: '26'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '27'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("ChooseSelect a filter")'
        action: Select
        args: '"Tag"'
    - step:
        id: '28'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("Choose")'
        action: Click
    - step:
        id: '29'
        action: Wait
        args: '"20"'
        default_args: '"1"'
    - step:
        id: '30'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("Choose")'
        action: Select
        args: '"project"'
    - step:
        id: '31'
        action: Wait
        args: '"20"'
        default_args: '"1"'
    - step:
        id: '32'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '33'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '34'
        object_path: mySendKeys
        action: SendKeys
        args: project
    - step:
        id: '35'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '36'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '37'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '38'
        action: Wait
        args: '"8"'
        default_args: '"1"'
    - step:
        id: '39'
        action: Script
        object_path: 'items = Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("ChooseSelect 1 or more").GetROProperty("items
          count")'
    - step:
        id: '40'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '41'
        action: Script
        object_path: ''' If the project is not found, flag this to ITAM and stop run'
    - step:
        id: '42'
        action: Script
        object_path: If items = 0 Then
    - step:
        id: '43'
        action: Script
        object_path: actual = ""
    - step:
        id: '44'
        action: Script
        object_path: errorScreenshot = Screenshot(filelocation,project&" Error")
    - step:
        id: '45'
        action: Script
        object_path: Parameter("gpc_actualCost") = actual
    - step:
        id: '46'
        action: Script
        object_path: Parameter("errorScreenshot") = errorScreenshot
    - step:
        id: '47'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Delete filter")'
        action: Click
    - step:
        id: '48'
        action: Script
        object_path: ExitTest
    - step:
        id: '49'
        action: Script
        object_path: Else
    - step:
        id: '50'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Select filter")'
        action: Click
    - step:
        id: '51'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '52'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Tag:project:").Exist(3) = false Then'
    - step:
        id: '53'
        action: Script
        object_path: actual = ""
    - step:
        id: '54'
        action: Script
        object_path: errorScreenshot = Screenshot(filelocation,project&" Error")
    - step:
        id: '55'
        action: Script
        object_path: Parameter("gpc_actualCost") = actual
    - step:
        id: '56'
        action: Script
        object_path: Parameter("errorScreenshot") = errorScreenshot
    - step:
        id: '57'
        action: Script
        object_path: ExitTest
    - step:
        id: '58'
        action: Script
        object_path: Else
    - step:
        id: '59'
        action: Script
        object_path: '''Select current month before extracting forecast'
    - step:
        id: '60'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebElement("DurationFilter")'
        action: Click
    - step:
        id: '61'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '62'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebElement("This month")'
        action: Click
    - step:
        id: '63'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '64'
        action: Script
        object_path: '''Extract forecast cost'
    - step:
        id: '65'
        action: Script
        object_path: forecastScreenshot =  Screenshot(filelocation,project&" Forecast")
    - step:
        id: '66'
        action: Script
        object_path: 'forecast = Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("forecast").GetROProperty("innertext")'
    - step:
        id: '67'
        action: Script
        object_path: forecast1 = split(forecast," on ")
    - step:
        id: '68'
        action: Script
        object_path: If IsArray(forecast1) = True Then
    - step:
        id: '69'
        action: Script
        object_path: forecast = forecast1(1)
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        action: Script
        object_path: forecast = forecast1(1)
    - step:
        id: '72'
        action: Script
        object_path: '''Set to last month to get actual'
    - step:
        id: '73'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebElement("DurationFilter")'
        action: Click
    - step:
        id: '74'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '75'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebElement("Last month")'
        action: Click
    - step:
        id: '76'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '77'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Actual cost total dropdown").Exist(2)
          Then'
    - step:
        id: '78'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Actual cost total dropdown")'
        action: Highlight
    - step:
        id: '79'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Actual cost total dropdown")'
        action: Click
    - step:
        id: '80'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '81'
        object_path: Reporter
        action: Filter
        args: = rfDisableAll
    - step:
        id: '82'
        action: Script
        object_path: On error resume next
    - step:
        id: '83'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("Metric Actual cost Amortized")'
        action: Highlight
    - step:
        id: '84'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebList("Metric Actual cost Amortized")'
        action: Select
        args: '"Amortized cost"'
    - step:
        id: '85'
        action: Script
        object_path: On error goto 0
    - step:
        id: '86'
        object_path: Reporter
        action: Filter
        args: = rfEnableAll
    - step:
        id: '87'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '88'
        action: Script
        object_path: End If
    - step:
        id: '89'
        action: Script
        object_path: '''Extract actual cost'
    - step:
        id: '90'
        action: Script
        object_path: actualScreenshot = Screenshot(filelocation,project&" Actual")
    - step:
        id: '91'
        action: Script
        object_path: 'actual = Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Actual cost total (Amortized)").GetROProperty("innertext")'
    - step:
        id: '92'
        action: Script
        object_path: actual1 = split(actual,"$")
    - step:
        id: '93'
        action: Script
        object_path: actual = actual1(1)
    - step:
        id: '94'
        action: Script
        object_path: forecast = Replace(forecast, " ", "")
    - step:
        id: '95'
        action: Script
        object_path: actual = Replace(actual, " ", "")
    - step:
        id: '96'
        action: Script
        object_path: '''Delete old file if still exists'
    - step:
        id: '97'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '98'
        action: Script
        object_path: If fso.FileExists("C:\Automation Downloads\costanalysis_charts.png")
          Then
    - step:
        id: '99'
        object_path: fso
        action: DeleteFile("C:\Automation
        args: Downloads\costanalysis_charts.png")
    - step:
        id: '100'
        action: Script
        object_path: End If
    - step:
        id: '101'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '102'
        action: Script
        object_path: '''Download graph'
    - step:
        id: '103'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Download")'
        action: Click
    - step:
        id: '104'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebRadioGroup("PNG")'
        action: Select
        args: '"PNG"'
    - step:
        id: '105'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").WebButton("Download charts")'
        action: Click
    - step:
        id: '106'
        action: Script
        object_path: While fso.FileExists("C:\Automation Downloads\costanalysis_charts.png")
          = false
    - step:
        id: '107'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '108'
        action: Script
        object_path: Wend
    - step:
        id: '109'
        action: Script
        object_path: '''Rename and relocate graph to OneDrive'
    - step:
        id: '110'
        action: Script
        object_path: today = Date()
    - step:
        id: '111'
        action: Script
        object_path: mon = Month(today) - 1
    - step:
        id: '112'
        action: Script
        object_path: reportMonth = MonthName(mon)
    - step:
        id: '113'
        action: Script
        object_path: reportYear = Year(today)
    - step:
        id: '114'
        action: Script
        object_path: newGraphLocation = filelocation&project&" "&reportMonth&" "&reportYear&"
          Graph.png"
    - step:
        id: '115'
        action: Script
        object_path: If fso.FileExists(newGraphLocation) Then
    - step:
        id: '116'
        object_path: fso
        action: DeleteFile(newGraphLocation)
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        object_path: fso
        action: MoveFile
        args: '"C:\Automation Downloads\costanalysis_charts.png", newGraphLocation'
    - step:
        id: '119'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '120'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '121'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Delete filter").Exist(1) Then'
    - step:
        id: '122'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Delete filter")'
        action: Highlight
    - step:
        id: '123'
        object_path: 'Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Delete filter")'
        action: Click
    - step:
        id: '124'
        action: Script
        object_path: End If
    - step:
        id: '125'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '126'
        action: Script
        object_path: If InStr(actual, "K") > 0 Then
    - step:
        id: '127'
        action: Script
        object_path: actuala = Replace(actual, "K", "")
    - step:
        id: '128'
        action: Script
        object_path: actualb = CDbl(actuala)
    - step:
        id: '129'
        action: Script
        object_path: actual = actualb * 1000
    - step:
        id: '130'
        action: Script
        object_path: End If
    - step:
        id: '131'
        action: Script
        object_path: If InStr(forecast, "K") > 0 Then
    - step:
        id: '132'
        action: Script
        object_path: forecasta = Replace(forecast, "K", "")
    - step:
        id: '133'
        action: Script
        object_path: forecastb = CDbl(forecasta)
    - step:
        id: '134'
        action: Script
        object_path: forecast = forecastb * 1000
    - step:
        id: '135'
        action: Script
        object_path: End If
    - step:
        id: '136'
        action: Script
        object_path: forecast = CDbl(forecast)
    - step:
        id: '137'
        action: Script
        object_path: actual = CDbl(actual)
    - step:
        id: '138'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '139'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '140'
        action: Script
        object_path: Parameter("gpc_actualCost") = actual
    - step:
        id: '141'
        action: Script
        object_path: Parameter("graph") = newGraphLocation
    - step:
        id: '142'
        action: Script
        object_path: Parameter("gpc_forecastCost") = forecast
    - step:
        id: '143'
        action: Script
        object_path: End If
    - step:
        id: '144'
        action: Script
        object_path: End If
    - step:
        id: '145'
        action: Script
        object_path: Function Screenshot(filelocation,projectName)
    - step:
        id: '146'
        action: Script
        object_path: screenShotFileLocaiton = filelocation&projectName&".png"
    - step:
        id: '147'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton,true
    - step:
        id: '148'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '149'
        action: Script
        object_path: Screenshot = screenShotFileLocaiton
    - step:
        id: '150'
        action: Script
        object_path: End Function
  outputs:
  - gpc_forecastCost:
      robot: true
      value: ${gpc_forecastCost}
  - graph:
      robot: true
      value: ${graph}
  - gpc_actualCost:
      robot: true
      value: ${gpc_actualCost}
  - errorScreenshot:
      robot: true
      value: ${errorScreenshot}
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
      name: 'Cost Management: SA Power'
      properties:
      - property:
          value:
            value: Sign in to Microsoft Azure
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Microsoft Azure
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
            value: Sign in to Microsoft Azure
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
            value: '3'
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
      last_update_time: Tuesday, 4 April 2023 3:10:14 PM
      child_objects:
      - object:
          class: Page
          name: 'Cost Management: SA Power'
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
                value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'Cost Management: SA Power Networks - Microsoft Azure'
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
                value: '10024'
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
          last_update_time: Tuesday, 4 April 2023 3:10:14 PM
          child_objects:
          - object:
              class: WebRadioGroup
              name: PNG
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
                    value: '3'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: LI
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: _weave_e_385
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: fxs-portal-border azc-optionPicker-item fxs-portal-button-primary
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
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
                  - items count
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects: []
          - object:
              class: WebList
              name: ChooseSelect a filter
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
                    value: //APP-ROOT[@id="appRoot"]/MAIN[1]/NG-COMPONENT[1]/NG-COMPONENT[1]/DIV[1]/HEADER[1]/DIV[1]/DIV[3]/APP-PILL-FILTERS[1]/APP-PILL[1]/DIV[1]/FORM[1]/DIV[1]/DIV[1]/DIV[1]/NG-SELECT[@role="listbox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
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
                    value: '21'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: NG-SELECT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Billing period
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
                    value: ng-select pre-open ng-select-single ng-untouched ng-pristine
                      ng-invalid ng-select-opened ng-select-bottom
                    regular_expression: false
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
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects: []
          - object:
              class: WebButton
              name: Download charts
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
                    value: //DIV/DIV/DIV/DIV[@role="button" and normalize-space()="Download
                      charts"]
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
                    value: Download charts
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
                    value: Download charts
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
                    value: _weave_e_511
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: fxs-button fxt-button fxs-inner-solid-border fxs-portal-button-primary
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Download charts
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
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects: []
          - object:
              class: WebButton
              name: Download
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
                    value: Download
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
                    value: Download
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
                    value: _weave_e_284
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: azc-toolbarButton-container fxs-fxclick fxs-portal-hover
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Download
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
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects: []
          - object:
              class: Frame
              name: Frame_2
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
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.01998.4528-51454-20220621/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.01998.4528-51454-20220621/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Azure Cost Management
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
                    value: ''
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
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects:
              - object:
                  class: WebList
                  name: Choose _commvault_gxmd_snap_
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
                        value: '112'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: NG-SELECT
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: _commvault_gxmd_snap_
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
                        value: ng-select pre-open ng-select-single ng-untouched ng-pristine
                          ng-invalid ng-select-focused ng-select-opened ng-select-bottom
                        regular_expression: false
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
                      - first item
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebCheckBox
                  name: WebCheckBox
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
                        value: checkbox
                        regular_expression: false
                      name: role
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
                        value: ng-option-check d-inline-block align-middle mr-2
                        regular_expression: false
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
                      - html id
                      - class
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Select filter
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
                        value: ''
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
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-submit ml-2 d-inline-block align-middle
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Select filter
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Add filter
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
                        value: Add filter
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
                        value: Add filter
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-view d-inline-block align-middle
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
          - object:
              class: Frame
              name: Frame
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
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.01971.4510-991038-20220525/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.01971.4510-991038-20220525/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Azure Cost Management
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
                    value: ''
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
              last_update_time: Tuesday, 4 April 2023 3:10:14 PM
              child_objects:
              - object:
                  class: WebRadioGroup
                  name: PNG
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
                        value: //DIV/DIV/DIV/DIV/DIV/UL[@role="radiogroup"]/LI[@role="radio"
                          and normalize-space()="PNG"]
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
                        value: '3'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: LI
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: _weave_e_500
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: fxs-portal-border azc-optionPicker-item fxs-portal-button-primary
                        regular_expression: false
                      name: class
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
                      - items count
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: Metric Actual cost Amortized
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
                        value: '2'
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
                        value: '2'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: Actual cost
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
                        value: costmetric-dropdown-content
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: ChooseSelect a filter
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
                        value: '0'
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
                        value: '21'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: NG-SELECT
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Billing period
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
                        value: ng-select pre-open ng-select-single ng-untouched ng-pristine
                          ng-invalid ng-select-opened ng-select-bottom
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: ChooseSelect 1 or more
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
                        value: //DIV[4]/DIV[1]/DIV[1]/NG-SELECT[@role="listbox"][1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '0'
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
                        value: '0'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: NG-SELECT
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
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
                        value: ng-select pre-open ng-select-multiple ng-untouched
                          ng-pristine ng-invalid ng-select-opened ng-select-bottom
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: Choose _commvault_gxmd_snap_
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
                        value: '0'
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
                        value: '112'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: NG-SELECT
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: _commvault_gxmd_snap_
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
                        value: ng-select pre-open ng-select-single ng-untouched ng-pristine
                          ng-invalid ng-select-focused ng-select-opened ng-select-bottom
                        regular_expression: false
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
                      - first item
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebList
                  name: Choose
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
                        value: //DIV/DIV/DIV/NG-SELECT[@role="listbox" and normalize-space()="Choose"]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '0'
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
                        value: '0'
                        regular_expression: false
                      name: items count
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: NG-SELECT
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
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
                        value: ng-select pre-open ng-select-single ng-pristine ng-invalid
                          ng-select-focused ng-select-bottom ng-touched
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
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
                        value: ng-arrow-wrapper
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
                        value: //DIV/DIV/DIV/NG-SELECT[@role="listbox"]/DIV[normalize-space()="Choose"]/SPAN[1]
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebElement
                  name: This month
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
                        value: This month
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
                        value: col-auto option-name
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebElement
                  name: SA Power Networks
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
                        value: SA Power Networks
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
                        value: ext-container-class
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
                        value: //TD[@role="gridcell"]/DIV[normalize-space()="SA Power
                          Networks"]/DIV[1]/DIV[1]
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebElement
                  name: Last month
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
                        value: Last month
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
                        value: col-auto option-name
                        regular_expression: false
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
                        value: //LI[@role="listitem"]/DIV/DIV[@role="option"]/DIV/DIV[normalize-space()="Last
                          month"]
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebElement
                  name: DurationFilter
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
                        value: ''
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
                        value: .*
                        regular_expression: true
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
                        value: font-weight-bold
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
                        value: //DIV/DIV/DIV/SPAN[normalize-space()="May 2022"]
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: Filter items...
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
                        value: //DIV[4]/DIV[1]/DIV[1]/NG-SELECT[@role="listbox"][1]/NG-DROPDOWN-PANEL[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
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
                        value: Filter items...
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
                        value: form-control form-control-sm
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Filter items...
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
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebCheckBox
                  name: WebCheckBox
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
                        value: //DIV/DIV/DIV/NG-SELECT[@role="listbox"]/NG-DROPDOWN-PANEL/DIV/DIV/DIV[@role="option"
                          and normalize-space()="workmate"]/DIV[@role="checkbox"][1]
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
                        value: ng-option-check d-inline-block align-middle mr-2
                        regular_expression: false
                      name: class
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
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: 'Tag:project:'
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
                        value: //APP-ROOT[@id="appRoot"]/MAIN[1]/NG-COMPONENT[1]/NG-COMPONENT[1]/DIV[1]/HEADER[1]/DIV[1]/DIV[3]/APP-PILL-FILTERS[1]/APP-PILL[1]/DIV[@role="button"][1]
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
                        value: Tag:project:informatica
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
                        value: Tag:project:.+
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-view d-inline-block align-middle
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Select filter
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
                        value: //DIV[3]/APP-PILL-FILTERS[1]/APP-PILL[1]/DIV[1]/FORM[1]/DIV[@role="button"][1]
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
                        value: ''
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
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-submit ml-2 d-inline-block align-middle
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Select filter
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: 'Scope:'
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
                        value: //DIV[1]/APP-SCOPE-PILL[1]/APP-PILL[1]/DIV[@role="button"][1]
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
                        value: 'Scope:                SA Power Networks'
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
                        value: Scope:.*
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-view d-inline-block align-middle
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: None
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
                        value: //BUTTON[@id="none"]
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
                        value: None
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
                        value: None
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
                        value: none
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: dropdown-item active selected
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: May 2022
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
                        value: May 2022
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
                        value: May 2022
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-view d-inline-block align-middle
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: 'Group by: None'
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
                        value: '//DIV/DIV/DIV/APP-GRAPH-GROUP-BY/BUTTON[normalize-space()="Group
                          by: None"]'
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
                        value: 'Group by: None'
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
                        value: 'Group by: None'
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
                        value: d-inline-block popover-button
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: forecast
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
                        value: //DIV[1]/DIV[1]/DIV[1]/APP-FORECAST-KPI[1]/DIV[1]/DIV[@role="button"][1]
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
                        value: 'Forecast:  Chart view on                  $1,061.81'
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
                        value: 'Forecast:  Chart view on                  .*'
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: d-inline-block forecast-kpi-inner-container
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Delete filter
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
                        value: ''
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
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-close ml-2 d-inline-block align-middle
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Delete filter
                        regular_expression: false
                      name: acc_name
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - type
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Current Month
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
                        value: //DIV/APP-CUSTOM-DATE-PICKER/APP-PILL/DIV\[@role="button"
                          and normalize-space\(\)=".*
                        regular_expression: true
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
                        value: Jun 2022
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
                        value: .*
                        regular_expression: true
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: <div _ngcontent-ysi-c16="" class="d-inline-block align-middle
                          mr-1"><div _ngcontent-ysi-c5="" class="pill-icon"><app-icon
                          _ngcontent-ysi-c5="" class="mr-1" _nghost-ysi-c18=""><div
                          _ngcontent-ysi-c18="" class="medium"><svg xmlns="http://www\.w3\.org/2000/svg"
                          viewBox="0 0 15 15">    <path d="M14\.1 0H\.9C\.4 0 0 \.4
                          0 \.9V14c0 \.6\.4 1 \.9 1H14c\.5 0 1-\.4 1-\.9V\.9c0-\.5-\.4-\.9-\.9-\.9zM14
                          14H1V4h13v10z"></path>    <path d="M5 5h2v2H5zm3 0h2v2H8zM2
                          8h2v2H2zm3 0h2v2H5zm3 0h2v2H8zm3 0h2v2h-2zm-9 3h2v2H2zm3
                          0h2v2H5zm3 0h2v2H8zm3-6h2v2h-2z"></path></svg></div></app-icon></div></div><!----><div
                          _ngcontent-ysi-c16="" class="pill-view-item d-inline-block
                          align-middle py-2"><div _ngcontent-ysi-c16="" class=""><!----><!----><!----><div
                          _ngcontent-ysi-c16="" class="ellipsis"><!----><span _ngcontent-ysi-c16=""
                          class="font-weight-bold" title="">.*</span><!----><!----><span
                          _ngcontent-ysi-c16="" class="pi pi-chevron-down suffix-icon"></span></div></div></div>
                        regular_expression: true
                      name: innerhtml
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
                        value: pill-view d-inline-block align-middle
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
                  basic_identification:
                    property_ref:
                    - micclass
                    - xpath
                    - role
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Back
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
                        value: //DIV[2]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[@role="button"][1]
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
                        value: ''
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
                        value: ext-scopepicker-parentscope-image ext-arrow-svg fxs-fxclick
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Back
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Add filter
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
                        value: //DIV/APP-PILL-FILTERS/APP-PILL/DIV[@role="button"
                          and normalize-space()="Add filter"]
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
                        value: Add filter
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
                        value: Add filter
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: pill-view d-inline-block align-middle
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Actual cost total dropdown
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
                      hidden: false
                      read_only: false
                      type: BOOL
                  - property:
                      value:
                        value: Actual cost  (USD)                  $18,466.01
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
                        value: Actual cost .*
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: d-inline-block costmetric-kpi-inner-container
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: 'Actual cost total: $18,466.01. Press Enter to select
                          a different metric.'
                        regular_expression: false
                      name: acc_name
                      hidden: true
                      read_only: true
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
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
                    active: true
                  custom_replay: ''
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Actual cost total (Amortized)
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
                        value: //DIV[1]/DIV[1]/DIV[1]/APP-COSTMETRIC-KPI[1]/DIV[1]/DIV[@role="button"][1]
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
                        value: Actual cost  (USD)                  $815.19
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
                        value: Amortized cost  \(USD\)                  .*
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
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: d-inline-block costmetric-kpi-inner-container
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: 'Actual cost total: $815.19. Press Enter to select
                          a different metric.'
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: WebButton
                  name: _weave_e_538
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
                        value: //DIV/DIV[@role="button" and normalize-space()="Select"]
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
                        value: Select
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
                        value: Select
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
                        value: _weave_e_538
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: fxs-button fxt-button fxs-inner-solid-border fxs-portal-button-primary
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: Link
                  name: Hutchison International
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
                        value: //DIV[@id="web-container"]/DIV[4]/DIV[@role="complementary"][1]/SECTION[1]/DIV[1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/DIV[@role="grid"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/DIV[@role="presentation"][1]/TABLE[@role="presentation"][1]/TBODY[@role="rowgroup"][1]/TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/DIV[1]/SPAN[@role="link"][1]
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
                        value: Hutchison International Limited
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Hutchison International Limited
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
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
                        value: undefined
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ext-ellipsisText ext-noWrap ext-underline-on-hover
                          ext-billingManagement-color-text fxs-fxclick
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: Link
                  name: Cost analysis (preview)
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
                        value: //DIV[@id="web-container"]/DIV[4]/MAIN[1]/DIV[3]/DIV[2]/SECTION[1]/DIV[1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/DIV[2]/DIV[1]/DIV[@role="list"][1]/DIV[@role="group"][2]/DIV[2]/LI[@role="listitem"][1]/A[1]
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
                        value: Cost analysis (preview)
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Cost analysis (preview)
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
                        value: _weave_e_167
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysisv3/open/costanalysisv3/openedBy/AzurePortal
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ext-fxc-menu-item
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
              - object:
                  class: Link
                  name: Cost analysis
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
                        value: //LI[@role="listitem"]/A[normalize-space()="Cost analysis"]
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
                        value: Cost analysis
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Cost analysis
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
                        value: _weave_e_170
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ext-fxc-menu-item
                        regular_expression: false
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
                  last_update_time: Tuesday, 4 April 2023 3:10:14 PM
                  child_objects: []
  check_points_and_outputs: []
  parameters: []
