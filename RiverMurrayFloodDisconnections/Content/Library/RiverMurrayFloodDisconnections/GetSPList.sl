namespace: RiverMurrayFloodDisconnections
operation:
  name: GetSPList
  sequential_action:
    gav: 'com.microfocus.seq:RiverMurrayFloodDisconnections.GetSPList:1.0.0'
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
          object_path: 'Set fso = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '2'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '3'
          action: Script
          object_path: 'Set objRegEx = CreateObject("VBScript.RegExp")'
      - step:
          id: '4'
          action: Script
          object_path: "newLocation = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\River Murray Flood Disconnections\\Flood Management.xlsx\""
      - step:
          id: '5'
          action: Script
          object_path: If Not fso.FileExists(newLocation)Then
      - step:
          id: '6'
          action: Script
          object_path: "If fso.FileExists(\"C:\\Automation Downloads\\query.iqy\")Then"
      - step:
          id: '7'
          object_path: fso
          action: "DeleteFile(\"C:\\Automation"
          args: "Downloads\\query.iqy\")"
      - step:
          id: '8'
          action: Script
          object_path: End If
      - step:
          id: '9'
          action: Script
          object_path: 'listURL = "https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx"'
      - step:
          id: '10'
          object_path: SystemUtil
          action: CloseProcessByName
          args: '"msedge.exe"'
      - step:
          id: '11'
          object_path: mySendKeys
          action: Run
          args: '"msedge -url "&listURL'
      - step:
          id: '12'
          action: Wait
          args: '"20"'
          default_args: '"1"'
      - step:
          id: '13'
          object_path: 'Browser("MDM Team Site - Flood")'
          action: Highlight
      - step:
          id: '14'
          object_path: 'Browser("MDM Team Site - Flood").Page("MDM Team Site - Flood")'
          action: Highlight
      - step:
          id: '15'
          object_path: 'Browser("MDM Team Site - Flood").Page("MDM Team Site - Flood").WebMenu("Command bar")'
          action: Highlight
      - step:
          id: '16'
          object_path: "'Browser(\"MDM Team Site - Flood\").Page(\"MDM Team Site - Flood\").WebMenu(\"Command bar\")"
          action: Select
          args: '"Export"'
      - step:
          id: '17'
          object_path: 'Browser("MDM Team Site - Flood").Page("MDM Team Site - Flood").WebMenu("Command bar")'
          action: Select
          args: '"Export;Export to Excel"'
      - step:
          id: '18'
          action: Wait
          args: '"5"'
          default_args: '"1"'
      - step:
          id: '19'
          action: Script
          object_path: "If fso.FileExists(\"C:\\Automation Downloads\\query.iqy\")Then"
      - step:
          id: '20'
          object_path: SystemUtil
          action: 'CloseProcessByName("msedge.exe")'
      - step:
          id: '21'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '22'
          object_path: objExcel
          action: visible
          args: = true
      - step:
          id: '23'
          action: Script
          object_path: "Set objWorkbook = objExcel.Workbooks.open(\"C:\\Automation Downloads\\query.iqy\")"
      - step:
          id: '24'
          object_path: objWorkbook
          action: SaveAs
          args: newLocation
      - step:
          id: '25'
          object_path: objWorkbook
          action: Save
      - step:
          id: '26'
          object_path: objWorkbook
          action: Close
      - step:
          id: '27'
          object_path: objExcel
          action: quit
      - step:
          id: '28'
          action: Script
          object_path: Set objWorkbook = Nothing
      - step:
          id: '29'
          action: Script
          object_path: Set objSheet = Nothing
      - step:
          id: '30'
          action: Script
          object_path: Else
      - step:
          id: '31'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Download failed", "Download failed"'
      - step:
          id: '32'
          action: Script
          object_path: ExitTest
      - step:
          id: '33'
          action: Script
          object_path: End If
      - step:
          id: '34'
          object_path: SystemUtil
          action: 'CloseProcessByName("msedge.exe")'
      - step:
          id: '35'
          action: Script
          object_path: "Parameter(\"floodManagementSheet\") = Replace(newLocation,\"\\\",\"/\")"
      - step:
          id: '36'
          action: Script
          object_path: Else
      - step:
          id: '37'
          action: Script
          object_path: "Parameter(\"floodManagementSheet\") = Replace(newLocation,\"\\\",\"/\")"
      - step:
          id: '38'
          action: Script
          object_path: End If
      - step:
          id: '39'
          action: Script
          object_path: Set fso = Nothing
      - step:
          id: '40'
          action: Script
          object_path: Set mySendKeys = Nothing
      - step:
          id: '41'
          action: Script
          object_path: Set objRegEx = Nothing
      - step:
          id: '42'
          action: Script
          object_path: Set objExcel = Nothing
  outputs:
    - floodManagementSheet:
        robot: true
        value: '${floodManagementSheet}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
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
        name: MDM Team Site - Flood
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
              name: MDM Team Site - Flood
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
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: 'List of folders, files'
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
                            value: '//DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[@role="grid"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebTable
                    visual_relations: ''
                    last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
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
                          - html id
                          - class
                          - first item
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Command bar
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
                            value: '//DIV[2]/DIV[@role="region"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="menubar"][1]'
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
                    comments: ''
                    custom_replay: ''
                    class: WebMenu
                    visual_relations: ''
                    last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
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
                      value: 'https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
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
              name: 'Customer & Installation'
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
                    name: Meter Number
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
                            value: '//TABLE[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::responsiveTable-listUl"]'
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
                            value: 'ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::responsiveTable-listUl'
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
                    last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
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
                    name: Empty Meter Number
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
                            value: '//TBODY[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ListReport.view.ListReport::ZCDS_DM_C_CISOV_SearchResSet--responsiveTable-_BYALL-tblBody"]/TR/TD/DIV/DIV[normalize-space()="Meter Number:"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
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
                    name: Meter Details
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
                            value: '//BUTTON[@id="ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::Section-anchor"]'
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
                            value: 'ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--objectPage-anchBar-ISUDataBrowser.isudatabrowser::sap.suite.ui.generic.template.ObjectPage.view.Details::ZCDS_DM_C_CISOV_SearchResSet--metDetails::Section-anchor'
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
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
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
                      value: "https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp#DataBrowser-display&//ZCDS_DM_C_CISOV_SearchResSet(p_guid='ee0c269a-9ddd-4e96-88fd-3138ef79a170',p_date='2022-11-11T11-44-25',p_device='Desktop',NMI='20014592260',UtilitiesInstallation='3000467863')/"
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: "https://sapebqas.sapowernetworks.com.au/sap/bc/ui2/flp#DataBrowser-display&//ZCDS_DM_C_CISOV_SearchResSet(p_guid='ee0c269a-9ddd-4e96-88fd-3138ef79a170',p_date='2022-11-11T11-44-25',p_device='Desktop',NMI='20014592260',UtilitiesInstallation='3000467863')/?sap-iapp-state=ASCJCF0F7GGJZOW47R23TRL245S3MXA470DGG2RR"
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'Customer & Installation Discovery'
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
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
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
                value: 'https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Flooding%20%20SA%20Water/AllItems.aspx'
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
        comments:
          comment:
            - value: ''
              name: miccommentproperty
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: 'Monday, 5 December 2022 4:49:48 PM'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 0
            type: creationtime
  check_points_and_outputs: []
  parameters: []
