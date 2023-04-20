namespace: RiverMurrayFloodDisconnections
operation:
  name: SO
  inputs:
  - floodManagementSheet: C:/Users/svcrpabot/OneDrive - SA Power Networks/River Murray
      Flood Disconnections/Flood Management.xlsx
  - b2bAction: Imported Bulk Disconnections
  - sourceOfDeen: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.SO:1.0.0
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
        object_path: If objSheet.cells(row,18).value = "" and (objSheet.cells(row,9).value
          <> "REMOVED" and objSheet.cells(row,9).value <> "INSTALLATION NOT FOUND")  Then
    - step:
        id: '10'
        action: Script
        object_path: nmi = objSheet.cells(row,1).value
    - step:
        id: '11'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW73"'
    - step:
        id: '12'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '13'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiEdit("Period
          From")
        action: Set
        args: '""'
    - step:
        id: '14'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiEdit("Period
          To")
        action: Set
        args: '""'
    - step:
        id: '15'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiEdit("NMI")
        action: Set
        args: nmi
    - step:
        id: '16'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiEdit("Basic
          Start Date From")
        action: Set
        args: Replace(Date(), "/", ".")
    - step:
        id: '17'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiEdit("Basic
          Start Date To")
        action: Set
        args: '"31.12.9999"'
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '19'
        object_path: objSheet.cells(row,18)
        action: value
        args: = "Yes"
    - step:
        id: '20'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiStatusBar("StatusBar").Exist(1)
          Then
    - step:
        id: '21'
        object_path: objSheet.cells(row,19)
        action: value
        args: = "No"
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:")
        action: SendKey
        args: ENTER
    - step:
        id: '24'
        action: Script
        object_path: Else
    - step:
        id: '25'
        object_path: objSheet.cells(row,19)
        action: value
        args: = "Yes"
    - step:
        id: '26'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Service Order:_2").Exist(1)
          Then
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:_2").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Order:_2")
        action: SendKey
        args: ENTER
    - step:
        id: '29'
        action: Script
        object_path: ElseIf SAPGuiSession("Session").SAPGuiWindow("Display Capital
          - Minor").Exist(1) Then
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Capital - Minor").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Capital - Minor")
        action: SendKey
        args: ENTER
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: End If
    - step:
        id: '34'
        object_path: objWorkbook
        action: save
    - step:
        id: '35'
        action: Script
        object_path: End If
    - step:
        id: '36'
        action: Script
        object_path: End If
    - step:
        id: '37'
        action: Script
        object_path: Next
    - step:
        id: '38'
        object_path: objWorkbook
        action: save
    - step:
        id: '39'
        object_path: objWorkbook
        action: close
    - step:
        id: '40'
        object_path: objExcel
        action: quit
    - step:
        id: '41'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '42'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '43'
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
      last_update_time: Saturday, 24 December 2022 3:39:46 PM
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
          last_update_time: Saturday, 24 December 2022 3:39:46 PM
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Service Order:_2
          properties:
          - property:
              value:
                value: IW73
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSLVC_FULLSCREEN
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
          last_update_time: Saturday, 24 December 2022 3:39:46 PM
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Service Order:'
          properties:
          - property:
              value:
                value: IW73
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
                value: RIAUFK20
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
          last_update_time: Saturday, 24 December 2022 3:39:46 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
              properties:
              - property:
                  value:
                    value: SAPGuiStatusBar
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '103'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/sbar
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Period To
              properties:
              - property:
                  value:
                    value: DATUB
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
                    value: wnd[0]/usr/ctxtDATUB
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Period From
              properties:
              - property:
                  value:
                    value: DATUV
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
                    value: wnd[0]/usr/ctxtDATUV
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: NMI
              properties:
              - property:
                  value:
                    value: S_NMI-LOW
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
                    value: wnd[0]/usr/ctxtS_NMI-LOW
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Basic Start Date To
              properties:
              - property:
                  value:
                    value: GSTRP-HIGH
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
                    value: wnd[0]/usr/ctxtGSTRP-HIGH
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Basic Start Date From
              properties:
              - property:
                  value:
                    value: GSTRP-LOW
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
                    value: wnd[0]/usr/ctxtGSTRP-LOW
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Capital - Minor
          properties:
          - property:
              value:
                value: IW33
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLIWO_UI_UI
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
          last_update_time: Saturday, 24 December 2022 3:39:46 PM
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
              last_update_time: Saturday, 24 December 2022 3:39:46 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
