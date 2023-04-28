namespace: RiverMurrayFloodDisconnections
operation:
  name: CID
  inputs:
  - username: svcrobotest
  - password:
      sensitive: true
      default: slot-HqJwUK6!!
  - b2bAction: Imported Bulk Disconnections
  - floodManagementSheet: C:/Users/svcrpabot/OneDrive - SA Power Networks/River Murray
      Flood Disconnections/Flood Management.xlsx
  - sourceOfDeen: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.CID:1.0.0
    skills:
    - SAP
    - SAPWebExt
    - Web
    - WPF
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
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '3'
        action: Script
        object_path: Set objRegEx = CreateObject("VBScript.RegExp")
    - step:
        id: '4'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '5'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '6'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))
    - step:
        id: '7'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("query")
    - step:
        id: '8'
        action: Script
        object_path: rowsNMI = objSheet.UsedRange.Rows.Count
    - step:
        id: '9'
        action: Script
        object_path: '''cidURL = "https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#DataBrowser-display"'
    - step:
        id: '10'
        action: Script
        object_path: cidURL = "https://sapeb.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#DataBrowser-display"
    - step:
        id: '11'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&cidURL'
    - step:
        id: '12'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '13'
        object_path: Browser("Logon").Page("Logon").WebEdit("sap-user")
        action: Set
        args: Parameter("username")
    - step:
        id: '14'
        object_path: Browser("Logon").Page("Logon").WebEdit("sap-password")
        action: SetSecure
        args: Parameter("password")
    - step:
        id: '15'
        object_path: Browser("Logon").Page("Logon").WebButton("Log On")
        action: Click
    - step:
        id: '16'
        action: Script
        object_path: waitCount = 0
    - step:
        id: '17'
        action: Script
        object_path: While waitCount < 10
    - step:
        id: '18'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '19'
        action: Script
        object_path: If Browser("Logon").Page("Logon").WebButton("Error Pop Up").Exist(10)
          Then
    - step:
        id: '20'
        object_path: Browser("Logon").Page("Logon").WebButton("Error Pop Up")
        action: Click
    - step:
        id: '21'
        action: Script
        object_path: waitCount = 10
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: waitCount = waitCount + 1
    - step:
        id: '24'
        action: Script
        object_path: Wend
    - step:
        id: '25'
        action: Script
        object_path: If Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("__token0-icon").Exist(3) Then
    - step:
        id: '26'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebElement("__token0-icon")
        action: Click
    - step:
        id: '27'
        action: Script
        object_path: End If
    - step:
        id: '28'
        action: Script
        object_path: For row = 2 To rowsNMI
    - step:
        id: '29'
        action: Script
        object_path: If objSheet.cells(row,2).value = Parameter("b2bAction") and objSheet.cells(row,3).value
          = Parameter("sourceOfDeen") Then
    - step:
        id: '30'
        action: Script
        object_path: If objSheet.cells(row,10).value = "" and (objSheet.cells(row,9).value
          <> "REMOVED" and objSheet.cells(row,9).value <> "INSTALLATION NOT FOUND")
          Then
    - step:
        id: '31'
        action: Script
        object_path: nmi = objSheet.cells(row,1).value
    - step:
        id: '32'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebEdit("NMI")
        action: Set
        args: nmi
    - step:
        id: '33'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebButton("GoGo")
        action: Click
    - step:
        id: '34'
        action: Wait
        args: '"15"'
        default_args: '"1"'
    - step:
        id: '35'
        action: Script
        object_path: found = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebTable("Customer Detail").GetRowWithCellText(nmi)
    - step:
        id: '36'
        action: Script
        object_path: If found = -1 Then
    - step:
        id: '37'
        object_path: objSheet.cells(row,9)
        action: value
        args: = "INSTALLATION NOT FOUND"
    - step:
        id: '38'
        object_path: objSheet.cells(row,2)
        action: value
        args: = "Processed"
    - step:
        id: '39'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebElement("__token0-icon")
        action: Click
    - step:
        id: '40'
        action: Script
        object_path: Else
    - step:
        id: '41'
        action: Script
        object_path: Set foundNMI = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebTable("Customer Detail").ChildItem(found,
          3, "WebElement", 0)
    - step:
        id: '42'
        object_path: foundNMI
        action: Click
    - step:
        id: '43'
        action: Wait
        args: '"8"'
        default_args: '"1"'
    - step:
        id: '44'
        action: Script
        object_path: customerName = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Customer Name").GetROProperty("innertext")
    - step:
        id: '45'
        action: Script
        object_path: If InStr(customerName,"(") Then
    - step:
        id: '46'
        action: Script
        object_path: customerName1 = Split(customerName, " (")
    - step:
        id: '47'
        action: Script
        object_path: customerName = customerName1(0)
    - step:
        id: '48'
        action: Script
        object_path: End If
    - step:
        id: '49'
        action: Script
        object_path: siteAddress = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Property Address").GetROProperty("innertext")
    - step:
        id: '50'
        action: Script
        object_path: If Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Customer Mobile Number").Exist(1)
          Then
    - step:
        id: '51'
        action: Script
        object_path: mobileNumber = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Customer Mobile Number").GetROProperty("innertext")
    - step:
        id: '52'
        action: Script
        object_path: Else
    - step:
        id: '53'
        action: Script
        object_path: mobileNumber = ""
    - step:
        id: '54'
        action: Script
        object_path: End If
    - step:
        id: '55'
        action: Script
        object_path: If Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Customer Telephone").Exist(1) Then
    - step:
        id: '56'
        action: Script
        object_path: homeNumber = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Customer Telephone").GetROProperty("innertext")
    - step:
        id: '57'
        action: Script
        object_path: Else
    - step:
        id: '58'
        action: Script
        object_path: homeNumber = ""
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: If mobileNumber = "" and homeNumber = "" Then
    - step:
        id: '61'
        action: Script
        object_path: contactNumber = "No phone number found"
    - step:
        id: '62'
        action: Script
        object_path: Else
    - step:
        id: '63'
        action: Script
        object_path: If InStr(1, mobileNumber,"04") = 1 Then
    - step:
        id: '64'
        action: Script
        object_path: contactNumber = mobileNumber
    - step:
        id: '65'
        action: Script
        object_path: ElseIf InStr(1, homeNumber ,"04") = 1 Then
    - step:
        id: '66'
        action: Script
        object_path: contactNumber = homeNumber
    - step:
        id: '67'
        action: Script
        object_path: Else
    - step:
        id: '68'
        action: Script
        object_path: contactNumber = "No mobile number found"
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        action: Script
        object_path: If Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Empty Meter Number").Exist(3) Then
    - step:
        id: '72'
        action: Script
        object_path: metersFound = "0"
    - step:
        id: '73'
        action: Script
        object_path: meters = "No meters found"
    - step:
        id: '74'
        action: Script
        object_path: Else
    - step:
        id: '75'
        action: Script
        object_path: metersFound = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Meter Numbers").GetROProperty("innertext")
    - step:
        id: '76'
        action: Script
        object_path: End If
    - step:
        id: '77'
        action: Script
        object_path: feeder = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Feeder Number").GetROProperty("innertext")
    - step:
        id: '78'
        action: Script
        object_path: transformer = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("Transformer Number").GetROProperty("innertext")
    - step:
        id: '79'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebButton("Service Provider Details")
        action: Click
    - step:
        id: '80'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '81'
        action: Script
        object_path: retailer = Browser("Customer & Installation Discovery").Page("Customer
          & Installation Discovery").WebElement("FRMP").GetROProperty("innertext")
    - step:
        id: '82'
        object_path: Browser("MDM Team Site - Flood").Page("Customer & Installation").WebButton("Meter
          Details")
        action: Click
    - step:
        id: '83'
        action: Script
        object_path: retailerURL = "https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Retailer%20Details78be85eba34844f681325897721ab6c9/AllItems.aspx"
    - step:
        id: '84'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&retailerURL'
    - step:
        id: '85'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '86'
        action: Script
        object_path: retailerRow = Browser("MDM Team Site - Retailer").Page("MDM Team
          Site - Retailer").WebTable("List of folders, files").RowCount
    - step:
        id: '87'
        action: Script
        object_path: For r = 2 To retailerRow
    - step:
        id: '88'
        action: Script
        object_path: foundRetailer = Browser("MDM Team Site - Retailer").Page("MDM
          Team Site - Retailer").WebTable("List of folders, files").GetCellData(r,
          4)
    - step:
        id: '89'
        action: Script
        object_path: If foundRetailer = retailer Then
    - step:
        id: '90'
        action: Script
        object_path: retailer = Browser("MDM Team Site - Retailer").Page("MDM Team
          Site - Retailer").WebTable("List of folders, files").GetCellData(r, 2)
    - step:
        id: '91'
        action: Script
        object_path: email = Browser("MDM Team Site - Retailer").Page("MDM Team Site
          - Retailer").WebTable("List of folders, files").GetCellData(r, 3)
    - step:
        id: '92'
        object_path: objRegEx
        action: Global
        args: = True
    - step:
        id: '93'
        object_path: objRegEx
        action: Pattern
        args: = "[^A-Za-z0-9\(\) ]"
    - step:
        id: '94'
        action: Script
        object_path: retailerTrim = objRegEx.Replace(retailer, "")
    - step:
        id: '95'
        action: Script
        object_path: Exit For
    - step:
        id: '96'
        action: Script
        object_path: End If
    - step:
        id: '97'
        action: Script
        object_path: Next
    - step:
        id: '98'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '99'
        action: Script
        object_path: If Browser("MDM Team Site - Retailer").Exist(3) Then
    - step:
        id: '100'
        object_path: Browser("MDM Team Site - Retailer")
        action: Close
    - step:
        id: '101'
        action: Script
        object_path: End If
    - step:
        id: '102'
        action: Script
        object_path: If metersFound <> "0" Then
    - step:
        id: '103'
        action: Script
        object_path: metersFound = Split(metersFound, ", ")
    - step:
        id: '104'
        action: Script
        object_path: meters = ""
    - step:
        id: '105'
        action: Script
        object_path: metersRow = Browser("MDM Team Site - Flood").Page("Customer &
          Installation").WebTable("Meter Number").RowCount
    - step:
        id: '106'
        action: Script
        object_path: While metersRow = -1
    - step:
        id: '107'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '108'
        action: Script
        object_path: metersRow = Browser("MDM Team Site - Flood").Page("Customer &
          Installation").WebTable("Meter Number").RowCount
    - step:
        id: '109'
        action: Script
        object_path: Wend
    - step:
        id: '110'
        action: Script
        object_path: For Each meter in metersFound
    - step:
        id: '111'
        action: Script
        object_path: meterRow = Browser("MDM Team Site - Flood").Page("Customer &
          Installation").WebTable("Meter Number").GetRowWithCellText(meter)
    - step:
        id: '112'
        action: Script
        object_path: If meterRow <> -1 Then
    - step:
        id: '113'
        action: Script
        object_path: meterStatus = Browser("MDM Team Site - Flood").Page("Customer
          & Installation").WebTable("Meter Number").GetCellData(meterRow, 8)
    - step:
        id: '114'
        action: Script
        object_path: If InStr(meterStatus, "Active") Then
    - step:
        id: '115'
        action: Script
        object_path: meters = meters & meter & ", "
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        action: Script
        object_path: Next
    - step:
        id: '119'
        action: Script
        object_path: If Right(meters, 2) = ", " Then
    - step:
        id: '120'
        action: Script
        object_path: meters = Left(meters, Len(meters) - 2)
    - step:
        id: '121'
        action: Script
        object_path: End If
    - step:
        id: '122'
        action: Script
        object_path: If meters = "" Then
    - step:
        id: '123'
        action: Script
        object_path: meters = "No active meters found"
    - step:
        id: '124'
        action: Script
        object_path: End If
    - step:
        id: '125'
        action: Script
        object_path: End If
    - step:
        id: '126'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '127'
        object_path: objSheet.cells(row,10)
        action: value
        args: = siteAddress
    - step:
        id: '128'
        object_path: objSheet.cells(row,11)
        action: value
        args: = feeder
    - step:
        id: '129'
        object_path: objSheet.cells(row,12)
        action: value
        args: = transformer
    - step:
        id: '130'
        object_path: objSheet.cells(row,13)
        action: value
        args: = meters
    - step:
        id: '131'
        object_path: objSheet.cells(row,14)
        action: value
        args: = customerName
    - step:
        id: '132'
        object_path: objSheet.cells(row,15)
        action: value
        args: = contactNumber
    - step:
        id: '133'
        object_path: objSheet.cells(row,16)
        action: value
        args: = retailerTrim
    - step:
        id: '134'
        object_path: objSheet.cells(row,17)
        action: value
        args: = email
    - step:
        id: '135'
        object_path: objWorkbook
        action: save
    - step:
        id: '136'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebButton("Back")
        action: Click
    - step:
        id: '137'
        object_path: Browser("Customer & Installation Discovery").Page("Customer &
          Installation Discovery").WebElement("__token0-icon")
        action: Click
    - step:
        id: '138'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '139'
        action: Script
        object_path: End If
    - step:
        id: '140'
        action: Script
        object_path: End If
    - step:
        id: '141'
        action: Script
        object_path: End If
    - step:
        id: '142'
        action: Script
        object_path: Next
    - step:
        id: '143'
        object_path: objWorkbook
        action: save
    - step:
        id: '144'
        object_path: objWorkbook
        action: close
    - step:
        id: '145'
        object_path: objExcel
        action: quit
    - step:
        id: '146'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '147'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '148'
        action: Script
        object_path: Set objRegEx = Nothing
    - step:
        id: '149'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '150'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '151'
        action: Script
        object_path: Set objSheet = Nothing
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
      name: MDM Team Site - Retailer
      properties:
      - property:
          value:
            value: MDM Team Site - Retailer Details - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Retailer%20Details78be85eba34844f681325897721ab6c9/AllItems.aspx
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
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
            value: MDM Team Site - Retailer Details - All Items
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
            value: '10'
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
      last_update_time: Thursday, 5 January 2023 8:51:48 PM
      child_objects:
      - object:
          class: Page
          name: MDM Team Site - Retailer
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
                value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Retailer%20Details78be85eba34844f681325897721ab6c9/AllItems.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Retailer%20Details78be85eba34844f681325897721ab6c9/AllItems.aspx
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MDM Team Site - Retailer Details - All Items
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
                value: '100037'
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
          last_update_time: Thursday, 5 January 2023 8:51:48 PM
          child_objects:
          - object:
              class: WebTable
              name: List of folders, files
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
                    value: //DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="grid"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
  - object:
      class: Browser
      name: MDM Team Site - Flood
      properties:
      - property:
          value:
            value: MDM Team Site - Flood Management - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
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
            value: MDM Team Site - Flood Management - All Items
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
      last_update_time: Thursday, 5 January 2023 8:51:48 PM
      child_objects:
      - object:
          class: Page
          name: MDM Team Site - Flood
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
                value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MDM Team Site - Flood Management - All Items
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
                value: '30035'
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
          last_update_time: Thursday, 5 January 2023 8:51:48 PM
          child_objects:
          - object:
              class: WebTable
              name: List of folders, files
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
                    value: //DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[@role="grid"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
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
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebMenu
              name: Command bar
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
                    value: //DIV[2]/DIV[@role="region"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="menubar"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
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
                    value: New
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-FocusZone css-83 ms-CommandBar root-84
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Command bar
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
      - object:
          class: Page
          name: Customer & Installation
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
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp#DataBrowser-display&//ZCDS_DM_C_CISOV_SearchResSet(p_guid='ee0c269a-9ddd-4e96-88fd-3138ef79a170',p_date='2022-11-11T11-44-25',p_device='Desktop',NMI='20014592260',UtilitiesInstallation='3000467863')/
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp#DataBrowser-display&//ZCDS_DM_C_CISOV_SearchResSet(p_guid='ee0c269a-9ddd-4e96-88fd-3138ef79a170',p_date='2022-11-11T11-44-25',p_device='Desktop',NMI='20014592260',UtilitiesInstallation='3000467863')/?sap-iapp-state=ASCJCF0F7GGJZOW47R23TRL245S3MXA470DGG2RR
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Customer & Installation Discovery
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
                value: '120037'
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
          last_update_time: Thursday, 5 January 2023 8:51:48 PM
          child_objects:
          - object:
              class: WebTable
              name: Meter Number
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
                    value: //TABLE[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::responsiveTable-listUl"]
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::responsiveTable-listUl
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
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Empty Meter Number
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
                    value: 'Meter Number:'
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
                    value: sapMListTblSubCntRow
                    regular_expression: false
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
                    value: //TBODY[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--responsiveTable-_BYALL-tblBody"]/TR/TD/DIV/DIV[normalize-space()="Meter
                      Number:"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: Meter Details
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
                    value: //BUTTON[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::Section-anchor"]
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
                    value: Meter Details
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
                    value: Meter Details
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::Section-anchor
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapUxAPAnchorBarButton sapMBarChild
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Meter Details
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
  - object:
      class: Browser
      name: Logon
      properties:
      - property:
          value:
            value: Logon
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#Shell-home
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
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
            value: Logon
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
      last_update_time: Thursday, 5 January 2023 8:51:48 PM
      child_objects:
      - object:
          class: Page
          name: Logon
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
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#Shell-home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Logon
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
                value: '10034'
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
          last_update_time: Thursday, 5 January 2023 8:51:48 PM
          child_objects:
          - object:
              class: WebEdit
              name: sap-user
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
                    value: //INPUT[@id="USERNAME_FIELD-inner"]
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
                    value: User
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sap-user
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '12'
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
                    value: USERNAME_FIELD-inner
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
                    value: loginInputField
                    regular_expression: false
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebEdit
              name: sap-password
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
                    value: //INPUT[@id="PASSWORD_FIELD-inner"]
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
                    value: sap-password
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
                    value: PASSWORD_FIELD-inner
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
                    value: loginInputField
                    regular_expression: false
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: Log On
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
                    value: //BUTTON[@id="LOGIN_LINK"]
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
                    value: Log On
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
                    value: Log On
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
                    value: LOGIN_LINK
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: loginButton sapUiButtonEmphasized
                    regular_expression: false
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: Error Pop Up
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
                    value: //DIV[5]/DIV[7]/DIV[@role="dialog"][1]/DIV[1]/DIV[1]/BUTTON[@role="button"][1]
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
                    value: x
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
                    value: Close Lightbox
                    regular_expression: false
                  name: title
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
                    value: x
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
                    value: __K0OWVZKM59A93CGN2PCH5T6J-cl
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: help4-close help4-control-button help4-control help4-exposed
                    regular_expression: false
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
                - title
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
  - object:
      class: Browser
      name: Customer & Installation Discovery
      properties:
      - property:
          value:
            value: Logon
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#Shell-home
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
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
            value: Logon
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
      last_update_time: Thursday, 5 January 2023 8:51:48 PM
      child_objects:
      - object:
          class: Page
          name: Customer & Installation Discovery
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
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp?sap-client=100&sap-language=EN#Shell-home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Logon
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
                value: '10034'
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
          last_update_time: Thursday, 5 January 2023 8:51:48 PM
          child_objects:
          - object:
              class: WebTable
              name: Customer Detail
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
                    value: //TABLE[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--responsiveTable-_BYALL-listUl"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--responsiveTable-_BYALL-listUl
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
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Transformer Number
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
                    value: '1'
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::TransformerNumber::Field
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUiCompSmartField
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
                    value: //DIV[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::TransformerNumber::Field"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Site Service Status
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
                    value: Fuse In(A)
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::SiteStatus::Field-objStatus-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMObjStatusText
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::SiteStatus::Field-objStatus-text"]
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Property Address
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
                    value: 116 WINKIE ROAD GLOSSOP SA 5344 AU
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::SiteAddress::Field-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextMaxWidth sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::SiteAddress::Field-text"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Meter Numbers
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
                    value: '[A-Z-0-9,\s]*'
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
                    value: __status1-__clone[0-9]+-text
                    regular_expression: true
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: sapMObjStatusText
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
                    value: //DIV/DIV[@role="group"]/SPAN[normalize-space()="3281758,
                      872890"]
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
                - html id
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: FRMP
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
                    value: AGL Electricity - SA(AGLE )
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--SPdet::FRMP::Field-text
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextMaxWidth sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--SPdet::FRMP::Field-text"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - html id
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Feeder Number
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
                    value: BM34
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::FeederNumber::Field-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextBreakWord sapMTextMaxWidth
                      sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--DevDet::FeederNumber::Field-text"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Empty Meter Number
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
                    value: 'Meter Number:'
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
                    value: sapMListTblSubCntRow
                    regular_expression: false
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
                    value: //TBODY[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--responsiveTable-_BYALL-tblBody"]/TR/TD/DIV/DIV[normalize-space()="Meter
                      Number:"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Customer Telephone
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
                    value: \d{10}
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::Telephone::Field-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextBreakWord sapMTextMaxWidth
                      sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::Telephone::Field-text"]
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Customer Name
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
                    value: JASON FOWLER (7000671963)
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::BusinessPartner::Field-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextMaxWidth sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::BusinessPartner::Field-text"]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: Customer Mobile Number
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
                    value: \d{10}
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::Mobile::Field-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMText sapUiSelectable sapMTextBreakWord sapMTextMaxWidth
                      sapUiCompSmartFieldValue
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
                    value: //SPAN[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--CustDet::Mobile::Field-text"]
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebElement
              name: __token0-icon
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
                    value: __token0-icon
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUiIcon sapUiIconMirrorInRTL sapUiIconPointer sapMTokenIcon
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
                    value: //DIV[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--listReportFilter-filterItemControl_BASIC-NMI-content"]/DIV[@role="listbox"]/DIV/DIV[@role="option"
                      and normalize-space()="=20016239026"]/SPAN[@role="presentation"][1]
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebEdit
              name: NMI
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
                    value: //INPUT[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--listReportFilter-filterItemControl_BASIC-NMI-inner"]
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--listReportFilter-filterItemControl_BASIC-NMI-inner
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
                    value: NMI
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: Service Provider Details
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
                    value: //BUTTON[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--SPdet::Section-anchor"]
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
                    value: Service Provider Details
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
                    value: Service Provider Details
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--SPdet::Section-anchor
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapUxAPAnchorBarButton sapMBarChild
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Service Provider Details
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: GoGo
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
                    value: //BUTTON[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--listReportFilter-btnGo"]
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
                    value: GoGo
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
                    value: GoGo
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
                    value: ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--listReportFilter-btnGo
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapMBtnBase sapMBtn sapMBtnInverted
                    regular_expression: false
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
          - object:
              class: WebButton
              name: Error Pop Up
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
                    value: //DIV[5]/DIV[7]/DIV[@role="dialog"][1]/DIV[1]/DIV[1]/BUTTON[@role="button"][1]
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
                    value: x
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
                    value: Close Lightbox
                    regular_expression: false
                  name: title
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
                    value: x
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
                    value: __K0OWVZKM59A93CGN2PCH5T6J-cl
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: help4-close help4-control-button help4-control help4-exposed
                    regular_expression: false
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
                - title
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
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
                    value: //A[@id="backBtn"]
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
                    value: 
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
                    value: 
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
                    value: backBtn
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: sapUshellShellHeadItm
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
              last_update_time: Thursday, 5 January 2023 8:51:48 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
