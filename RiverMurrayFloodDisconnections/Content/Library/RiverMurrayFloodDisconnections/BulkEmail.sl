namespace: RiverMurrayFloodDisconnections
operation:
  name: BulkEmail
  inputs:
  - b2bAction: Imported Bulk Disconnections
  - floodManagementSheet: C:\Users\svcrpabot\OneDrive - SA Power Networks\River Murray
      Flood Disconnections\Flood Management.xlsx
  - sourceOfDeen: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.BulkEmail:1.0.0
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
        object_path: Set objRegEx = CreateObject("VBScript.RegExp")
    - step:
        id: '2'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '3'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '4'
        action: Script
        object_path: retailerURL = "https://sapowernetworks.sharepoint.com/sites/MDMTeamSite/Lists/Retailer%20Details78be85eba34844f681325897721ab6c9/AllItems.aspx"
    - step:
        id: '5'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&retailerURL'
    - step:
        id: '6'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '7'
        action: Script
        object_path: retailerSheet = Replace(Parameter("floodManagementSheet"), ".xlsx",
          " Retailer Emails.xlsx")
    - step:
        id: '8'
        action: Script
        object_path: Parameter("retailerSheet") = retailerSheet
    - step:
        id: '9'
        action: Script
        object_path: If fso.FileExists(retailerSheet)Then
    - step:
        id: '10'
        object_path: fso
        action: DeleteFile(retailerSheet)
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '13'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '14'
        action: Script
        object_path: ''''''' CREATE RETAILER EMAIL DOC'
    - step:
        id: '15'
        action: Script
        object_path: Set objWorkbookRetailer = objExcel.Workbooks.Add()
    - step:
        id: '16'
        action: Script
        object_path: Set objSheetRetailer = objWorkbookRetailer.Worksheets(1)
    - step:
        id: '17'
        action: Script
        object_path: tempRetailer = Replace(retailerSheet,"/","\")
    - step:
        id: '18'
        object_path: objWorkbookRetailer
        action: SaveAs(tempRetailer)
    - step:
        id: '19'
        action: Script
        object_path: rowsEmail = objSheetRetailer.UsedRange.Rows.Count
    - step:
        id: '20'
        action: Script
        object_path: ''''''' OPEN FLOOD MANAGEMENT'
    - step:
        id: '21'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))
    - step:
        id: '22'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("query")
    - step:
        id: '23'
        action: Script
        object_path: rowsNMI = objSheet.UsedRange.Rows.Count
    - step:
        id: '24'
        action: Script
        object_path: retailerRow = Browser("MDM Team Site - Retailer").Page("MDM Team
          Site - Retailer").WebTable("List of folders, files").RowCount
    - step:
        id: '25'
        action: Script
        object_path: For r = 2 To retailerRow
    - step:
        id: '26'
        action: Script
        object_path: retailer = Browser("MDM Team Site - Retailer").Page("MDM Team
          Site - Retailer").WebTable("List of folders, files").GetCellData(r, 2)
    - step:
        id: '27'
        object_path: objRegEx
        action: Global
        args: = True
    - step:
        id: '28'
        object_path: objRegEx
        action: Pattern
        args: = "[^A-Za-z0-9\(\) ]"
    - step:
        id: '29'
        action: Script
        object_path: retailerTrim = objRegEx.Replace(retailer, "")
    - step:
        id: '30'
        action: Script
        object_path: retailerEmail = Browser("MDM Team Site - Retailer").Page("MDM
          Team Site - Retailer").WebTable("List of folders, files").GetCellData(r,
          3)
    - step:
        id: '31'
        object_path: objSheetRetailer.cells(rowsEmail,1)
        action: value
        args: = retailerTrim
    - step:
        id: '32'
        object_path: objSheetRetailer.cells(rowsEmail,2)
        action: value
        args: = retailerEmail
    - step:
        id: '33'
        action: Script
        object_path: rowsEmail = rowsEmail + 1
    - step:
        id: '34'
        action: Script
        object_path: Next
    - step:
        id: '35'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"msedge.exe"'
    - step:
        id: '36'
        action: Script
        object_path: For y = 2 to rowsNMI
    - step:
        id: '37'
        action: Script
        object_path: If objSheet.cells(y,35).value = "Ready to upload" and objSheet.cells(y,30).value
          = "" and objSheet.cells(y,2).value = "Processed" and objSheet.cells(y,9).value
          <> "" Then
    - step:
        id: '38'
        action: Script
        object_path: retailer = objSheet.cells(y,16).value
    - step:
        id: '39'
        action: Script
        object_path: For x = 2 To retailerRow
    - step:
        id: '40'
        action: Script
        object_path: If objSheetRetailer.cells(x,1).value = retailer Then
    - step:
        id: '41'
        action: Script
        object_path: nmi = objSheet.cells(y,1).value
    - step:
        id: '42'
        action: Script
        object_path: deenDate = objSheet.cells(y,4).value
    - step:
        id: '43'
        action: Script
        object_path: address = objSheet.cells(y,10).value
    - step:
        id: '44'
        action: Script
        object_path: meter = objSheet.cells(y,13).value
    - step:
        id: '45'
        action: Script
        object_path: existingBody = objSheetRetailer.cells(x,3).value
    - step:
        id: '46'
        action: Script
        object_path: newbody = existingBody & nmi & " / "& Replace(deenDate,"/","-")
          & " / "& address & " / "& meter & vbNewLine
    - step:
        id: '47'
        object_path: objSheetRetailer.cells(x,3)
        action: value
        args: = newbody
    - step:
        id: '48'
        object_path: objSheet.cells(y,30)
        action: value
        args: = "Yes"
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: Next
    - step:
        id: '51'
        action: Script
        object_path: End If
    - step:
        id: '52'
        action: Script
        object_path: Next
    - step:
        id: '53'
        object_path: objWorkbookRetailer
        action: save
    - step:
        id: '54'
        object_path: objWorkbookRetailer
        action: close
    - step:
        id: '55'
        object_path: objWorkbook
        action: save
    - step:
        id: '56'
        object_path: objWorkbook
        action: close
    - step:
        id: '57'
        object_path: objExcel
        action: quit
    - step:
        id: '58'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '59'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '60'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '61'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '62'
        action: Script
        object_path: Set fso = Nothing
  outputs:
  - retailerSheet:
      robot: true
      value: ${retailerSheet}
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
            value: '1'
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
      last_update_time: Thursday, 22 December 2022 9:30:05 PM
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
                value: '10046'
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
          last_update_time: Thursday, 22 December 2022 9:30:05 PM
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
              last_update_time: Thursday, 22 December 2022 9:30:05 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
