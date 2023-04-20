namespace: SAPtoP6IntegrationAPI
operation:
  name: PlannedSAPExtraction
  inputs:
  - plannedActivities: 10_08_2022-0844 PlannedActivities.xlsx
  - plannedResources: 10_08_2022-0844 PlannedResources.xlsx
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\SAP
      to P6 Integration\
  sequential_action:
    gav: com.microfocus.seq:SAPtoP6IntegrationAPI.PlannedSAPExtraction:1.0.0
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
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '3'
        action: Script
        object_path: ''' Planned ACTIVITIES'
    - step:
        id: '4'
        action: Script
        object_path: Set activitiesWorkbook = objExcel.Workbooks.open(Parameter("filePath")&Parameter("plannedActivities"))
    - step:
        id: '5'
        action: Script
        object_path: sheetName = activitiesWorkbook.Worksheets(1).Name
    - step:
        id: '6'
        action: Script
        object_path: Set activitiesSheet = activitiesWorkbook.Worksheets(sheetName)
    - step:
        id: '7'
        action: Script
        object_path: activitiesRowCount = activitiesSheet.UsedRange.Rows.Count
    - step:
        id: '8'
        action: Script
        object_path: ''' Planned RESOURCES'
    - step:
        id: '9'
        action: Script
        object_path: Set resourcesWorkbook = objExcel.Workbooks.open(Parameter("filePath")&Parameter("plannedResources"))
    - step:
        id: '10'
        action: Script
        object_path: sheetName = resourcesWorkbook.Worksheets(1).Name
    - step:
        id: '11'
        action: Script
        object_path: Set resourcesSheet = resourcesWorkbook.Worksheets(sheetName)
    - step:
        id: '12'
        action: Script
        object_path: resourcesRowCount = resourcesSheet.UsedRange.Rows.Count
    - step:
        id: '13'
        action: Script
        object_path: For activityRow = 2 To activitiesRowCount
    - step:
        id: '14'
        action: Script
        object_path: Parameter("currentRow") = activityRow
    - step:
        id: '15'
        action: Script
        object_path: emailContent = ""
    - step:
        id: '16'
        action: Script
        object_path: activityID = activitiesSheet.cells(activityRow,1).value
    - step:
        id: '17'
        action: Script
        object_path: orderNumber = activitiesSheet.cells(activityRow,5).value
    - step:
        id: '18'
        action: Script
        object_path: projectNumber = activitiesSheet.cells(activityRow,7).value
    - step:
        id: '19'
        action: Script
        object_path: activityStatus = activitiesSheet.cells(activityRow,6).value
    - step:
        id: '20'
        action: Script
        object_path: If len(orderNumber) = 9 and activityStatus <> "Completed" Then
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Highlight
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '26'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '27'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(1) Then
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '30'
        action: Script
        object_path: End If
    - step:
        id: '31'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(1) Then
    - step:
        id: '32'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '34'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '35'
        action: Script
        object_path: End If
    - step:
        id: '36'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '37'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projectNumber
    - step:
        id: '38'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '39'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '40'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '41'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '42'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '43'
        action: Script
        object_path: set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '44'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projectNumber,"PRJ "&projectNumber'
    - step:
        id: '45'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '46'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projectNumber'
    - step:
        id: '47'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '48'
        action: Script
        object_path: rowContainingOrdNum = findCost(tree, orderNumber)
    - step:
        id: '49'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '50'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '51'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '52'
        action: Script
        object_path: If WBSrow <> "" Then
    - step:
        id: '53'
        action: Script
        object_path: PlannedProjectCost = tree.Object.GetItemText(tree.Object.GetAllNodeKeys(WBSrow),
          colKey_plan1)
    - step:
        id: '54'
        action: Script
        object_path: End If
    - step:
        id: '55'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '56'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '57'
        action: Script
        object_path: PlannedProjectCost = 0
    - step:
        id: '58'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project Planned Cost, Labour Planned Cost, Material
          Planned Cost or Services Planned Cost could not be extracted). "
    - step:
        id: '59'
        action: Script
        object_path: Else
    - step:
        id: '60'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '61'
        action: Script
        object_path: PlannedProjectCost = 0
    - step:
        id: '62'
        action: Script
        object_path: emailContent = emailContent& "Multiple order numbers associated
          with WBS element (Project Planned Cost, Labour Planned Cost, Material Planned
          Cost or Services Planned Cost could not be extracted). "
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '65'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '66'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '67'
        action: Script
        object_path: '''Planned LABOUR, MATERIALS AND SERVICES'
    - step:
        id: '68'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '69'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '70'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '71'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '72'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '73'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '74'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '75'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '76'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '77'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '78'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '79'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '82'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '83'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '85'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '86'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '87'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '88'
        action: Script
        object_path: Else
    - step:
        id: '89'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '90'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '91'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '92'
        action: Script
        object_path: Found = 0
    - step:
        id: '93'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '94'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '95'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '96'
        action: Script
        object_path: Found = 1
    - step:
        id: '97'
        action: Script
        object_path: Exit For
    - step:
        id: '98'
        action: Script
        object_path: End if
    - step:
        id: '99'
        action: Script
        object_path: Next
    - step:
        id: '100'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '101'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '102'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '103'
        action: Script
        object_path: LPlannedCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '104'
        action: Script
        object_path: If LPlannedCost = "" Then
    - step:
        id: '105'
        action: Script
        object_path: LPlannedCost = 0
    - step:
        id: '106'
        action: Script
        object_path: End If
    - step:
        id: '107'
        action: Script
        object_path: LPlannedCost = CDbl(LPlannedCost)
    - step:
        id: '108'
        action: Script
        object_path: labourPlannedCost = labourPlannedCost + LPlannedCost
    - step:
        id: '109'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '110'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '111'
        action: Script
        object_path: Else
    - step:
        id: '112'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '113'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '114'
        action: Script
        object_path: End  If
    - step:
        id: '115'
        action: Script
        object_path: End  If
    - step:
        id: '116'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '117'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '118'
        action: Script
        object_path: Next
    - step:
        id: '119'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '120'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '121'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '122'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '123'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '124'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '125'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '126'
        action: Script
        object_path: End If
    - step:
        id: '127'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '128'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '129'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '130'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '131'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '132'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '133'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '134'
        action: Script
        object_path: Else
    - step:
        id: '135'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '136'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '137'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '138'
        action: Script
        object_path: Found = 0
    - step:
        id: '139'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '140'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '141'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '142'
        action: Script
        object_path: Found = 1
    - step:
        id: '143'
        action: Script
        object_path: Exit For
    - step:
        id: '144'
        action: Script
        object_path: End if
    - step:
        id: '145'
        action: Script
        object_path: Next
    - step:
        id: '146'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '147'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '148'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '149'
        action: Script
        object_path: MPlannedCost =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '150'
        action: Script
        object_path: If MPlannedCost = "" Then
    - step:
        id: '151'
        action: Script
        object_path: MPlannedCost = 0
    - step:
        id: '152'
        action: Script
        object_path: End If
    - step:
        id: '153'
        action: Script
        object_path: MPlannedCost = CDbl(MPlannedCost)
    - step:
        id: '154'
        action: Script
        object_path: materialPlannedCost = materialPlannedCost + MPlannedCost
    - step:
        id: '155'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '156'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '157'
        action: Script
        object_path: Else
    - step:
        id: '158'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '159'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '160'
        action: Script
        object_path: End If
    - step:
        id: '161'
        action: Script
        object_path: End If
    - step:
        id: '162'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '164'
        action: Script
        object_path: Next
    - step:
        id: '165'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '166'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '167'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '168'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '169'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '170'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '171'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '174'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '175'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: '"EST"'
    - step:
        id: '176'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '177'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '178'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '179'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '180'
        action: Script
        object_path: Else
    - step:
        id: '181'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '182'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '183'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '184'
        action: Script
        object_path: Found = 0
    - step:
        id: '185'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '186'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '187'
        action: Script
        object_path: If NodeText = WBSelement Then
    - step:
        id: '188'
        action: Script
        object_path: Found = 1
    - step:
        id: '189'
        action: Script
        object_path: Exit For
    - step:
        id: '190'
        action: Script
        object_path: End if
    - step:
        id: '191'
        action: Script
        object_path: Next
    - step:
        id: '192'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '193'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '194'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '195'
        action: Script
        object_path: SPlannedCost =  SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("ProjPlan").GetROProperty("content")
    - step:
        id: '196'
        action: Script
        object_path: If SPlannedCost = "" Then
    - step:
        id: '197'
        action: Script
        object_path: SPlannedCost = 0
    - step:
        id: '198'
        action: Script
        object_path: End If
    - step:
        id: '199'
        action: Script
        object_path: SPlannedCost = CDbl(SPlannedCost)
    - step:
        id: '200'
        action: Script
        object_path: servicesPlannedCost = servicesPlannedCost + SPlannedCost
    - step:
        id: '201'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '202'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '203'
        action: Script
        object_path: Else
    - step:
        id: '204'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '205'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '206'
        action: Script
        object_path: End  If
    - step:
        id: '207'
        action: Script
        object_path: End  If
    - step:
        id: '208'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '209'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '210'
        action: Script
        object_path: Next
    - step:
        id: '211'
        action: Script
        object_path: If labourPlannedCost = 0 or labourPlannedCost = "" Then
    - step:
        id: '212'
        action: Script
        object_path: labourPlannedCost = 0
    - step:
        id: '213'
        action: Script
        object_path: emailContent = emailContent& "Labour Planned Cost not found.
          "
    - step:
        id: '214'
        action: Script
        object_path: End If
    - step:
        id: '215'
        action: Script
        object_path: If materialPlannedCost = 0 or materialPlannedCost = "" Then
    - step:
        id: '216'
        action: Script
        object_path: materialPlannedCost = 0
    - step:
        id: '217'
        action: Script
        object_path: emailContent = emailContent& "Material Planned Cost not found.
          "
    - step:
        id: '218'
        action: Script
        object_path: End If
    - step:
        id: '219'
        action: Script
        object_path: If servicesPlannedCost = 0 or servicesPlannedCost = "" Then
    - step:
        id: '220'
        action: Script
        object_path: servicesPlannedCost = 0
    - step:
        id: '221'
        action: Script
        object_path: emailContent = emailContent& "Services Planned Cost not found.
          "
    - step:
        id: '222'
        action: Script
        object_path: End If
    - step:
        id: '223'
        action: Script
        object_path: End  If
    - step:
        id: '224'
        action: Script
        object_path: '''LABOUR Planned HOURS'
    - step:
        id: '225'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '226'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '227'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: orderNumber
    - step:
        id: '228'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '229'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '230'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '231'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '232'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '233'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '234'
        action: Script
        object_path: If controlKeyValue = "INSU" or controlKeyValue = "SOPL" or controlKeyValue
          = "EXSV" Then
    - step:
        id: '235'
        action: Script
        object_path: labourPlannedHRS1 = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Work")
    - step:
        id: '236'
        action: Script
        object_path: labourPlannedHRS1 = CDbl(labourPlannedHRS1)
    - step:
        id: '237'
        action: Script
        object_path: labourPlannedHRS = CDbl(labourPlannedHRS)
    - step:
        id: '238'
        action: Script
        object_path: labourPlannedHRS = labourPlannedHRS + labourPlannedHRS1
    - step:
        id: '239'
        action: Script
        object_path: End If
    - step:
        id: '240'
        action: Script
        object_path: Else
    - step:
        id: '241'
        action: Script
        object_path: Exit For
    - step:
        id: '242'
        action: Script
        object_path: End  If
    - step:
        id: '243'
        action: Script
        object_path: Next
    - step:
        id: '244'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '245'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(1) Then
    - step:
        id: '246'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '247'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '248'
        action: Script
        object_path: Else
    - step:
        id: '249'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '250'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '251'
        action: Script
        object_path: End If
    - step:
        id: '252'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '253'
        action: Script
        object_path: ''' ADD LABOUR TO EXCEL'
    - step:
        id: '254'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '255'
        action: Script
        object_path: For resourceRow = 2 To resourcesRowCount
    - step:
        id: '256'
        action: Script
        object_path: activityID2 = resourcesSheet.cells(resourceRow,1).value
    - step:
        id: '257'
        action: Script
        object_path: If activityID2 = activityID Then
    - step:
        id: '258'
        action: Script
        object_path: resourceName = resourcesSheet.cells(resourceRow,8).value
    - step:
        id: '259'
        action: Script
        object_path: If resourceName = "Labour" Then
    - step:
        id: '260'
        object_path: resourcesSheet.cells(resourceRow,10)
        action: value
        args: = labourPlannedCost
    - step:
        id: '261'
        object_path: resourcesSheet.cells(resourceRow,11)
        action: value
        args: = labourPlannedHRS
    - step:
        id: '262'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '263'
        action: Script
        object_path: resourceAdded = True
    - step:
        id: '264'
        action: Script
        object_path: Exit For
    - step:
        id: '265'
        action: Script
        object_path: End If
    - step:
        id: '266'
        action: Script
        object_path: End If
    - step:
        id: '267'
        action: Script
        object_path: Next
    - step:
        id: '268'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '269'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '270'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '271'
        object_path: resourcesSheet.cells(resourcesRowCount,6)
        action: value
        args: = "Labour Resource"
    - step:
        id: '272'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = "Labour"
    - step:
        id: '273'
        object_path: resourcesSheet.cells(resourcesRowCount,9)
        action: value
        args: = "false"
    - step:
        id: '274'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = labourPlannedCost
    - step:
        id: '275'
        object_path: resourcesSheet.cells(resourcesRowCount,11)
        action: value
        args: = labourPlannedHRS
    - step:
        id: '276'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '277'
        action: Script
        object_path: End If
    - step:
        id: '278'
        action: Script
        object_path: ''' ADD MATERIAL TO EXCEL'
    - step:
        id: '279'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '280'
        action: Script
        object_path: For resourceRow = 2 To resourcesRowCount
    - step:
        id: '281'
        action: Script
        object_path: activityID2 = resourcesSheet.cells(resourceRow,1).value
    - step:
        id: '282'
        action: Script
        object_path: If activityID2 = activityID Then
    - step:
        id: '283'
        action: Script
        object_path: resourceName = resourcesSheet.cells(resourceRow,8).value
    - step:
        id: '284'
        action: Script
        object_path: If resourceName = "Material" Then
    - step:
        id: '285'
        object_path: resourcesSheet.cells(resourceRow,10)
        action: value
        args: = materialPlannedCost
    - step:
        id: '286'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '287'
        action: Script
        object_path: resourceAdded = True
    - step:
        id: '288'
        action: Script
        object_path: Exit For
    - step:
        id: '289'
        action: Script
        object_path: End If
    - step:
        id: '290'
        action: Script
        object_path: End If
    - step:
        id: '291'
        action: Script
        object_path: Next
    - step:
        id: '292'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '293'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '294'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '295'
        object_path: resourcesSheet.cells(resourcesRowCount,6)
        action: value
        args: = "Material Resource"
    - step:
        id: '296'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = "Material"
    - step:
        id: '297'
        object_path: resourcesSheet.cells(resourcesRowCount,9)
        action: value
        args: = "false"
    - step:
        id: '298'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = materialPlannedCost
    - step:
        id: '299'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '300'
        action: Script
        object_path: End If
    - step:
        id: '301'
        action: Script
        object_path: ''' ADD SERVICES TO EXCEL'
    - step:
        id: '302'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '303'
        action: Script
        object_path: For resourceRow = 2 To resourcesRowCount
    - step:
        id: '304'
        action: Script
        object_path: activityID2 = resourcesSheet.cells(resourceRow,1).value
    - step:
        id: '305'
        action: Script
        object_path: If activityID2 = activityID Then
    - step:
        id: '306'
        action: Script
        object_path: resourceName = resourcesSheet.cells(resourceRow,8).value
    - step:
        id: '307'
        action: Script
        object_path: If resourceName = "Services" Then
    - step:
        id: '308'
        object_path: resourcesSheet.cells(resourceRow,10)
        action: value
        args: = servicesPlannedCost
    - step:
        id: '309'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '310'
        action: Script
        object_path: resourceAdded = True
    - step:
        id: '311'
        action: Script
        object_path: Exit For
    - step:
        id: '312'
        action: Script
        object_path: End If
    - step:
        id: '313'
        action: Script
        object_path: End If
    - step:
        id: '314'
        action: Script
        object_path: Next
    - step:
        id: '315'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '316'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '317'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '318'
        object_path: resourcesSheet.cells(resourcesRowCount,6)
        action: value
        args: = "Services Resource"
    - step:
        id: '319'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = "Services"
    - step:
        id: '320'
        object_path: resourcesSheet.cells(resourcesRowCount,9)
        action: value
        args: = "false"
    - step:
        id: '321'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = servicesPlannedCost
    - step:
        id: '322'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '323'
        action: Script
        object_path: End If
    - step:
        id: '324'
        action: Script
        object_path: '''ADD PROJECT VALUES TO EXCEL'
    - step:
        id: '325'
        action: Script
        object_path: If emailContent = "" Then
    - step:
        id: '326'
        action: Script
        object_path: emailContent = "Completed."
    - step:
        id: '327'
        action: Script
        object_path: End If
    - step:
        id: '328'
        object_path: activitiesSheet.cells(activityRow,10)
        action: value
        args: = PlannedProjectCost
    - step:
        id: '329'
        object_path: activitiesSheet.cells(activityRow,11)
        action: value
        args: = labourPlannedHRS
    - step:
        id: '330'
        object_path: activitiesSheet.cells(activityRow,12)
        action: value
        args: = emailContent
    - step:
        id: '331'
        object_path: activitiesWorkbook
        action: save
    - step:
        id: '332'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '333'
        action: Script
        object_path: End If
    - step:
        id: '334'
        action: Script
        object_path: Next
    - step:
        id: '335'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '336'
        object_path: activitiesWorkbook
        action: save
    - step:
        id: '337'
        object_path: resourcesWorkbook
        action: close
    - step:
        id: '338'
        object_path: activitiesWorkbook
        action: close
    - step:
        id: '339'
        object_path: objExcel
        action: quit
    - step:
        id: '340'
        action: Script
        object_path: '''****************************************************************FUNCTIONS*********************************************************************'''
    - step:
        id: '341'
        action: Script
        object_path: Function getColNameFromTitle(tree, title)
    - step:
        id: '342'
        action: Script
        object_path: Set colNames = tree.Object.GetColumnNames
    - step:
        id: '343'
        action: Script
        object_path: For i = 1 To (colNames.length-1)
    - step:
        id: '344'
        action: Script
        object_path: selectedColTitle = tree.Object.GetColumnTitleFromName(colNames(i))
    - step:
        id: '345'
        action: Script
        object_path: If selectedColTitle = title Then
    - step:
        id: '346'
        action: Script
        object_path: getColNameFromTitle = colNames(i)
    - step:
        id: '347'
        action: Script
        object_path: Exit For
    - step:
        id: '348'
        action: Script
        object_path: End If
    - step:
        id: '349'
        action: Script
        object_path: Next
    - step:
        id: '350'
        action: Script
        object_path: End Function
    - step:
        id: '351'
        action: Script
        object_path: Function findCost(tree, orderNumber)
    - step:
        id: '352'
        action: Script
        object_path: rowContainingOrdNum = Array()
    - step:
        id: '353'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '354'
        action: Script
        object_path: set columnKeys = tree.Object.GetColumnCol(columnNames(0))
    - step:
        id: '355'
        action: Script
        object_path: For i = 1 To (columnKeys.length-1)
    - step:
        id: '356'
        action: Script
        object_path: If InStr(columnKeys(i), orderNumber) > 0 Then
    - step:
        id: '357'
        action: Script
        object_path: If InStr(columnKeys(i-1), "WBS") > 0 Then
    - step:
        id: '358'
        action: Script
        object_path: If InStr(columnKeys(i+1), "WBS") > 0 or InStr(columnKeys(i+1),
          "Result") > 0 Then
    - step:
        id: '359'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '360'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '361'
        action: Script
        object_path: AddItem rowContainingOrdNum, i-1
    - step:
        id: '362'
        action: Script
        object_path: Exit For
    - step:
        id: '363'
        action: Script
        object_path: ElseIf InStr(columnKeys(i+1), "ORD") > 0 Then
    - step:
        id: '364'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '365'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '366'
        action: Script
        object_path: End If
    - step:
        id: '367'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-1), "ORD") > 0 Then
    - step:
        id: '368'
        action: Script
        object_path: If InStr(columnKeys(i-2), "WBS") > 0 Then
    - step:
        id: '369'
        action: Script
        object_path: WBSelement = columnKeys(i-2)
    - step:
        id: '370'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '371'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-3), "WBS") > 0 Then
    - step:
        id: '372'
        action: Script
        object_path: WBSelement = columnKeys(i-3)
    - step:
        id: '373'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '374'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-4), "WBS") > 0 Then
    - step:
        id: '375'
        action: Script
        object_path: WBSelement = columnKeys(i-4)
    - step:
        id: '376'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '377'
        action: Script
        object_path: End If
    - step:
        id: '378'
        action: Script
        object_path: End If
    - step:
        id: '379'
        action: Script
        object_path: End If
    - step:
        id: '380'
        action: Script
        object_path: Next
    - step:
        id: '381'
        action: Script
        object_path: findCost = rowContainingOrdNum
    - step:
        id: '382'
        action: Script
        object_path: End Function
    - step:
        id: '383'
        action: Script
        object_path: Function AddItem(arr, val)
    - step:
        id: '384'
        action: Script
        object_path: ReDim Preserve arr(UBound(arr) + 1)
    - step:
        id: '385'
        action: Script
        object_path: arr(UBound(arr)) = val
    - step:
        id: '386'
        action: Script
        object_path: AddItem = arr
    - step:
        id: '387'
        action: Script
        object_path: End Function
    - step:
        id: '388'
        action: Script
        object_path: Function WBSsearch(WBSelement)
    - step:
        id: '389'
        action: Script
        object_path: WBSelementSplit = Split(WBSelement,"-")
    - step:
        id: '390'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '391'
        action: Script
        object_path: For e = 1 to lengthOfSplit
    - step:
        id: '392'
        action: Script
        object_path: WBSelementSplit(e) = WBSelementSplit(e-1)&"-"&WBSelementSplit(e)
    - step:
        id: '393'
        action: Script
        object_path: Next
    - step:
        id: '394'
        action: Script
        object_path: Const removalIndex = 0
    - step:
        id: '395'
        action: Script
        object_path: For x=removalIndex To UBound(WBSelementSplit)-1
    - step:
        id: '396'
        action: Script
        object_path: WBSelementSplit(x) = WBSelementSplit(x + 1)
    - step:
        id: '397'
        action: Script
        object_path: Next
    - step:
        id: '398'
        action: Script
        object_path: ReDim Preserve WBSelementSplit(UBound(WBSelementSplit) - 1)
    - step:
        id: '399'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '400'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '401'
        action: Script
        object_path: WBSsearch = "PRJ "&projectNumber
    - step:
        id: '402'
        action: Script
        object_path: If InStr(projectNumber,"CP") Then
    - step:
        id: '403'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '404'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '405'
        action: Script
        object_path: Next
    - step:
        id: '406'
        action: Script
        object_path: ElseIf InStr(projectNumber,"FS") Then
    - step:
        id: '407'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '408'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '409'
        action: Script
        object_path: Next
    - step:
        id: '410'
        action: Script
        object_path: Else
    - step:
        id: '411'
        action: Script
        object_path: For e1 = 0 To lengthOfSplit
    - step:
        id: '412'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '413'
        action: Script
        object_path: Next
    - step:
        id: '414'
        action: Script
        object_path: End If
    - step:
        id: '415'
        action: Script
        object_path: WBSsearch = WBSsearch
    - step:
        id: '416'
        action: Script
        object_path: End Function
    - step:
        id: '417'
        action: Script
        object_path: Function ClearVariables
    - step:
        id: '418'
        action: Script
        object_path: LPlannedCost = 0
    - step:
        id: '419'
        action: Script
        object_path: labourPlannedCost = 0
    - step:
        id: '420'
        action: Script
        object_path: MPlannedCost = 0
    - step:
        id: '421'
        action: Script
        object_path: materialPlannedCost = 0
    - step:
        id: '422'
        action: Script
        object_path: SPlannedCost = 0
    - step:
        id: '423'
        action: Script
        object_path: servicesPlannedCost = 0
    - step:
        id: '424'
        action: Script
        object_path: PlannedProjectCost = 0
    - step:
        id: '425'
        action: Script
        object_path: labourPlannedHRS1 = 0
    - step:
        id: '426'
        action: Script
        object_path: labourPlannedHRS = 0
    - step:
        id: '427'
        action: Script
        object_path: emailContent = ""
    - step:
        id: '428'
        action: Script
        object_path: End Function
  outputs:
  - currentRow:
      robot: true
      value: ${currentRow}
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
      last_update_time: Friday, 2 September 2022 2:59:22 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Set Controlling Area
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Controlling Area
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Selection: Plan 1/plan'
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: Graphical report output
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Plan version 2
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Network/order
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: Transaction
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Exit Report
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Execute Drilldown Report
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile_2
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Database prof.
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Database prof._2
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Database prof.
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Order: Initial'
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Order
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Contestable -
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TabMenu
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: SAPLICO1TCTRL_1110
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: OperationsTable
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
              basic_identification:
                property_ref:
                - name
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
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
              basic_identification:
                property_ref:
                - text
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Confirmations List
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Act. Data
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Confirmations
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: EmployeeTable
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Actual/Plan/Variance
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Report contains no data
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[0,0]
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: ProjPlan
              properties:
              - property:
                  value:
                    value: wnd\[0\]\/usr\/lbl\[62\,[0-9]+\]
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
                    value: ^[ ]*\d*.*\d*.*\d*$
                    regular_expression: true
                  name: content
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Actual
              properties:
              - property:
                  value:
                    value: '279'
                    regular_expression: false
                  name: y
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
                    value: wnd[0]/usr/lbl[46,13]
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
                    value: .*
                    regular_expression: true
                  name: content
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                - content
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Act/Plan/Variance Abs./
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
          last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: to
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Plan Version
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Or value(s)
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Network/order
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Cost Element Group
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
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
              last_update_time: Friday, 2 September 2022 2:59:22 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
