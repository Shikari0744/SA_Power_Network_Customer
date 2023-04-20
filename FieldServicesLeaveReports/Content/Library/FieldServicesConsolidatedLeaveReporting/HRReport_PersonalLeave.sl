namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: HRReport_PersonalLeave
  inputs:
  - orgStructureValue
  - filepath
  - orgStructureSelection
  sequential_action:
    gav: com.microfocus.seq:FieldServicesConsolidatedLeaveReporting.HRReport_PersonalLeave:1.0.0
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
        object_path: '''PERSONAL LEAVE EXTRACTION'
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
        object_path: Set objWorksheet = objWorkbook.Worksheets("Personal Leave")
    - step:
        id: '10'
        action: Script
        object_path: '''GET ROW COUNT'
    - step:
        id: '11'
        action: Script
        object_path: excelRow = objWorksheet.usedrange.Rows.Count + 1
    - step:
        id: '12'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '13'
        action: Script
        object_path: orgStructureValue = Parameter("orgStructureValue")
    - step:
        id: '14'
        action: Script
        object_path: orgStructValue = Split(orgStructureValue,"/")
    - step:
        id: '15'
        action: Script
        object_path: '''EXTRACT PERSONAL LEAVE BALANCES AND ADD TO EXCEL'
    - step:
        id: '16'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n/SPIN/ER"'
    - step:
        id: '17'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: '"Draft Reports;End Of Month Reporting;Field Serv PL All Types Report
          inc hours"'
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")
        action: Select
        args: '"Report Data Period"'
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Period")
        action: Click
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiRadioButton("Current
          year")
        action: Set
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")
        action: Select
        args: '"Select Employees"'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl")
        action: SetCellData
        args: 2,"Value","0004"
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: 5,"#4"
    - step:
        id: '25'
        action: Script
        object_path: For x = 1 To Ubound(orgStructValue) + 1
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Additional Selection").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: x,"Single value",orgStructValue(x-1)
    - step:
        id: '27'
        action: Script
        object_path: Next
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Additional Selection").SAPGuiButton("Copy   (F8)")
        action: Click
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")
        action: Select
        args: '"Run the Report"'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Execute
          Report in Foreground")
        action: Click
    - step:
        id: '31'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").Exist(3)
          Then
    - step:
        id: '32'
        action: Script
        object_path: sapRow =  SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '33'
        action: Script
        object_path: For i = 1 To sapRow
    - step:
        id: '34'
        action: Script
        object_path: costCentre = SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Cost
          Center")
    - step:
        id: '35'
        action: Script
        object_path: If costCentre <> "" Then
    - step:
        id: '36'
        action: Script
        object_path: employeeNo = SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Employee
          No.")
    - step:
        id: '37'
        action: Script
        object_path: lastName = SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Last
          Name")
    - step:
        id: '38'
        action: Script
        object_path: firstName = SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"First
          Name")
    - step:
        id: '39'
        action: Script
        object_path: adminForTime = SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Administrator
          for Time (Text)")
    - step:
        id: '40'
        action: Script
        object_path: contractDescription = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Contract Description")
    - step:
        id: '41'
        action: Script
        object_path: positionDescription = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Position - Description")
    - step:
        id: '42'
        action: Script
        object_path: personalLeavePaid = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"PL Paid Hours")
    - step:
        id: '43'
        action: Script
        object_path: If Instr(personalLeavePaid,"-") Then
    - step:
        id: '44'
        action: Script
        object_path: personalLeavePaid = Replace(personalLeavePaid,"-","")
    - step:
        id: '45'
        action: Script
        object_path: personalLeavePaid = "-"&personalLeavePaid
    - step:
        id: '46'
        action: Script
        object_path: personalLeavePaid = CDbl(personalLeavePaid)
    - step:
        id: '47'
        action: Script
        object_path: Else
    - step:
        id: '48'
        action: Script
        object_path: personalLeavePaid = CDbl(personalLeavePaid)
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: personalLeaveUnpaid = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"PL Unpaid")
    - step:
        id: '51'
        action: Script
        object_path: If Instr(personalLeaveUnpaid,"-") Then
    - step:
        id: '52'
        action: Script
        object_path: personalLeaveUnpaid = Replace(personalLeaveUnpaid,"-","")
    - step:
        id: '53'
        action: Script
        object_path: personalLeaveUnpaid = "-"&personalLeaveUnpaid
    - step:
        id: '54'
        action: Script
        object_path: personalLeaveUnpaid = CDbl(personalLeaveUnpaid)
    - step:
        id: '55'
        action: Script
        object_path: Else
    - step:
        id: '56'
        action: Script
        object_path: personalLeaveUnpaid = CDbl(personalLeaveUnpaid)
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        action: Script
        object_path: carersLeavePaid = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Carers Leave Paid")
    - step:
        id: '59'
        action: Script
        object_path: If Instr(carersLeavePaid,"-") Then
    - step:
        id: '60'
        action: Script
        object_path: carersLeavePaid = Replace(carersLeavePaid,"-","")
    - step:
        id: '61'
        action: Script
        object_path: carersLeavePaid = "-"&carersLeavePaid
    - step:
        id: '62'
        action: Script
        object_path: carersLeavePaid = CDbl(carersLeavePaid)
    - step:
        id: '63'
        action: Script
        object_path: Else
    - step:
        id: '64'
        action: Script
        object_path: carersLeavePaid = CDbl(carersLeavePaid)
    - step:
        id: '65'
        action: Script
        object_path: End If
    - step:
        id: '66'
        action: Script
        object_path: carersLeaveUnpaid = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Carers Leave unpaid")
    - step:
        id: '67'
        action: Script
        object_path: If Instr(carersLeaveUnpaid,"-") Then
    - step:
        id: '68'
        action: Script
        object_path: carersLeaveUnpaid = Replace(carersLeaveUnpaid,"-","")
    - step:
        id: '69'
        action: Script
        object_path: carersLeaveUnpaid = "-"&carersLeaveUnpaid
    - step:
        id: '70'
        action: Script
        object_path: carersLeaveUnpaid = CDbl(carersLeaveUnpaid)
    - step:
        id: '71'
        action: Script
        object_path: Else
    - step:
        id: '72'
        action: Script
        object_path: carersLeaveUnpaid = CDbl(carersLeaveUnpaid)
    - step:
        id: '73'
        action: Script
        object_path: End If
    - step:
        id: '74'
        action: Script
        object_path: personalLeaveEntitlement = SAPGuiSession("Session").SAPGuiWindow("Easy
          Reporter").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Personal Leave Entitlement")
    - step:
        id: '75'
        action: Script
        object_path: If Instr(personalLeaveEntitlement,"-") Then
    - step:
        id: '76'
        action: Script
        object_path: personalLeaveEntitlement = Replace(personalLeaveEntitlement,"-","")
    - step:
        id: '77'
        action: Script
        object_path: personalLeaveEntitlement = "-"&personalLeaveEntitlement
    - step:
        id: '78'
        action: Script
        object_path: personalLeaveEntitlement = CDbl(personalLeaveEntitlement)
    - step:
        id: '79'
        action: Script
        object_path: Else
    - step:
        id: '80'
        action: Script
        object_path: personalLeaveEntitlement = CDbl(personalLeaveEntitlement)
    - step:
        id: '81'
        action: Script
        object_path: End If
    - step:
        id: '82'
        action: Script
        object_path: '''If Logistics file, only include specific leaders'
    - step:
        id: '83'
        action: Script
        object_path: If Instr(Parameter("filepath"),"Logistics") > 0 Then
    - step:
        id: '84'
        action: Script
        object_path: If adminForTime = "Dilena A" or adminForTime = "Docking B" or
          adminForTime = "Caldicott P" or adminForTime = "Turner P" or adminForTime
          = "Souter G" or adminForTime = "Lindner T" or adminForTime = "Perrone A"
          or adminForTime = "Durdin C" Then
    - step:
        id: '85'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = costCentre
    - step:
        id: '86'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeNo
    - step:
        id: '87'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = lastName
    - step:
        id: '88'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = firstName
    - step:
        id: '89'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = adminForTime
    - step:
        id: '90'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = contractDescription
    - step:
        id: '91'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = positionDescription
    - step:
        id: '92'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = personalLeavePaid
    - step:
        id: '93'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = personalLeaveUnpaid
    - step:
        id: '94'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = carersLeavePaid
    - step:
        id: '95'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = carersLeaveUnpaid
    - step:
        id: '96'
        action: Script
        object_path: totalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid
          + carersLeavePaid + carersLeaveUnpaid
    - step:
        id: '97'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = totalPersonalAndCarers
    - step:
        id: '98'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = personalLeaveEntitlement
    - step:
        id: '99'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '100'
        action: Script
        object_path: End If
    - step:
        id: '101'
        action: Script
        object_path: '''If Ops Planning file, don''t include Logistics leaders'
    - step:
        id: '102'
        action: Script
        object_path: ElseIf Instr(Parameter("filepath"),"Operations Planning") > 0
          Then
    - step:
        id: '103'
        action: Script
        object_path: If adminForTime = "Dilena A" or adminForTime = "Docking B" or
          adminForTime = "Caldicott P" or adminForTime = "Turner P" or adminForTime
          = "Souter G" or adminForTime = "Lindner T" or adminForTime = "Perrone A"
          or adminForTime = "Durdin C" Then
    - step:
        id: '104'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '105'
        action: Script
        object_path: Else
    - step:
        id: '106'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = costCentre
    - step:
        id: '107'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeNo
    - step:
        id: '108'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = lastName
    - step:
        id: '109'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = firstName
    - step:
        id: '110'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = adminForTime
    - step:
        id: '111'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = contractDescription
    - step:
        id: '112'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = positionDescription
    - step:
        id: '113'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = personalLeavePaid
    - step:
        id: '114'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = personalLeaveUnpaid
    - step:
        id: '115'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = carersLeavePaid
    - step:
        id: '116'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = carersLeaveUnpaid
    - step:
        id: '117'
        action: Script
        object_path: totalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid
          + carersLeavePaid + carersLeaveUnpaid
    - step:
        id: '118'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = totalPersonalAndCarers
    - step:
        id: '119'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = personalLeaveEntitlement
    - step:
        id: '120'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '121'
        action: Script
        object_path: End If
    - step:
        id: '122'
        action: Script
        object_path: Else
    - step:
        id: '123'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = costCentre
    - step:
        id: '124'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeNo
    - step:
        id: '125'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = lastName
    - step:
        id: '126'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = firstName
    - step:
        id: '127'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = adminForTime
    - step:
        id: '128'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = contractDescription
    - step:
        id: '129'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = positionDescription
    - step:
        id: '130'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = personalLeavePaid
    - step:
        id: '131'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = personalLeaveUnpaid
    - step:
        id: '132'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = carersLeavePaid
    - step:
        id: '133'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = carersLeaveUnpaid
    - step:
        id: '134'
        action: Script
        object_path: totalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid
          + carersLeavePaid + carersLeaveUnpaid
    - step:
        id: '135'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = totalPersonalAndCarers
    - step:
        id: '136'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = personalLeaveEntitlement
    - step:
        id: '137'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '138'
        action: Script
        object_path: End If
    - step:
        id: '139'
        action: Script
        object_path: Else
    - step:
        id: '140'
        action: Script
        object_path: Exit For
    - step:
        id: '141'
        action: Script
        object_path: End If
    - step:
        id: '142'
        action: Script
        object_path: Next
    - step:
        id: '143'
        action: Script
        object_path: End If
    - step:
        id: '144'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '145'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Enter   (Enter)")
        action: Click
    - step:
        id: '146'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '147'
        action: Script
        object_path: '''SAVE AND CLOSE WORKBOOK'
    - step:
        id: '148'
        object_path: objWorkbook
        action: Save
    - step:
        id: '149'
        object_path: objWorkbook
        action: Close
    - step:
        id: '150'
        object_path: objExcel
        action: Quit
    - step:
        id: '151'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '152'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '153'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
      last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report_3
          properties:
          - property:
              value:
                value: ZLVE
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report_2
          properties:
          - property:
              value:
                value: ZLVE
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: Annual Leave Information
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report
          properties:
          - property:
              value:
                value: ZLVE
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
                value: ZEH25P01
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
          child_objects:
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
              properties:
              - property:
                  value:
                    value: btn[3]
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Easy Reporter
          properties:
          - property:
              value:
                value: /SPIN/ER
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
                value: /ALG/MNU_MAINMENU
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TAB_RUN_RPT
              properties:
              - property:
                  value:
                    value: TAB_RUN_RPT
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Current year
              properties:
              - property:
                  value:
                    value: Current year
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RUN_CURR_YR
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Period
              properties:
              - property:
                  value:
                    value: BUT_DATES_PERIOD
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute Report in Foreground
              properties:
              - property:
                  value:
                    value: BUT_RUN_RPT
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Organizational_2
          properties:
          - property:
              value:
                value: /SPIN/ER
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
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Organizational
          properties:
          - property:
              value:
                value: ZLVE
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
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Additional Selection
          properties:
          - property:
              value:
                value: /SPIN/ER
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
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
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
              last_update_time: Wednesday, 13 April 2022 5:19:08 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
