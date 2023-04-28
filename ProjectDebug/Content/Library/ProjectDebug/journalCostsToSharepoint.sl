namespace: ProjectDebug
operation:
  name: journalCostsToSharepoint
  inputs:
  - costs: '2223.95'
  - projectName: test project for debugging RPA
  - projectMangerEmail: Muen.Chen@sapowernetworks.com.au
  - sapCode: 80087396-0050
  - currencyConversion: '1'
  sequential_action:
    gav: com.microfocus.seq:ProjectDebug.journalCostsToSharepoint:1.0.0
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
        object_path: Pc = Parameter("costs") * Parameter("currencyConversion")
    - step:
        id: '11'
        action: Script
        object_path: projectCost = Round(Pc, 2)
    - step:
        id: '12'
        action: Script
        object_path: projectName = Parameter("projectName")
    - step:
        id: '13'
        action: Script
        object_path: projectManager = Parameter("projectMangerEmail")
    - step:
        id: '14'
        action: Script
        object_path: Sc = Parameter("sapCode")
    - step:
        id: '15'
        action: Script
        object_path: screenShotFileLocation = "C:\Users\svcrpabot\OneDrive - SA Power
          Networks\ITAM Azure Cost Management\"&projectName&".png"
    - step:
        id: '16'
        action: Script
        object_path: '''split sap code'
    - step:
        id: '17'
        action: Script
        object_path: SapCode = ""
    - step:
        id: '18'
        action: Script
        object_path: SapActivity = ""
    - step:
        id: '19'
        action: Script
        object_path: If InStr(Sc, "-") Then
    - step:
        id: '20'
        action: Script
        object_path: temp = Split(Sc, "-")
    - step:
        id: '21'
        action: Script
        object_path: SapCode = temp(0)
    - step:
        id: '22'
        action: Script
        object_path: SapActivity = temp(1)
    - step:
        id: '23'
        action: Script
        object_path: Else
    - step:
        id: '24'
        action: Script
        object_path: SapCode = Sc
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: '''Create journal name'
    - step:
        id: '27'
        action: Script
        object_path: mon = Month(Date())
    - step:
        id: '28'
        action: Script
        object_path: If mon = 1 Then
    - step:
        id: '29'
        action: Script
        object_path: reportMonth = "December"
    - step:
        id: '30'
        action: Script
        object_path: Else
    - step:
        id: '31'
        action: Script
        object_path: reportMonth = MonthName(Month(Date()) - 1)
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: JournalName = "Azure - "&projectName&" - "&reportMonth
    - step:
        id: '34'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '35'
        action: Script
        object_path: '''Add item'
    - step:
        id: '36'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebButton("New")
        action: Click
    - step:
        id: '37'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Cost
          Required Field, empty,")
        action: Set
        args: projectCost
        snapshot: .\Snapshots\ssf12.html
        highlight_id: '10000000'
    - step:
        id: '38'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Quantity
          Required Field")
        action: Set
        args: '"1"'
        snapshot: .\Snapshots\ssf13.html
        highlight_id: '10000000'
    - step:
        id: '39'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebRadioGroup("Type
          of Journal Required")
        comment: Cloud Services (Off-prem) - 533124
        action: Select
        args: '"#0"'
        snapshot: .\Snapshots\ssf15.html
        highlight_id: '10000000'
    - step:
        id: '40'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Notes
          Required Field")
        action: Set
        args: JournalName
        snapshot: .\Snapshots\ssf16.html
        highlight_id: '10000000'
    - step:
        id: '41'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Debit
          SAP number")
        comment: static code
        action: Set
        args: '"7048464"'
        snapshot: .\Snapshots\ssf17.html
        highlight_id: '10000000'
    - step:
        id: '42'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Credit
          SAP Number")
        action: Set
        args: SapCode
    - step:
        id: '43'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Credit
          SAP Activity code")
        action: Set
        args: SapActivity
    - step:
        id: '44'
        object_path: Browser("IT Asset Management").Page("Journal Sheet").WebEdit("Customer
          Required Field")
        action: Click
        snapshot: .\Snapshots\ssf20.html
        highlight_id: '10000000'
    - step:
        id: '45'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '46'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '47'
        object_path: mySendKeys
        action: SendKeys
        args: projectManager
    - step:
        id: '48'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '49'
        action: Script
        object_path: '''Call Screenshot(screenShotFileLocation)'
    - step:
        id: '50'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '51'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '52'
        action: Script
        object_path: If Browser("IT Asset Management").Page("Journal Sheet").WebElement("EmailError").Exist(1)
          Then
    - step:
        id: '53'
        action: Script
        object_path: emailAddress = Browser("IT Asset Management").Page("Journal Sheet").WebElement("EmailError").GetROProperty("innertext")
    - step:
        id: '54'
        action: Script
        object_path: Else
    - step:
        id: '55'
        action: Script
        object_path: emailAddress = ""
    - step:
        id: '56'
        action: Script
        object_path: End If
    - step:
        id: '57'
        action: Script
        object_path: If emailAddress <> "" Then
    - step:
        id: '58'
        action: Script
        object_path: Parameter("failureScreenshotLocation") = screenShotFileLocation
    - step:
        id: '59'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "PM doesn't exist", "PM doesn't exist"
    - step:
        id: '60'
        action: Script
        object_path: Else
    - step:
        id: '61'
        object_path: '''Browser("IT Asset Management").Page("Journal Sheet").WebButton("Save")'
        action: Click
    - step:
        id: '62'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        object_path: SystemUtil
        action: CloseProcessByName("chrome.exe")
    - step:
        id: '65'
        action: Script
        object_path: Function Screenshot(screenShotFileLocation)
    - step:
        id: '66'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocation,true
    - step:
        id: '67'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '68'
        action: Script
        object_path: End Function
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
      last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
          last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
                    value: ChoiceGroup846
                    regular_expression: false
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
                    value: '727'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '354'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1146'
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
                    value: TextField842
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
                    value: '1'
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
                    value: Quantity Required Field, empty, field editor.
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '457'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1146'
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
                    value: '727'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '274'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1146'
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
                    value: '36'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: Cost Required Field, empty, field editor.
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '377'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1146'
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
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
              last_update_time: Wednesday, 7 December 2022 10:49:06 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
