namespace: ProjectExpensing
operation:
  name: SAPDataExport
  inputs:
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks (1)\Project Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.SAPDataExport:1.0.0
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
        object_path: '''STEP 2: UPDATE SAP DATA EXPORT TAB'
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
        object_path: '''OPEN SAP DATA EXPORT TAB'
    - step:
        id: '10'
        action: Script
        object_path: Set objSAPDataExport = objSupportFile.Worksheets("SAP Data Export")
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
        object_path: '''LOOP THROUGH PROJECTS TO BE EXPENSED'
    - step:
        id: '14'
        action: Script
        object_path: For i = 2 To numberOfProj
    - step:
        id: '15'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(i,1).value
    - step:
        id: '16'
        action: Script
        object_path: cn43nCheck = objProjectsToBeExpenses.cells(i,4).value
    - step:
        id: '17'
        action: Script
        object_path: sapExportCheck = objProjectsToBeExpenses.cells(i,5).value
    - step:
        id: '18'
        action: Script
        object_path: If projNum <> "" and cn43nCheck = "YES" Then
    - step:
        id: '19'
        action: Script
        object_path: '''EXTRACT SAP DATA AND ENTER INTO SAP DATA EXPORT TAB'
    - step:
        id: '20'
        action: Script
        object_path: If sapExportCheck = "" Then
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nS_ALR_87013543"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '23'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '5'
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile")
        action: SendKey
        args: ENTER
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Project")
        action: Set
        args: projNum
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '57'
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Controlling
          Area")
        action: Set
        args: '"1000"'
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '43'
    - step:
        id: '29'
        action: Script
        object_path: currentYear = year(Date)
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("To
          Fiscal Year")
        action: Set
        args: currentYear
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiEdit("Cost
          Element Group")
        action: Set
        args: '"CAPCOSTREP"'
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '43'
    - step:
        id: '32'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '33'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiStatusBar("NoObjectsSelected").Exist(3)
          = False Then
    - step:
        id: '34'
        action: Script
        object_path: '''OPEN PRIME PROJECTS COST'
    - step:
        id: '35'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiMenubar("mbar")
        action: Select
        args: '"Goto;Find..."'
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '1'
    - step:
        id: '36'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find").SAPGuiEdit("Find")
        action: Set
        args: '"Prime Project Costs"'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '7'
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '0'
    - step:
        id: '38'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          = False Then
    - step:
        id: '39'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find_2").SAPGuiLabel("Prime
          Project Costs")
        action: SetFocus
        snapshot: .\Snapshots\ssf10.png
        highlight_id: '11'
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find_2").SAPGuiLabel("Prime
          Project Costs")
        action: SetCaretPos
        args: '7'
        snapshot: .\Snapshots\ssf10.png
        highlight_id: '11'
    - step:
        id: '41'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find_2")
        action: SendKey
        args: F2
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: F2
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '0'
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Project line item selection").SAPGuiLabel("Project
          actual cost line")
        action: SetFocus
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '6'
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Project line item selection").SAPGuiLabel("Project
          actual cost line")
        action: SetCaretPos
        args: '12'
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '6'
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Project line item selection")
        action: SendKey
        args: F2
    - step:
        id: '46'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiStatusBar("StatusBar").Exist(3)
          = False Then
    - step:
        id: '47'
        action: Script
        object_path: '''SET LAYOUT TO SVCLAYOUT'
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line").SAPGuiButton("Select
          Layout...   (Ctrl+F9)")
        action: Click
    - step:
        id: '49'
        action: Script
        object_path: rowCount = SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '50'
        action: Script
        object_path: For a = 1 To rowCount
    - step:
        id: '51'
        action: Script
        object_path: cell = SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl").GetCellData(a,
          "Layout")
    - step:
        id: '52'
        action: Script
        object_path: If cell = "/SVCLAYOUT" Then
    - step:
        id: '53'
        action: Script
        object_path: row = a
    - step:
        id: '54'
        action: Script
        object_path: Exit for
    - step:
        id: '55'
        action: Script
        object_path: End If
    - step:
        id: '56'
        action: Script
        object_path: Next
    - step:
        id: '57'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Layout").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: row, "Layout"
    - step:
        id: '58'
        action: Script
        object_path: '''EXTRACT DATA'
    - step:
        id: '59'
        action: Script
        object_path: SAPExportRow = objSAPDataExport.Range("A1048576").End(-4162).Row
          + 1
    - step:
        id: '60'
        action: Script
        object_path: sapGrid = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '61'
        action: Script
        object_path: p = SAPExportRow
    - step:
        id: '62'
        action: Script
        object_path: If sapGrid = "" Then
    - step:
        id: '63'
        object_path: objProjectsToBeExpenses.cells(i,5)
        action: value
        args: = "NO"
    - step:
        id: '64'
        action: Script
        object_path: Else
    - step:
        id: '65'
        action: Script
        object_path: For o = 1 To sapGrid
    - step:
        id: '66'
        action: Script
        object_path: projDef = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Project definition")
    - step:
        id: '67'
        action: Script
        object_path: If projDef = "" Then
    - step:
        id: '68'
        action: Script
        object_path: Exit For
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        object_path: Reporter
        action: Filter
        args: = rfDisableAll
    - step:
        id: '71'
        action: Script
        object_path: On error resume next
    - step:
        id: '72'
        action: Script
        object_path: wbsElement = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"WBS element")
    - step:
        id: '73'
        action: Script
        object_path: order = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Order")
    - step:
        id: '74'
        action: Script
        object_path: object = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Object")
    - step:
        id: '75'
        action: Script
        object_path: costElement = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Cost Element")
    - step:
        id: '76'
        action: Script
        object_path: personnelNum = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Personnel Number")
    - step:
        id: '77'
        action: Script
        object_path: totalQuantity = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Total quantity")
    - step:
        id: '78'
        action: Script
        object_path: valueTranCurr = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Value TranCurr")
    - step:
        id: '79'
        action: Script
        object_path: partnerCctr = SAPGuiSession("Session").SAPGuiWindow("Display
          Actual Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"Partner-CCtr")
    - step:
        id: '80'
        action: Script
        object_path: parAct = SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").GetCellData(o,"ParActivity")
    - step:
        id: '81'
        action: Script
        object_path: On error goto 0
    - step:
        id: '82'
        object_path: Reporter
        action: Filter
        args: = rfEnableAll
    - step:
        id: '83'
        action: Script
        object_path: If InStr(valueTranCurr,"-") Then
    - step:
        id: '84'
        action: Script
        object_path: valueTranCurr = Split(valueTranCurr,"-")
    - step:
        id: '85'
        action: Script
        object_path: valueTranCurr1 = valueTranCurr(0)
    - step:
        id: '86'
        action: Script
        object_path: valueTranCurr = "-"&valueTranCurr1
    - step:
        id: '87'
        action: Script
        object_path: End If
    - step:
        id: '88'
        action: Script
        object_path: If InStr(totalQuantity,"-") Then
    - step:
        id: '89'
        action: Script
        object_path: totalQuantity = Split(totalQuantity,"-")
    - step:
        id: '90'
        action: Script
        object_path: totalQuantity1 = totalQuantity(0)
    - step:
        id: '91'
        action: Script
        object_path: totalQuantity = "-"&totalQuantity1
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        object_path: objSAPDataExport.cells(p,1)
        action: value
        args: = projDef
    - step:
        id: '94'
        object_path: objSAPDataExport.cells(p,2)
        action: value
        args: = wbsElement
    - step:
        id: '95'
        object_path: objSAPDataExport.cells(p,3)
        action: value
        args: = order
    - step:
        id: '96'
        object_path: objSAPDataExport.cells(p,4)
        action: value
        args: = object
    - step:
        id: '97'
        object_path: objSAPDataExport.cells(p,5)
        action: value
        args: = costElement
    - step:
        id: '98'
        object_path: objSAPDataExport.cells(p,6)
        action: value
        args: = personnelNum
    - step:
        id: '99'
        object_path: objSAPDataExport.cells(p,7)
        action: value
        args: = totalQuantity
    - step:
        id: '100'
        object_path: objSAPDataExport.cells(p,8)
        action: value
        args: = valueTranCurr
    - step:
        id: '101'
        object_path: objSAPDataExport.cells(p,9)
        action: value
        args: = partnerCctr
    - step:
        id: '102'
        object_path: objSAPDataExport.cells(p,10)
        action: value
        args: = parAct
    - step:
        id: '103'
        object_path: objSAPDataExport.cells(p,11)
        action: value
        args: = "=IF(LEN(D"&p&")<12,"""",RIGHT(D"&p&",4))"
    - step:
        id: '104'
        object_path: objSAPDataExport.cells(p,12)
        action: value
        args: = "=VLOOKUP(A"&p&",'Projects To Be Expensed'!A:C,3,FALSE)"
    - step:
        id: '105'
        action: Script
        object_path: If (projDef <> "") or (wbsElement <> "") or (order <> "") or
          (object <> "") or (costElement <> "") or (personnelNum <> "") or (totalQuantity
          <> "") or (valueTranCurr <> "") or (partnerCctr <> "") or (parAct <> "")
          Then
    - step:
        id: '106'
        object_path: objProjectsToBeExpenses.cells(i,5)
        action: value
        args: = "YES"
    - step:
        id: '107'
        action: Script
        object_path: End If
    - step:
        id: '108'
        action: Script
        object_path: p = p + 1
    - step:
        id: '109'
        action: Script
        object_path: Next
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '0'
    - step:
        id: '110'
        action: Script
        object_path: '''GET BACK TO SAP HOME SCREEN'
    - step:
        id: '111'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '21'
    - step:
        id: '112'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost Line")
        action: SendKey
        args: ENTER
    - step:
        id: '113'
        action: Script
        object_path: End If
    - step:
        id: '114'
        action: Script
        object_path: Else
    - step:
        id: '115'
        action: Script
        object_path: '''GET BACK TO SAP HOME SCREEN'
    - step:
        id: '116'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '117'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: ENTER
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        action: Script
        object_path: '''FIND NEXT EMPTY ROW IN SAP DATA EXTRACT TAB'
    - step:
        id: '120'
        action: Script
        object_path: Else
    - step:
        id: '121'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '122'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Find").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '123'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '124'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Actual/Plan/Variance")
        action: SendKey
        args: ENTER
    - step:
        id: '125'
        action: Script
        object_path: End If
    - step:
        id: '126'
        action: Script
        object_path: Else
    - step:
        id: '127'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '128'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Act/Plan/Variance Abs./")
        action: SendKey
        args: ENTER
    - step:
        id: '129'
        action: Script
        object_path: End If
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '0'
    - step:
        id: '130'
        action: Script
        object_path: End  If
    - step:
        id: '131'
        action: Script
        object_path: Else
    - step:
        id: '132'
        action: Script
        object_path: flag = "Projects found with missing CN43n Export"
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
        object_path: '''REFRESH WORKBOOK TO UPDATE PIVOT TABLE'
    - step:
        id: '136'
        object_path: objSupportFile
        action: RefreshAll
    - step:
        id: '137'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '138'
        object_path: objSupportFile
        action: save
    - step:
        id: '139'
        object_path: objSupportFile
        action: close
    - step:
        id: '140'
        object_path: objExcel
        action: Quit
    - step:
        id: '141'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '142'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '143'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '144'
        action: Script
        object_path: Set objProjectsToBeExpenses = Nothing
    - step:
        id: '145'
        action: Script
        object_path: Set objSAPDataExport = Nothing
    - step:
        id: '146'
        action: Script
        object_path: Parameter("flag") = flag
    - step:
        id: '147'
        action: Script
        object_path: '''For o = 1 To sapGrid'
    - step:
        id: '148'
        action: Script
        object_path: "'\tOn error resume next"
    - step:
        id: '149'
        action: Script
        object_path: "'\twbsElement = SAPGuiSession(\"Session\").SAPGuiWindow(\"Display\
          \ Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"WBS element\"\
          )"
    - step:
        id: '150'
        action: Script
        object_path: "'\torder = SAPGuiSession(\"Session\").SAPGuiWindow(\"Display\
          \ Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"Order\"\
          )"
    - step:
        id: '151'
        action: Script
        object_path: "'\tobject = SAPGuiSession(\"Session\").SAPGuiWindow(\"Display\
          \ Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"Object\"\
          )"
    - step:
        id: '152'
        action: Script
        object_path: "'\tcostElement = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Display Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"\
          Cost Element\")"
    - step:
        id: '153'
        action: Script
        object_path: "'\tpersonnelNum = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Display Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"\
          Personnel Number\")"
    - step:
        id: '154'
        action: Script
        object_path: "'\ttotalQuantity = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Display Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"\
          Total quantity\")"
    - step:
        id: '155'
        action: Script
        object_path: "'\tvalueTranCurr = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Display Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"\
          Value TranCurr\")"
    - step:
        id: '156'
        action: Script
        object_path: "'\tpartnerCctr = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Display Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"\
          Partner-CCtr\")"
    - step:
        id: '157'
        action: Script
        object_path: "'\tparAct = SAPGuiSession(\"Session\").SAPGuiWindow(\"Display\
          \ Actual Cost Line\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(o,\"ParActivity\"\
          )"
    - step:
        id: '158'
        action: Script
        object_path: "'\tOn error goto 0"
    - step:
        id: '159'
        action: Script
        object_path: '''Next'
    - step:
        id: '160'
        action: Script
        object_path: '''If SAPGuiSession("Session").SAPGuiWindow("Display Actual Cost
          Line").SAPGuiGrid("GridViewCtrl").GetCellData(1,"ParActivity") <> "" Then'
    - step:
        id: '161'
        action: Script
        object_path: "'\tWait 2"
    - step:
        id: '162'
        action: Script
        object_path: '''End If'
    - step:
        id: '163'
        action: Script
        object_path: ''''
    - step:
        id: '164'
        action: Script
        object_path: '''msgbox SAPGuiSession("Session").SAPGuiWindow("Display Actual
          Cost Line").SAPGuiGrid("GridViewCtrl").Object.GetVisibleText'
  outputs:
  - flag:
      robot: true
      value: ${flag}
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
      last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Project actual cost line
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Prime Project Costs
              properties:
              - property:
                  value:
                    value: .*
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
                    value: Prime Project Costs
                    regular_expression: false
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
                    value: wnd[0]/usr/lbl[0,0]
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
          last_update_time: Monday, 3 April 2023 3:42:35 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: NoObjectsSelected
              properties:
              - property:
                  value:
                    value: No objects were selected using the criteria entered
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
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
              last_update_time: Monday, 3 April 2023 3:42:35 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
