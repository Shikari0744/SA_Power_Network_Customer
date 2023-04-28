namespace: ITAzureChargeBack
operation:
  name: journalCostsToSharepoint
  inputs:
  - actualCosts: '492.51'
  - projectName: informatica
  - projectMangerEmail: Edward.Rodrigo@sapowernetworks.com.au
  - sapCode: 80102167-0040
  - currencyConversion: '1.5'
  - forecastedCosts: '702.66'
  - location: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM Azure Cost Management\
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.journalCostsToSharepoint:1.0.0
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
        object_path: '''Open edge to sharepoint'
    - step:
        id: '2'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '3'
        action: Script
        object_path: URL = "https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx"
    - step:
        id: '4'
        object_path: mySendKeys
        action: Run
        args: '"chrome -url "&URL'
    - step:
        id: '5'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '6'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '7'
        object_path: Browser("IT Asset Management")
        action: Maximize
    - step:
        id: '8'
        object_path: Browser("IT Asset Management")
        action: Highlight
    - step:
        id: '9'
        action: Script
        object_path: ''' set variabls'
    - step:
        id: '10'
        action: Script
        object_path: Pc = Parameter("actualCosts") * Parameter("currencyConversion")
    - step:
        id: '11'
        action: Script
        object_path: Pfc = Parameter("forecastedCosts") * Parameter("currencyConversion")
    - step:
        id: '12'
        action: Script
        object_path: projectCost = Round(Pc, 2)
    - step:
        id: '13'
        action: Script
        object_path: projectName = Parameter("projectName")
    - step:
        id: '14'
        action: Script
        object_path: projectManager = Parameter("projectMangerEmail")
    - step:
        id: '15'
        action: Script
        object_path: Sc = Parameter("sapCode")
    - step:
        id: '16'
        action: Script
        object_path: screenShotFileLocation = Parameter("location")&projectName&"
          Journal.png"
    - step:
        id: '17'
        action: Script
        object_path: '''split sap code'
    - step:
        id: '18'
        action: Script
        object_path: SapCode = ""
    - step:
        id: '19'
        action: Script
        object_path: SapActivity = ""
    - step:
        id: '20'
        action: Script
        object_path: If InStr(Sc, "-") Then
    - step:
        id: '21'
        action: Script
        object_path: temp = Split(Sc, "-")
    - step:
        id: '22'
        action: Script
        object_path: SapCode = temp(0)
    - step:
        id: '23'
        action: Script
        object_path: SapActivity = temp(1)
    - step:
        id: '24'
        action: Script
        object_path: Else
    - step:
        id: '25'
        action: Script
        object_path: SapCode = Sc
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        action: Script
        object_path: '''Create journal name'
    - step:
        id: '28'
        action: Script
        object_path: mon = Month(Date())
    - step:
        id: '29'
        action: Script
        object_path: If mon = 1 Then
    - step:
        id: '30'
        action: Script
        object_path: reportMonth = "December"
    - step:
        id: '31'
        action: Script
        object_path: Else
    - step:
        id: '32'
        action: Script
        object_path: reportMonth = MonthName(Month(Date()) - 1)
    - step:
        id: '33'
        action: Script
        object_path: End If
    - step:
        id: '34'
        action: Script
        object_path: JournalName = "Azure - "&projectName&" - "&reportMonth
    - step:
        id: '35'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '36'
        action: Script
        object_path: '''Add item'
    - step:
        id: '37'
        object_path: '''Browser("IT Asset Management").Page("Journal Sheet").WebButton("New")'
        action: Click
    - step:
        id: '38'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebMenu("Command
          bar")
        action: Select
        args: '"New"'
    - step:
        id: '39'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Cost
          Required Field, empty,")
        action: Set
        args: projectCost
        snapshot: .\Snapshots\ssf12.html
        highlight_id: '10000000'
    - step:
        id: '40'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Quantity
          Required Field,")
        action: Set
        args: '"1"'
    - step:
        id: '41'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebRadioGroup("Type
          of Journal Required")
        comment: Cloud Services (Off-prem) - 533124
        action: Select
        args: '"#0"'
        snapshot: .\Snapshots\ssf15.html
        highlight_id: '10000000'
    - step:
        id: '42'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Notes
          Required Field")
        action: Set
        args: JournalName
        snapshot: .\Snapshots\ssf16.html
        highlight_id: '10000000'
    - step:
        id: '43'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Debit
          SAP number")
        action: Set
        args: SapCode
    - step:
        id: '44'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Debit
          SAP Activity Code")
        action: Set
        args: SapActivity
    - step:
        id: '45'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Credit
          SAP Number")
        action: Set
        args: '"7048464"'
    - step:
        id: '46'
        object_path: '''Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Credit
          SAP Activity code")'
        action: Set
        args: '""'
    - step:
        id: '47'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Customer
          Required Field")
        action: Click
        snapshot: .\Snapshots\ssf20.html
        highlight_id: '10000000'
    - step:
        id: '48'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '49'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '50'
        object_path: mySendKeys
        action: SendKeys
        args: projectManager
    - step:
        id: '51'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '52'
        action: Script
        object_path: Call Screenshot(screenShotFileLocation)
    - step:
        id: '53'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '54'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '55'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '56'
        action: Script
        object_path: listResult = Browser("IT Asset Management").Page("Journal Sheet").WebList("Suggested
          people").GetROProperty("first item")
    - step:
        id: '57'
        action: Script
        object_path: If InStr(listResult,projectManager) Then
    - step:
        id: '58'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebButton("html
          tag:=BUTTON","innertext:="&replace(trim(listResult),".","\."),"index:=0")
        action: Click
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: If Browser("IT Asset Management").Page("Journal Sheet").WebElement("EmailError").Exist(1)
          Then
    - step:
        id: '61'
        action: Script
        object_path: emailAddress = Browser("IT Asset Management").Page("Journal Sheet").WebElement("EmailError").GetROProperty("innertext")
    - step:
        id: '62'
        action: Script
        object_path: Else
    - step:
        id: '63'
        action: Script
        object_path: emailAddress = ""
    - step:
        id: '64'
        action: Script
        object_path: End If
    - step:
        id: '65'
        action: Script
        object_path: If emailAddress <> "" Then
    - step:
        id: '66'
        action: Script
        object_path: Parameter("failureScreenshotLocation") = screenShotFileLocation
    - step:
        id: '67'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "PM doesn't exist", "PM doesn't exist"
    - step:
        id: '68'
        action: Script
        object_path: Else
    - step:
        id: '69'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebButton("Save")
        action: Click
    - step:
        id: '70'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '71'
        action: Script
        object_path: End If
    - step:
        id: '72'
        object_path: Browser("IT Asset Management")
        action: Close
    - step:
        id: '73'
        action: Script
        object_path: Function Screenshot(screenShotFileLocation)
    - step:
        id: '74'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocation,true
    - step:
        id: '75'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '76'
        action: Script
        object_path: End Function
        snapshot: .\Snapshots\ssf36.html
        highlight_id: '10000000'
  outputs:
  - failureScreenshotLocation:
      robot: true
      value: ${failureScreenshotLocation}
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
      name: New item | Journal Sheet
      properties:
      - property:
          value:
            value: New item | Journal Sheet
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx?viewid=ee7abb73-9060-4a7a-9563-63c257d2d4ae
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
            value: New item | Journal Sheet
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
            value: '4'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 2
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
      last_update_time: Tuesday, 4 April 2023 2:42:14 PM
      child_objects:
      - object:
          class: Page
          name: New item | Journal Sheet
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
                value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx?viewid=ee7abb73%2D9060%2D4a7a%2D9563%2D63c257d2d4ae
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: New item | Journal Sheet
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
                value: '40033'
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
          last_update_time: Tuesday, 4 April 2023 2:42:14 PM
          child_objects:
          - object:
              class: WebList
              name: Suggested people
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="listbox"][1]
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
                    value: suggestion-list-id__850
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: SSimon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.au
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Suggestions root-238
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Suggested people
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
  - object:
      class: Browser
      name: IT Asset Management
      properties:
      - property:
          value:
            value: IT Asset Management - Journal Sheet - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx
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
            value: IT Asset Management - Journal Sheet - All Items
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
            value: '2'
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
      last_update_time: Tuesday, 4 April 2023 2:42:14 PM
      child_objects:
      - object:
          class: Page
          name: Journal Sheet
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
                value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/ITAssetManagement/Lists/Journal%20Sheet/All%20Items.aspx
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: IT Asset Management - Journal Sheet - All Items
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
                value: '20026'
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
          last_update_time: Tuesday, 4 April 2023 2:42:14 PM
          child_objects:
          - object:
              class: WebRadioGroup
              name: Type of Journal Required
              properties:
              - property:
                  value:
                    value: WebRadioGroup
                    regular_expression: false
                  name: micclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="appRoot"]/DIV[2]/DIV[@role="presentation"][1]/DIV[4]/DIV[1]/DIV[1]/DIV[@role="dialog"][1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[4]/SPAN[1]/DIV[1]/DIV[@role="radiogroup"][1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: radio
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ChoiceGroup+\d{3}
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '8'
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
                    value: ChoiceGroup846-Cloud Services (Off-prem) - 533124
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ms-ChoiceField-input input-211
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
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
                    value: '1872'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '129'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '48'
                    regular_expression: false
                  name: view_x
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
                    value: '44'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: ms-FocusZone css-74 ms-CommandBar root-75
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
              - property:
                  value:
                    value: '232'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '48'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebList
              name: Suggested people
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
                    value: //DIV[5]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="listbox"][1]
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
                    value: suggestion-list-id__1630
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Jasmin HaasJasmin HaasAutomation AnalystAutomation AnalystJasmin.Haas@sapowernetworks.com.auJasmin.Haas@sapowernetworks.com.au
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Suggestions root-238
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Suggested people
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebElement
              name: Simon.Elleway@sapowernetworks.
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
                    value: Simon.Elleway@sapowernetworks.com.auSimon.Elleway@sapowernetworks.com.au
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
                    value: ms-TooltipHost root-109
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
                    value: //DIV[5]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="listbox"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/BUTTON[@role="option"][1]/SPAN[1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[@role="none"][1]
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebElement
              name: EmailError
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
                    value: ErrorMessageId862
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ReactFieldEditor-required
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
                    value: //DIV[10]/DIV[2]/DIV[@role="alert"][1]
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Quantity Required Field,
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
                    value: //DIV[normalize-space()="Quantity"]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter a number
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
                    value: TextField803
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
                    value: ms-TextField-field NumberFieldEditor-Input field-180
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Quantity Required Field, empty, field editor.
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Quantity Required Field
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
                    value: //DIV[normalize-space()="Quantity"]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter a number
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
                    value: TextField831
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '1'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field NumberFieldEditor-Input field-190
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Quantity Required Field, 1, field editor.
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
              custom_replay:
                behavior: ''
              comments: ''
              visual_relations:
                visual_relation: []
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Notes Required Field
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
                    value: //DIV[normalize-space()="Notes"]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '729'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '751'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
                    value: Enter value here
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
                    value: TextField849
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '36'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: azure project
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field field-198
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Notes Required Field, empty, field editor.
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '854'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Debit SAP number
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
                    value: //DIV[6]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '729'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '429'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
                    value: Enter value here
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
                    value: TextField853
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '36'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '7000'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field field-198
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Debit SAP number (Money From) Required Field, empty, field
                      editor. Sender Network code
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '532'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Debit SAP Activity Code
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
                    value: //DIV/SPAN[normalize-space()="Sender Activity code"]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter a number
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
                    value: TextField1650
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
                    value: ms-TextField-field NumberFieldEditor-Input field-338
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Debit SAP Activity Code, empty, field editor. Sender Activity
                      code
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Customer Required Field
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
                    value: //DIV[10]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="presentation"][1]/DIV[1]/INPUT[@role="combobox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '725'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '241'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1147'
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
                    value: Enter a name or email address
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
                    value: combobox-id__869
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: jasmin.haas@sapowernetworks.com.au
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-BasePicker-input pickerInput_883892a8
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Customer Required Field, Enter a name or email address,
                      field editor.
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '344'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1147'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Credit SAP Number
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
                    value: //DIV[8]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '729'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '519'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
                    value: Enter value here
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
                    value: TextField861
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '36'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '800000'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field field-198
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Credit SAP Number (Money To) Required Field, empty, field
                      editor. Sender Network code
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '622'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Credit SAP Activity code
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
                    value: //DIV[9]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '729'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '713'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
                    value: Enter value here
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
                    value: TextField865
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '36'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0010'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field field-198
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Credit SAP Activity code, empty, field editor. Receiver
                      Activity code
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '816'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1145'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Cost Required Field, empty,
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
                    value: //DIV[normalize-space()="Cost"]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
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
                    value: Enter a number
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
                    value: TextField838
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '190'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field NumberFieldEditor-Input field-241
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Cost Required Field, [\D\d.]+, field editor\.
                    regular_expression: true
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
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
                    value: //DIV/DIV[@role="presentation"]/DIV/DIV/DIV/DIV[@role="dialog"]/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV/BUTTON[normalize-space()="Save"]
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
                    value: ms-Button ms-Button--primary root-228
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebButton
              name: Remove Jasmin Haas
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
                    value: //DIV/SPAN/DIV/DIV/DIV[@role="presentation"]/DIV/SPAN[@role="list"]/DIV[@role="listitem"]/BUTTON[normalize-space()=""]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
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
                    value: '441'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1267'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: 
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
                    value: 
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
                    value: '28'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ms-Button ms-Button--icon ms-PickerItem-content root-278
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Remove Jasmin Haas
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '544'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1267'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebButton
              name: New
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
                    value: //DIV/BUTTON[@role="menuitem" and normalize-space()="New"]
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
                    value: New
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
                    value: New
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
                    value: ms-Button ms-Button--commandBar spo--primaryNewButton ms-CommandBarItem-link
                      root-86
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
          - object:
              class: WebButton
              name: Jasmin Haas
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
                    value: //DIV[5]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="listbox"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/BUTTON[@role="option"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '260'
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
                    value: '476'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1147'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Jasmin HaasJasmin HaasAutomation AnalystAutomation AnalystJasmin.Haas@sapowernetworks.com.auJasmin.Haas@sapowernetworks.com.au
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
                    value: Jasmin HaasJasmin HaasAutomation AnalystAutomation AnalystJasmin.Haas@sapowernetworks.com.auJasmin.Haas@sapowernetworks.com.au
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
                    value: sug-0
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '54'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ms-Button ms-Button--action ms-Button--command ms-Suggestions-itemButton
                      is-suggested itemButton-253
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Jasmin Haas
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '579'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1147'
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
              last_update_time: Tuesday, 4 April 2023 2:42:14 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
