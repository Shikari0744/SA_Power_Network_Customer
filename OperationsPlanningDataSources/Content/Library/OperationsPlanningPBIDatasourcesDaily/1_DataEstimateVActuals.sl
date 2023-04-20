namespace: OperationsPlanningPBIDatasourcesDaily
operation:
  name: 1_DataEstimateVActuals
  inputs:
  - sap_user: SVCOPSPLANBI
  - sap_pass: Pli0*k2au
  - location: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Operations Planning
      PBI Data Sources\
  - dataEvA: Data_Estimate v Actuals.xlsx
  sequential_action:
    gav: com.microfocus.seq:OperationsPlanningPBIDatasourcesDaily.1_DataEstimateVActuals:1.0.0
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
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '2'
        action: Script
        object_path: If objFSO.FolderExists("C:\Users\SVCRPABOT\AppData\Roaming\SAP
          AG")Then
    - step:
        id: '3'
        object_path: objFSO
        action: DeleteFolder("C:\Users\SVCRPABOT\AppData\Roaming\SAP
        args: AG")
    - step:
        id: '4'
        action: Script
        object_path: End If
    - step:
        id: '5'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '6'
        object_path: '''SystemUtil'
        action: Run
        args: '"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SAP Business
          Intelligence\SAP BusinessObjects Analysis\Analysis for Microsoft Excel.lnk"'
    - step:
        id: '7'
        action: Script
        object_path: '''file = Parameter("location")&Parameter("dataEvA")'
    - step:
        id: '8'
        object_path: '''Window("Excel_2").WinObject("Ribbon").WinButton("File Tab")'
        action: Click
    - step:
        id: '9'
        object_path: '''Window("Excel_2").WinObject("WinObject").WinList("File")'
        action: Select
        args: '"Open"'
    - step:
        id: '10'
        object_path: '''Window("Excel_2").WinObject("WinObject").WinButton("Browse")'
        action: Click
    - step:
        id: '11'
        object_path: '''Window("Excel_2").Dialog("Open").WinEdit("File name:")'
        action: Set
        args: '"C:\Users\svcrpabot\OneDrive - SA Power Networks\Operations Planning
          PBI Data Sources\Data_Estimate v Actuals.xlsx"'
    - step:
        id: '12'
        object_path: '''Window("Excel_2").Dialog("Open").WinEdit("File name:")'
        action: Type
        args: micReturn
    - step:
        id: '13'
        args: '"10"'
        object_path: '''Wait 10'
        action: Script
    - step:
        id: '14'
        object_path: '''SystemUtil'
        action: CloseProcessByWndTitle
        args: '"Book1 - Excel"'
    - step:
        id: '15'
        action: Script
        object_path: file = Parameter("location") & Parameter("dataEvA")
    - step:
        id: '16'
        action: Script
        object_path: username = Parameter("sap_user")
    - step:
        id: '17'
        action: Script
        object_path: password = Parameter("sap_pass")
    - step:
        id: '18'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '19'
        object_path: SystemUtil
        action: Run
        args: file
    - step:
        id: '20'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '21'
        action: Script
        object_path: While Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs").Exist(3)
          = false
    - step:
        id: '22'
        action: Script
        object_path: Wend
    - step:
        id: '23'
        action: Script
        object_path: If WpfWindow("Error").Exist(3) Then
    - step:
        id: '24'
        object_path: WpfWindow("Error").WpfButton("Close")
        action: Click
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: Set excel = GetObject(,"excel.application")
    - step:
        id: '27'
        object_path: excel
        action: DisplayAlerts
        args: = False
    - step:
        id: '28'
        object_path: excel
        action: AskToUpdateLinks
        args: = False
    - step:
        id: '29'
        action: Script
        object_path: Set workbook = excel.ActiveWorkbook
    - step:
        id: '30'
        action: Script
        object_path: Set sheet = workbook.worksheets("Summary")
    - step:
        id: '31'
        action: Script
        object_path: Set update = workbook.worksheets("Update")
    - step:
        id: '32'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '33'
        action: Script
        object_path: originalUpdate = update.cells(2,2).value
    - step:
        id: '34'
        action: Script
        object_path: Parameter("originalUpdate") = originalUpdate
    - step:
        id: '35'
        action: Script
        object_path: '''*********************'
    - step:
        id: '36'
        object_path: Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs")
        action: Highlight
    - step:
        id: '37'
        object_path: Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs")
        action: Select
        args: '"Analysis"'
    - step:
        id: '38'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '39'
        object_path: Window("Excel").WinObject("Ribbon").WinButton("Prompts")
        action: Highlight
    - step:
        id: '40'
        object_path: Window("Excel").WinObject("Ribbon").WinButton("Prompts")
        action: Click
    - step:
        id: '41'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '42'
        object_path: Window("Excel").Window("Production").WinObject("User")
        action: Highlight
    - step:
        id: '43'
        object_path: Window("Excel").Window("Production").WinObject("User")
        action: Click
        args: 19,0
    - step:
        id: '44'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '45'
        object_path: mySendKeys
        action: SendKeys
        args: '"^(a)"'
    - step:
        id: '46'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '47'
        object_path: Window("Excel").Window("Production").WinObject("User")
        action: Type
        args: username
    - step:
        id: '48'
        object_path: Window("Excel").Window("Production").WinObject("Password")
        action: Click
        args: 17,1
    - step:
        id: '49'
        object_path: Window("Excel").Window("Production").WinObject("Password")
        action: Type
        args: password
    - step:
        id: '50'
        object_path: Window("Excel").Window("Production").WinObject("Language")
        action: Click
        args: 17,10
    - step:
        id: '51'
        object_path: Window("Excel").Window("Production").WinObject("Language")
        action: Type
        args: '"EN"'
    - step:
        id: '52'
        object_path: Window("Excel").Window("Production").WinObject("OK")
        action: Click
        args: 38,10
    - step:
        id: '53'
        action: Script
        object_path: waiting = 0
    - step:
        id: '54'
        action: Script
        object_path: Do While WpfWindow("Insecure Connection to").Exist = False
    - step:
        id: '55'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '56'
        action: Script
        object_path: waiting = waiting + 1
    - step:
        id: '57'
        action: Script
        object_path: If waiting = 10 or WpfWindow("Prompts").WpfList("VariableSummaryList").Exist
          Then
    - step:
        id: '58'
        action: Script
        object_path: Exit Do
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: Loop
    - step:
        id: '61'
        action: Script
        object_path: If WpfWindow("Insecure Connection to").Exist(3) Then
    - step:
        id: '62'
        object_path: WpfWindow("Insecure Connection to").WpfButton("Continue")
        action: Click
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: waiting = 0
    - step:
        id: '65'
        action: Script
        object_path: Do While WpfWindow("Prompts").WpfList("VariableSummaryList").Exist
          = False
    - step:
        id: '66'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '67'
        action: Script
        object_path: waiting = waiting + 1
    - step:
        id: '68'
        action: Script
        object_path: If waiting = 10 Then
    - step:
        id: '69'
        action: Script
        object_path: Exit Do
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        action: Script
        object_path: Loop
    - step:
        id: '72'
        action: Script
        object_path: If WpfWindow("Prompts").WpfList("VariableSummaryList").Exist(3)
          Then
    - step:
        id: '73'
        object_path: WpfWindow("Prompts").WpfComboBox("ActionComboBox")
        action: Select
        args: '1'
    - step:
        id: '74'
        object_path: WpfWindow("Prompts").WpfButton("OK")
        action: Click
    - step:
        id: '75'
        action: Wait
        args: '"180"'
        default_args: '"1"'
    - step:
        id: '76'
        action: Script
        object_path: updated = update.cells(2,2).value
    - step:
        id: '77'
        action: Script
        object_path: Parameter("updated") = updated
    - step:
        id: '78'
        action: Script
        object_path: '''SAVE AND CLOSE REPORT'
    - step:
        id: '79'
        object_path: workbook
        action: save
    - step:
        id: '80'
        object_path: workbook
        action: close
    - step:
        id: '81'
        object_path: excel
        action: Quit
    - step:
        id: '82'
        action: Script
        object_path: Set excel = Nothing
    - step:
        id: '83'
        action: Script
        object_path: Set workbook = Nothing
    - step:
        id: '84'
        action: Script
        object_path: Set sheet = Nothing
    - step:
        id: '85'
        action: Script
        object_path: Set update = Nothing
    - step:
        id: '86'
        action: Script
        object_path: If originalUpdate = updated Then
    - step:
        id: '87'
        action: Script
        object_path: Parameter("reason") = "Original update date and new update date
          are the same"
    - step:
        id: '88'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Report did not successfully update" , "Original update date
          and new update date are the same"
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        action: Script
        object_path: Else
    - step:
        id: '91'
        action: Script
        object_path: '''SAVE AND CLOSE REPORT'
    - step:
        id: '92'
        object_path: workbook
        action: save
    - step:
        id: '93'
        object_path: workbook
        action: close
    - step:
        id: '94'
        object_path: excel
        action: Quit
    - step:
        id: '95'
        action: Script
        object_path: Set excel = Nothing
    - step:
        id: '96'
        action: Script
        object_path: Set workbook = Nothing
    - step:
        id: '97'
        action: Script
        object_path: Set sheet = Nothing
    - step:
        id: '98'
        action: Script
        object_path: Set update = Nothing
    - step:
        id: '99'
        action: Script
        object_path: Parameter("updated") = "not updated"
    - step:
        id: '100'
        action: Script
        object_path: Parameter("reason") = "Data Estimate v Actuals not updated"
    - step:
        id: '101'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Data Estimate v Actuals not updated" , "Data Estimate v Actuals
          not updated"
    - step:
        id: '102'
        action: Script
        object_path: ExitTest
    - step:
        id: '103'
        action: Script
        object_path: End If
  outputs:
  - updated:
      robot: true
      value: ${updated}
  - originalUpdate:
      robot: true
      value: ${originalUpdate}
  - reason:
      robot: true
      value: ${reason}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: WpfWindow
      name: Prompts
      properties:
      - property:
          value:
            value: window
            regular_expression: false
          name: wpftypename
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Prompts
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: PromptsDialogWindow
            regular_expression: false
          name: devname
          hidden: false
          read_only: false
          type: STRING
      basic_identification:
        property_ref:
        - wpftypename
        - regexpwndtitle
        - devname
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 17 January 2023 9:26:32 AM
      child_objects:
      - object:
          class: WpfList
          name: VariableSummaryList
          properties:
          - property:
              value:
                value: VariableSummaryList
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfEdit
          name: StartValue_Calendar
          properties:
          - property:
              value:
                value: edit
                regular_expression: false
              name: wpftypename
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Prompts
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: StartValue;VarIntervalControl;MS.Internal.Data.CollectionViewGroupInternal;VariableItemsScroll;PromptsDialogWindow;
                regular_expression: false
              name: devnamepath
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: StartValue
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - wpftypename
            - regexpwndtitle
            - devnamepath
            - devname
            ordinal_identifier:
              value: 1
              type: index
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfEdit
          name: StartValue
          properties:
          - property:
              value:
                value: edit
                regular_expression: false
              name: wpftypename
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Prompts
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: StartValue;VarIntervalControl;MS.Internal.Data.CollectionViewGroupInternal;VariableItemsScroll;PromptsDialogWindow;
                regular_expression: false
              name: devnamepath
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: StartValue
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - wpftypename
            - regexpwndtitle
            - devnamepath
            - devname
            ordinal_identifier:
              value: 0
              type: index
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfEdit
          name: EndValue_Calendar
          properties:
          - property:
              value:
                value: edit
                regular_expression: false
              name: wpftypename
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Prompts
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: EndValue;VarIntervalControl;MS.Internal.Data.CollectionViewGroupInternal;VariableItemsScroll;PromptsDialogWindow;
                regular_expression: false
              name: devnamepath
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: EndValue
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - wpftypename
            - regexpwndtitle
            - devnamepath
            - devname
            ordinal_identifier:
              value: 1
              type: index
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfEdit
          name: EndValue
          properties:
          - property:
              value:
                value: edit
                regular_expression: false
              name: wpftypename
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Prompts
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: EndValue;VarIntervalControl;MS.Internal.Data.CollectionViewGroupInternal;VariableItemsScroll;PromptsDialogWindow;
                regular_expression: false
              name: devnamepath
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: EndValue
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - wpftypename
            - regexpwndtitle
            - devnamepath
            - devname
            ordinal_identifier:
              value: 0
              type: index
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfComboBox
          name: ActionComboBox
          properties:
          - property:
              value:
                value: SelectionPatternIdentifiers.Pattern;ScrollPatternIdentifiers.Pattern;ExpandCollapsePatternIdentifiers.Pattern;ItemContainerPatternIdentifiers.Pattern;SynchronizedInputPatternIdentifiers.Pattern
                regular_expression: false
              name: supported automation patterns
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ComboBox
                regular_expression: false
              name: localized control type
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ActionComboBox
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
      - object:
          class: WpfButton
          name: OK
          properties:
          - property:
              value:
                value: OK
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: OkButton
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - text
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
  - object:
      class: WpfWindow
      name: Insecure Connection to
      properties:
      - property:
          value:
            value: window
            regular_expression: false
          name: wpftypename
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: TransformPatternIdentifiers.Pattern;WindowPatternIdentifiers.Pattern
            regular_expression: false
          name: supported automation patterns
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: 'Insecure Connection to System: BW - ES0 - Production'
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Window
            regular_expression: false
          name: localized control type
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: 'Insecure Connection to System: BW - ES0 - Production'
            regular_expression: false
          name: devname
          hidden: false
          read_only: false
          type: STRING
      basic_identification:
        property_ref:
        - wpftypename
        - regexpwndtitle
        - devname
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 17 January 2023 9:26:32 AM
      child_objects:
      - object:
          class: WpfButton
          name: Continue
          properties:
          - property:
              value:
                value: Continue
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: InvokePatternIdentifiers.Pattern;SynchronizedInputPatternIdentifiers.Pattern
                regular_expression: false
              name: supported automation patterns
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Button
                regular_expression: false
              name: localized control type
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Continue
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - text
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
  - object:
      class: WpfWindow
      name: Error
      properties:
      - property:
          value:
            value: window
            regular_expression: false
          name: wpftypename
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Error
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Error
            regular_expression: false
          name: devname
          hidden: false
          read_only: false
          type: STRING
      basic_identification:
        property_ref:
        - wpftypename
        - regexpwndtitle
        - devname
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 17 January 2023 9:26:32 AM
      child_objects:
      - object:
          class: WpfButton
          name: Close
          properties:
          - property:
              value:
                value: Close
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Close
                regular_expression: false
              name: devname
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - text
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects: []
  - object:
      class: Window
      name: Excel_2
      properties:
      - property:
          value:
            value: Excel
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: XLMAIN
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
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 17 January 2023 9:26:32 AM
      child_objects:
      - object:
          class: WinObject
          name: WinObject
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
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
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinList
              name: File
              properties:
              - property:
                  value:
                    value: list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinButton
              name: Browse
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Browse
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
      - object:
          class: WinObject
          name: Ribbon
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Ribbon
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinButton
              name: File Tab
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File Tab
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
      - object:
          class: Dialog
          name: Open
          properties:
          - property:
              value:
                value: Open
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
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
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File &name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
  - object:
      class: Window
      name: Excel
      properties:
      - property:
          value:
            value: Excel
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: XLMAIN
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
      - property:
          value:
            value: ''
            regular_expression: false
          name: index
          hidden: false
          read_only: false
          type: STRING
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Tuesday, 17 January 2023 9:26:32 AM
      child_objects:
      - object:
          class: WinObject
          name: Ribbon
          properties:
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: visible
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Ribbon
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - visible
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations:
            visual_relation: []
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinTab
              name: Ribbon Tabs
              properties:
              - property:
                  value:
                    value: page tab list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Ribbon Tabs
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: page tab list
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinButton
              name: Prompts
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: split button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Prompts
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: split button
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinButton
              name: File Tab
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File Tab
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
      - object:
          class: Window
          name: Quality Assurance
          properties:
          - property:
              value:
                value: .*Quality Assurance.*
                regular_expression: true
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: WindowsForms10.Window.8.app.0.134c08f_r83_ad2
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
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
            - regexpwndtitle
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: WindowsForms10.Window.8.app.0.134c08f_r83_ad2
              name: simclass
              type: STRING
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinObject
              name: User
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                - regexpwndclass
                ordinal_identifier:
                  value: 1
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Password
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 2
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: OK
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Language
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: EN
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 3
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Client
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 0
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Cancel
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
      - object:
          class: Window
          name: Production
          properties:
          - property:
              value:
                value: .*Production.*
                regular_expression: true
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: WindowsForms10.Window.8.app.0.134c08f_r83_ad2
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
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
            - regexpwndtitle
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: WindowsForms10.Window.8.app.0.134c08f_r83_ad2
              name: simclass
              type: STRING
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Tuesday, 17 January 2023 9:26:32 AM
          child_objects:
          - object:
              class: WinObject
              name: User
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                - regexpwndclass
                ordinal_identifier:
                  value: 1
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Password
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 2
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: OK
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Language
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: EN
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 3
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Client
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.[a-zA-Z0-9]+_r[0-9]+_ad2
                    regular_expression: true
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: object class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - regexpwndclass
                ordinal_identifier:
                  value: 0
                  type: location
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.EDIT.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
          - object:
              class: WinObject
              name: Cancel
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - visible
                - text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: WindowsForms10.BUTTON.app.0.134c08f_r83_ad2
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Tuesday, 17 January 2023 9:26:32 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
