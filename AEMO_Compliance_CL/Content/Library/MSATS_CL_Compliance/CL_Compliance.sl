namespace: MSATS_CL_Compliance
operation:
  name: CL_Compliance
  inputs:
  - msats_user: MPBBOT1
  - excelSheet: Remaining_List_IT - 22_11_2022 to 25_11_2022.xlsx
  - msats_pass: Adl@2022
  - site_url: https://msats.prod.nemnet.net.au/msats/index.jsp
  - sheet_name: '25_11_2022'
  sequential_action:
    gav: com.microfocus.seq:MSATS_CL_Compliance.CL_Compliance:1.0.0
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
        object_path: '''OPEN EXCEL'
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
          - SA Power Networks\AEMO Reports\CL Compliance\"&Parameter("excelSheet"))
    - step:
        id: '5'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(Parameter("sheet_name"))
    - step:
        id: '6'
        action: Script
        object_path: row = objSheet.usedrange.Rows.Count
    - step:
        id: '7'
        action: Script
        object_path: '''''OPEN MSATS'
    - step:
        id: '8'
        action: Script
        object_path: '''Set mySendKeys = CreateObject("WScript.Shell")'
    - step:
        id: '9'
        action: Script
        object_path: '''URL = Parameter("site_url")'
    - step:
        id: '10'
        object_path: '''mySendKeys'
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '11'
        action: Script
        object_path: '''Set mySendKeys = NOTHING'
    - step:
        id: '12'
        args: '"3"'
        object_path: '''Wait 3'
        action: Script
    - step:
        id: '13'
        object_path: '''Browser("Login").Page("Login").WebEdit("userID")'
        action: Set
        args: Parameter("msats_user")
    - step:
        id: '14'
        object_path: '''Browser("Login").Page("Login").WebEdit("password")'
        action: Set
        args: Parameter("msats_pass")
    - step:
        id: '15'
        object_path: '''Browser("Login").Page("Login").Image("Login")'
        action: Click
    - step:
        id: '16'
        object_path: '''Browser("Login").Page("MSATS").Frame("toc").WebElement("Transactions")'
        action: Click
    - step:
        id: '17'
        object_path: '''Browser("Login").Page("MSATS").Frame("toc").Link("Change Requests")'
        action: Click
    - step:
        id: '18'
        action: Script
        object_path: '''ACTION NMIs'
    - step:
        id: '19'
        action: Script
        object_path: For x = 2 To row
    - step:
        id: '20'
        action: Script
        object_path: crid = objSheet.cells(x,11).value
    - step:
        id: '21'
        action: Script
        object_path: If crid = "" Then
    - step:
        id: '22'
        action: Script
        object_path: meterSerial = objSheet.cells(x,2).value
    - step:
        id: '23'
        action: Script
        object_path: registerID = objSheet.cells(x,3).value
    - step:
        id: '24'
        action: Script
        object_path: nmiChecksum = objSheet.cells(x,5).value
    - step:
        id: '25'
        action: Script
        object_path: nmi = Left(nmiChecksum, Len(nmiChecksum) - 1)
    - step:
        id: '26'
        action: Script
        object_path: checksum = Right(nmiChecksum, 1)
    - step:
        id: '27'
        action: Script
        object_path: effectiveDate = objSheet.cells(x,9).value
    - step:
        id: '28'
        action: Script
        object_path: tariffDate = Split(effectiveDate, ".")
    - step:
        id: '29'
        action: Script
        object_path: dayDate = tariffDate(0)
    - step:
        id: '30'
        action: Script
        object_path: monthDateTemp = tariffDate(1)
    - step:
        id: '31'
        action: Script
        object_path: monthDate = MonthName(monthDateTemp, True)
    - step:
        id: '32'
        action: Script
        object_path: yearDate = tariffDate(2)
    - step:
        id: '33'
        action: Script
        object_path: tariffEffectiveDate = dayDate&"-"&monthDate&"-"&yearDate
    - step:
        id: '34'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").Link("New")
        action: Click
    - step:
        id: '35'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebList("CRCode")
        action: Select
        args: '"3051 - Change Meter Details - Retrospective"'
    - step:
        id: '36'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("NMIID")
        action: Set
        args: nmi
    - step:
        id: '37'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("proposedStartDate")
        action: Set
        args: tariffEffectiveDate
    - step:
        id: '38'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("participantTransactionID")
        action: Set
        args: '"RPA Bot"'
    - step:
        id: '39'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("checksum")
        action: Set
        args: checksum
    - step:
        id: '40'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_2").WebButton("Next")
        action: Click
    - step:
        id: '41'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '42'
        action: Script
        object_path: foundRow = Browser("Login").Page("MSATS").Frame("DETAIL_2").WebTable("NMI
          Register Identifier").GetRowWithCellText(meterSerial,1)
    - step:
        id: '43'
        action: Script
        object_path: If foundRow = -1 Then
    - step:
        id: '44'
        object_path: objSheet.cells(x,11)
        action: value
        args: = "meter not found"
    - step:
        id: '45'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("Change Requests")
        action: Click
    - step:
        id: '46'
        action: Script
        object_path: Else
    - step:
        id: '47'
        action: Script
        object_path: For t = foundRow To foundRow + Cint(registerID)
    - step:
        id: '48'
        action: Script
        object_path: reg = Browser("Login").Page("MSATS").Frame("DETAIL_2").WebTable("NMI
          Register Identifier").GetCellData(t,1)
    - step:
        id: '49'
        action: Script
        object_path: If reg = registerID Then
    - step:
        id: '50'
        action: Script
        object_path: editRow = t
    - step:
        id: '51'
        action: Script
        object_path: Exit For
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: Next
    - step:
        id: '54'
        action: Script
        object_path: '''editRow = foundRow + Cint(registerID)'
    - step:
        id: '55'
        action: Script
        object_path: Set objLink = Browser("Login").Page("MSATS").Frame("DETAIL_2").WebTable("NMI
          Register Identifier").ChildItem(editRow, 3, "link", 0)
    - step:
        id: '56'
        object_path: objLink
        action: click
    - step:
        id: '57'
        action: Script
        object_path: Set objLink = Nothing
    - step:
        id: '58'
        action: Script
        object_path: meterRow = Browser("Login").Page("MSATS").Frame("DETAIL_5").WebTable("Meter
          Register Serial").GetRowWithCellText("Meter Register Serial ID:")
    - step:
        id: '59'
        action: Script
        object_path: registerRow = Browser("Login").Page("MSATS").Frame("DETAIL_5").WebTable("Meter
          Register Serial").GetRowWithCellText("Register ID:")
    - step:
        id: '60'
        action: Script
        object_path: meterFound = Browser("Login").Page("MSATS").Frame("DETAIL_5").WebTable("Meter
          Register Serial").GetCellData(meterRow, 2)
    - step:
        id: '61'
        action: Script
        object_path: registerFound = Browser("Login").Page("MSATS").Frame("DETAIL_5").WebTable("Meter
          Register Serial").GetCellData(registerRow, 2)
    - step:
        id: '62'
        action: Script
        object_path: If meterFound = meterSerial and registerFound = registerID Then
    - step:
        id: '63'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_5").WebList("controlledLoad")
        action: Select
        args: '"YES"'
    - step:
        id: '64'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_5").WebButton("Save")
        action: Click
    - step:
        id: '65'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_5").WebButton("Submit")
        action: Click
    - step:
        id: '66'
        object_path: Browser("Login")
        action: HandleDialog
        args: micOK
    - step:
        id: '67'
        action: Script
        object_path: If Browser("Login").Page("MSATS").Frame("DETAIL_4").WebElement("CR
          ID").Exist(3) Then
    - step:
        id: '68'
        action: Script
        object_path: tempCrid = Browser("Login").Page("MSATS").Frame("DETAIL_4").WebElement("CR
          ID").GetROProperty("innertext")
    - step:
        id: '69'
        action: Script
        object_path: 'tempCrid1 = Split(tempCrid, "Change Request ID: ")'
    - step:
        id: '70'
        object_path: objSheet.cells(x,11)
        action: value
        args: = tempCrid1(1)
    - step:
        id: '71'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL_4").Link("Return
          to 'Change Request")
        action: Click
    - step:
        id: '72'
        action: Script
        object_path: Else
    - step:
        id: '73'
        object_path: objSheet.cells(x,11)
        action: value
        args: = "NMI skipped"
    - step:
        id: '74'
        object_path: Browser("Login").Page("MSATS_2").Frame("toc").Link("Change Requests")
        action: Click
    - step:
        id: '75'
        action: Script
        object_path: End If
    - step:
        id: '76'
        action: Script
        object_path: Else
    - step:
        id: '77'
        object_path: objSheet.cells(x,11)
        action: value
        args: = "Meter and Register ID do not match"
    - step:
        id: '78'
        object_path: Browser("Login").Page("MSATS_2").Frame("toc").WebElement("Transactions")
        action: Click
    - step:
        id: '79'
        object_path: Browser("Login").Page("MSATS_2").Frame("toc").Link("Change Requests")
        action: Click
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        action: Script
        object_path: End If
    - step:
        id: '82'
        action: Script
        object_path: End If
    - step:
        id: '83'
        action: Script
        object_path: Next
    - step:
        id: '84'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"msedge.exe"'
    - step:
        id: '85'
        object_path: objWorkbook
        action: Save
    - step:
        id: '86'
        object_path: objWorkbook
        action: close
    - step:
        id: '87'
        object_path: objExcel
        action: Quit
    - step:
        id: '88'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '89'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '90'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '91'
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
      last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                value: '80205'
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
          last_update_time: Friday, 25 November 2022 11:33:26 AM
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebElement
                  name: Transactions
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
                        value: Transactions
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
                        value: //DIV[8]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: Link
                  name: Change Requests
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
                        value: //DIV[9]/A[1]
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
                        value: Change Requests
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Change Requests
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
                        value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL_3
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
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMIList.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMIList.jsp
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebTable
                  name: 'Change Requests:'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebEdit
                  name: NMIRangeFrom
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
                        value: '//TR/TD/TABLE/TBODY/TR[normalize-space()="NMI Range
                          From: To:"]/TD[2]/INPUT[1]'
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
                        value: NMIRangeFrom
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '10'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: dateTo
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
                        value: //TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[10]/TD[4]/INPUT[1]
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
                        value: dateTo
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: dateFrom
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
                        value: //TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[10]/TD[2]/INPUT[1]
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
                        value: dateFrom
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Search
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
                        value: //INPUT[@id="submit"]
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
                        value: Search
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
                        value: Search
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
                        value: submit
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMIMain.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.prod.nemnet.net.au/msats/FW410_CRNMIMain.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Error Page
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: SAPEdit
                  name: Failed
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
                        value: ''
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
                        value: Not valid initiator for whole period of change request.
                          Please try again or contact the AEMO Support Hub with a
                          screenshot of the data input screen and the error message.
                        regular_expression: false
                      name: outertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: <body>  <br>  Not valid initiator for whole period
                          of change request.<br><br>Please try again or contact the
                          AEMO Support Hub with a screenshot of the data input screen
                          and the error message.<br><br><script> jsPortalCall = "false";
                          jsSetDocDomainTo = "prod.nemnet.net.au"; jsCurrentDomain
                          = ""; i=-2; if (jsPortalCall=="true") {    jsCurrentDomain=document.domain;    i=jsCurrentDomain.indexOf(jsSetDocDomainTo);    if
                          (i > -1) { //The current doaim must contain domain to set       if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length)
                          { //The current doaim must end with domain to set; i.e.
                          current domain must be sub doamin of the domain to be set         document.domain=jsSetDocDomainTo;       }    }
                          }</script> </body>
                        regular_expression: false
                      name: outerhtml
                      hidden: false
                      read_only: false
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
                        value: Not valid initiator for whole period of change request.Please
                          try again or contact the AEMO Support Hub with a screenshot
                          of the data input screen and the error message.
                        regular_expression: false
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: <br>  Not valid initiator for whole period of change
                          request.<br><br>Please try again or contact the AEMO Support
                          Hub with a screenshot of the data input screen and the error
                          message.<br><br><script> jsPortalCall = "false"; jsSetDocDomainTo
                          = "prod.nemnet.net.au"; jsCurrentDomain = ""; i=-2; if (jsPortalCall=="true")
                          {    jsCurrentDomain=document.domain;    i=jsCurrentDomain.indexOf(jsSetDocDomainTo);    if
                          (i > -1) { //The current doaim must contain domain to set       if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length)
                          { //The current doaim must end with domain to set; i.e.
                          current domain must be sub doamin of the domain to be set         document.domain=jsSetDocDomainTo;       }    }
                          }</script>
                        regular_expression: false
                      name: innerhtml
                      hidden: false
                      read_only: false
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - sap attached text
                    - outertext
                    - outerhtml
                    - innertext
                    - innerhtml
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
                  comments:
                    comment:
                    - value: ''
                      name: miccommentproperty
                  visual_relations: ''
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                value: '10199'
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
          last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebElement
                  name: Transactions
                  properties:
                  - property:
                      value:
                        value: '160'
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
                        value: '149'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '0'
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
                        value: Transactions
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
                        value: '22'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '252'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '0'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: //DIV[8]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: Link
                  name: Change Requests
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
                        value: //DIV[9]/A[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '93'
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
                        value: '175'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '16'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Change Requests
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Change Requests
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '13'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '278'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '16'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL_5
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIRegisterIdentifierEdit.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIRegisterIdentifierEdit.jsp?action=edit&rowID=9715359&eIDICR=FvEHVZ72%2Bcw%3D&CRCode=3051
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebTable
                  name: Meter Register Serial
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
                        value: //TR[3]/TD[1]/TABLE[1]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebList
                  name: controlledLoad
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
                        value: //TR[3]/TD[1]/TABLE[1]/TBODY[1]/TR[8]/TD[2]/SELECT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '159'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '287'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '556'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: controlledLoad
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '5'
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
                        value: '17'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '366.5'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: R8
                  - property:
                      value:
                        value: '579.5'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Submit
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
                        value: //TR[3]/TD[1]/TABLE[4]/TBODY[1]/TR[1]/TD[1]/INPUT[2]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '95'
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
                        value: '624'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '272'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Submit
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
                        value: Submit
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
                        value: '703.5'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: R8
                  - property:
                      value:
                        value: '295.5'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: R8
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                        value: //TR[3]/TD[1]/TABLE[2]/TBODY[1]/TR[1]/TD[1]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '42'
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
                        value: '367'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '172'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '446.5'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: R8
                  - property:
                      value:
                        value: '195.5'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: R8
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL_4
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIMain.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIMain.jsp
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebTable
                  name: Return to 'Change Request
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebElement
                  name: Date is not within the
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
                        value: Date is not within the allowed number of days. Please
                          try again or contact the AEMO Support Hub with a screenshot
                          of the data input screen and the error message. jsPortalCall
                          = "false"; jsSetDocDomainTo = "preprod.nemnet.net.au"; jsCurrentDomain
                          = ""; i=-2; if (jsPortalCall=="true") { jsCurrentDomain=document.domain;
                          i=jsCurrentDomain.indexOf(jsSetDocDomainTo); if (i > -1)
                          { //The current doaim must contain domain to set if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length)
                          { //The current doaim must end with domain to set; i.e.
                          current domain must be sub doamin of the domain to be set
                          document.domain=jsSetDocDomainTo; } } }
                        regular_expression: false
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: BODY
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
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
                        value: //BODY
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebElement
                  name: CR ID
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
                        value: 'The "Change Request" record has been submitted successfully\.
                          Return to "Change Request - Search" screen\. Change Request
                          ID: [0-9]*'
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
                        value: //TABLE[1]/TBODY[1]/TR[1]/TD[1]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: Link
                  name: Return to 'Change Request
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
                        value: //TABLE[1]/TBODY[1]/TR[1]/TD[1]/A[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '243'
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
                        value: '104'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '918'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Return to "Change Request - Search" screen.
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Return to "Change Request - Search" screen.
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '13'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '207'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '918'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL_3
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp?action=new&CRCode=5051&eIDICR=BBYymXIgi7c%3D
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebList
                  name: CND_02
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
                        value: //TR[3]/TD[1]/TABLE[2]/TBODY[1]/TR[19]/TD[2]/SELECT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '159'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '657'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '321'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: CND_02
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '5'
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
                        value: '17'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '760'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '321'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Submit
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
                        value: //TR[3]/TD[1]/TABLE[3]/TBODY[1]/TR[1]/TD[1]/INPUT[2]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '95'
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
                        value: '334'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '272'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Submit
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
                        value: Submit
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
                        value: '437'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '272'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                        value: //TR[3]/TD[1]/TABLE[3]/TBODY[1]/TR[1]/TD[1]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '42'
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
                        value: '695'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '172'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '798'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '172'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp?action=new
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: WebTable
                  name: NMI Register Identifier
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
                        value: //TR[3]/TD[1]/TABLE[3]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebTable
                  name: Change Requests - Main
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
                        value: //FORM[2]/TABLE[1]
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebList
                  name: CRCode
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
                        value: //TABLE[1]/TBODY[1]/TR[1]/TD[2]/SELECT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '349'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '74'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '645'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: CRCode
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '76'
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
                        value: '17'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '177'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '645'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                        value: //TR[3]/TD[1]/TABLE[3]/TBODY[1]/TR[4]/TD[2]
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
                      value: 29
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebElement
                  name: NMI and Checksum do not
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
                        value: NMI and Checksum do not match Please try again or contact
                          the AEMO Support Hub with a screenshot of the data input
                          screen and the error message. jsPortalCall = "false"; jsSetDocDomainTo
                          = "preprod.nemnet.net.au"; jsCurrentDomain = ""; i=-2; if
                          (jsPortalCall=="true") { jsCurrentDomain=document.domain;
                          i=jsCurrentDomain.indexOf(jsSetDocDomainTo); if (i > -1)
                          { //The current doaim must contain domain to set if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length)
                          { //The current doaim must end with domain to set; i.e.
                          current domain must be sub doamin of the domain to be set
                          document.domain=jsSetDocDomainTo; } } }
                        regular_expression: false
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: BODY
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
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
                        value: //BODY
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: proposedStartDate
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
                        value: //TABLE[1]/TBODY[1]/TR[4]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '94'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '147'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '494'
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
                        value: proposedStartDate
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
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
                        value: '250'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '494'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: participantTransactionID
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
                        value: //TABLE[1]/TBODY[1]/TR[2]/TD[4]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '251'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '97'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1317'
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
                        value: participantTransactionID
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '36'
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
                        value: '200'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1317'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: NMIID
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
                        value: //FORM[2]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '119'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '122'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '494'
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
                        value: NMIID
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '10'
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
                        value: '225'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '494'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: checksum
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
                        value: //FORM[2]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[4]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '30'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '122'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1317'
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
                        value: checksum
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '1'
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
                        value: '225'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1317'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                        value: //INPUT[@id="next"]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '40'
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
                        value: '237'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1867'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: next
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
                        value: '340'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1867'
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: Link
                  name: NMI Standing Data
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
                        value: //TR/TD/A[normalize-space()="NMI Standing Data"]
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
                        value: NMI Standing Data
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: NMI Standing Data
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp#standing
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
                  child_objects: []
              - object:
                  class: Link
                  name: New
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
                        value: //TR/TD/TABLE/TBODY/TR/TH/A[normalize-space()="New"]
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
                        value: New
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: New
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp?action=new&CRCode=5051&eIDICR=BBYymXIgi7c%3D
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects:
              - object:
                  class: Link
                  name: New
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
                        value: //TR/TD/TABLE/TBODY/TR/TH/A[normalize-space()="New"]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '27'
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
                        value: '72'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1406'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: New
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: New
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp?action=new
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '13'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                        value: '175'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1406'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                value: '10199'
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
          last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: '150'
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
                    value: '871'
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
                    value: '249'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: '150'
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
                    value: '871'
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
                    value: '280'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
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
                    value: '871'
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
                    value: '311'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
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
              last_update_time: Friday, 25 November 2022 11:33:26 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
