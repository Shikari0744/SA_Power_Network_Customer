namespace: RiverMurrayFloodDisconnections
operation:
  name: D
  inputs:
  - floodManagementSheet: C:\Users\haasj0\Downloads\Flood Management (2).xlsx
  - b2bAction: Imported Bulk Disconnections
  - sourceOfDeen: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.D:1.0.0
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
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '3'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '4'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))
    - step:
        id: '5'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("query")
    - step:
        id: '6'
        action: Script
        object_path: rowsNMI = objSheet.UsedRange.Rows.Count
    - step:
        id: '7'
        action: Script
        object_path: For row = 2 To rowsNMI
    - step:
        id: '8'
        action: Script
        object_path: If objSheet.cells(row,2).value = Parameter("b2bAction") and objSheet.cells(row,3).value
          = Parameter("sourceOfDeen") Then
    - step:
        id: '9'
        action: Script
        object_path: If objSheet.cells(row,27).value <> "Bill reversal required" and
          objSheet.cells(row,27).value <> "" Then
    - step:
        id: '10'
        action: Script
        object_path: If objSheet.cells(row,28).value = "" and (objSheet.cells(row,9).value
          <> "REMOVED" and objSheet.cells(row,9).value <> "INSTALLATION NOT FOUND")
          Then
    - step:
        id: '11'
        action: Script
        object_path: nmi = objSheet.cells(row,1).value
    - step:
        id: '12'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nES31"'
    - step:
        id: '13'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '14'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Installation:
          Initial").SAPGuiEdit("Installation")'
        action: OpenPossibleEntries
    - step:
        id: '15'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiTabStrip("G_SELONETABSTRIP")
        action: Select
        args: '"Installation by Point of Delivery"'
    - step:
        id: '16'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiEdit("Point
          of Delivery ID")
        action: Set
        args: nmi
    - step:
        id: '17'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiLabel("Found
          NMI")
        action: SetFocus
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '20'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Installation:
          Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '21'
        action: Script
        object_path: status = SAPGuiSession("Session").SAPGuiWindow("Change Installation:").SAPGuiEdit("Site
          Status").GetROProperty("value")
    - step:
        id: '22'
        action: Script
        object_path: If status <> "OTR" Then
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Installation:").SAPGuiEdit("Site
          Status")
        action: Set
        args: '"DEFECT"'
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Installation:").SAPGuiEdit("Text
          for Installation")
        action: Set
        args: '"DEEN due to Flooding. ECOC may be required."'
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Installation:").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '26'
        object_path: objSheet.cells(row,28)
        action: value
        args: = "Yes"
    - step:
        id: '27'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Installation:
          Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
    - step:
        id: '28'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Installation:
          Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '29'
        object_path: objSheet.cells(row,2)
        action: value
        args: = "Processed"
    - step:
        id: '30'
        object_path: objSheet.cells(row,5)
        action: value
        args: = CDate(FormatDateTime(Now(),2))
    - step:
        id: '31'
        action: Script
        object_path: Else
    - step:
        id: '32'
        object_path: objSheet.cells(row,28)
        action: value
        args: = "No - OTR Site"
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Installation:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Installation:")
        action: SendKey
        args: ENTER
    - step:
        id: '35'
        object_path: objSheet.cells(row,2)
        action: value
        args: = "OTR - No Further Action"
    - step:
        id: '36'
        action: Script
        object_path: End If
    - step:
        id: '37'
        object_path: objSheet.cells(row,35)
        action: value
        args: = "Ready to upload"
    - step:
        id: '38'
        object_path: objWorkbook
        action: save
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: End If
    - step:
        id: '42'
        action: Script
        object_path: Next
    - step:
        id: '43'
        object_path: objWorkbook
        action: save
    - step:
        id: '44'
        object_path: objWorkbook
        action: close
    - step:
        id: '45'
        object_path: objExcel
        action: quit
    - step:
        id: '46'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '47'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '48'
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
      last_update_time: Friday, 6 January 2023 10:42:16 AM
      child_objects:
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
          last_update_time: Friday, 6 January 2023 10:42:16 AM
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Restrict Value Range
          properties:
          - property:
              value:
                value: ES31
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSDH4
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
          last_update_time: Friday, 6 January 2023 10:42:16 AM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: G_SELONETABSTRIP
              properties:
              - property:
                  value:
                    value: G_SELONETABSTRIP
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '90'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/tabsG_SELONETABSTRIP
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Point of Delivery ID
              properties:
              - property:
                  value:
                    value: G_SELFLD_TAB-LOW
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
                    value: wnd[1]/usr/tabsG_SELONETABSTRIP/tabpTAB002/ssubSUBSCR_PRESEL:SAPLSDH4:0220/sub:SAPLSDH4:0220/txtG_SELFLD_TAB-LOW[0,24]
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
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Installation 1 Entry
          properties:
          - property:
              value:
                value: ES31
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
          last_update_time: Friday, 6 January 2023 10:42:16 AM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Found NMI
              properties:
              - property:
                  value:
                    value: wnd[1]/usr/lbl[1,3]
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
                    value: wnd[1]/usr/lbl[1,3]
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Apply   (Enter)
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Installation: Initial'
          properties:
          - property:
              value:
                value: ES31
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '110'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Friday, 6 January 2023 10:42:16 AM
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Installation
              properties:
              - property:
                  value:
                    value: EANLD-ANLAGE
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
                    value: wnd[0]/usr/ctxtEANLD-ANLAGE
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Installation:'
          properties:
          - property:
              value:
                value: ES31
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '201'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Friday, 6 January 2023 10:42:16 AM
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Text for Installation
              properties:
              - property:
                  value:
                    value: EENO_DYNP-ZEILE
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
                    value: wnd[0]/usr/subNOTICE:SAPLEENO:1001/sub:SAPLEENO:1001/txtEENO_DYNP-ZEILE[0,19]
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Site Status
              properties:
              - property:
                  value:
                    value: GS_EANLSD-ZZ_SITE_STATUS
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
                    value: wnd[0]/usr/subCUSTSUB:SAPLXES30:0100/ctxtGS_EANLSD-ZZ_SITE_STATUS
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
                    value: wnd[0]/tbar[0]/btn[11]
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
              last_update_time: Friday, 6 January 2023 10:42:16 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
