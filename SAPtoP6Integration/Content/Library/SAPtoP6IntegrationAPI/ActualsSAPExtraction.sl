namespace: SAPtoP6IntegrationAPI
operation:
  name: ActualsSAPExtraction
  inputs:
  - actualsActivities: 05_04_2023-1517 ActualActivities.xlsx
  - actualsResources: 05_04_2023-1517 ActualResources.xlsx
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\SAP
      to P6 Integration\
  sequential_action:
    gav: com.microfocus.seq:SAPtoP6IntegrationAPI.ActualsSAPExtraction:1.0.0
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
        object_path: '''V2'
    - step:
        id: '2'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '3'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '4'
        action: Script
        object_path: ''' ACTUALS ACTIVITIES'
    - step:
        id: '5'
        action: Script
        object_path: Set activitiesWorkbook = objExcel.Workbooks.open(Parameter("filePath")&Parameter("actualsActivities"))
    - step:
        id: '6'
        action: Script
        object_path: sheetName = activitiesWorkbook.Worksheets(1).Name
    - step:
        id: '7'
        action: Script
        object_path: Set activitiesSheet = activitiesWorkbook.Worksheets(sheetName)
    - step:
        id: '8'
        action: Script
        object_path: activitiesRowCount = activitiesSheet.UsedRange.Rows.Count
    - step:
        id: '9'
        action: Script
        object_path: ''' ACTUALS RESOURCES'
    - step:
        id: '10'
        action: Script
        object_path: Set resourcesWorkbook = objExcel.Workbooks.open(Parameter("filePath")&Parameter("actualsResources"))
    - step:
        id: '11'
        action: Script
        object_path: sheetName = resourcesWorkbook.Worksheets(1).Name
    - step:
        id: '12'
        action: Script
        object_path: Set resourcesSheet = resourcesWorkbook.Worksheets(sheetName)
    - step:
        id: '13'
        action: Script
        object_path: resourcesRowCount = resourcesSheet.UsedRange.Rows.Count
    - step:
        id: '14'
        action: Script
        object_path: For activityRow = 2 To activitiesRowCount
    - step:
        id: '15'
        action: Script
        object_path: emailContent = ""
    - step:
        id: '16'
        action: Script
        object_path: Parameter("currentRow") = activityRow
    - step:
        id: '17'
        action: Script
        object_path: activityID = activitiesSheet.cells(activityRow,1).value
    - step:
        id: '18'
        action: Script
        object_path: orderNumber = activitiesSheet.cells(activityRow,5).value
    - step:
        id: '19'
        action: Script
        object_path: projectNumber = activitiesSheet.cells(activityRow,7).value
    - step:
        id: '20'
        action: Script
        object_path: activityStatus = activitiesSheet.cells(activityRow,6).value
    - step:
        id: '21'
        action: Script
        object_path: If len(orderNumber) = 9 Then
    - step:
        id: '22'
        action: Script
        object_path: '''GET FULL WBS ELEMENT'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Maximize
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: Highlight
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013534"'
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '27'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '28'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(1) Then
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '31'
        action: Script
        object_path: End If
    - step:
        id: '32'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(1) Then
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '35'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '36'
        action: Script
        object_path: End If
    - step:
        id: '37'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: Set
    - step:
        id: '38'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Project")'
        action: Set
        args: projectNumber
    - step:
        id: '39'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
    - step:
        id: '40'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiEdit("Plan
          version 2")'
        action: Set
        args: '"est"'
    - step:
        id: '41'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiRadioButton("Graphical
          report output")'
        action: SetFocus
    - step:
        id: '42'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Selection: Plan 1/plan").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '43'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '44'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown
          Report").SAPGuiTree("TableTreeControl")
    - step:
        id: '45'
        object_path: tree
        action: OpenItemContextMenu
        args: '"PRJ "&projectNumber,"PRJ "&projectNumber'
    - step:
        id: '46'
        object_path: tree
        action: SelectMenuItemById
        args: '"&EXPAND"'
    - step:
        id: '47'
        object_path: tree
        action: SelectNode
        args: '"PRJ "&projectNumber'
    - step:
        id: '48'
        action: Script
        object_path: colKey_plan1 = getColNameFromTitle(tree, "Plan 2--Overall")
    - step:
        id: '49'
        action: Script
        object_path: rowContainingOrdNum = findBudget(tree, orderNumber)
    - step:
        id: '50'
        action: Script
        object_path: If Ubound(rowContainingOrdNum) = 1 Then
    - step:
        id: '51'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '52'
        action: Script
        object_path: WBSrow = rowContainingOrdNum(1)
    - step:
        id: '53'
        action: Script
        object_path: ElseIf Ubound(rowContainingOrdNum) = -1 Then
    - step:
        id: '54'
        action: Script
        object_path: WBSelement = ""
    - step:
        id: '55'
        action: Script
        object_path: emailContent = emailContent& "Order number and WBS element could
          not be found in SAP (Project Actual Cost, Labour Actual Cost, Material Actual
          Cost or Services Actual Cost could not be extracted). "
    - step:
        id: '56'
        action: Script
        object_path: Else
    - step:
        id: '57'
        action: Script
        object_path: WBSelement = rowContainingOrdNum(0)
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '60'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '61'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Execute Drilldown Report")
        action: SendKey
        args: ENTER
    - step:
        id: '62'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '63'
        action: Script
        object_path: If WBSelement <> "" Then
    - step:
        id: '64'
        action: Script
        object_path: '''ACTUAL LABOUR, MATERIALS AND SERVICES $'
    - step:
        id: '65'
        action: Script
        object_path: LabourCostElementGroups = Array("INT_LABOUR","CONS_CONTR")
    - step:
        id: '66'
        action: Script
        object_path: MaterialsCostElementGroups = Array("MATERIAL","MATL_ONCST")
    - step:
        id: '67'
        action: Script
        object_path: ServicesCostElementGroups = Array("SERVICES")
    - step:
        id: '68'
        action: Script
        object_path: planVersion = GetPlanVersion
    - step:
        id: '69'
        action: Script
        object_path: WBS = WBSsearch(WBSelement)
    - step:
        id: '70'
        action: Script
        object_path: For Each group in LabourCostElementGroups
    - step:
        id: '71'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '72'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '73'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '74'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '75'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '76'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '77'
        action: Script
        object_path: End If
    - step:
        id: '78'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '79'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '80'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '82'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '83'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '85'
        action: Script
        object_path: Else
    - step:
        id: '86'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '87'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '88'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '89'
        action: Script
        object_path: Found = 0
    - step:
        id: '90'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '91'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '92'
        action: Script
        object_path: If NodeText = ("ORD "&orderNumber) Then
    - step:
        id: '93'
        action: Script
        object_path: Found = 1
    - step:
        id: '94'
        action: Script
        object_path: Exit For
    - step:
        id: '95'
        action: Script
        object_path: End if
    - step:
        id: '96'
        action: Script
        object_path: Next
    - step:
        id: '97'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '98'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '99'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '100'
        action: Script
        object_path: LactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '101'
        action: Script
        object_path: If LactualCost = "" Then
    - step:
        id: '102'
        action: Script
        object_path: LactualCost = 0
    - step:
        id: '103'
        action: Script
        object_path: End If
    - step:
        id: '104'
        action: Script
        object_path: LactualCost = CDbl(LactualCost)
    - step:
        id: '105'
        action: Script
        object_path: labourActualCost = labourActualCost + LactualCost
    - step:
        id: '106'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '107'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '108'
        action: Script
        object_path: Else
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
        object_path: End  If
    - step:
        id: '112'
        action: Script
        object_path: End  If
    - step:
        id: '113'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '114'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").Exist(1)
          = False Then
    - step:
        id: '115'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '116'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        action: Script
        object_path: Next
    - step:
        id: '119'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '120'
        action: Script
        object_path: For Each group in MaterialsCostElementGroups
    - step:
        id: '121'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '122'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '123'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '124'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '125'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '126'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '127'
        action: Script
        object_path: End If
    - step:
        id: '128'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '129'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '130'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '131'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '132'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '133'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '134'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '135'
        action: Script
        object_path: Else
    - step:
        id: '136'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '137'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '138'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '139'
        action: Script
        object_path: Found = 0
    - step:
        id: '140'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '141'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '142'
        action: Script
        object_path: If NodeText = ("ORD "&orderNumber) Then
    - step:
        id: '143'
        action: Script
        object_path: Found = 1
    - step:
        id: '144'
        action: Script
        object_path: Exit For
    - step:
        id: '145'
        action: Script
        object_path: End if
    - step:
        id: '146'
        action: Script
        object_path: Next
    - step:
        id: '147'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '148'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '149'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '150'
        action: Script
        object_path: MactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '151'
        action: Script
        object_path: If MactualCost = "" Then
    - step:
        id: '152'
        action: Script
        object_path: MactualCost = 0
    - step:
        id: '153'
        action: Script
        object_path: End If
    - step:
        id: '154'
        action: Script
        object_path: MactualCost = CDbl(MactualCost)
    - step:
        id: '155'
        action: Script
        object_path: materialActualCost = materialActualCost + MactualCost
    - step:
        id: '156'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '157'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '158'
        action: Script
        object_path: Else
    - step:
        id: '159'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '160'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '161'
        action: Script
        object_path: End If
    - step:
        id: '162'
        action: Script
        object_path: End If
    - step:
        id: '163'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '164'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").Exist(1)
          = False Then
    - step:
        id: '165'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '166'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '167'
        action: Script
        object_path: End If
    - step:
        id: '168'
        action: Script
        object_path: Next
    - step:
        id: '169'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '170'
        action: Script
        object_path: For Each group in ServicesCostElementGroups
    - step:
        id: '171'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nS_ALR_87013543"'
    - step:
        id: '172'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '173'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2").Exist(1) Then
    - step:
        id: '174'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof._2")
        action: Set
        args: '"000000000001"'
    - step:
        id: '175'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '176'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '177'
        action: Script
        object_path: End If
    - step:
        id: '178'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projectNumber
    - step:
        id: '179'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Network/order")
        action: Set
        args: '""'
    - step:
        id: '180'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Plan
          Version")
        action: Set
        args: planVersion
    - step:
        id: '181'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: group
    - step:
        id: '182'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '183'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Report
          contains no data").Exist(1) Then
    - step:
        id: '184'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '185'
        action: Script
        object_path: Else
    - step:
        id: '186'
        action: Script
        object_path: Set TreeObj = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl").Object
    - step:
        id: '187'
        action: Script
        object_path: Set AllValues = TreeObj.GetAllNodeKeys
    - step:
        id: '188'
        action: Script
        object_path: Count = AllValues.Count
    - step:
        id: '189'
        action: Script
        object_path: Found = 0
    - step:
        id: '190'
        action: Script
        object_path: For i = 0 to Count-1
    - step:
        id: '191'
        action: Script
        object_path: NodeText = TreeObj.GetNodeTextByKey(AllValues(i))
    - step:
        id: '192'
        action: Script
        object_path: If NodeText = ("ORD "&orderNumber) Then
    - step:
        id: '193'
        action: Script
        object_path: Found = 1
    - step:
        id: '194'
        action: Script
        object_path: Exit For
    - step:
        id: '195'
        action: Script
        object_path: End if
    - step:
        id: '196'
        action: Script
        object_path: Next
    - step:
        id: '197'
        action: Script
        object_path: If Found = 1 Then
    - step:
        id: '198'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiTree("TableTreeControl")
        action: SelectNode
        args: WBS
    - step:
        id: '199'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: SHIFT_F10
    - step:
        id: '200'
        action: Script
        object_path: SactualCost = SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiLabel("Actual").GetROProperty("content")
    - step:
        id: '201'
        action: Script
        object_path: If SactualCost = "" Then
    - step:
        id: '202'
        action: Script
        object_path: SactualCost = 0
    - step:
        id: '203'
        action: Script
        object_path: End If
    - step:
        id: '204'
        action: Script
        object_path: SactualCost = CDbl(SactualCost)
    - step:
        id: '205'
        action: Script
        object_path: servicesActualCost = servicesActualCost + SactualCost
    - step:
        id: '206'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '207'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '208'
        action: Script
        object_path: Else
    - step:
        id: '209'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '210'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Exit Report").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '211'
        action: Script
        object_path: End  If
    - step:
        id: '212'
        action: Script
        object_path: End  If
    - step:
        id: '213'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '214'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").Exist(1)
          = False Then
    - step:
        id: '215'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '216'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '217'
        action: Script
        object_path: End If
    - step:
        id: '218'
        action: Script
        object_path: Next
    - step:
        id: '219'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '220'
        action: Script
        object_path: If labourActualCost = 0 or labourActualCost = "" Then
    - step:
        id: '221'
        action: Script
        object_path: emailContent = emailContent& "Labour Actual Cost not found. "
    - step:
        id: '222'
        action: Script
        object_path: labourActualCost = 0
    - step:
        id: '223'
        action: Script
        object_path: End If
    - step:
        id: '224'
        action: Script
        object_path: If materialActualCost = 0 or aterialActualCost = "" Then
    - step:
        id: '225'
        action: Script
        object_path: emailContent = emailContent& "Material Actual Cost not found.
          "
    - step:
        id: '226'
        action: Script
        object_path: materialActualCost = 0
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: If servicesActualCost = 0 or servicesActualCost = "" Then
    - step:
        id: '229'
        action: Script
        object_path: emailContent = emailContent& "Services Actual Cost not found.
          "
    - step:
        id: '230'
        action: Script
        object_path: servicesActualCost = 0
    - step:
        id: '231'
        action: Script
        object_path: End If
    - step:
        id: '232'
        action: Script
        object_path: Else
    - step:
        id: '233'
        action: Script
        object_path: labourActualCost = 0
    - step:
        id: '234'
        action: Script
        object_path: materialActualCost = 0
    - step:
        id: '235'
        action: Script
        object_path: servicesActualCost = 0
    - step:
        id: '236'
        action: Script
        object_path: End  If
    - step:
        id: '237'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '238'
        action: Script
        object_path: '''ACTUAL PROJECT COST'
    - step:
        id: '239'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("Transaction")
        action: Set
        args: '"/nIW33"'
    - step:
        id: '240'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
    - step:
        id: '241'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiEdit("Order")'
        action: Set
        args: orderNumber
    - step:
        id: '242'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '243'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Costs"'
    - step:
        id: '244'
        action: Script
        object_path: systemStatus = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiEdit("Sys.Status").GetROProperty("value")
    - step:
        id: '245'
        action: Script
        object_path: If InStr(systemStatus,"CNF") or InStr(systemStatus,"PCNF") Then
    - step:
        id: '246'
        action: Script
        object_path: Set tree = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTree("TableTreeControl")
    - step:
        id: '247'
        object_path: tree
        action: SelectNode
        args: '"Costs"'
    - step:
        id: '248'
        action: Script
        object_path: nodeKey = tree.Object.SelectedItemNode
    - step:
        id: '249'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '250'
        action: Script
        object_path: For i = 0 to columnNames.Length - 1
    - step:
        id: '251'
        action: Script
        object_path: columnName = columnNames.ElementAt(i)
    - step:
        id: '252'
        action: Script
        object_path: itemText = tree.Object.GetItemText(nodeKey, columnName)
    - step:
        id: '253'
        action: Script
        object_path: If columnName = "C          8" Then
    - step:
        id: '254'
        action: Script
        object_path: actualProjectCost = itemText
    - step:
        id: '255'
        action: Script
        object_path: If actualProjectCost = 0 Then
    - step:
        id: '256'
        action: Script
        object_path: emailContent = emailContent& "Actual Project cost not found.
          "
    - step:
        id: '257'
        action: Script
        object_path: End If
    - step:
        id: '258'
        action: Script
        object_path: Exit For
    - step:
        id: '259'
        action: Script
        object_path: End If
    - step:
        id: '260'
        action: Script
        object_path: Next
    - step:
        id: '261'
        action: Script
        object_path: Else
    - step:
        id: '262'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '263'
        action: Script
        object_path: emailContent = emailContent& "Project Actual Cost not found.
          "
    - step:
        id: '264'
        action: Script
        object_path: End If
    - step:
        id: '265'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTabStrip("TabMenu")
        action: Select
        args: '"Operations"'
    - step:
        id: '266'
        action: Script
        object_path: '''ACTUAL LABOUR HOURS + EMPLOYEE HOURS'
    - step:
        id: '267'
        action: Script
        object_path: labourRow = SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").RowCount
    - step:
        id: '268'
        action: Script
        object_path: '''DateOfTimeEntry = ""'
    - step:
        id: '269'
        action: Script
        object_path: earliestDate = ""
    - step:
        id: '270'
        action: Script
        object_path: For i = 1 To labourRow
    - step:
        id: '271'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiTable("OperationsTable").ValidRow(i) Then
    - step:
        id: '272'
        action: Script
        object_path: controlKeyValue = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Control key")
    - step:
        id: '273'
        action: Script
        object_path: If controlKeyValue = "INSU" or controlKeyValue = "SOPL" Then
    - step:
        id: '274'
        action: Script
        object_path: labourHours = SAPGuiSession("Session").SAPGuiWindow("Display
          Contestable -").SAPGuiTable("OperationsTable").GetCellData(i, "Actual work")
    - step:
        id: '275'
        action: Script
        object_path: If labourHours = "" Then
    - step:
        id: '276'
        action: Script
        object_path: labourHours = 0
    - step:
        id: '277'
        action: Script
        object_path: End If
    - step:
        id: '278'
        action: Script
        object_path: totalLabour = totalLabour + CDbl(labourHours)
    - step:
        id: '279'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiTable("OperationsTable")
        action: SelectRow
        args: i
    - step:
        id: '280'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Act.
          Data")
        action: Click
    - step:
        id: '281'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Confirmations
          List")
        action: Click
    - step:
        id: '282'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(1) = false Then
    - step:
        id: '283'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiElement("Confirmation
          Data").Exist(1) = False Then
    - step:
        id: '284'
        action: Script
        object_path: employeeR = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").RowCount
    - step:
        id: '285'
        action: Script
        object_path: '''DateOfTimeEntry = Array()'
    - step:
        id: '286'
        action: Script
        object_path: earliestDate = Date()
    - step:
        id: '287'
        action: Script
        object_path: For r = 1 To employeeR
    - step:
        id: '288'
        action: Script
        object_path: empNumber = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Personnel number")
    - step:
        id: '289'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Name of employee")
    - step:
        id: '290'
        action: Script
        object_path: empHrs = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,
          "Actual work")
    - step:
        id: '291'
        action: Script
        object_path: empHrs = CDbl(empHrs)
    - step:
        id: '292'
        action: Script
        object_path: dateOfEntry = SAPGuiSession("Session").SAPGuiWindow("Display
          Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r,"Actual Execution
          Start Date")
    - step:
        id: '293'
        action: Script
        object_path: If len(empNumber) = 5 Then
    - step:
        id: '294'
        action: Script
        object_path: empNumber = "000"&empNumber
    - step:
        id: '295'
        action: Script
        object_path: ElseIf len(empNumber) = 6 Then
    - step:
        id: '296'
        action: Script
        object_path: empNumber = "00"&empNumber
    - step:
        id: '297'
        action: Script
        object_path: Elseif len(empNumber) = 7 Then
    - step:
        id: '298'
        action: Script
        object_path: empNumber = "0"&empNumber
    - step:
        id: '299'
        action: Script
        object_path: End If
    - step:
        id: '300'
        action: Script
        object_path: If empNumber <> "" and empHrs <> "" and empName = "" Then
    - step:
        id: '301'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '302'
        action: Script
        object_path: ''' ADD TO EXISTING ROW'
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
        object_path: employeeID = resourcesSheet.cells(resourceRow,10).value
    - step:
        id: '307'
        action: Script
        object_path: If empNumber = employeeID Then
    - step:
        id: '308'
        object_path: resourcesSheet.cells(resourceRow,13)
        action: value
        args: = empHrs
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
        object_path: ''' ADD A NEW ROW IF EMPLOYEE NOT FOUND'
    - step:
        id: '316'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '317'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '318'
        action: Script
        object_path: empName = SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiGrid("EmployeeTable").GetCellData(r+1,
          "Name of employee")
    - step:
        id: '319'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '320'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = empName
    - step:
        id: '321'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = empNumber
    - step:
        id: '322'
        object_path: resourcesSheet.cells(resourcesRowCount,13)
        action: value
        args: = empHrs
    - step:
        id: '323'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '324'
        action: Script
        object_path: End If
    - step:
        id: '325'
        action: Script
        object_path: End If
    - step:
        id: '326'
        action: Script
        object_path: If dateOfEntry <> "" Then
    - step:
        id: '327'
        action: Script
        object_path: dateOfEntry = replace(dateOfEntry,".", "-")
    - step:
        id: '328'
        action: Script
        object_path: dateOfEntry = CDate(dateOfEntry)
    - step:
        id: '329'
        action: Script
        object_path: If dateOfEntry < earliestDate Then
    - step:
        id: '330'
        action: Script
        object_path: earliestDate = dateOfEntry
    - step:
        id: '331'
        action: Script
        object_path: End If
    - step:
        id: '332'
        action: Script
        object_path: '''ReDim Preserve DateOfTimeEntry(UBound(DateOfTimeEntry) + 1)'
    - step:
        id: '333'
        action: Script
        object_path: '''DateOfTimeEntry(UBound(DateOfTimeEntry)) = dateOfEntry'
    - step:
        id: '334'
        action: Script
        object_path: End If
    - step:
        id: '335'
        action: Script
        object_path: Next
    - step:
        id: '336'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Confirmations").SAPGuiButton("Back")
        action: Click
    - step:
        id: '337'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '338'
        action: Script
        object_path: Else
    - step:
        id: '339'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display PM Order Confirmation:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '340'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '341'
        action: Script
        object_path: End If
    - step:
        id: '342'
        action: Script
        object_path: Else
    - step:
        id: '343'
        action: Script
        object_path: noEmpHoursFound = true
    - step:
        id: '344'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiButton("Back")
        action: Click
    - step:
        id: '345'
        action: Script
        object_path: End If
    - step:
        id: '346'
        action: Script
        object_path: End  If
    - step:
        id: '347'
        action: Script
        object_path: Else
    - step:
        id: '348'
        action: Script
        object_path: Exit For
    - step:
        id: '349'
        action: Script
        object_path: End  If
    - step:
        id: '350'
        action: Script
        object_path: Next
    - step:
        id: '351'
        action: Script
        object_path: If earliestDate = "" Then
    - step:
        id: '352'
        action: Script
        object_path: newStartDate = ""
    - step:
        id: '353'
        action: Script
        object_path: Else
    - step:
        id: '354'
        action: Script
        object_path: newStart = earliestDate
    - step:
        id: '355'
        action: Script
        object_path: dayDate = Day(newStart)
    - step:
        id: '356'
        action: Script
        object_path: If len(dayDate) = 1 Then
    - step:
        id: '357'
        action: Script
        object_path: dayDate = "0"&dayDate
    - step:
        id: '358'
        action: Script
        object_path: End If
    - step:
        id: '359'
        action: Script
        object_path: monthDate = Month(newStart)
    - step:
        id: '360'
        action: Script
        object_path: If len(monthDate) = 1 Then
    - step:
        id: '361'
        action: Script
        object_path: monthDate = "0"&monthDate
    - step:
        id: '362'
        action: Script
        object_path: End If
    - step:
        id: '363'
        action: Script
        object_path: yearDate = Year(newStart)
    - step:
        id: '364'
        action: Script
        object_path: newStartDate = yearDate&"-"&monthDate&"-"&dayDate&"T00:00:00"
    - step:
        id: '365'
        action: Script
        object_path: End If
    - step:
        id: '366'
        action: Script
        object_path: '''If VarType(DateOfTimeEntry) = 8 Then'
    - step:
        id: '367'
        action: Script
        object_path: "'\tnewStartDate = \"\""
    - step:
        id: '368'
        action: Script
        object_path: '''Else'
    - step:
        id: '369'
        action: Script
        object_path: "'\tBubbleSort DateOfTimeEntry"
    - step:
        id: '370'
        action: Script
        object_path: "'\tnewStart = DateOfTimeEntry(0)"
    - step:
        id: '371'
        action: Script
        object_path: "'\tdayDate = Day(newStart)"
    - step:
        id: '372'
        action: Script
        object_path: "'\tIf len(dayDate) = 1 Then"
    - step:
        id: '373'
        action: Script
        object_path: "'\t\tdayDate = \"0\"&dayDate"
    - step:
        id: '374'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '375'
        action: Script
        object_path: "'\tmonthDate = Month(newStart)"
    - step:
        id: '376'
        action: Script
        object_path: "'\tIf len(monthDate) = 1 Then"
    - step:
        id: '377'
        action: Script
        object_path: "'\t\tmonthDate = \"0\"&monthDate"
    - step:
        id: '378'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '379'
        action: Script
        object_path: "'\tyearDate = Year(newStart)"
    - step:
        id: '380'
        action: Script
        object_path: "'\tnewStartDate = yearDate&\"-\"&monthDate&\"-\"&dayDate&\"\
          T00:00:00\""
    - step:
        id: '381'
        action: Script
        object_path: '''End If'
    - step:
        id: '382'
        action: Script
        object_path: '''get back to SAP home screen, ready for next iteration'
    - step:
        id: '383'
        action: Script
        object_path: If SAPGuiSession("Session").Exist(3) = False Then
    - step:
        id: '384'
        action: Script
        object_path: Call OpenSAP(Parameter("sapuser"), Parameter("sappass"), "PRD",
          "ERP")
    - step:
        id: '385'
        action: Script
        object_path: Else
    - step:
        id: '386'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '387'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Contestable -")
        action: SendKey
        args: ENTER
    - step:
        id: '388'
        action: Script
        object_path: End If
    - step:
        id: '389'
        action: Script
        object_path: '''If SAPGuiSession("Session").SAPGuiWindow("Display Contestable
          -").SAPGuiStatusBar("StatusBar").Exist(1) Then'
    - step:
        id: '390'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Display Contestable\
          \ -\").SAPGuiOKCode(\"OKCode\").Set \"/nIW33\""
    - step:
        id: '391'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Display Contestable\
          \ -\").SendKey ENTER"
    - step:
        id: '392'
        action: Script
        object_path: '''Else'
    - step:
        id: '393'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Display Contestable\
          \ -\").SAPGuiOKCode(\"OKCode\").Set \"/nIW33\""
    - step:
        id: '394'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Display Contestable\
          \ -\").SendKey ENTER"
    - step:
        id: '395'
        action: Script
        object_path: '''End If'
    - step:
        id: '396'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Display Order: Initial").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '397'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '398'
        action: Script
        object_path: If activityStatus = "Not Started" and (actualProjectCost <> 0
          or labourActualCost <> 0 or materialActualCost <> 0 or servicesActualCost
          <> 0 or totalLabour <> 0) Then
    - step:
        id: '399'
        action: Script
        object_path: 'emailContent = "Activity Status is set to Not Started however
          actual values have been found and updated in P6: Project Actual Cost: $"
          & actualProjectCost & ", Labour Actual Cost: $" &labourActualCost &", Material
          Actual Cost: $" &materialActualCost &", Services Actual Cost: $" &servicesActualCost&",
          Labour Total Hours: "&totalLabour &". "'
    - step:
        id: '400'
        action: Script
        object_path: End If
    - step:
        id: '401'
        object_path: activitiesSheet.cells(activityRow,13)
        action: value
        args: = emailContent
    - step:
        id: '402'
        action: Script
        object_path: ''''''''' 4/4/23 - team requested to remove the actuals labour
          inputs.'
    - step:
        id: '403'
        action: Script
        object_path: "'\t\t' ADD LABOUR TO EXCEL"
    - step:
        id: '404'
        action: Script
        object_path: "'\t\tresourceAdded = False"
    - step:
        id: '405'
        action: Script
        object_path: "'\t\tFor resourceRow = 2 To resourcesRowCount"
    - step:
        id: '406'
        action: Script
        object_path: "'\t\t\tactivityID2 = resourcesSheet.cells(resourceRow,1).value"
    - step:
        id: '407'
        action: Script
        object_path: "'\t\t\tIf activityID2 = activityID Then"
    - step:
        id: '408'
        action: Script
        object_path: "'\t\t\t\tresourceName = resourcesSheet.cells(resourceRow,10).value"
    - step:
        id: '409'
        action: Script
        object_path: "'\t\t\t\tIf resourceName = \"Labour\" Then"
    - step:
        id: '410'
        action: Script
        object_path: "'\t\t\t\t\tresourcesSheet.cells(resourceRow,12).value = labourActualCost"
    - step:
        id: '411'
        action: Script
        object_path: "'\t\t\t\t\tresourcesSheet.cells(resourceRow,13).value = totalLabour"
    - step:
        id: '412'
        action: Script
        object_path: "'\t\t\t\t\tresourcesWorkbook.save"
    - step:
        id: '413'
        action: Script
        object_path: "'\t\t\t\t\tresourceAdded = True"
    - step:
        id: '414'
        action: Script
        object_path: "'\t\t\t\t\tExit For"
    - step:
        id: '415'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '416'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '417'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '418'
        action: Script
        object_path: "'\t\tIf resourceAdded = False Then"
    - step:
        id: '419'
        action: Script
        object_path: "'\t\t\tresourcesRowCount = resourcesRowCount + 1"
    - step:
        id: '420'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,1).value = activityID"
    - step:
        id: '421'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,8).value = \"\
          Labour Resource\""
    - step:
        id: '422'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,10).value = \"\
          Labour\""
    - step:
        id: '423'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,11).value = \"\
          false\""
    - step:
        id: '424'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,12).value = labourActualCost"
    - step:
        id: '425'
        action: Script
        object_path: "'\t\t\tresourcesSheet.cells(resourcesRowCount,13).value = totalLabour"
    - step:
        id: '426'
        action: Script
        object_path: "'\t\t\tresourcesWorkbook.save"
    - step:
        id: '427'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '428'
        action: Script
        object_path: ''' ADD MATERIAL TO EXCEL'
    - step:
        id: '429'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '430'
        action: Script
        object_path: For resourceRow = 2 To resourcesRowCount
    - step:
        id: '431'
        action: Script
        object_path: activityID2 = resourcesSheet.cells(resourceRow,1).value
    - step:
        id: '432'
        action: Script
        object_path: If activityID2 = activityID Then
    - step:
        id: '433'
        action: Script
        object_path: resourceName = resourcesSheet.cells(resourceRow,10).value
    - step:
        id: '434'
        action: Script
        object_path: If resourceName = "Material" Then
    - step:
        id: '435'
        object_path: resourcesSheet.cells(resourceRow,12)
        action: value
        args: = materialActualCost
    - step:
        id: '436'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '437'
        action: Script
        object_path: resourceAdded = True
    - step:
        id: '438'
        action: Script
        object_path: Exit For
    - step:
        id: '439'
        action: Script
        object_path: End If
    - step:
        id: '440'
        action: Script
        object_path: End If
    - step:
        id: '441'
        action: Script
        object_path: Next
    - step:
        id: '442'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '443'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '444'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '445'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = "Material Resource"
    - step:
        id: '446'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = "Material"
    - step:
        id: '447'
        object_path: resourcesSheet.cells(resourcesRowCount,11)
        action: value
        args: = "false"
    - step:
        id: '448'
        object_path: resourcesSheet.cells(resourcesRowCount,12)
        action: value
        args: = materialActualCost
    - step:
        id: '449'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '450'
        action: Script
        object_path: End If
    - step:
        id: '451'
        action: Script
        object_path: ''' ADD SERVICES TO EXCEL'
    - step:
        id: '452'
        action: Script
        object_path: resourceAdded = False
    - step:
        id: '453'
        action: Script
        object_path: For resourceRow = 2 To resourcesRowCount
    - step:
        id: '454'
        action: Script
        object_path: activityID2 = resourcesSheet.cells(resourceRow,1).value
    - step:
        id: '455'
        action: Script
        object_path: If activityID2 = activityID Then
    - step:
        id: '456'
        action: Script
        object_path: resourceName = resourcesSheet.cells(resourceRow,10).value
    - step:
        id: '457'
        action: Script
        object_path: If resourceName = "Services" Then
    - step:
        id: '458'
        object_path: resourcesSheet.cells(resourceRow,12)
        action: value
        args: = servicesActualCost
    - step:
        id: '459'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '460'
        action: Script
        object_path: resourceAdded = True
    - step:
        id: '461'
        action: Script
        object_path: Exit For
    - step:
        id: '462'
        action: Script
        object_path: End If
    - step:
        id: '463'
        action: Script
        object_path: End If
    - step:
        id: '464'
        action: Script
        object_path: Next
    - step:
        id: '465'
        action: Script
        object_path: If resourceAdded = False Then
    - step:
        id: '466'
        action: Script
        object_path: resourcesRowCount = resourcesRowCount + 1
    - step:
        id: '467'
        object_path: resourcesSheet.cells(resourcesRowCount,1)
        action: value
        args: = activityID
    - step:
        id: '468'
        object_path: resourcesSheet.cells(resourcesRowCount,8)
        action: value
        args: = "Services Resource"
    - step:
        id: '469'
        object_path: resourcesSheet.cells(resourcesRowCount,10)
        action: value
        args: = "Services"
    - step:
        id: '470'
        object_path: resourcesSheet.cells(resourcesRowCount,11)
        action: value
        args: = "false"
    - step:
        id: '471'
        object_path: resourcesSheet.cells(resourcesRowCount,12)
        action: value
        args: = servicesActualCost
    - step:
        id: '472'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '473'
        action: Script
        object_path: End If
    - step:
        id: '474'
        object_path: activitiesSheet.cells(activityRow,10)
        action: value
        args: = actualProjectCost
    - step:
        id: '475'
        object_path: activitiesSheet.cells(activityRow,11)
        action: value
        args: = totalLabour
    - step:
        id: '476'
        object_path: activitiesSheet.cells(activityRow,12)
        action: value
        args: = newStartDate
    - step:
        id: '477'
        object_path: activitiesWorkbook
        action: save
    - step:
        id: '478'
        action: Script
        object_path: Call ClearVariables
    - step:
        id: '479'
        action: Script
        object_path: End If
    - step:
        id: '480'
        action: Script
        object_path: Next
    - step:
        id: '481'
        object_path: resourcesWorkbook
        action: save
    - step:
        id: '482'
        object_path: activitiesWorkbook
        action: save
    - step:
        id: '483'
        object_path: resourcesWorkbook
        action: close
    - step:
        id: '484'
        object_path: activitiesWorkbook
        action: close
    - step:
        id: '485'
        object_path: objExcel
        action: quit
    - step:
        id: '486'
        action: Script
        object_path: '''****************************************************************FUNCTIONS*********************************************************************'''
    - step:
        id: '487'
        action: Script
        object_path: '''expand sap trees'
    - step:
        id: '488'
        action: Script
        object_path: Function getColNameFromTitle(tree, title)
    - step:
        id: '489'
        action: Script
        object_path: Set colNames = tree.Object.GetColumnNames
    - step:
        id: '490'
        action: Script
        object_path: For i = 1 To (colNames.length-1)
    - step:
        id: '491'
        action: Script
        object_path: selectedColTitle = tree.Object.GetColumnTitleFromName(colNames(i))
    - step:
        id: '492'
        action: Script
        object_path: If selectedColTitle = title Then
    - step:
        id: '493'
        action: Script
        object_path: getColNameFromTitle = colNames(i)
    - step:
        id: '494'
        action: Script
        object_path: Exit For
    - step:
        id: '495'
        action: Script
        object_path: End If
    - step:
        id: '496'
        action: Script
        object_path: Next
    - step:
        id: '497'
        action: Script
        object_path: End Function
    - step:
        id: '498'
        action: Script
        object_path: '''find order number'
    - step:
        id: '499'
        action: Script
        object_path: Function findBudget(tree, orderNumber)
    - step:
        id: '500'
        action: Script
        object_path: rowContainingOrdNum = Array()
    - step:
        id: '501'
        action: Script
        object_path: Set columnNames = tree.Object.GetColumnNames()
    - step:
        id: '502'
        action: Script
        object_path: set columnKeys = tree.Object.GetColumnCol(columnNames(0))
    - step:
        id: '503'
        action: Script
        object_path: For i = 1 To (columnKeys.length-1)
    - step:
        id: '504'
        action: Script
        object_path: If InStr(columnKeys(i), orderNumber) > 0 Then
    - step:
        id: '505'
        action: Script
        object_path: If InStr(columnKeys(i-1), "WBS") > 0 Then
    - step:
        id: '506'
        action: Script
        object_path: If InStr(columnKeys(i+1), "WBS") > 0 or InStr(columnKeys(i+1),
          "Result") > 0 Then
    - step:
        id: '507'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '508'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '509'
        action: Script
        object_path: AddItem rowContainingOrdNum, i
    - step:
        id: '510'
        action: Script
        object_path: Exit For
    - step:
        id: '511'
        action: Script
        object_path: ElseIf InStr(columnKeys(i+1), "ORD") > 0 Then
    - step:
        id: '512'
        action: Script
        object_path: WBSelement = columnKeys(i-1)
    - step:
        id: '513'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '514'
        action: Script
        object_path: End If
    - step:
        id: '515'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-1), "ORD") > 0 Then
    - step:
        id: '516'
        action: Script
        object_path: If InStr(columnKeys(i-2), "WBS") > 0 Then
    - step:
        id: '517'
        action: Script
        object_path: WBSelement = columnKeys(i-2)
    - step:
        id: '518'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '519'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-3), "WBS") > 0 Then
    - step:
        id: '520'
        action: Script
        object_path: WBSelement = columnKeys(i-3)
    - step:
        id: '521'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '522'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-4), "WBS") > 0 Then
    - step:
        id: '523'
        action: Script
        object_path: WBSelement = columnKeys(i-4)
    - step:
        id: '524'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '525'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-5), "WBS") > 0 Then
    - step:
        id: '526'
        action: Script
        object_path: WBSelement = columnKeys(i-5)
    - step:
        id: '527'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '528'
        action: Script
        object_path: ElseIf InStr(columnKeys(i-6), "WBS") > 0 Then
    - step:
        id: '529'
        action: Script
        object_path: WBSelement = columnKeys(i-6)
    - step:
        id: '530'
        action: Script
        object_path: AddItem rowContainingOrdNum, WBSelement
    - step:
        id: '531'
        action: Script
        object_path: End If
    - step:
        id: '532'
        action: Script
        object_path: End If
    - step:
        id: '533'
        action: Script
        object_path: End If
    - step:
        id: '534'
        action: Script
        object_path: Next
    - step:
        id: '535'
        action: Script
        object_path: findBudget = rowContainingOrdNum
    - step:
        id: '536'
        action: Script
        object_path: End Function
    - step:
        id: '537'
        action: Script
        object_path: Function AddItem(arr, val)
    - step:
        id: '538'
        action: Script
        object_path: ReDim Preserve arr(UBound(arr) + 1)
    - step:
        id: '539'
        action: Script
        object_path: arr(UBound(arr)) = val
    - step:
        id: '540'
        action: Script
        object_path: AddItem = arr
    - step:
        id: '541'
        action: Script
        object_path: End Function
    - step:
        id: '542'
        action: Script
        object_path: '''sort the array of time entries'
    - step:
        id: '543'
        action: Script
        object_path: Function BubbleSort(DateOfEntry)
    - step:
        id: '544'
        action: Script
        object_path: Dim j, k, Temp
    - step:
        id: '545'
        action: Script
        object_path: For j = LBound(DateOfEntry) To UBound(DateOfEntry)
    - step:
        id: '546'
        action: Script
        object_path: For k = j + 1 To UBound(DateOfEntry)
    - step:
        id: '547'
        action: Script
        object_path: If (DateOfEntry(j) > DateOfEntry(k)) Then
    - step:
        id: '548'
        action: Script
        object_path: Temp = DateOfEntry(j)
    - step:
        id: '549'
        action: Script
        object_path: DateOfEntry(j) = DateOfEntry(k)
    - step:
        id: '550'
        action: Script
        object_path: DateOfEntry(k) = Temp
    - step:
        id: '551'
        action: Script
        object_path: End If
    - step:
        id: '552'
        action: Script
        object_path: Next
    - step:
        id: '553'
        action: Script
        object_path: Next
    - step:
        id: '554'
        action: Script
        object_path: DateOfTimeEntry = DateOfEntry
    - step:
        id: '555'
        action: Script
        object_path: End Function
    - step:
        id: '556'
        action: Script
        object_path: '''function to get plan version, Plan Version is month before
          current'
    - step:
        id: '557'
        action: Script
        object_path: Function GetPlanVersion()
    - step:
        id: '558'
        action: Script
        object_path: monthNum1 = Month(date)
    - step:
        id: '559'
        action: Script
        object_path: If monthNum1 = 1 Then
    - step:
        id: '560'
        action: Script
        object_path: monthNum = 12
    - step:
        id: '561'
        action: Script
        object_path: Else
    - step:
        id: '562'
        action: Script
        object_path: monthNum = monthNum1 - 1
    - step:
        id: '563'
        action: Script
        object_path: End If
    - step:
        id: '564'
        action: Script
        object_path: If len(monthNum) = 2 Then
    - step:
        id: '565'
        action: Script
        object_path: planVersion = "E"&monthNum
    - step:
        id: '566'
        action: Script
        object_path: Else
    - step:
        id: '567'
        action: Script
        object_path: planVersion = "E0"&monthNum
    - step:
        id: '568'
        action: Script
        object_path: End If
    - step:
        id: '569'
        action: Script
        object_path: GetPlanVersion = planVersion
    - step:
        id: '570'
        action: Script
        object_path: End Function
    - step:
        id: '571'
        action: Script
        object_path: '''get WBS search for table'
    - step:
        id: '572'
        action: Script
        object_path: Function WBSsearch(WBSelement)
    - step:
        id: '573'
        action: Script
        object_path: WBSelementSplit = Split(WBSelement,"-")
    - step:
        id: '574'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '575'
        action: Script
        object_path: For e = 1 to lengthOfSplit
    - step:
        id: '576'
        action: Script
        object_path: WBSelementSplit(e) = WBSelementSplit(e-1)&"-"&WBSelementSplit(e)
    - step:
        id: '577'
        action: Script
        object_path: Next
    - step:
        id: '578'
        action: Script
        object_path: Const removalIndex = 0
    - step:
        id: '579'
        action: Script
        object_path: For x=removalIndex To UBound(WBSelementSplit)-1
    - step:
        id: '580'
        action: Script
        object_path: WBSelementSplit(x) = WBSelementSplit(x + 1)
    - step:
        id: '581'
        action: Script
        object_path: Next
    - step:
        id: '582'
        action: Script
        object_path: ReDim Preserve WBSelementSplit(UBound(WBSelementSplit) - 1)
    - step:
        id: '583'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '584'
        action: Script
        object_path: lengthOfSplit = Ubound(WBSelementSplit)
    - step:
        id: '585'
        action: Script
        object_path: WBSsearch = "PRJ "&projectNumber
    - step:
        id: '586'
        action: Script
        object_path: If InStr(projectNumber,"CP") Then
    - step:
        id: '587'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '588'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '589'
        action: Script
        object_path: Next
    - step:
        id: '590'
        action: Script
        object_path: ElseIf InStr(projectNumber,"FS") Then
    - step:
        id: '591'
        action: Script
        object_path: For e1 = 1 To lengthOfSplit
    - step:
        id: '592'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '593'
        action: Script
        object_path: Next
    - step:
        id: '594'
        action: Script
        object_path: Else
    - step:
        id: '595'
        action: Script
        object_path: For e1 = 0 To lengthOfSplit
    - step:
        id: '596'
        action: Script
        object_path: WBSsearch = WBSsearch&";"&WBSelementSplit(e1)
    - step:
        id: '597'
        action: Script
        object_path: Next
    - step:
        id: '598'
        action: Script
        object_path: End If
    - step:
        id: '599'
        action: Script
        object_path: WBSsearch = WBSsearch&";ORD "&orderNumber
    - step:
        id: '600'
        action: Script
        object_path: End Function
    - step:
        id: '601'
        action: Script
        object_path: '''clear variables'
    - step:
        id: '602'
        action: Script
        object_path: Function ClearVariables
    - step:
        id: '603'
        action: Script
        object_path: LactualCost = 0
    - step:
        id: '604'
        action: Script
        object_path: labourActualCost = 0
    - step:
        id: '605'
        action: Script
        object_path: MactualCost = 0
    - step:
        id: '606'
        action: Script
        object_path: materialActualCost = 0
    - step:
        id: '607'
        action: Script
        object_path: SactualCost = 0
    - step:
        id: '608'
        action: Script
        object_path: servicesActualCost = 0
    - step:
        id: '609'
        action: Script
        object_path: actualProjectCost = 0
    - step:
        id: '610'
        action: Script
        object_path: labourHours = 0
    - step:
        id: '611'
        action: Script
        object_path: totalLabour = 0
    - step:
        id: '612'
        action: Script
        object_path: End Function
    - step:
        id: '613'
        action: Script
        object_path: '''open SAP'
    - step:
        id: '614'
        action: Script
        object_path: Function OpenSAP(user, pass, environment, system)
    - step:
        id: '615'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '616'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '617'
        action: Script
        object_path: If UCase(system) = "ISU" Then
    - step:
        id: '618'
        action: Script
        object_path: If UCase(environment) = "PRD" Then
    - step:
        id: '619'
        action: Script
        object_path: enviro = "SAP - ISU - EAP - Production (SSO)"
    - step:
        id: '620'
        action: Script
        object_path: client = "100"
    - step:
        id: '621'
        action: Script
        object_path: Else
    - step:
        id: '622'
        action: Script
        object_path: enviro = "SAP - ISU - EAQ (SSO)"
    - step:
        id: '623'
        action: Script
        object_path: client = "100"
    - step:
        id: '624'
        action: Script
        object_path: End If
    - step:
        id: '625'
        action: Script
        object_path: Else
    - step:
        id: '626'
        action: Script
        object_path: If UCase(environment) = "PRD" Then
    - step:
        id: '627'
        action: Script
        object_path: enviro = "ERP - PRD - Production"
    - step:
        id: '628'
        action: Script
        object_path: client = "410"
    - step:
        id: '629'
        action: Script
        object_path: Else
    - step:
        id: '630'
        action: Script
        object_path: enviro = "ERP - CAQ - Quality Assurance"
    - step:
        id: '631'
        action: Script
        object_path: client = "410"
    - step:
        id: '632'
        action: Script
        object_path: End If
    - step:
        id: '633'
        action: Script
        object_path: End If
    - step:
        id: '634'
        object_path: SystemUtil
        action: Run("saplogon.exe")
    - step:
        id: '635'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '636'
        object_path: SAPGuiUtil
        action: AutoLogon
        args: enviro, client, user, pass, ""
    - step:
        id: '637'
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
      last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WinMenu
              name: WinMenu2
              properties:
              - property:
                  value:
                    value: '2'
                    regular_expression: false
                  name: menuobjtype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinMenu
              name: WinMenu
              properties:
              - property:
                  value:
                    value: '2'
                    regular_expression: false
                  name: menuobjtype
                  hidden: false
                  read_only: false
                  type: NUMBER
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
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinList
              name: WinMenu
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinList
              name: File_2
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
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
                    value: Info
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: WinObject
          name: Message Bars
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
                value: Message Bars
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: Static
              name: Enable Editing
              properties:
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Enable Editing
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
                  value: text
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Dialog
          name: Save As
          properties:
          - property:
              value:
                value: Save As
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WinTreeView
              name: WinTreeView
              properties:
              - property:
                  value:
                    value: SysTreeView32
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
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: SysTreeView32
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinScrollBar
              name: WinScrollBar
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
                    value: ScrollBar
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
              basic_identification:
                property_ref:
                - window id
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: ScrollBar
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinObject
              name: Items View
              properties:
              - property:
                  value:
                    value: DirectUIHWND
                    regular_expression: false
                  name: regexpwndclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Items View
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects:
              - object:
                  class: WinList
                  name: Items View
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
                        value: Items View
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
                  last_update_time: Wednesday, 5 April 2023 4:18:50 PM
                  child_objects: []
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
                    value: 'File name:'
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinButton
              name: Save
              properties:
              - property:
                  value:
                    value: '&Save'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WinButton
              name: Cancel
              properties:
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
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
      custom_replay:
        behavior: ''
      comments: ''
      visual_relations:
        visual_relation: []
      last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display PM Order Confirmation:'
          properties:
          - property:
              value:
                value: IW43
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '3200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCORU
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: SAPGuiElement
              name: Confirmation Data
              properties:
              - property:
                  value:
                    value: RUECKMELDEDATEN
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '62'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/boxRUECKMELDEDATEN
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar_2
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Sys.Status
              properties:
              - property:
                  value:
                    value: CAUFVD-STTXT
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
                    value: wnd[0]/usr/subSUB_ALL:SAPLCOIH:3001/ssubSUB_LEVEL:SAPLCOIH:1107/subSUB_KOPF:SAPLCOIH:1108/txtCAUFVD-STTXT
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
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
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
  - object:
      class: Browser
      name: Primavera P6 - Activities
      properties:
      - property:
          value:
            value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF
              Stands (NW-016412) (Deferred to 2021)
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/authorize?client_id=00000003-0000-0ff1-ce00-000000000000&response_mode=form_post&protectedtoken=true&response_type=code+id_token&resource=00000003-0000-0ff1-ce00-000000000000&scope=openid&nonce=EFDA664BEE14CF4D567E6225E5050C33F0DAB75D8955DA0F-D806393BCC380B7E76D2AB726B36E5E071A7BB8BD06F5CC99EA10670435E284F&redirect_uri=https%3a%2f%2fsapowernetworks.sharepoint.com%2f_forms%2fdefault.aspx&claims=%7b%22id_token%22%3a%7b%22xms_cc%22%3a%7b%22values%22%3a%5b%22CP1%22%5d%7d%7d%7d&wsucxt=1&cobrandid=11bd8083-87e0-41b5-bb78-0bc43c8a8e8a&client-request-id=3702a29f-609b-0000-55d3-5f158ce8ed8d&sso_nonce=AwABAAAAAAABAOz_AwD0_-gbbHmaFI7HiglbXtcb9hd3BoFqPdOJDcB6D9SyDrtHfoARQjH1Nmdm3r4y8_kJ4MfUUqYnXpM9I2OaYPTt6AcgAA&mscrid=3702a29f-609b-0000-55d3-5f158ce8ed8d
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Working...
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
            value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser Upgrade+Cable/TF
              Stands (NW-016412) (Deferred to 2021)
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
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Wednesday, 5 April 2023 4:18:50 PM
      child_objects:
      - object:
          class: Page
          name: Primavera P6 - Enterprise_2
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?selectedItem=ARO111_7232
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '20013'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebTable
              name: SA Power Networks
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
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
              - property:
                  value:
                    value: pgbu-icon pgbu-icon-cog
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //TR[@role="row"][6]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/DIV[1]/I[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 5
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: No search results found.
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No search results found.
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
              - property:
                  value:
                    value: rowset-message-text
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/DIV[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[6]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-input-248
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Open Project
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="menuitem"]/A[normalize-space()="Open Project"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Open Project
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Open Project
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvprd612.utilities.etsa.net.au/p6/action/pm/projects?projectId=12910&wbsId=491866&ProjectName=null&selectedItem=ARO111_515875&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Enterprise
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?selectedItem=ARO111_301732
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '30012'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebMenu
              name: pgbu-dropdown-menu-259
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-dropdown-menu-259
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: dropdown-menu  pull-center disclosure select-menu
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: StartDate
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Reporting Only
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Reporting Only
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"]/TD[@role="rowheader" and normalize-space()="Reporting
                      Only"]/DIV[1]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: xpath
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 3grid-row-ARO10_652-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 7
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: PlannedFilter
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"][12]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 3grid-row-ARO10_667-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 8
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: ActualsFilter
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row"][11]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 3grid-row-ARO10_658-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 7
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  save-apply-btn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: FilterSave
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  save-apply-btn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Filters
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button"
                      and normalize-space()="Filters"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn dropdown-toggle filter-error-status-button active
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: FilterCancel
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-dark
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Open Project
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="menuitem"]/A[normalize-space()="Open Project"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Open Project
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Open Project
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Manage Filters...
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/UL[@role="menu"]/LI/A[@role="menuitem"
                      and normalize-space()="Manage Filters..."]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: manage-filters-btn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Close All
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="menuitem" and normalize-space()="Close All"]/A[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Close All
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Close All
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?&projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO111_7232#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: item-label
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - role
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Activities
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Activities of Booleroo Centre - 33kV Recloser
                  Upgrade+Cable/TF Stands (NW-016412) (Deferred to 2021)
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
                value: '10000'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebTree
              name: oui-tree-panel-115
              properties:
              - property:
                  value:
                    value: WebTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[@role="tree"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-.*
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-115
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: orcl-widget tree orcl-tree picker fill fluid filtered
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceName
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 10
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceAttributes
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 11
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ID_Code_Table
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ActivityDetails
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 5
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebList
              name: active-resource-view
              properties:
              - property:
                  value:
                    value: WebList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="active-resource-view"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: active-resource-view
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - class
                  - items count
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_4
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: location
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
              - property:
                  value:
                    value: pgbu-icon-small pgbu-icon-ent-activity
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //TD[@role="gridcell"]/DIV/DIV[normalize-space()="A1190"]/I[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
                - _xpath
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_3
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: toggle-children
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement_2
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
              - property:
                  value:
                    value: pgbu-icon-small pgbu-icon-tree-expanded
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[2]/I[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: I
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
              - property:
                  value:
                    value: pgbu-icon-small pgbu-icon-ent-activity
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                ordinal_identifier:
                  value: 0
                  type: location
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: UA
              properties:
              - property:
                  value:
                    value: '158'
                    regular_expression: false
                  name: width
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UA.*
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - width
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: TitleCell
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //TR[@role="row"][1]/TD[@role="gridcell"][1]/DIV[1]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Schedule... Actions
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: 'Schedule... Actions    Define Baselines Apply Actuals
                      Check Schedule Dissolve Import Create Import Template Import
                      from Excel Leveler Link Selected Activities Open Dependent Projects
                      Publish Projects Recalculate Assignment Costs Store Period Performance
                      Summarize Projects Views Automation View Select Field: Press
                      Down to show all options or type a letter to filter values.
                      Grid View Gantt View Activity Network View Progress Spotlight
                      (Ctrl+Alt+S) Filters Manage Filters... Clear All Filters Applied
                      Order Number is not empty Recent Full Screen Print Options Print
                      Options Customize View Enter a query to search.No filter applied'
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: btn-toolbar pane-toolbar
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Same resource could not
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Same resource could not be added because the project does
                      not permit the same resource to be assigned to an activity more
                      than once
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="alert-modal"]/DIV[2]/P[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: oui-calendar-36
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31
                      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
                      24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: oui-calendar-36
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: calendar dark-theme align-left
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: NoResultFound
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: oui-tree-panel-81-no-results
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: no-results
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No
                      results found"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: No results found Labour
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found Labour Labour Resource No results
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: tree-items no-scroll
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[@role="tree"][1]/DIV[3]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: master-panel
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Schedule... Actions.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: master-panel
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - visible
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Labour
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Labour
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: col
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: gantt-0-bar-vertical-scroller
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: gantt-0-bar-vertical-scroller
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pseudo-scroller vertical
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[7]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Download
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Download
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: grid-status-bar adjust-for-context-menu
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation"
                      and normalize-space()="Download"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - visible
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Calendar
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: January 2020
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: LABEL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-calendar-label-33
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: title
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading"
                      and normalize-space()="January 2020"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Assignments
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Assignments
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: activity-panel
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: 3grid-scroller-vertical-assignments
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: 3grid-scroller-vertical-assignmentsRowset
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pseudo-scroller vertical
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[17]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 3
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: WebEdit
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
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
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '255'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - visible
                - type
                - name
                - html tag
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-typeahead-108
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: ResourceValue
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 2grid-row-ARO27_577308-col-SyncUnitsFromCost-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: ‹
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  proceedModal
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Views
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox"
                      and normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-input-110
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Views
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Today
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-small btn-blue-light today
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save View
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn save-view-button unsaved btn-action
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
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
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action save-button unsaved
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: OK
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/BUTTON[normalize-space()="OK"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  proceedModal
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Got It
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="okBtn"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Got It
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Got It
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: okBtn
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel_2
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="lwfactivities"]/DIV[@role="main"][1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
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
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-dark  cancel-button
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - visible
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-dark
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign...
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button"
                      and normalize-space()="Assign..."]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light dropdown-toggle
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action modal-accept
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Resource
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="menuitem" and normalize-space()="Resource"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Resource
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Resource
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: ExpandCollapseDock
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/A[normalize-space()="Expand Dock"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
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
                    value: Expand Dock
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: collapse-handle
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Details
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - innertext
                - html tag
                - html id
                - class
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Download
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV[@role="treegrid"]/DIV[@role="presentation"]/DIV/DIV/A[normalize-space()="Download"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Download
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Download
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084779&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Automation View
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"]/A[normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Assignments
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Assignments
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: tab
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assignments
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=11082&wbsId=384558&ProjectName=null&selectedItem=ARO2_1084776&checkTabs=true#assignments-tab
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: activity-panel
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - role
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: All Resources
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@id="active-resource-view-AR"]/A[normalize-space()="All
                      Resources"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM_2
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
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvprd612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
                value: '150014'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebButton
              name: Prod - Enerven
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Prod - Enerven
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Prod - Enerven
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Prod - Field Services
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"][2]/A[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Prod - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Prod - Field Services
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvprd612.utilities.etsa.net.au/p6/action/login#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
                value: '60022'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebList
              name: databaseId
              properties:
              - property:
                  value:
                    value: WebList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: QAS - Field Services
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Database
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: QAS - Field Services
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"]/A[normalize-space()="QAS - Field Services"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Advanced
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //A[@id="advancedOptionsToggle"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Advanced
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Advanced
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: advancedOptionsToggle
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: accordion-toggle
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
  - object:
      class: Browser
      name: Oracle Primavera P6 EPPM
      properties:
      - property:
          value:
            value: Oracle Primavera P6 EPPM
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://prvqas612.utilities.etsa.net.au/p6/action/login
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Oracle Primavera P6 EPPM
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
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Oracle Primavera P6 EPPM
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
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Wednesday, 5 April 2023 4:18:50 PM
      child_objects:
      - object:
          class: Page
          name: Primavera P6 - Enterprise
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?projectId=10083&wbsId=301732&ProjectName=null&checkTabs=true&selectedItem=ARO111_7232
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Enterprise Project Structure
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
                value: '20015'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebMenu
              name: Row menu
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[2]/DIV[1]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 1grid-menu
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Add Project
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: grid-menu grid-root-menu grid-root-menu-down
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row menu
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebMenu
              name: pgbu-dropdown-menu-259
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV[1]/DIV[@role="toolbar"][1]/DIV[5]/DIV[1]/UL[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-dropdown-menu-259
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Filters...
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: dropdown-menu  pull-center disclosure select-menu
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: StartDate
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TD[@role="gridcell"]/DIV[normalize-space()="05-Feb-21"]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row_2
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Status - What-If"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 4grid-row-ARO10_117-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 6
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[@role="row" and normalize-space()="Reporting Only"]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 4grid-row-ARO10_652-col-selected-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 7
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save_2
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action save-button unsaved
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save View
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/BUTTON[normalize-space()="Save View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action save-view-button unsaved
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  save-apply-btn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Grid View
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[normalize-space()="Grid
                      View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Grid View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Grid View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light active
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Filters
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/DIV/DIV/BUTTON[@role="button"
                      and normalize-space()="Filters"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn dropdown-toggle filter-error-status-button active
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Filters
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Customize View
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="master-panel"]/DIV/DIV[@role="toolbar"]/BUTTON[normalize-space()="Customize
                      View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Customize View
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Customize View
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Close
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[1]/A[@role="button"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: modal-close
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="dialog"][3]/DIV[3]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-dark
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Activities
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //A[@id="tab_link_ProjectActivities"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Activities
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Activities
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: tab_link_ProjectActivities
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Dashboards
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/home
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/home
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Dashboards
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
                value: '30039'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: Link
              name: Projects
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@id="menu.section.multiprojects"]/DIV/A[normalize-space()="Projects"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Projects
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Projects
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projectstartpage?
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Primavera P6 - Activities
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Primavera P6 - Activities of 11kV Cable Box Replacement Program
                  2020, 2019 Earth Grid, 2019 Fencing, 38 Currie CBD 11kV
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
                value: '10037'
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebTree
              name: oui-tree-panel-115
              properties:
              - property:
                  value:
                    value: WebTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[@role="tree"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-.*
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: oui-tree-panel-115
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: orcl-widget tree orcl-tree picker fill fluid filtered
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTabStrip
              name: GeneralGeneralAssignments
              properties:
              - property:
                  value:
                    value: WebTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[2]/DIV[3]/DIV[1]/DIV[1]/UL[@role="tablist"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: tablist
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: UL
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: General
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: nav nav-tabs content-tabs sort-ready
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - html id
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceName
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 10
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ResourceAttributes
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
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 11
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebTable
              name: ActivityDetails
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
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="treegrid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: presentation
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TABLE
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: border
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 5
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - border
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebMenu
              name: Row menu
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV/UL[@role="menu" and normalize-space()="Delete"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 2grid-menu
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Delete
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: grid-menu grid-root-menu grid-root-menu-down
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row menu
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebList
              name: Views
              properties:
              - property:
                  value:
                    value: WebList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="toolbar"]/DIV/DIV/DIV/DIV/BUTTON[@role="combobox"
                      and normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: pgbu-input-110
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Views
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebList
              name: active-resource-view
              properties:
              - property:
                  value:
                    value: WebList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="active-resource-view"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: active-resource-view
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 4
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - class
                  - items count
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: UA
              properties:
              - property:
                  value:
                    value: '158'
                    regular_expression: false
                  name: width
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: UA.*
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: cell-renderer
                    regular_expression: false
                  name: class
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
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][2]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][3]/TD[@role="gridcell"][1]/DIV[1]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - width
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: oui-calendar-36
              properties:
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: « ‹ January 2020 › » Mon Tue Wed Thu Fri Sat Sun 30 31
                      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
                      24 25 26 27 28 29 30 31 1 2 3 4 5 6 7 8 9 Today Cancel
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: oui-calendar-36
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: calendar dark-theme align-left
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: NoResultFound
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: No results found
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
                    value: oui-tree-panel-81-no-results
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: no-results
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="tree"]/DIV/DIV[@role="treeitem" and normalize-space()="No
                      results found"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Labour
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Labour
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
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
              - property:
                  value:
                    value: col
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="tree"]/DIV/UL/LI[@role="treeitem"]/DIV[normalize-space()="Labour"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Calendar
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: January 2020
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: LABEL
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-calendar-label-33
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: title
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/LABEL[@role="heading"
                      and normalize-space()="January 2020"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebElement
              name: Assignments
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Assignments
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: activity-panel
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="tab" and normalize-space()="Assignments"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: WebEdit
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '255'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Search
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: oui-typeahead-108
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: search-query
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Search
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 2
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: ResourceValue
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
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
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - placeholder
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Row
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV[2]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][3]/TABLE[@role="presentation"][1]/TBODY[@role="presentation"][1]/TR[@role="row"][4]/TD[@role="gridcell"][10]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'on'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 2grid-row-ARO27_577308-col-SyncUnitsFromCost-input
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: cell-descendant
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Row
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 3
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: ‹
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="‹"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ‹
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="confirm-modal"]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'Yes'
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  proceedModal
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Today
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/DIV/DIV/DIV/DIV/DIV/SPAN/DIV/BUTTON[normalize-space()="Today"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Today
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-small btn-blue-light today
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV/BUTTON[normalize-space()="Save"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action save-button unsaved
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: OK
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/BUTTON[normalize-space()="OK"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: OK
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action  proceedModal
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Close
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="grid-settings-dialog"]/DIV[1]/DIV[1]/A[@role="button"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: modal-close
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-dark
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign...
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="assignments-tab"]/DIV/DIV[@role="toolbar"]/DIV/BUTTON[@role="button"
                      and normalize-space()="Assign..."]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign...
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-blue-light dropdown-toggle
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Assign
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="activity-resource-custom-dialog"]/DIV[3]/BUTTON[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Assign
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
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
              - property:
                  value:
                    value: btn btn-action modal-accept
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Resource
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI/A[@role="menuitem" and normalize-space()="Resource"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Resource
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Resource
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Manage Views...
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"]/A[normalize-space()="Manage Views..."]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Manage Views...
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Manage Views...
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: EPS
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //A[@id="tab_link_ProjectEPS"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: EPS
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: EPS
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: tab_link_ProjectEPS
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/projects?
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Automation View
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"]/A[normalize-space()="Automation View"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Automation View
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=10729&wbsId=362123&ProjectName=null&selectedItem=&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: All Resources
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@id="active-resource-view-AR"]/A[normalize-space()="All
                      Resources"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: All Resources
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/pm/activities?projectId=9413&wbsId=259006&ProjectName=null&selectedItem=ARO2_920457&checkTabs=true#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
      - object:
          class: Page
          name: Oracle Primavera P6 EPPM
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
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://prvqas612.utilities.etsa.net.au/p6/action/login
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Oracle Primavera P6 EPPM
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
                value: ''
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: STRING
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
          last_update_time: Wednesday, 5 April 2023 4:18:50 PM
          child_objects:
          - object:
              class: WebList
              name: databaseId
              properties:
              - property:
                  value:
                    value: WebList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="databaseId"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: visible items
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: combobox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: select
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: databaseId
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: btn btn-blue-light combo-button combo-value
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
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
                - micclass
                - _xpath
                - role
                - name
                - html tag
                - acc_name
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - class
                  - default value
                  - items count
                  - visible items
                  - visible
                  - acc_name
                  - first item
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Username
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="username"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Username
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: username
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: username
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: username
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Username
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebEdit
              name: password
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="password"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Password
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: WebButton
              name: Sign In
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BUTTON[@id="login"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Sign In
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Sign In
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: login
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit btn btn-action btn-huge
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: QAS - Field Services
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //LI[@role="option"]/A[normalize-space()="QAS - Field Services"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: QAS - Field Services
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
          - object:
              class: Link
              name: Advanced
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //A[@id="advancedOptionsToggle"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Advanced
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Advanced
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: advancedOptionsToggle
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://prvqas612.utilities.etsa.net.au/p6/action/login#advancedOptions
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: accordion-toggle
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 5 April 2023 4:18:50 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
