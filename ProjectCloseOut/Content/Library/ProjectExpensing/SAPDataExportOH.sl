namespace: ProjectExpensing
operation:
  name: SAPDataExportOH
  inputs:
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Project
      Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.SAPDataExportOH:1.0.0
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
        object_path: '''STEP 6: UPDATE EXECUTE OVERHEADS AND SAP DATA EXPORT OH TAB
          fixed'
    - step:
        id: '2'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: '''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '6'
        action: Script
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("filePath")&Parameter("supportFile"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN PROJECTS TO BE EXPENSED TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objProjectsToBeExpenses = objSupportFile.Worksheets("Projects
          To Be Expensed")
    - step:
        id: '9'
        action: Script
        object_path: '''OPEN SAP DATA EXPORT OH TAB'
    - step:
        id: '10'
        action: Script
        object_path: Set objSAPDataExportOH = objSupportFile.Worksheets("SAP Data
          Export OH")
    - step:
        id: '11'
        action: Script
        object_path: '''GET ROW COUNT OF PROJECTS TO BE EXPENSED'
    - step:
        id: '12'
        action: Script
        object_path: numberOfProj = objProjectsToBeExpenses.usedrange.Rows.Count
    - step:
        id: '13'
        action: Script
        object_path: '''GET ROW COUNT OF SAP DATA EXPORT OH TAB'
    - step:
        id: '14'
        action: Script
        object_path: numberOfSAPDataOH = objSAPDataExportOH.usedrange.Rows.Count
    - step:
        id: '15'
        action: Script
        object_path: '''LOOP THROUGH PROJECTS TO BE EXPENSED FOR OVERHEADS'
    - step:
        id: '16'
        action: Script
        object_path: For i = 2 To numberOfProj
    - step:
        id: '17'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(i,1).value
    - step:
        id: '18'
        action: Script
        object_path: cn43nCheck = objProjectsToBeExpenses.cells(i,4).value
    - step:
        id: '19'
        action: Script
        object_path: overheadCheck = objProjectsToBeExpenses.cells(i,6).value
    - step:
        id: '20'
        action: Script
        object_path: If projNum <> "" and cn43nCheck = "YES" Then
    - step:
        id: '21'
        action: Script
        object_path: '''EXTRACT SAP DATA AND ENTER INTO SAP DATA EXPORT TAB'
    - step:
        id: '22'
        action: Script
        object_path: If overheadCheck = "" Then
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nCJ45"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '25'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area").Exist(3) Then
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Set Controlling Area")
        action: SendKey
        args: ENTER
    - step:
        id: '28'
        action: Script
        object_path: End If
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiCheckBox("Background
          Processing")
        action: Set
        args: '"OFF"'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiCheckBox("Dialog
          display")
        action: Set
        args: '"OFF"'
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiCheckBox("Test
          Run")
        action: Set
        args: '"OFF"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '31'
    - step:
        id: '32'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiCheckBox("Detail
          Lists")
        action: Set
        args: '"ON"'
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiEdit("Selection
          variant")
        action: Set
        args: '"SAML"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '36'
    - step:
        id: '34'
        action: Script
        object_path: currentYear = Year(Date)
    - step:
        id: '35'
        action: Script
        object_path: currentMonth = Month(Date)
    - step:
        id: '36'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiEdit("Fiscal
          Year")
        action: Set
        args: currentYear
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiEdit("Period")
        action: Set
        args: currentMonth
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '30'
    - step:
        id: '38'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiButton("Change")
        action: Click
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '33'
    - step:
        id: '39'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiStatusBar("StatusBar").Exist(3)
          = false Then
    - step:
        id: '40'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Edit Variants: Report").SAPGuiEdit("Project")'
        action: Set
        args: projNum
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '44'
    - step:
        id: '41'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Edit Variants: Report").SAPGuiEdit("WBS
          element")'
        action: Set
        args: '""'
    - step:
        id: '42'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Edit Variants: Report").SAPGuiEdit("Network/order")'
        action: Set
        args: '""'
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '42'
    - step:
        id: '43'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Edit Variants: Report").SAPGuiButton("Back   (F3)")'
        action: Click
    - step:
        id: '44'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Maint. variant SAML").SAPGuiButton("Yes").Exist(3)
          Then
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maint. variant SAML").SAPGuiButton("Yes")
        action: Click
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '9'
    - step:
        id: '46'
        action: Script
        object_path: End  If
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '1'
    - step:
        id: '47'
        action: Script
        object_path: End If
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '49'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:_2").SAPGuiTextArea("TextAreaControl").Exist(3)
          Then
    - step:
        id: '50'
        action: Script
        object_path: text = SAPGuiSession("Session").SAPGuiWindow("Actual Overhead
          Calculation:_2").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '51'
        object_path: objProjectsToBeExpenses.cells(i,6)
        action: value
        args: = text
    - step:
        id: '52'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:_2").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '21'
    - step:
        id: '53'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:_2")
        action: SendKey
        args: ENTER
    - step:
        id: '54'
        action: Script
        object_path: Else
    - step:
        id: '55'
        action: Script
        object_path: text = SAPGuiSession("Session").SAPGuiWindow("Actual Overhead
          Calculation:").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '56'
        object_path: objProjectsToBeExpenses.cells(i,6)
        action: value
        args: = text
    - step:
        id: '57'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual Overhead Calculation:")
        action: SendKey
        args: ENTER
    - step:
        id: '59'
        action: Script
        object_path: End If
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '0'
    - step:
        id: '60'
        action: Script
        object_path: Else
    - step:
        id: '61'
        action: Script
        object_path: Exit For
    - step:
        id: '62'
        action: Script
        object_path: End If
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: Next
    - step:
        id: '65'
        action: Script
        object_path: '''LOOP THROUGH PROJECTS TO BE EXPENSED AND UPDATE OVERHEADS
          TAB'
    - step:
        id: '66'
        action: Script
        object_path: For i = 2 To numberOfProj
    - step:
        id: '67'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(i,1).value
    - step:
        id: '68'
        action: Script
        object_path: cn43nCheck = objProjectsToBeExpenses.cells(i,4).value
    - step:
        id: '69'
        action: Script
        object_path: sapExportCheck = objProjectsToBeExpenses.cells(i,7).value
    - step:
        id: '70'
        action: Script
        object_path: If projNum <> "" and cn43nCheck = "YES" Then
    - step:
        id: '71'
        action: Script
        object_path: '''EXTRACT SAP DATA AND ENTER INTO SAP DATA EXPORT TAB'
    - step:
        id: '72'
        action: Script
        object_path: If sapExportCheck = "" Then
    - step:
        id: '73'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '21'
    - step:
        id: '74'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '0'
    - step:
        id: '75'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '76'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
    - step:
        id: '77'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile")
        action: SendKey
        args: ENTER
    - step:
        id: '78'
        action: Script
        object_path: End If
    - step:
        id: '79'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '57'
    - step:
        id: '80'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("WBS
          element")
        action: Set
        args: '""'
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '43'
    - step:
        id: '82'
        action: Script
        object_path: currentYear = year(Date)
    - step:
        id: '83'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("To
          Fiscal Year")
        action: Set
        args: currentYear
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '61'
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: '"CAPCOSTREP"'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '44'
    - step:
        id: '85'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '3'
    - step:
        id: '86'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiStatusBar("NoObjectsSelected").Exist(3)
          = False Then
    - step:
        id: '87'
        action: Script
        object_path: '''OPEN PRIME PROJECT COSTS'
    - step:
        id: '88'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiMenubar("mbar")
        action: Select
        args: '"Goto;Find..."'
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '1'
    - step:
        id: '89'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find").SAPGuiEdit("Find")
        action: Set
        args: '"Prime Project Costs"'
        snapshot: .\Snapshots\ssf15.png
        highlight_id: '7'
    - step:
        id: '90'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find")
        action: SendKey
        args: ENTER
    - step:
        id: '91'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          = False Then
    - step:
        id: '92'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find_2").SAPGuiLabel("Prime
          Project Costs")
        action: SetFocus
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '14'
    - step:
        id: '93'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find_2")
        action: SendKey
        args: F2
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '4'
    - step:
        id: '94'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: F2
    - step:
        id: '95'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiStatusBar("StatusBar").Exist(3)
          = False Then
    - step:
        id: '96'
        action: Script
        object_path: '''SET LAYOUT TO SVCLAYOUT'
    - step:
        id: '97'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line").SAPGuiButton("Select
          Layout...   (Ctrl+F9)")
        action: Click
    - step:
        id: '98'
        action: Script
        object_path: rowCount = SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '99'
        action: Script
        object_path: For a = 1 To rowCount
    - step:
        id: '100'
        action: Script
        object_path: cell = SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl").GetCellData(a,
          "Layout")
    - step:
        id: '101'
        action: Script
        object_path: If cell = "/SVCLAYOUT" Then
    - step:
        id: '102'
        action: Script
        object_path: row = a
    - step:
        id: '103'
        action: Script
        object_path: Exit for
    - step:
        id: '104'
        action: Script
        object_path: End If
    - step:
        id: '105'
        action: Script
        object_path: Next
    - step:
        id: '106'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: row, "Layout"
    - step:
        id: '107'
        action: Script
        object_path: '''FIND NEXT EMPTY ROW IN SAP DATA EXTRACT OH TAB'
    - step:
        id: '108'
        action: Script
        object_path: SAPExportOHRow = objSAPDataExportOH.Range("A1048576").End(-4162).Row
          + 1
    - step:
        id: '109'
        action: Script
        object_path: sapGrid = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '110'
        action: Script
        object_path: p = SAPExportOHRow
    - step:
        id: '111'
        action: Script
        object_path: If sapGrid = "" Then
    - step:
        id: '112'
        object_path: objProjectsToBeExpenses.cells(i,7)
        action: value
        args: = "NO"
    - step:
        id: '113'
        action: Script
        object_path: Else
    - step:
        id: '114'
        action: Script
        object_path: For o = 1 To sapGrid
    - step:
        id: '115'
        action: Script
        object_path: projDef = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Project definition")
    - step:
        id: '116'
        action: Script
        object_path: If projDef = "" Then
    - step:
        id: '117'
        action: Script
        object_path: Exit For
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        object_path: Reporter
        action: Filter
        args: = rfDisableAll
    - step:
        id: '120'
        action: Script
        object_path: On error resume next
    - step:
        id: '121'
        action: Script
        object_path: WBSelement = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"WBS element")
    - step:
        id: '122'
        action: Script
        object_path: order = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Order")
    - step:
        id: '123'
        action: Script
        object_path: object = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Object")
    - step:
        id: '124'
        action: Script
        object_path: costElement = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Cost Element")
    - step:
        id: '125'
        action: Script
        object_path: personnelNum = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Personnel Number")
    - step:
        id: '126'
        action: Script
        object_path: Totalquantity = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Total quantity")
    - step:
        id: '127'
        action: Script
        object_path: ValueTranCurr = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Value TranCurr")
    - step:
        id: '128'
        action: Script
        object_path: partnerCctr = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Partner-CCtr")
    - step:
        id: '129'
        action: Script
        object_path: parAct = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"ParActivity")
    - step:
        id: '130'
        action: Script
        object_path: On error goto 0
    - step:
        id: '131'
        object_path: Reporter
        action: Filter
        args: = rfEnableAll
    - step:
        id: '132'
        action: Script
        object_path: If InStr(Totalquantity,"-") Then
    - step:
        id: '133'
        action: Script
        object_path: Totalquantity = Replace(Totalquantity,"-","")
    - step:
        id: '134'
        action: Script
        object_path: Totalquantity = "-"&Totalquantity
    - step:
        id: '135'
        action: Script
        object_path: End If
    - step:
        id: '136'
        action: Script
        object_path: If InStr(ValueTranCurr,"-") Then
    - step:
        id: '137'
        action: Script
        object_path: ValueTranCurr = Replace(ValueTranCurr,"-","")
    - step:
        id: '138'
        action: Script
        object_path: ValueTranCurr = "-"&ValueTranCurr
    - step:
        id: '139'
        action: Script
        object_path: End If
    - step:
        id: '140'
        object_path: objSAPDataExportOH.cells(p,1)
        action: value
        args: = projDef
    - step:
        id: '141'
        object_path: objSAPDataExportOH.cells(p,2)
        action: value
        args: = WBSelement
    - step:
        id: '142'
        object_path: objSAPDataExportOH.cells(p,3)
        action: value
        args: = order
    - step:
        id: '143'
        object_path: objSAPDataExportOH.cells(p,4)
        action: value
        args: = object
    - step:
        id: '144'
        object_path: objSAPDataExportOH.cells(p,5)
        action: value
        args: = costElement
    - step:
        id: '145'
        object_path: objSAPDataExportOH.cells(p,6)
        action: value
        args: = personnelNum
    - step:
        id: '146'
        object_path: objSAPDataExportOH.cells(p,7)
        action: value
        args: = Totalquantity
    - step:
        id: '147'
        object_path: objSAPDataExportOH.cells(p,8)
        action: value
        args: = ValueTranCurr
    - step:
        id: '148'
        object_path: objSAPDataExportOH.cells(p,9)
        action: value
        args: = partnerCctr
    - step:
        id: '149'
        object_path: objSAPDataExportOH.cells(p,10)
        action: value
        args: = parAct
    - step:
        id: '150'
        object_path: objSAPDataExportOH.cells(p,11)
        action: value
        args: = "=IF(LEN(D"&p&")<12,"""",RIGHT(D"&p&",4))"
    - step:
        id: '151'
        object_path: objSAPDataExportOH.cells(p,12)
        action: value
        args: = "=VLOOKUP(A"&p&",'Projects To Be Expensed'!A:C,3,FALSE)"
    - step:
        id: '152'
        action: Script
        object_path: If (projDef <> "") or (WBSelement <> "") or (order <> "") or
          (object <> "") or (costElement <> "") or (personnelNum <> "") or (Totalquantity
          <> "") or (ValueTranCurr <> "") or (partnerCctr <> "") or (parAct <> "")
          Then
    - step:
        id: '153'
        object_path: objProjectsToBeExpenses.cells(i,7)
        action: value
        args: = "YES"
    - step:
        id: '154'
        action: Script
        object_path: End If
    - step:
        id: '155'
        action: Script
        object_path: p = p + 1
    - step:
        id: '156'
        action: Script
        object_path: Next
    - step:
        id: '157'
        action: Script
        object_path: '''GET BACK TO SAP HOME SCREEN'
    - step:
        id: '158'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '159'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line")
        action: SendKey
        args: ENTER
    - step:
        id: '160'
        action: Script
        object_path: End If
    - step:
        id: '161'
        action: Script
        object_path: Else
    - step:
        id: '162'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: ENTER
    - step:
        id: '164'
        action: Script
        object_path: End If
    - step:
        id: '165'
        action: Script
        object_path: Else
    - step:
        id: '166'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '167'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '168'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '169'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: ENTER
    - step:
        id: '170'
        action: Script
        object_path: End If
    - step:
        id: '171'
        action: Script
        object_path: Else
        snapshot: .\Snapshots\ssf19.png
        highlight_id: '1'
    - step:
        id: '172'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf20.png
        highlight_id: '21'
    - step:
        id: '173'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf20.png
        highlight_id: '0'
    - step:
        id: '174'
        action: Script
        object_path: End If
    - step:
        id: '175'
        action: Script
        object_path: Else
    - step:
        id: '176'
        action: Script
        object_path: Exit For
    - step:
        id: '177'
        action: Script
        object_path: End If
    - step:
        id: '178'
        action: Script
        object_path: End If
    - step:
        id: '179'
        action: Script
        object_path: Next
    - step:
        id: '180'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '181'
        action: Script
        object_path: '''REFRESH WORKBOOK TO UPDATE PIVOT TABLE'
    - step:
        id: '182'
        object_path: objSupportFile
        action: RefreshAll
    - step:
        id: '183'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '184'
        object_path: objSupportFile
        action: save
    - step:
        id: '185'
        object_path: objSupportFile
        action: close
    - step:
        id: '186'
        object_path: objExcel
        action: Quit
    - step:
        id: '187'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '188'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '189'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '190'
        action: Script
        object_path: Set objProjectsToBeExpenses = Nothing
    - step:
        id: '191'
        action: Script
        object_path: Set objSAPDataExportOH = Nothing
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
      last_update_time: Friday, 10 February 2023 12:51:47 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Set Controlling Area
          properties:
          - property:
              value:
                value: CJ45
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[0,21]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Project line item selection
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Maint. variant SAML
          properties:
          - property:
              value:
                value: CJ45
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
                value: SAPLSPO1
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: SPOP-OPTION1
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
                    value: wnd[1]/usr/btnSPOP-OPTION1
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
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
                value: '10'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSDYP
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[2]
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
                value: wnd[2]
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
                    value: wnd[2]/tbar[0]/btn[0]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Find_2
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
                value: wnd[2]
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
                value: wnd[2]
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Prime Project Costs
              properties:
              - property:
                  value:
                    value: wnd[2]/usr/lbl[46,2]
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
                    value: wnd[2]/usr/lbl[46,2]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Position cursor
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
                    value: wnd[2]/tbar[0]/btn[2]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Find
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
                value: '800'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSYSF
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Find
              properties:
              - property:
                  value:
                    value: RSYSF-STRING
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
                    value: wnd[1]/usr/txtRSYSF-STRING
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[1]/usr/ctxtTCNT-PROF_DB
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Edit Variants: Report'
          properties:
          - property:
              value:
                value: CJ45
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
                value: RKPSEL00
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: WBS element
              properties:
              - property:
                  value:
                    value: CN_PSPNR-LOW
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
                    value: wnd[0]/usr/ctxtCN_PSPNR-LOW
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[0]/usr/ctxtCN_PROJN-LOW
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[0]/usr/ctxtCN_NETNR-LOW
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Actual Cost Line
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Select Layout...   (Ctrl+F9)
              properties:
              - property:
                  value:
                    value: btn[33]
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
                    value: wnd[0]/tbar[1]/btn[33]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Change Layout...   (Ctrl+F8)
              properties:
              - property:
                  value:
                    value: btn[32]
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
                    value: wnd[0]/tbar[1]/btn[32]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Layout
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
                value: '1500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSALV_CUL_CONFIGURATION
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
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
                    value: wnd[1]/usr/ssubD0500_SUBSCREEN:SAPLSLVC_DIALOG:0501/cntlG51_CONTAINER/shellcont/shell
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiMenubar
              name: mbar
              properties:
              - property:
                  value:
                    value: SAPGuiMenubar
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '111'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/mbar
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: '****          Prime Project'
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[5,35]
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
                    value: wnd[0]/usr/lbl[5,35]
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Actual Overhead Calculation:_2
          properties:
          - property:
              value:
                value: CJ45
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '2000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLOBJ1_PROCESSING_LOG
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiTextArea
              name: TextAreaControl
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
                    value: SAPGuiTextArea
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '203'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cntlOBJ_LOG_CONTAINER/shellcont/shell/shellcont[2]/shell
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Actual Overhead Calculation:'
          properties:
          - property:
              value:
                value: CJ45
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
                value: SAPLKAZB
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Selection variant
              properties:
              - property:
                  value:
                    value: PRZB-VARIANT
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
                    value: wnd[0]/usr/subBLOCK1:SAPLKAOP:0500/ctxtPRZB-VARIANT
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Period
              properties:
              - property:
                  value:
                    value: RKAUF-FROM
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
                    value: wnd[0]/usr/subBLOCK2:SAPLKAZB:2100/txtRKAUF-FROM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Fiscal Year
              properties:
              - property:
                  value:
                    value: RKAUF-GJAHR
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
                    value: wnd[0]/usr/subBLOCK2:SAPLKAZB:2100/txtRKAUF-GJAHR
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Test Run
              properties:
              - property:
                  value:
                    value: Test Run
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RKAUF-TEST
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
                    value: wnd[0]/usr/chkRKAUF-TEST
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Dialog display
              properties:
              - property:
                  value:
                    value: Dialog display
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RKAUF-DIALOG
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
                    value: wnd[0]/usr/chkRKAUF-DIALOG
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Detail Lists
              properties:
              - property:
                  value:
                    value: Detail Lists
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RKAUF-LIST
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
                    value: wnd[0]/usr/chkRKAUF-LIST
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Background Processing
              properties:
              - property:
                  value:
                    value: Background Processing
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RKAUF-BATCH
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
                    value: wnd[0]/usr/chkRKAUF-BATCH
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Change
              properties:
              - property:
                  value:
                    value: VAR_CHANGE
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
                    value: wnd[0]/usr/subBLOCK1:SAPLKAOP:0500/btnVAR_CHANGE
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
          last_update_time: Friday, 10 February 2023 12:51:47 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: NoObjectsSelected
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: WBS element
              properties:
              - property:
                  value:
                    value: CN_PSPNR-LOW
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
                    value: wnd[0]/usr/ctxtCN_PSPNR-LOW
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: To Fiscal Year
              properties:
              - property:
                  value:
                    value: $6-GJAHB
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
                    value: wnd[0]/usr/txt$6-GJAHB
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[0]/usr/ctxtCN_PROJN-LOW
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              - property:
                  value:
                    value: wnd[0]/usr/ctxt$6-KSTAR
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Controlling Area
              properties:
              - property:
                  value:
                    value: $6-KOKRS
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
                    value: wnd[0]/usr/ctxt$6-KOKRS
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
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
              last_update_time: Friday, 10 February 2023 12:51:47 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
