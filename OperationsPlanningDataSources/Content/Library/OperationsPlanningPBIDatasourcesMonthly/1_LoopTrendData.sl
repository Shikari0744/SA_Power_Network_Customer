namespace: OperationsPlanningPBIDatasourcesMonthly
operation:
  name: 1_LoopTrendData
  inputs:
  - sap_user: SVCOPSPLANBI
  - sap_pass: Pli0*k2au
  - location: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Operations Planning
      PBI Data Sources\
  - looptrend: Loop_Trend_data.xlsx
  sequential_action:
    gav: com.microfocus.seq:OperationsPlanningPBIDatasourcesMonthly.1_LoopTrendData:1.0.0
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
        object_path: "'1\tExecute query on AFO tab"
    - step:
        id: '2'
        action: Script
        object_path: "'2\tPopulate column \"A\" with 1st of the month. Eg if downloading\
          \ January 2022 data, populate with 1/1/2022"
    - step:
        id: '3'
        action: Script
        object_path: "'3\tCopy formulas in columns AB to AF to end of new list"
    - step:
        id: '4'
        action: Script
        object_path: "'4\tFind \"Refurb_Unp\" and replace with \"Refurb_Unplan\""
    - step:
        id: '5'
        action: Script
        object_path: "'5\tFilter Start Month and Year for the month in question. Eg\
          \ if extracting January 2022 data, filter for month 01 and year 2022"
    - step:
        id: '6'
        action: Script
        object_path: "'6\tCopy filtered data into \"Data\" tab (paste values)"
    - step:
        id: '7'
        action: Script
        object_path: "'7\tSave Trend workbook"
    - step:
        id: '8'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '9'
        action: Script
        object_path: If objFSO.FolderExists("C:\Users\SVCRPABOT\AppData\Roaming\SAP
          AG")Then
    - step:
        id: '10'
        object_path: objFSO
        action: DeleteFolder("C:\Users\SVCRPABOT\AppData\Roaming\SAP
        args: AG")
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '13'
        action: Script
        object_path: username = Parameter("sap_user")
    - step:
        id: '14'
        action: Script
        object_path: password = Parameter("sap_pass")
    - step:
        id: '15'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '16'
        action: Script
        object_path: file = Parameter("location")&Parameter("looptrend")
    - step:
        id: '17'
        object_path: SystemUtil
        action: Run
        args: file
    - step:
        id: '18'
        action: Script
        object_path: While Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs").Exist(3)
          = false
    - step:
        id: '19'
        action: Script
        object_path: Wend
    - step:
        id: '20'
        action: Script
        object_path: If WpfWindow("Error").Exist(3) Then
    - step:
        id: '21'
        object_path: WpfWindow("Error").WpfButton("Close")
        action: Click
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: Set excel = GetObject(,"excel.application")
    - step:
        id: '24'
        object_path: excel
        action: DisplayAlerts
        args: = False
    - step:
        id: '25'
        object_path: excel
        action: AskToUpdateLinks
        args: = False
    - step:
        id: '26'
        action: Script
        object_path: Set workbook = excel.ActiveWorkbook
    - step:
        id: '27'
        action: Script
        object_path: Set afoSheet = workbook.Worksheets("AFO")
    - step:
        id: '28'
        action: Script
        object_path: Set dataSheet = workbook.Worksheets("Data")
    - step:
        id: '29'
        action: Script
        object_path: Set update = workbook.worksheets("Update")
    - step:
        id: '30'
        action: Script
        object_path: '''GET ROW COUNTS FOR AFO'
    - step:
        id: '31'
        action: Script
        object_path: currentAFORow = afoSheet.usedrange.Rows.Count + 1
    - step:
        id: '32'
        action: Script
        object_path: "'1\tExecute query on AFO tab"
    - step:
        id: '33'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '34'
        action: Script
        object_path: '''''*********************'
    - step:
        id: '35'
        object_path: Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs")
        action: Select
        args: '"Analysis"'
    - step:
        id: '36'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '37'
        object_path: Window("Excel").WinObject("Ribbon").WinButton("Prompts")
        action: Click
    - step:
        id: '38'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '39'
        object_path: Window("Excel").Window("Production").WinObject("User")
        action: Click
        args: 19,0
    - step:
        id: '40'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '41'
        object_path: mySendKeys
        action: SendKeys
        args: '"^(a)"'
    - step:
        id: '42'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '43'
        object_path: Window("Excel").Window("Production").WinObject("User")
        action: Type
        args: username
    - step:
        id: '44'
        object_path: Window("Excel").Window("Production").WinObject("Password")
        action: Click
        args: 17,1
    - step:
        id: '45'
        object_path: Window("Excel").Window("Production").WinObject("Password")
        action: Type
        args: password
    - step:
        id: '46'
        object_path: Window("Excel").Window("Production").WinObject("Language")
        action: Click
        args: 17,10
    - step:
        id: '47'
        object_path: Window("Excel").Window("Production").WinObject("Language")
        action: Type
        args: '"EN"'
    - step:
        id: '48'
        object_path: Window("Excel").Window("Production").WinObject("OK")
        action: Click
        args: 38,10
    - step:
        id: '49'
        action: Script
        object_path: waiting = 0
    - step:
        id: '50'
        action: Script
        object_path: Do While WpfWindow("Insecure Connection to").Exist = False
    - step:
        id: '51'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '52'
        action: Script
        object_path: waiting = waiting + 1
    - step:
        id: '53'
        action: Script
        object_path: If waiting > 100 Then
    - step:
        id: '54'
        action: Script
        object_path: Exit Do
    - step:
        id: '55'
        action: Script
        object_path: End If
    - step:
        id: '56'
        action: Script
        object_path: Loop
    - step:
        id: '57'
        action: Script
        object_path: If WpfWindow("Insecure Connection to").Exist(3) Then
    - step:
        id: '58'
        object_path: WpfWindow("Insecure Connection to").WpfButton("Continue")
        action: Click
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: waiting = 0
    - step:
        id: '61'
        action: Script
        object_path: Do While WpfWindow("Prompts").WpfList("VariableSummaryList").Exist
          = False
    - step:
        id: '62'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '63'
        action: Script
        object_path: waiting = waiting + 1
    - step:
        id: '64'
        action: Script
        object_path: If waiting > 100 Then
    - step:
        id: '65'
        action: Script
        object_path: Exit Do
    - step:
        id: '66'
        action: Script
        object_path: End If
    - step:
        id: '67'
        action: Script
        object_path: Loop
    - step:
        id: '68'
        action: Script
        object_path: If WpfWindow("Prompts").WpfList("VariableSummaryList").Exist(0)
          Then
    - step:
        id: '69'
        object_path: WpfWindow("Prompts").WpfComboBox("ActionComboBox")
        action: Select
        args: '1'
    - step:
        id: '70'
        object_path: WpfWindow("Prompts").WpfEdit("StartValue")
        action: Set
        args: '"01.01.2010"'
    - step:
        id: '71'
        object_path: WpfWindow("Prompts").WpfEdit("EndValue")
        action: Set
        args: '"31.12.2050"'
    - step:
        id: '72'
        object_path: WpfWindow("Prompts").WpfButton("OK")
        action: Click
    - step:
        id: '73'
        action: Wait
        args: '"300"'
        default_args: '"1"'
    - step:
        id: '74'
        action: Script
        object_path: '''get row count again after query has been run'
    - step:
        id: '75'
        action: Script
        object_path: newAFORow = afoSheet.usedrange.Rows.Count
    - step:
        id: '76'
        action: Script
        object_path: '''GET ROW COUNT FOR DATA'
    - step:
        id: '77'
        action: Script
        object_path: dataRowCount = dataSheet.usedrange.Rows.Count + 1
    - step:
        id: '78'
        action: Script
        object_path: "'2\tPopulate column \"A\" with 1st of the month. Eg if downloading\
          \ January 2022 data, populate with 1/1/2022"
    - step:
        id: '79'
        action: Script
        object_path: "'3\tCopy formulas in columns AB to AF to end of new list"
    - step:
        id: '80'
        action: Script
        object_path: "'4\tFind \"Refurb_Unp\" and replace with \"Refurb_Unplan\""
    - step:
        id: '81'
        action: Script
        object_path: "'5\tFilter Start Month and Year for the current month. Eg if\
          \ extracting January 2022 data, filter for month 01 and year 2022"
    - step:
        id: '82'
        action: Script
        object_path: "'6\tCopy filtered data into \"Data\" tab (paste values)"
    - step:
        id: '83'
        action: Script
        object_path: currentMonth = Month( Date())
    - step:
        id: '84'
        action: Script
        object_path: currentYear = Cstr(Year( Date()))
    - step:
        id: '85'
        action: Script
        object_path: If len(currentMonth) = 1 Then
    - step:
        id: '86'
        action: Script
        object_path: currentMonth = "0"&currentMonth
    - step:
        id: '87'
        action: Script
        object_path: End If
    - step:
        id: '88'
        action: Script
        object_path: newDate = currentMonth&"/01/"& currentYear
    - step:
        id: '89'
        action: Script
        object_path: processMonth = Month(Date())
    - step:
        id: '90'
        action: Script
        object_path: If len(processMonth) = 1Then
    - step:
        id: '91'
        action: Script
        object_path: processMonth = "0"&CStr(processMonth)
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: processYear = Year(Date())
    - step:
        id: '94'
        action: Script
        object_path: o = dataRowCount
    - step:
        id: '95'
        action: Script
        object_path: For i = 2  To newAFORow
    - step:
        id: '96'
        object_path: afoSheet.cells(i,1)
        action: value
        args: = newDate
    - step:
        id: '97'
        object_path: afoSheet.cells(i,28)
        action: value
        args: =  "=INDEX(Wkctr!A:A,MATCH(B"&i&",Wkctr!B:B,0))"
    - step:
        id: '98'
        object_path: afoSheet.cells(i,29)
        action: value
        args: =  "=COUNTIFS(D:D,D"&i&",B:B,B"&i&",N:N,N"&i&")"
    - step:
        id: '99'
        object_path: afoSheet.cells(i,30)
        action: value
        args: =  "=SUMIFS(AA:AA,D:D,D"&i&",B:B,B"&i&",N:N,N"&i&")"
    - step:
        id: '100'
        object_path: afoSheet.cells(i,31)
        action: value
        args: =  "=IFERROR(Z"&i&"/AD"&i&",0)"
    - step:
        id: '101'
        object_path: afoSheet.cells(i,32)
        action: value
        args: =  "=AE"&i&"*AA"&i
    - step:
        id: '102'
        action: Script
        object_path: budgetCategory = afoSheet.cells(i,3).value
    - step:
        id: '103'
        action: Script
        object_path: If budgetCategory = "REFURB_UNP" or budgetCategory = "Refurb_Unp"
          Then
    - step:
        id: '104'
        action: Script
        object_path: budgetCategory = Replace(budgetCategory,"REFURB_UNP", "REFURB_UNPLAN")
    - step:
        id: '105'
        action: Script
        object_path: budgetCategory = Replace(budgetCategory,"Refurb_Unp", "REFURB_UNPLAN")
    - step:
        id: '106'
        object_path: afoSheet.cells(i,3)
        action: value
        args: = budgetCategory
    - step:
        id: '107'
        action: Script
        object_path: End If
    - step:
        id: '108'
        action: Script
        object_path: operationMonth = afoSheet.cells(i,10).value
    - step:
        id: '109'
        action: Script
        object_path: operationYear = afoSheet.cells(i,11).value
    - step:
        id: '110'
        action: Script
        object_path: If operationMonth = CStr(currentMonth) and operationYear = CStr(currentYear)
          Then
    - step:
        id: '111'
        object_path: afoSheet.Rows(i).Copy dataSheet
        action: Rows(o)
    - step:
        id: '112'
        action: Script
        object_path: o = o + 1
    - step:
        id: '113'
        action: Script
        object_path: End If
    - step:
        id: '114'
        action: Script
        object_path: Next
    - step:
        id: '115'
        action: Script
        object_path: "'3\tCopy formulas in columns AB to AF to end of new list"
    - step:
        id: '116'
        action: Script
        object_path: "'\tFor i = currentAFORow  To newAFORow"
    - step:
        id: '117'
        action: Script
        object_path: "'\t\tafoSheet.cells(i,28).value =  \"=INDEX(Wkctr!A:A,MATCH(B\"\
          &i&\",Wkctr!B:B,0))\""
    - step:
        id: '118'
        action: Script
        object_path: "'\t\tafoSheet.cells(i,29).value =  \"=COUNTIFS(D:D,D\"&i&\"\
          ,B:B,B\"&i&\",N:N,N\"&i&\")\""
    - step:
        id: '119'
        action: Script
        object_path: "'\t\tafoSheet.cells(i,30).value =  \"=SUMIFS(AA:AA,D:D,D\"&i&\"\
          ,B:B,B\"&i&\",N:N,N\"&i&\")\""
    - step:
        id: '120'
        action: Script
        object_path: "'\t\tafoSheet.cells(i,31).value =  \"=IFERROR(Z\"&i&\"/AD\"\
          &i&\",0)\""
    - step:
        id: '121'
        action: Script
        object_path: "'\t\tafoSheet.cells(i,32).value =  \"=AE\"&i&\"*AA\"&i"
    - step:
        id: '122'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '123'
        action: Script
        object_path: "'4\tFind \"Refurb_Unp\" and replace with \"Refurb_Unplan\""
    - step:
        id: '124'
        action: Script
        object_path: "'\tFor i = currentAFORow  To newAFORow"
    - step:
        id: '125'
        action: Script
        object_path: "'\t\tbudgetCategory = afoSheet.cells(i,3).value"
    - step:
        id: '126'
        action: Script
        object_path: "'\t\tIf budgetCategory = \"REFURB_UNP\" or budgetCategory =\
          \ \"Refurb_Unp\" Then"
    - step:
        id: '127'
        action: Script
        object_path: "'\t\t\tbudgetCategory = Replace(budgetCategory,\"REFURB_UNP\"\
          , \"REFURB_UNPLAN\")"
    - step:
        id: '128'
        action: Script
        object_path: "'\t\t\tbudgetCategory = Replace(budgetCategory,\"Refurb_Unp\"\
          , \"REFURB_UNPLAN\")"
    - step:
        id: '129'
        action: Script
        object_path: "'\t\t\tafoSheet.cells(i,3).value = budgetCategory"
    - step:
        id: '130'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '131'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '132'
        action: Script
        object_path: "'5\tFilter Start Month and Year for the current month. Eg if\
          \ extracting January 2022 data, filter for month 01 and year 2022"
    - step:
        id: '133'
        action: Script
        object_path: "'6\tCopy filtered data into \"Data\" tab (paste values)"
    - step:
        id: '134'
        action: Script
        object_path: "'\tprocessMonth = Month(Date())"
    - step:
        id: '135'
        action: Script
        object_path: "'\tIf len(processMonth) = 1Then"
    - step:
        id: '136'
        action: Script
        object_path: "'\t\tprocessMonth = \"0\"&CStr(processMonth)"
    - step:
        id: '137'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '138'
        action: Script
        object_path: "'\tprocessYear = Year(Date())"
    - step:
        id: '139'
        action: Script
        object_path: "'\to = dataRowCount"
    - step:
        id: '140'
        action: Script
        object_path: "'\tFor i = 2  To newAFORow"
    - step:
        id: '141'
        action: Script
        object_path: "'\t\toperationMonth = afoSheet.cells(i,10).value"
    - step:
        id: '142'
        action: Script
        object_path: "'\t\toperationYear = afoSheet.cells(i,11).value"
    - step:
        id: '143'
        action: Script
        object_path: "'\t\tIf operationMonth = CStr(currentMonth) and operationYear\
          \ = CStr(currentYear) Then"
    - step:
        id: '144'
        action: Script
        object_path: "'\t\t\tafoSheet.Rows(i).Copy dataSheet.Rows(o)"
    - step:
        id: '145'
        action: Script
        object_path: "'\t\t\to = o + 1"
    - step:
        id: '146'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '147'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '148'
        action: Script
        object_path: updated = update.cells(1,2).value
    - step:
        id: '149'
        action: Script
        object_path: '''SAVE AND CLOSE REPORT'
    - step:
        id: '150'
        object_path: workbook
        action: save
    - step:
        id: '151'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '152'
        object_path: workbook
        action: close
    - step:
        id: '153'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '154'
        object_path: excel
        action: Quit
    - step:
        id: '155'
        action: Script
        object_path: Set excel = Nothing
    - step:
        id: '156'
        action: Script
        object_path: Set workbook = Nothing
    - step:
        id: '157'
        action: Script
        object_path: Set afoSheet = Nothing
    - step:
        id: '158'
        action: Script
        object_path: Set dataSheet = Nothing
    - step:
        id: '159'
        action: Script
        object_path: Set update = Nothing
    - step:
        id: '160'
        action: Script
        object_path: Parameter("output") = updated
    - step:
        id: '161'
        action: Script
        object_path: Else
    - step:
        id: '162'
        action: Script
        object_path: '''SAVE AND CLOSE REPORT'
    - step:
        id: '163'
        object_path: workbook
        action: save
    - step:
        id: '164'
        object_path: workbook
        action: close
    - step:
        id: '165'
        object_path: excel
        action: Quit
    - step:
        id: '166'
        action: Script
        object_path: Set excel = Nothing
    - step:
        id: '167'
        action: Script
        object_path: Set workbook = Nothing
    - step:
        id: '168'
        action: Script
        object_path: Set afoSheet = Nothing
    - step:
        id: '169'
        action: Script
        object_path: Set dataSheet = Nothing
    - step:
        id: '170'
        action: Script
        object_path: Set update = Nothing
    - step:
        id: '171'
        action: Script
        object_path: 'Parameter("output") = "Loop Trend: unsuccessful"'
    - step:
        id: '172'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Loop Trend not updated" , "Loop Trend not updated"
    - step:
        id: '173'
        action: Script
        object_path: ExitTest
    - step:
        id: '174'
        action: Script
        object_path: End If
  outputs:
  - output:
      robot: true
      value: ${output}
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
      last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
          child_objects: []
      - object:
          class: WpfEdit
          name: StartValue
          properties:
          - property:
              value:
                value: RangeValuePatternIdentifiers.Pattern;ValuePatternIdentifiers.Pattern;ScrollPatternIdentifiers.Pattern;TextPatternIdentifiers.Pattern;SynchronizedInputPatternIdentifiers.Pattern
                regular_expression: false
              name: supported automation patterns
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Edit
                regular_expression: false
              name: localized control type
              hidden: true
              read_only: true
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
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
          child_objects: []
      - object:
          class: WpfEdit
          name: EndValue
          properties:
          - property:
              value:
                value: RangeValuePatternIdentifiers.Pattern;ValuePatternIdentifiers.Pattern;ScrollPatternIdentifiers.Pattern;TextPatternIdentifiers.Pattern;SynchronizedInputPatternIdentifiers.Pattern
                regular_expression: false
              name: supported automation patterns
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Edit
                regular_expression: false
              name: localized control type
              hidden: true
              read_only: true
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
            - devname
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ''
              name: typeinfo
              type: STRING
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
      last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
      last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
      last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
          last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
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
              last_update_time: Wednesday, 22 March 2023 3:32:26 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
