namespace: DepotStockCount
operation:
  name: CreatePhysInvDoc
  inputs:
  - depot: Holden Hill
  - stockCount: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Depot
      Stock Count\Stockcount Schedule 2022.xlsx
  - countDate: 09/11/2021
  sequential_action:
    gav: com.microfocus.seq:DepotStockCount.CreatePhysInvDoc:1.0.0
    skills:
    - SAP
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
        object_path: depot = Parameter("depot")
    - step:
        id: '2'
        action: Script
        object_path: stockCountSheet = Parameter("stockCount")
    - step:
        id: '3'
        action: Script
        object_path: '''''''''''DATE IS BEING CONVERTED TO US'
    - step:
        id: '4'
        action: Script
        object_path: countDate = Parameter("countDate")
    - step:
        id: '5'
        action: Script
        object_path: If countDate = "" Then
    - step:
        id: '6'
        action: Script
        object_path: countDate = CDate(FormatDateTime(Now(),2))
    - step:
        id: '7'
        action: Script
        object_path: Else
    - step:
        id: '8'
        action: Script
        object_path: countDate = CDate(FormatDateTime(countDate,2))
    - step:
        id: '9'
        action: Script
        object_path: End If
    - step:
        id: '10'
        action: Script
        object_path: '''hwnp)5Emk'
    - step:
        id: '11'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '12'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '13'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(stockCountSheet)
    - step:
        id: '14'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Storage Locations")
    - step:
        id: '15'
        action: Script
        object_path: rowCount = objSheet.UsedRange.Rows.Count
    - step:
        id: '16'
        action: Script
        object_path: For row = 1 To rowCount
    - step:
        id: '17'
        action: Script
        object_path: If objSheet.cells(row,1).value <> "" Then
    - step:
        id: '18'
        action: Script
        object_path: depot2 = objSheet.cells(row,1).value
    - step:
        id: '19'
        action: Script
        object_path: If UCase(depot2) = UCase(depot) Then
    - step:
        id: '20'
        action: Script
        object_path: storagelocation = objSheet.cells(row,2).value
    - step:
        id: '21'
        action: Script
        object_path: Exit for
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: Else
    - step:
        id: '24'
        action: Script
        object_path: flag = "Storage location not found. Process cancelled"
    - step:
        id: '25'
        action: Script
        object_path: Parameter("flag") = flag
    - step:
        id: '26'
        action: Script
        object_path: ExitTest
    - step:
        id: '27'
        action: Script
        object_path: End If
    - step:
        id: '28'
        action: Script
        object_path: Next
    - step:
        id: '29'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(depot)
    - step:
        id: '30'
        action: Script
        object_path: rowCount = objSheet.UsedRange.Rows.Count
    - step:
        id: '31'
        action: Script
        object_path: colCount = objSheet.UsedRange.Columns.count
    - step:
        id: '32'
        action: Script
        object_path: For row = 19 To rowCount
    - step:
        id: '33'
        action: Script
        object_path: If objSheet.cells(row,4).value <> "END" Then
    - step:
        id: '34'
        action: Script
        object_path: scheduledCount = objSheet.cells(row,5).value
    - step:
        id: '35'
        action: Script
        object_path: countedDate = objSheet.cells(row,6).value
    - step:
        id: '36'
        action: Script
        object_path: If scheduledCount = countDate and CStr(countedDate) = "" Then
    - step:
        id: '37'
        action: Script
        object_path: binRange = objSheet.cells(row,4).value
    - step:
        id: '38'
        action: Script
        object_path: Exit for
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: Else
    - step:
        id: '41'
        action: Script
        object_path: flag = "No available bin range for date found. Process cancelled"
    - step:
        id: '42'
        action: Script
        object_path: Parameter("flag") = flag
    - step:
        id: '43'
        action: Script
        object_path: ExitTest
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: Next
    - step:
        id: '46'
        object_path: objWorkbook
        action: save
    - step:
        id: '47'
        object_path: objWorkbook
        action: close
    - step:
        id: '48'
        object_path: objExcel
        action: Quit
    - step:
        id: '49'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '50'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '51'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '52'
        action: Script
        object_path: If InStr(binRange, " - ") Then
    - step:
        id: '53'
        action: Script
        object_path: binRanges = Split(binRange, " - ")
    - step:
        id: '54'
        action: Script
        object_path: typeofBin = "Ranges"
    - step:
        id: '55'
        action: Script
        object_path: ElseIf InStr(binRange, " ") Then
    - step:
        id: '56'
        action: Script
        object_path: binRanges = Split(binRange, " ")
    - step:
        id: '57'
        action: Script
        object_path: typeofBin = "Areas"
    - step:
        id: '58'
        action: Script
        object_path: Else
    - step:
        id: '59'
        action: Script
        object_path: typeofBin = "Single"
    - step:
        id: '60'
        action: Script
        object_path: End If
    - step:
        id: '61'
        action: Script
        object_path: '''CREATE PHYSICAL INVENTORY DOCUMENT'
    - step:
        id: '62'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMI31"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '63'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '64'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiCheckBox("Set
          posting block")
        action: Set
        args: '"OFF"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '42'
    - step:
        id: '65'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiButton("Get
          Variant...   (Shift+F5)")
        action: Click
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '24'
    - step:
        id: '66'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find Variant").SAPGuiEdit("Created
          By")
        action: Set
        args: '""'
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '12'
    - step:
        id: '67'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find Variant").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '3'
    - step:
        id: '68'
        action: Script
        object_path: 'varRow = SAPGuiSession("Session").SAPGuiWindow("ABAP: Variant
          Directory").SAPGuiGrid("Variant Catalog for Program").RowCount'
    - step:
        id: '69'
        action: Script
        object_path: For row = 1 To varRow
    - step:
        id: '70'
        action: Script
        object_path: 'variantName = SAPGuiSession("Session").SAPGuiWindow("ABAP: Variant
          Directory").SAPGuiGrid("Variant Catalog for Program").GetCellData(row, "Short
          Description")'
    - step:
        id: '71'
        action: Script
        object_path: If InStr(variantName, "Stock count") and InStr(variantName, depot)
          Then
    - step:
        id: '72'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ABAP: Variant Directory").SAPGuiGrid("Variant
          Catalog for Program")'
        action: SelectRow
        args: row
    - step:
        id: '73'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ABAP: Variant Directory").SAPGuiButton("Choose   (F2)")'
        action: Click
    - step:
        id: '74'
        action: Script
        object_path: Exit For
    - step:
        id: '75'
        action: Script
        object_path: End If
    - step:
        id: '76'
        action: Script
        object_path: Next
    - step:
        id: '77'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiEdit("Storage
          Location")
        action: Set
        args: storagelocation
    - step:
        id: '78'
        action: Script
        object_path: If typeofBin = "Ranges" Then
    - step:
        id: '79'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiEdit("Storage
          Bin Description")
        action: Set
        args: binRanges(0)
    - step:
        id: '80'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiEdit("to")
        action: Set
        args: binRanges(1)
    - step:
        id: '81'
        action: Script
        object_path: ElseIf typeofBin = "Areas" Then
    - step:
        id: '82'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiButton("Multiple
          selection")
        action: Click
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '35'
    - step:
        id: '83'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: 1,"Single value",binRanges(0)
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '15'
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: 2,"Single value",binRanges(1)
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '15'
    - step:
        id: '85'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Check
          entries   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2'
    - step:
        id: '86'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
    - step:
        id: '87'
        action: Script
        object_path: ElseIf typeofBin = "Single" Then
    - step:
        id: '88'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiEdit("Storage
          Bin Description")
        action: Set
        args: binRange
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Selected Data for Phys.").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '25'
    - step:
        id: '91'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Physical Inventory
          Documents").SAPGuiLabel("List does not contain").Exist = False Then
    - step:
        id: '92'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Physical Inventory Documents").SAPGuiButton("Show
          Result")
        action: Click
    - step:
        id: '93'
        action: Script
        object_path: For z = 3 to 100
    - step:
        id: '94'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Physical Inventory
          Documents_2").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[39,"&z&"\]").Exist
          Then
    - step:
        id: '95'
        action: Script
        object_path: invDoc = SAPGuiSession("Session").SAPGuiWindow("Physical Inventory
          Documents_2").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[39,"&z&"\]").GetROProperty("content")
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
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '99'
        action: Script
        object_path: Else
    - step:
        id: '100'
        action: Script
        object_path: flag = "Inventory list contains no data"
    - step:
        id: '101'
        action: Script
        object_path: Parameter("flag") = flag
    - step:
        id: '102'
        action: Script
        object_path: ExitTest
    - step:
        id: '103'
        action: Script
        object_path: End If
    - step:
        id: '104'
        action: Script
        object_path: Parameter("invDoc") = invDoc
    - step:
        id: '105'
        action: Script
        object_path: Parameter("binRange") = binRange
  outputs:
  - flag:
      robot: true
      value: ${flag}
  - invDoc:
      robot: true
      value: ${invDoc}
  - binRange:
      robot: true
      value: ${binRange}
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
      name: Window
      properties:
      - property:
          value:
            value: TaskListThumbnailWnd
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
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: TaskListThumbnailWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Monday, 7 November 2022 2:32:35 PM
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
            value: /app/con[0]/ses[0]
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
      last_update_time: Monday, 7 November 2022 2:32:35 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Selected Data for Phys.
          properties:
          - property:
              value:
                value: MI31
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
                value: RM07II31
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
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: to
              properties:
              - property:
                  value:
                    value: R_LGPBE-HIGH
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
                    value: '31'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/txtR_LGPBE-HIGH
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Storage Location
              properties:
              - property:
                  value:
                    value: R_LGORT-LOW
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
              - property:
                  value:
                    value: wnd[0]/usr/ctxtR_LGORT-LOW
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Storage Bin Description
              properties:
              - property:
                  value:
                    value: R_LGPBE-LOW
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
                    value: '31'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/txtR_LGPBE-LOW
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Set posting block
              properties:
              - property:
                  value:
                    value: Set posting block
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPERR
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkSPERR
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Multiple selection
              properties:
              - property:
                  value:
                    value: '%_R_LGPBE_%_APP_%-VALU_PUSH'
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
              - property:
                  value:
                    value: wnd[0]/usr/btn%_R_LGPBE_%_APP_%-VALU_PUSH
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Get Variant...   (Shift+F5)
              properties:
              - property:
                  value:
                    value: btn[17]
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
              - property:
                  value:
                    value: wnd[0]/tbar[1]/btn[17]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
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
              - property:
                  value:
                    value: wnd[0]/tbar[1]/btn[8]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access  -  User
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
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 7 November 2022 2:32:35 PM
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Physical Inventory Documents_2
          properties:
          - property:
              value:
                value: MI31
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: PhysInvDoc
              properties:
              - property:
                  value:
                    value: wnd\[1\]/usr/lbl\[39,.*\]
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
                    value: wnd[1]/usr/lbl[39,4]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Physical Inventory Documents
          properties:
          - property:
              value:
                value: MI31
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
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: List does not contain
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[2,8]
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
                    value: wnd[0]/usr/lbl[2,8]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Show Result
              properties:
              - property:
                  value:
                    value: btn[46]
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
              - property:
                  value:
                    value: wnd[0]/tbar[1]/btn[46]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Multiple Selection for
          properties:
          - property:
              value:
                value: MI31
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
                value: SAPLALDB
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLALDBSINGLE
              properties:
              - property:
                  value:
                    value: SAPLALDBSINGLE
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
                    value: wnd[1]/usr/tabsTAB_STRIP/tabpSIVA/ssubSCREEN_HEADER:SAPLALDB:3010/tblSAPLALDBSINGLE
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Copy   (F8)
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[8]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Check entries   (Enter)
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Find Variant
          properties:
          - property:
              value:
                value: MI31
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
                value: SAPLSVAR
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Created By
              properties:
              - property:
                  value:
                    value: ENAME-LOW
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
                    value: '31'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/txtENAME-LOW
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[8]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'ABAP: Variant Directory'
          properties:
          - property:
              value:
                value: MI31
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
                value: SAPLSVAR
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
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
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
          last_update_time: Monday, 7 November 2022 2:32:35 PM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: Variant Catalog for Program
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
              - property:
                  value:
                    value: wnd[1]/usr/cntlALV_CONTAINER_1/shellcont/shell
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Choose   (F2)
              properties:
              - property:
                  value:
                    value: btn[2]
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[2]
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
              last_update_time: Monday, 7 November 2022 2:32:35 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
