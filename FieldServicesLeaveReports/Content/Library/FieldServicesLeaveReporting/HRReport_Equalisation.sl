namespace: FieldServicesLeaveReporting
operation:
  name: HRReport_Equalisation
  inputs:
  - orgStructure
  - filepath
  - orgStructureSelection
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.HRReport_Equalisation:1.0.1
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
        object_path: '''EQUALISATION (RDO) EXTRACTION'
    - step:
        id: '2'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '3'
        action: Script
        object_path: '''CREATE EXCEL DOCUMENT'
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
        object_path: '''OPEN WORKBOOK'
    - step:
        id: '7'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Open(Parameter("filepath"))
    - step:
        id: '8'
        action: Script
        object_path: '''OPEN SHEET'
    - step:
        id: '9'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Equalisation")
    - step:
        id: '10'
        action: Script
        object_path: '''GET ROW COUNT'
    - step:
        id: '11'
        action: Script
        object_path: excelRow = 2
        comment: objWorksheet.usedrange.Rows.Count + 1
    - step:
        id: '12'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '13'
        action: Script
        object_path: orgStructure = Parameter("orgStructure")
    - step:
        id: '14'
        action: Script
        object_path: orgStruct = Split(orgStructure,"|")
    - step:
        id: '15'
        action: Script
        object_path: orgStructureSelection = Parameter("orgStructureSelection")
    - step:
        id: '16'
        action: Script
        object_path: orgStructSelect = Split(orgStructureSelection,"|")
    - step:
        id: '17'
        action: Script
        object_path: '''EXTRACT EQUALISATION BALANCES AND ADD TO EXCEL'
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nPT_BAL00"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiRadioButton("Today")
        action: Set
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiRadioButton("Cumulated
          balances")
        action: Set
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiEdit("Cumulated
          balances")
        action: Set
        args: '"YEQN"'
    - step:
        id: '23'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiEdit("Layout")'
        comment: /STANDARD
        action: Set
        args: '"LEAVEBAL"'
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiButton("Org.
          structure")
        action: Click
    - step:
        id: '25'
        action: Script
        object_path: For x = 0 To Ubound(orgStruct)
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiTree("TableTreeControl")
        action: Set
        args: orgStruct(x),orgStructSelect(x),"ON"
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiButton("Select
          subtree   (Shift+F1)")
        action: Click
    - step:
        id: '28'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '29'
        action: Script
        object_path: Next
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '4'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiButton("Continue   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '2'
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '2'
    - step:
        id: '32'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '33'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Error messages").Exist(3)
          Then
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Error messages").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '35'
        action: Script
        object_path: End If
    - step:
        id: '36'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation_2").SAPGuiGrid("GridViewCtrl").Exist(3)
          Then
    - step:
        id: '37'
        action: Script
        object_path: sapRow = SAPGuiSession("Session").SAPGuiWindow("Cumulated Time
          Evaluation_2").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '38'
        action: Script
        object_path: For i = 1 To sapRow
    - step:
        id: '39'
        action: Script
        object_path: employeeNo = SAPGuiSession("Session").SAPGuiWindow("Cumulated
          Time Evaluation_2").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Personnel
          Number")
    - step:
        id: '40'
        action: Script
        object_path: subgroup = SAPGuiSession("Session").SAPGuiWindow("Cumulated Time
          Evaluation_2").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Employee subgroup")
    - step:
        id: '41'
        action: Script
        object_path: If employeeNo <> "" and subgroup <> "Terminated/Separated" Then
    - step:
        id: '42'
        action: Script
        object_path: employeeName = SAPGuiSession("Session").SAPGuiWindow("Cumulated
          Time Evaluation_2").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Name of employee
          or applicant")
    - step:
        id: '43'
        action: Script
        object_path: entitlement = SAPGuiSession("Session").SAPGuiWindow("Cumulated
          Time Evaluation_2").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Number of
          hours")
    - step:
        id: '44'
        action: Script
        object_path: If Instr(entitlement,"-") Then
    - step:
        id: '45'
        action: Script
        object_path: entitlement = Replace(entitlement,"-","")
    - step:
        id: '46'
        action: Script
        object_path: entitlement = "-"&entitlement
    - step:
        id: '47'
        action: Script
        object_path: entitlement = CDbl(entitlement)
    - step:
        id: '48'
        action: Script
        object_path: End If
    - step:
        id: '49'
        action: Script
        object_path: timeAdmin = SAPGuiSession("Session").SAPGuiWindow("Cumulated
          Time Evaluation_2").SAPGuiGrid("GridViewCtrl").GetCellData(i, "Time administrator")
    - step:
        id: '50'
        action: Script
        object_path: '''If Logistics file, only include specific leaders'
    - step:
        id: '51'
        action: Script
        object_path: If Instr(Parameter("filepath"),"Logistics") > 0 Then
    - step:
        id: '52'
        action: Script
        object_path: If timeAdmin = "Dilena A" or timeAdmin = "Docking B" or timeAdmin
          = "Caldicott P" or timeAdmin = "Turner P" or timeAdmin = "Souter G" or timeAdmin
          = "Lindner T" or timeAdmin = "Perrone A" or timeAdmin = "Durdin C" Then
    - step:
        id: '53'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '54'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '55'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = entitlement
    - step:
        id: '56'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = timeAdmin
    - step:
        id: '57'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: '''If Ops Planning file, don''t include Logistics leaders'
    - step:
        id: '60'
        action: Script
        object_path: ElseIf Instr(Parameter("filepath"),"Operations Planning") > 0
          Then
    - step:
        id: '61'
        action: Script
        object_path: If timeAdmin = "Dilena A" or timeAdmin = "Docking B" or timeAdmin
          = "Caldicott P" or timeAdmin = "Turner P" or timeAdmin = "Souter G" or timeAdmin
          = "Lindner T" or timeAdmin = "Perrone A" or timeAdmin = "Durdin C" Then
    - step:
        id: '62'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '63'
        action: Script
        object_path: Else
    - step:
        id: '64'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '65'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '66'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = entitlement
    - step:
        id: '67'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = timeAdmin
    - step:
        id: '68'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: Else
    - step:
        id: '71'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '72'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '73'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = entitlement
    - step:
        id: '74'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = timeAdmin
    - step:
        id: '75'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '76'
        action: Script
        object_path: End If
    - step:
        id: '77'
        action: Script
        object_path: Else
    - step:
        id: '78'
        action: Script
        object_path: Exit For
    - step:
        id: '79'
        action: Script
        object_path: End If
    - step:
        id: '80'
        action: Script
        object_path: Next
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation_2").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '82'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation_2").SAPGuiButton("Enter")
        action: Click
    - step:
        id: '83'
        action: Script
        object_path: Else
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '85'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cumulated Time Evaluation").SAPGuiButton("Enter   (Enter)")
        action: Click
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '88'
        action: Script
        object_path: '''SAVE AND CLOSE WORKBOOK'
    - step:
        id: '89'
        object_path: objWorkbook
        action: Save
    - step:
        id: '90'
        object_path: objWorkbook
        action: Close
    - step:
        id: '91'
        object_path: objExcel
        action: Quit
    - step:
        id: '92'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '93'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '94'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        snapshot: .\Snapshots\ssf101.png
        highlight_id: '0'
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
      last_update_time: Friday, 5 August 2022 8:19:48 AM
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
      last_update_time: Friday, 5 August 2022 8:19:48 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access
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
          last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Error messages
          properties:
          - property:
              value:
                value: PT_BAL00
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
                value: SAPLRPBS
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
          last_update_time: Friday, 5 August 2022 8:19:48 AM
          child_objects:
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Cumulated Time Evaluation_2
          properties:
          - property:
              value:
                value: PT_BAL00
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
          last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: wnd[0]/usr/cntlGRID1/shellcont/shell/shellcont[1]/shell
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Cumulated Time Evaluation
          properties:
          - property:
              value:
                value: PT_BAL00
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
                value: RPTBAL00
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
          last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Today
              properties:
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: PNPTIMR1
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiRadioButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '41'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/radPNPTIMR1
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Cumulated balances
              properties:
              - property:
                  value:
                    value: Cumulated balances
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SW_SAL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiRadioButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '41'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/radSW_SAL
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Layout
              properties:
              - property:
                  value:
                    value: VARIANT
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
                    value: wnd[0]/usr/ctxtVARIANT
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Cumulated balances
              properties:
              - property:
                  value:
                    value: SALDI-LOW
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
                    value: wnd[0]/usr/ctxtSALDI-LOW
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Org. structure
              properties:
              - property:
                  value:
                    value: PNPS$ORG
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
                    value: wnd[0]/usr/btnPNPS$ORG
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter   (Enter)
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Organizational
          properties:
          - property:
              value:
                value: PT_BAL00
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '400'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLRHWH
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Friday, 5 August 2022 8:19:48 AM
          child_objects:
          - object:
              class: SAPGuiTree
              name: TableTreeControl
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
                    value: SAPGuiTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '200'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/subSUB_SEARCH:SAPLRHWH:0300/cntlSEARCH_TREE/shellcont/shell
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Select subtree   (Shift+F1)
              properties:
              - property:
                  value:
                    value: btn[13]
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
                    value: wnd[1]/tbar[0]/btn[13]
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Cancel   (F12)
              properties:
              - property:
                  value:
                    value: btn[12]
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
                    value: wnd[1]/tbar[0]/btn[12]
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
              last_update_time: Friday, 5 August 2022 8:19:48 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
