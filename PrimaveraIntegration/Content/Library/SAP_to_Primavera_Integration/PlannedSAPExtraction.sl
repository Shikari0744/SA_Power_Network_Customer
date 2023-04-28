namespace: SAP_to_Primavera_Integration
operation:
  name: PlannedSAPExtraction
  inputs:
    - projectNumber:
        required: false
    - orderNumber:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:SAP_to_Primavera_Integration.PlannedSAPExtraction:1.0.0'
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
          object_path: "'PLANNED"
      - step:
          id: '2'
          action: Script
          object_path: 'projNum = Parameter("projectNumber")'
      - step:
          id: '3'
          action: Script
          object_path: 'ordNum = Parameter("orderNumber")'
      - step:
          id: '4'
          action: Script
          object_path: If IsNumeric(ordNum) Then
      - step:
          id: '5'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: Maximize
      - step:
          id: '6'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: Highlight
      - step:
          id: '7'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")'
          action: Set
          args: '"/nS_ALR_87013534"'
      - step:
          id: '8'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: SendKey
          args: ENTER
      - step:
          id: '9'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '10'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling Area").Exist(3) Then'
      - step:
          id: '11'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling Area")'
          action: Set
          args: '"1000"'
      - step:
          id: '12'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '13'
          action: Script
          object_path: End If
      - step:
          id: '14'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database prof.").Exist(3) Then'
      - step:
          id: '15'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database prof.")'
          action: Set
          args: '"000000000001"'
      - step:
          id: '16'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '17'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '18'
          action: Script
          object_path: End If
      - step:
          id: '19'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical report output")'
          action: Set
      - step:
          id: '20'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
          action: Set
          args: projNum
      - step:
          id: '21'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
          action: Set
          args: '""'
      - step:
          id: '22'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan version 2")'
          action: Set
          args: '"est"'
      - step:
          id: '23'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical report output")'
          action: SetFocus
      - step:
          id: '24'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '25'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '26'
          action: Script
          object_path: 'set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiTree("TableTreeControl")'
      - step:
          id: '27'
          object_path: tree
          action: OpenItemContextMenu
          args: '"PRJ "&projNum,"PRJ "&projNum'
      - step:
          id: '28'
          object_path: tree
          action: SelectMenuItemById
          args: '"&EXPAND"'
      - step:
          id: '29'
          object_path: tree
          action: SelectNode
          args: '"PRJ "&projNum'
      - step:
          id: '30'
          action: Script
          object_path: 'colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")'
      - step:
          id: '31'
          action: Script
          object_path: 'rowContainingOrdNum = findBudget(tree, ordNum)'
      - step:
          id: '32'
          action: Script
          object_path: If Ubound(rowContainingOrdNum) = 1 Then
      - step:
          id: '33'
          action: Script
          object_path: WBSelement = rowContainingOrdNum(0)
      - step:
          id: '34'
          action: Script
          object_path: WBSrow = rowContainingOrdNum(1)
      - step:
          id: '35'
          action: Script
          object_path: 'If WBSrow <> "" Then'
      - step:
          id: '36'
          action: Script
          object_path: 'plannedProjectBudget = tree.Object.GetItemText(tree.Object.GetAllNodeKeys(WBSrow), colKey_plan1)'
      - step:
          id: '37'
          action: Script
          object_path: End If
      - step:
          id: '38'
          action: Script
          object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
      - step:
          id: '39'
          action: Script
          object_path: 'WBSelement = ""'
      - step:
          id: '40'
          action: Script
          object_path: 'plannedProjectBudget = "0"'
      - step:
          id: '41'
          action: Script
          object_path: 'emailContent = emailContent& "Order number and WBS element could not be found in SAP (Project planned budget, Labour planned budget, Material planned budget or Services planned budget could not be extracted). "'
      - step:
          id: '42'
          action: Script
          object_path: Else
      - step:
          id: '43'
          action: Script
          object_path: WBSelement = rowContainingOrdNum(0)
      - step:
          id: '44'
          action: Script
          object_path: 'plannedProjectBudget = "0"'
      - step:
          id: '45'
          action: Script
          object_path: 'emailContent = emailContent& "Multiple order numbers associated with WBS element (Project planned budget, Labour planned budget, Material planned budget or Services planned budget could not be extracted). "'
      - step:
          id: '46'
          action: Script
          object_path: End If
      - step:
          id: '47'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '48'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nS_ALR_87013543"'
      - step:
          id: '49'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")'
          action: SendKey
          args: ENTER
      - step:
          id: '50'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database prof._2").Exist(3) Then'
      - step:
          id: '51'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database prof._2")'
          action: Set
          args: '"000000000001"'
      - step:
          id: '52'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")'
          action: Click
      - step:
          id: '53'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '54'
          action: Script
          object_path: End If
      - step:
          id: '55'
          action: Script
          object_path: "'PLANNED LABOUR, MATERIALS AND SERVICES"
      - step:
          id: '56'
          action: Script
          object_path: If Ubound(rowContainingOrdNum) = 1 Then
      - step:
          id: '57'
          action: Script
          object_path: 'LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")'
      - step:
          id: '58'
          action: Script
          object_path: 'MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")'
      - step:
          id: '59'
          action: Script
          object_path: 'ServicesCostElementGroups = Array("SERVICES")'
      - step:
          id: '60'
          action: Script
          object_path: WBS = WBSsearch(WBSelement)
      - step:
          id: '61'
          action: Script
          object_path: For Each group in LabourCostElementGroups
      - step:
          id: '62'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")'
          action: Set
          args: projNum
      - step:
          id: '63'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")'
          action: Set
          args: '""'
      - step:
          id: '64'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan Version")'
          action: Set
          args: '"EST"'
      - step:
          id: '65'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost Element Group")'
          action: Set
          args: group
      - step:
          id: '66'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '67'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report contains no data").Exist(3) Then'
      - step:
          id: '68'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '69'
          action: Script
          object_path: Else
      - step:
          id: '70'
          action: Script
          object_path: 'Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object'
      - step:
          id: '71'
          action: Script
          object_path: Set AllValues = TreeObj.GetAllNodeKeys
      - step:
          id: '72'
          action: Script
          object_path: Count = AllValues.Count
      - step:
          id: '73'
          action: Script
          object_path: Found = 0
      - step:
          id: '74'
          action: Script
          object_path: For i = 0 to Count-1
      - step:
          id: '75'
          action: Script
          object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
      - step:
          id: '76'
          action: Script
          object_path: If NodeText = WBSelement Then
      - step:
          id: '77'
          action: Script
          object_path: Found = 1
      - step:
          id: '78'
          action: Script
          object_path: Exit For
      - step:
          id: '79'
          action: Script
          object_path: End if
      - step:
          id: '80'
          action: Script
          object_path: Next
      - step:
          id: '81'
          action: Script
          object_path: If Found = 1 Then
      - step:
          id: '82'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")'
          action: SelectNode
          args: WBS
      - step:
          id: '83'
          action: Script
          object_path: "'collapses table to only have totals row"
      - step:
          id: '84'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")'
          action: SendKey
          args: SHIFT_F10
      - step:
          id: '85'
          action: Script
          object_path: 'Lplannedbudget = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")'
      - step:
          id: '86'
          action: Script
          object_path: 'If Lplannedbudget <> "" Then'
      - step:
          id: '87'
          action: Script
          object_path: Lplannedbudget = CDbl(Lplannedbudget)
      - step:
          id: '88'
          action: Script
          object_path: labourPlannedBudget = labourPlannedBudget + Lplannedbudget
      - step:
          id: '89'
          action: Script
          object_path: End If
      - step:
          id: '90'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '91'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '92'
          action: Script
          object_path: Else
      - step:
          id: '93'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '94'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '95'
          action: Script
          object_path: End  If
      - step:
          id: '96'
          action: Script
          object_path: End  If
      - step:
          id: '97'
          action: Script
          object_path: Next
      - step:
          id: '98'
          action: Script
          object_path: For Each group in MaterialsCostElementGroups
      - step:
          id: '99'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")'
          action: Set
          args: projNum
      - step:
          id: '100'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")'
          action: Set
          args: '""'
      - step:
          id: '101'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan Version")'
          action: Set
          args: '"EST"'
      - step:
          id: '102'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost Element Group")'
          action: Set
          args: group
      - step:
          id: '103'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '104'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report contains no data").Exist(3) Then'
      - step:
          id: '105'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '106'
          action: Script
          object_path: Else
      - step:
          id: '107'
          action: Script
          object_path: 'Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object'
      - step:
          id: '108'
          action: Script
          object_path: Set AllValues = TreeObj.GetAllNodeKeys
      - step:
          id: '109'
          action: Script
          object_path: Count = AllValues.Count
      - step:
          id: '110'
          action: Script
          object_path: Found = 0
      - step:
          id: '111'
          action: Script
          object_path: For i = 0 to Count-1
      - step:
          id: '112'
          action: Script
          object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
      - step:
          id: '113'
          action: Script
          object_path: If NodeText = WBSelement Then
      - step:
          id: '114'
          action: Script
          object_path: Found = 1
      - step:
          id: '115'
          action: Script
          object_path: Exit For
      - step:
          id: '116'
          action: Script
          object_path: End if
      - step:
          id: '117'
          action: Script
          object_path: Next
      - step:
          id: '118'
          action: Script
          object_path: If Found = 1 Then
      - step:
          id: '119'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")'
          action: SelectNode
          args: WBS
      - step:
          id: '120'
          action: Script
          object_path: "'collapses table to only have totals row"
      - step:
          id: '121'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")'
          action: SendKey
          args: SHIFT_F10
      - step:
          id: '122'
          action: Script
          object_path: 'Mplannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")'
      - step:
          id: '123'
          action: Script
          object_path: 'If Mplannedbudget <> "" Then'
      - step:
          id: '124'
          action: Script
          object_path: Mplannedbudget = CDbl(Mplannedbudget)
      - step:
          id: '125'
          action: Script
          object_path: materialPlannedbudget = materialPlannedbudget + Mplannedbudget
      - step:
          id: '126'
          action: Script
          object_path: End If
      - step:
          id: '127'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '128'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '129'
          action: Script
          object_path: Else
      - step:
          id: '130'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '131'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '132'
          action: Script
          object_path: End If
      - step:
          id: '133'
          action: Script
          object_path: End If
      - step:
          id: '134'
          action: Script
          object_path: Next
      - step:
          id: '135'
          action: Script
          object_path: For Each group in ServicesCostElementGroups
      - step:
          id: '136'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")'
          action: Set
          args: projNum
      - step:
          id: '137'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")'
          action: Set
          args: '""'
      - step:
          id: '138'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan Version")'
          action: Set
          args: '"EST"'
      - step:
          id: '139'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost Element Group")'
          action: Set
          args: group
      - step:
          id: '140'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")'
          action: Click
      - step:
          id: '141'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report contains no data").Exist(3) Then'
      - step:
          id: '142'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '143'
          action: Script
          object_path: Else
      - step:
          id: '144'
          action: Script
          object_path: 'Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object'
      - step:
          id: '145'
          action: Script
          object_path: Set AllValues = TreeObj.GetAllNodeKeys
      - step:
          id: '146'
          action: Script
          object_path: Count = AllValues.Count
      - step:
          id: '147'
          action: Script
          object_path: Found = 0
      - step:
          id: '148'
          action: Script
          object_path: For i = 0 to Count-1
      - step:
          id: '149'
          action: Script
          object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
      - step:
          id: '150'
          action: Script
          object_path: If NodeText = WBSelement Then
      - step:
          id: '151'
          action: Script
          object_path: Found = 1
      - step:
          id: '152'
          action: Script
          object_path: Exit For
      - step:
          id: '153'
          action: Script
          object_path: End if
      - step:
          id: '154'
          action: Script
          object_path: Next
      - step:
          id: '155'
          action: Script
          object_path: If Found = 1 Then
      - step:
          id: '156'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")'
          action: SelectNode
          args: WBS
      - step:
          id: '157'
          action: Script
          object_path: "'collapses table to only have totals row"
      - step:
          id: '158'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")'
          action: SendKey
          args: SHIFT_F10
      - step:
          id: '159'
          action: Script
          object_path: 'Splannedbudget =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")'
      - step:
          id: '160'
          action: Script
          object_path: 'If Splannedbudget <> "" Then'
      - step:
          id: '161'
          action: Script
          object_path: Splannedbudget = CDbl(Splannedbudget)
      - step:
          id: '162'
          action: Script
          object_path: servicesPlannedbudget = servicesPlannedbudget + Splannedbudget
      - step:
          id: '163'
          action: Script
          object_path: End If
      - step:
          id: '164'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '165'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '166'
          action: Script
          object_path: Else
      - step:
          id: '167'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")'
          action: Click
      - step:
          id: '168'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")'
          action: Click
      - step:
          id: '169'
          action: Script
          object_path: End  If
      - step:
          id: '170'
          action: Script
          object_path: End  If
      - step:
          id: '171'
          action: Script
          object_path: Next
      - step:
          id: '172'
          action: Script
          object_path: If labourPlannedBudget = 0 Then
      - step:
          id: '173'
          action: Script
          object_path: 'emailContent = emailContent& "Labour planned budget not found. "'
      - step:
          id: '174'
          action: Script
          object_path: End If
      - step:
          id: '175'
          action: Script
          object_path: If materialPlannedbudget = 0 Then
      - step:
          id: '176'
          action: Script
          object_path: 'emailContent = emailContent& "Material planned budget not found. "'
      - step:
          id: '177'
          action: Script
          object_path: End If
      - step:
          id: '178'
          action: Script
          object_path: If servicesPlannedbudget = 0 Then
      - step:
          id: '179'
          action: Script
          object_path: 'emailContent = emailContent& "Services planned budget not found. "'
      - step:
          id: '180'
          action: Script
          object_path: End If
      - step:
          id: '181'
          action: Script
          object_path: End  If
      - step:
          id: '182'
          action: Script
          object_path: "'LABOUR PLANNED HOURS"
      - step:
          id: '183'
          action: Script
          object_path: "'extract labour actual and planned hours from only INSU SOPL EXSV control keys"
      - step:
          id: '184'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nIW33"'
      - step:
          id: '185'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")'
          action: SendKey
          args: ENTER
      - step:
          id: '186'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
          action: Set
          args: ordNum
      - step:
          id: '187'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
          action: SendKey
          args: ENTER
      - step:
          id: '188'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")'
          action: Select
          args: '"Operations"'
      - step:
          id: '189'
          action: Script
          object_path: 'labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable").RowCount'
      - step:
          id: '190'
          action: Script
          object_path: For i = 1 To labourRow
      - step:
          id: '191'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable").ValidRow(i) Then'
      - step:
          id: '192'
          action: Script
          object_path: 'controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")'
      - step:
          id: '193'
          action: Script
          object_path: 'If controlKeyValue = "INSU" or controlKeyValue = "SOPL" or controlKeyValue = "EXSV" Then'
      - step:
          id: '194'
          action: Script
          object_path: 'labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")'
      - step:
          id: '195'
          action: Script
          object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
      - step:
          id: '196'
          action: Script
          object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
      - step:
          id: '197'
          action: Script
          object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
      - step:
          id: '198'
          action: Script
          object_path: End If
      - step:
          id: '199'
          action: Script
          object_path: Else
      - step:
          id: '200'
          action: Script
          object_path: Exit For
      - step:
          id: '201'
          action: Script
          object_path: End  If
      - step:
          id: '202'
          action: Script
          object_path: Next
      - step:
          id: '203'
          action: Script
          object_path: "'get back to SAP home screen, ready for next iteration"
      - step:
          id: '204'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiStatusBar("StatusBar").Exist(3) Then'
      - step:
          id: '205'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nIW33"'
      - step:
          id: '206'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")'
          action: SendKey
          args: ENTER
      - step:
          id: '207'
          action: Script
          object_path: Else
      - step:
          id: '208'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")'
          action: Set
          args: '"/nIW33"'
      - step:
          id: '209'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")'
          action: SendKey
          args: ENTER
      - step:
          id: '210'
          action: Script
          object_path: End If
      - step:
          id: '211'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
          action: Click
      - step:
          id: '212'
          action: Script
          object_path: 'Parameter("plannedProjectBudget") = plannedProjectBudget'
      - step:
          id: '213'
          action: Script
          object_path: 'Parameter("labourPlannedBudget") = labourPlannedBudget'
      - step:
          id: '214'
          action: Script
          object_path: 'Parameter("labourPlannedHRS") = labourPlannedHRS'
      - step:
          id: '215'
          action: Script
          object_path: 'Parameter("materialPlannedbudget") = materialPlannedbudget'
      - step:
          id: '216'
          action: Script
          object_path: 'Parameter("servicesPlannedbudget") = servicesPlannedbudget'
      - step:
          id: '217'
          action: Script
          object_path: 'Parameter("emailContent") = emailContent'
      - step:
          id: '218'
          action: Script
          object_path: End If
      - step:
          id: '219'
          action: Script
          object_path: 'Function getColNameFromTitle(tree, title)'
      - step:
          id: '220'
          action: Script
          object_path: Set colNames = tree.Object.GetColumnNames
      - step:
          id: '221'
          action: Script
          object_path: For i = 1 To (colNames.length-1)
      - step:
          id: '222'
          action: Script
          object_path: selectedColTitle = tree.Object.GetColumnTitleFromName(colNames(i))
      - step:
          id: '223'
          action: Script
          object_path: If selectedColTitle = title Then
      - step:
          id: '224'
          action: Script
          object_path: getColNameFromTitle = colNames(i)
      - step:
          id: '225'
          action: Script
          object_path: Exit For
      - step:
          id: '226'
          action: Script
          object_path: End If
      - step:
          id: '227'
          action: Script
          object_path: Next
      - step:
          id: '228'
          action: Script
          object_path: End Function
      - step:
          id: '229'
          action: Script
          object_path: 'Function findBudget(tree, ordNum)'
      - step:
          id: '230'
          action: Script
          object_path: rowContainingOrdNum = Array()
      - step:
          id: '231'
          action: Script
          object_path: Set columnNames = tree.Object.GetColumnNames()
      - step:
          id: '232'
          action: Script
          object_path: set columnKeys = tree.Object.GetColumnCol(columnNames(0))
      - step:
          id: '233'
          action: Script
          object_path: For i = 1 To (columnKeys.length-1)
      - step:
          id: '234'
          action: Script
          object_path: 'If InStr(columnKeys(i), ordNum) > 0 Then'
      - step:
          id: '235'
          action: Script
          object_path: 'If InStr(columnKeys(i-1), "WBS") > 0 Then'
      - step:
          id: '236'
          action: Script
          object_path: 'If InStr(columnKeys(i+1), "WBS") > 0 or InStr(columnKeys(i+1), "Result") > 0 Then'
      - step:
          id: '237'
          action: Script
          object_path: WBSelement = columnKeys(i-1)
      - step:
          id: '238'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, WBSelement'
      - step:
          id: '239'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, i-1'
      - step:
          id: '240'
          action: Script
          object_path: Exit For
      - step:
          id: '241'
          action: Script
          object_path: 'ElseIf InStr(columnKeys(i+1), "ORD") > 0 Then'
      - step:
          id: '242'
          action: Script
          object_path: WBSelement = columnKeys(i-1)
      - step:
          id: '243'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, WBSelement'
      - step:
          id: '244'
          action: Script
          object_path: End If
      - step:
          id: '245'
          action: Script
          object_path: 'ElseIf InStr(columnKeys(i-1), "ORD") > 0 Then'
      - step:
          id: '246'
          action: Script
          object_path: 'If InStr(columnKeys(i-2), "WBS") > 0 Then'
      - step:
          id: '247'
          action: Script
          object_path: WBSelement = columnKeys(i-2)
      - step:
          id: '248'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, WBSelement'
      - step:
          id: '249'
          action: Script
          object_path: 'ElseIf InStr(columnKeys(i-3), "WBS") > 0 Then'
      - step:
          id: '250'
          action: Script
          object_path: WBSelement = columnKeys(i-3)
      - step:
          id: '251'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, WBSelement'
      - step:
          id: '252'
          action: Script
          object_path: 'ElseIf InStr(columnKeys(i-4), "WBS") > 0 Then'
      - step:
          id: '253'
          action: Script
          object_path: WBSelement = columnKeys(i-4)
      - step:
          id: '254'
          action: Script
          object_path: 'AddItem rowContainingOrdNum, WBSelement'
      - step:
          id: '255'
          action: Script
          object_path: End If
      - step:
          id: '256'
          action: Script
          object_path: End If
      - step:
          id: '257'
          action: Script
          object_path: End If
      - step:
          id: '258'
          action: Script
          object_path: Next
      - step:
          id: '259'
          action: Script
          object_path: findBudget = rowContainingOrdNum
      - step:
          id: '260'
          action: Script
          object_path: End Function
      - step:
          id: '261'
          action: Script
          object_path: 'Function AddItem(arr, val)'
      - step:
          id: '262'
          action: Script
          object_path: ReDim Preserve arr(UBound(arr) + 1)
      - step:
          id: '263'
          action: Script
          object_path: arr(UBound(arr)) = val
      - step:
          id: '264'
          action: Script
          object_path: AddItem = arr
      - step:
          id: '265'
          action: Script
          object_path: End Function
      - step:
          id: '266'
          action: Script
          object_path: Function WBSsearch(WBSelement)
      - step:
          id: '267'
          action: Script
          object_path: 'WBSelementSplit = Split(WBSelement,"-")'
      - step:
          id: '268'
          action: Script
          object_path: lengthOfSplit = Ubound(WBSelementSplit)
      - step:
          id: '269'
          action: Script
          object_path: For e = 1 to lengthOfSplit
      - step:
          id: '270'
          action: Script
          object_path: 'WBSelementSplit(e) = WBSelementSplit(e-1)&"-"&WBSelementSplit(e)'
      - step:
          id: '271'
          action: Script
          object_path: Next
      - step:
          id: '272'
          action: Script
          object_path: Const removalIndex = 0
      - step:
          id: '273'
          action: Script
          object_path: For x=removalIndex To UBound(WBSelementSplit)-1
      - step:
          id: '274'
          action: Script
          object_path: WBSelementSplit(x) = WBSelementSplit(x + 1)
      - step:
          id: '275'
          action: Script
          object_path: Next
      - step:
          id: '276'
          action: Script
          object_path: ReDim Preserve WBSelementSplit(UBound(WBSelementSplit) - 1)
      - step:
          id: '277'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '278'
          action: Script
          object_path: lengthOfSplit = Ubound(WBSelementSplit)
      - step:
          id: '279'
          action: Script
          object_path: 'WBSsearch = "PRJ "&projNum'
      - step:
          id: '280'
          action: Script
          object_path: 'If InStr(projNum,"CP") Then'
      - step:
          id: '281'
          action: Script
          object_path: For e1 = 1 To lengthOfSplit
      - step:
          id: '282'
          action: Script
          object_path: 'WBSsearch = WBSsearch&";"&WBSelementSplit(e1)'
      - step:
          id: '283'
          action: Script
          object_path: Next
      - step:
          id: '284'
          action: Script
          object_path: 'ElseIf InStr(projNum,"FS") Then'
      - step:
          id: '285'
          action: Script
          object_path: For e1 = 1 To lengthOfSplit
      - step:
          id: '286'
          action: Script
          object_path: 'WBSsearch = WBSsearch&";"&WBSelementSplit(e1)'
      - step:
          id: '287'
          action: Script
          object_path: Next
      - step:
          id: '288'
          action: Script
          object_path: Else
      - step:
          id: '289'
          action: Script
          object_path: For e1 = 0 To lengthOfSplit
      - step:
          id: '290'
          action: Script
          object_path: 'WBSsearch = WBSsearch&";"&WBSelementSplit(e1)'
      - step:
          id: '291'
          action: Script
          object_path: Next
      - step:
          id: '292'
          action: Script
          object_path: End If
      - step:
          id: '293'
          action: Script
          object_path: WBSsearch = WBSsearch
      - step:
          id: '294'
          action: Script
          object_path: End Function
  outputs:
    - plannedProjectBudget:
        robot: true
        value: '${plannedProjectBudget}'
    - emailContent:
        robot: true
        value: '${emailContent}'
    - labourPlannedBudget:
        robot: true
        value: '${labourPlannedBudget}'
    - materialPlannedbudget:
        robot: true
        value: '${materialPlannedbudget}'
    - servicesPlannedbudget:
        robot: true
        value: '${servicesPlannedbudget}'
    - labourPlannedHRS:
        robot: true
        value: '${labourPlannedHRS}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: Set Controlling Area
              child_objects:
                - object:
                    smart_identification: ''
                    name: Controlling Area
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SVALD-VALUE
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013534
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '300'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSPO4
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'Selection: Plan 1/plan'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Graphical report output
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Graphical report output
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: CONTROL
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiRadioButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - text
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Project
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: CN_PROJN-LOW
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Plan version 2
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: PAR_04
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Network/order
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: CN_NETNR-LOW
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[8]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013534
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
                      value: GP43KO2KBLC752LFPD0I8S3ZDB4
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: SAP Easy Access
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Transaction
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Enter
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: SAP
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013534
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
                      value: SAPMSSY0
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Exit Report
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'Yes'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: BUTTON_YES
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013543
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
                      value: SAPLGRWF
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Execute Drilldown Report
              child_objects:
                - object:
                    smart_identification: ''
                    name: TableTreeControl
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTree
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier:
                        value: 1
                        type: index
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013534
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
                      value: SAPLKYPC
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Enter profile_2
              child_objects:
                - object:
                    smart_identification: ''
                    name: Database prof.
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TCNT-PROF_DB
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013543
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
                      value: SAPLCNIS
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Enter profile
              child_objects:
                - object:
                    smart_identification: ''
                    name: Database prof._2
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TCNT-PROF_DB
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Database prof.
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TCNT-PROF_DB
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Continue   (Enter)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[0]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013534
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
                      value: SAPLCNIS
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'Display Order: Initial'
              child_objects:
                - object:
                    smart_identification: ''
                    name: Order
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: CAUFVD-AUFNR
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
                      value: '101'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLCOIH
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Display Contestable -
              child_objects:
                - object:
                    smart_identification: ''
                    name: TableTreeControl
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTree
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: TABSTRIP
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TABSTRIP
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTabStrip
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: TabMenu
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TS_1100
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTabStrip
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: SAPLICO1TCTRL_1110
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPLICO1TCTRL_1110
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: OperationsTable
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPLCOVGTCTRL_3010
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
                            value: ''
                            regular_expression: false
                          name: columnselectmode
                          hidden: false
                          read_only: false
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiTable
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: No objects were selected
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - text
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Confirmations List
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: BTN_VGRM
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Act. Data
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: BTN_VGD8
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
                      value: '3000'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLCOIH
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay:
                behavior: ''
              class: SAPGuiWindow
              visual_relations:
                visual_relation: []
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Display Confirmations
              child_objects:
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: EmployeeTable
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiGrid
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
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
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Actual/Plan/Variance
              child_objects:
                - object:
                    smart_identification: ''
                    name: TableTreeControl
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTree
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Report contains no data
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[0,0]'
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
                            value: Report contains no data
                            regular_expression: false
                          name: content
                          hidden: false
                          read_only: false
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                        - content
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: ProjPlan
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: "wnd\\[0\\]\\/usr\\/lbl\\[62\\,[0-9]+\\]"
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
                            value: "^[ ]*\\d*.*\\d*.*\\d*$"
                            regular_expression: true
                          name: content
                          hidden: false
                          read_only: false
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay:
                      behavior: ''
                    class: SAPGuiLabel
                    visual_relations:
                      visual_relation: []
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                        - content
                      ordinal_identifier:
                        value: 1
                        type: index
                - object:
                    smart_identification: ''
                    name: Actual
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '279'
                            regular_expression: false
                          name: 'y'
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: '372'
                            regular_expression: false
                          name: x
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/lbl[46,13]'
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
                            value: '.*'
                            regular_expression: true
                          name: content
                          hidden: false
                          read_only: false
                          type: STRING
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    custom_replay: ''
                    class: SAPGuiLabel
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - relativeid
                        - micclass
                        - guicomponenttype
                        - content
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Back   (F3)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[3]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013543
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
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Act/Plan/Variance Abs./
              child_objects:
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: to
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: _6-KSTAR-HIGH
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Project
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: CN_PROJN-LOW
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Plan Version
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: $6-VERP
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Or value(s)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: _6-KSTAR-LOW
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Network/order
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: CN_NETNR-LOW
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Cost Element Group
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: $6-KSTAR
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Execute   (F8)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[8]'
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
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: S_ALR_87013543
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
                      value: GP19IKIISXT68SL5787G66QHP8F410
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
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
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'ses[0]'
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
        comments: ''
        custom_replay: ''
        class: SAPGuiSession
        visual_relations: ''
        last_update_time: 'Tuesday, 10 May 2022 4:43:57 PM'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
