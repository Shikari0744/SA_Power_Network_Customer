namespace: ProjectExpensing
operation:
  name: ClearPreviousExports
  inputs:
  - fileLocation: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Project
      Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.ClearPreviousExports:1.0.0
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
        object_path: '''STEP 0: CLEAR PREVIOUS EXPORTS'
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
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("fileLocation")&Parameter("supportFile"))
    - step:
        id: '5'
        action: Script
        object_path: Set objProjectsToBeExpenses = objSupportFile.Worksheets("Projects
          To Be Expensed")
    - step:
        id: '6'
        action: Script
        object_path: numberOfProj = objProjectsToBeExpenses.usedrange.Rows.Count
    - step:
        id: '7'
        action: Script
        object_path: For c = 2 To numberOfProj
    - step:
        id: '8'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(c,1).value
    - step:
        id: '9'
        action: Script
        object_path: If projNum = "" Then
    - step:
        id: '10'
        action: Script
        object_path: Exit For
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: projNum = Trim(projNum)
    - step:
        id: '13'
        action: Script
        object_path: If len(projNum) = 8 Then
    - step:
        id: '14'
        action: Script
        object_path: newProj = Split(projNum,"-")
    - step:
        id: '15'
        action: Script
        object_path: projNum = newProj(0)&"-0"&newProj(1)
    - step:
        id: '16'
        action: Script
        object_path: ElseIf len(projNum) = 7 Then
    - step:
        id: '17'
        action: Script
        object_path: newProj = Split(projNum,"-")
    - step:
        id: '18'
        action: Script
        object_path: projNum = newProj(0)&"-00"&newProj(1)
    - step:
        id: '19'
        action: Script
        object_path: End If
    - step:
        id: '20'
        object_path: objProjectsToBeExpenses.cells(c,1)
        action: value
        args: = projNum
    - step:
        id: '21'
        object_path: objProjectsToBeExpenses.cells(c,2)
        action: value
        args: = "=VLOOKUP(A"&c&",'CN43n Export'!$A:$I,4,FALSE)"
    - step:
        id: '22'
        object_path: objProjectsToBeExpenses.cells(c,3)
        action: value
        args: = "=VLOOKUP(B"&c&",'Work Order Lookup'!$A:$D,2,FALSE)"
    - step:
        id: '23'
        object_path: objProjectsToBeExpenses.cells(c,4)
        action: clearcontents
    - step:
        id: '24'
        object_path: objProjectsToBeExpenses.cells(c,5)
        action: clearcontents
    - step:
        id: '25'
        object_path: objProjectsToBeExpenses.cells(c,6)
        action: clearcontents
    - step:
        id: '26'
        object_path: objProjectsToBeExpenses.cells(c,7)
        action: clearcontents
    - step:
        id: '27'
        object_path: objProjectsToBeExpenses.cells(c,8)
        action: clearcontents
    - step:
        id: '28'
        object_path: objProjectsToBeExpenses.cells(c,9)
        action: clearcontents
    - step:
        id: '29'
        action: Script
        object_path: Next
    - step:
        id: '30'
        action: Script
        object_path: Set objProjectsToBeExpenses = Nothing
    - step:
        id: '31'
        action: Script
        object_path: ''''''''
    - step:
        id: '32'
        action: Script
        object_path: Set objCN43nExport = objSupportFile.Worksheets("CN43n Export")
    - step:
        id: '33'
        object_path: objCN43nExport.UsedRange
        action: Delete
    - step:
        id: '34'
        object_path: objCN43nExport.cells(1,1)
        action: value
        args: = "Project Definition"
    - step:
        id: '35'
        object_path: objCN43nExport.cells(1,1).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '36'
        object_path: objCN43nExport.cells(1,1).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '37'
        object_path: objCN43nExport.cells(1,2)
        action: value
        args: = "Level"
    - step:
        id: '38'
        object_path: objCN43nExport.cells(1,2).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '39'
        object_path: objCN43nExport.cells(1,2).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '40'
        object_path: objCN43nExport.cells(1,3)
        action: value
        args: = "Name"
    - step:
        id: '41'
        object_path: objCN43nExport.cells(1,3).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '42'
        object_path: objCN43nExport.cells(1,3).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '43'
        object_path: objCN43nExport.cells(1,4)
        action: value
        args: = "Responsible Cost Ctr"
    - step:
        id: '44'
        object_path: objCN43nExport.cells(1,4).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '45'
        object_path: objCN43nExport.cells(1,4).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '46'
        object_path: objCN43nExport.cells(1,5)
        action: value
        args: = "Person Responsible"
    - step:
        id: '47'
        object_path: objCN43nExport.cells(1,5).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '48'
        object_path: objCN43nExport.cells(1,5).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '49'
        object_path: objCN43nExport.cells(1,6)
        action: value
        args: = "Profit Center"
    - step:
        id: '50'
        object_path: objCN43nExport.cells(1,6).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '51'
        object_path: objCN43nExport.cells(1,6).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '52'
        object_path: objCN43nExport.cells(1,7)
        action: value
        args: = "Status"
    - step:
        id: '53'
        object_path: objCN43nExport.cells(1,7).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '54'
        object_path: objCN43nExport.cells(1,7).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '55'
        object_path: objCN43nExport.cells(1,8)
        action: value
        args: = "Investment Program"
    - step:
        id: '56'
        object_path: objCN43nExport.cells(1,8).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '57'
        object_path: objCN43nExport.cells(1,8).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '58'
        object_path: objCN43nExport.cells(1,9)
        action: value
        args: = "WBS Element"
    - step:
        id: '59'
        object_path: objCN43nExport.cells(1,9).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '60'
        object_path: objCN43nExport.cells(1,9).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '61'
        object_path: objCN43nExport.cells(1,10)
        action: value
        args: = "Functional Location"
    - step:
        id: '62'
        object_path: objCN43nExport.cells(1,10).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '63'
        object_path: objCN43nExport.cells(1,10).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '64'
        object_path: objCN43nExport.cells(1,11)
        action: value
        args: = "AER Sub Category"
    - step:
        id: '65'
        object_path: objCN43nExport.cells(1,11).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '66'
        object_path: objCN43nExport.cells(1,11).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '67'
        object_path: objCN43nExport.cells(1,12)
        action: value
        args: = "Business Sub Category"
    - step:
        id: '68'
        object_path: objCN43nExport.cells(1,12).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '69'
        object_path: objCN43nExport.cells(1,12).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '70'
        action: Script
        object_path: Set objCN43nExport = Nothing
    - step:
        id: '71'
        action: Script
        object_path: ''''''''
    - step:
        id: '72'
        action: Script
        object_path: Set objSAPDataExport = objSupportFile.Worksheets("SAP Data Export")
    - step:
        id: '73'
        object_path: objSAPDataExport.UsedRange
        action: Delete
    - step:
        id: '74'
        object_path: objSAPDataExport.cells(1,1)
        action: value
        args: = "Project Definition"
    - step:
        id: '75'
        object_path: objSAPDataExport.cells(1,1).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '76'
        object_path: objSAPDataExport.cells(1,1).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '77'
        object_path: objSAPDataExport.cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '78'
        object_path: objSAPDataExport.cells(1,2)
        action: value
        args: = "WBS Element"
    - step:
        id: '79'
        object_path: objSAPDataExport.cells(1,2).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '80'
        object_path: objSAPDataExport.cells(1,2).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '81'
        object_path: objSAPDataExport.cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '82'
        object_path: objSAPDataExport.cells(1,3)
        action: value
        args: = "Order"
    - step:
        id: '83'
        object_path: objSAPDataExport.cells(1,3).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '84'
        object_path: objSAPDataExport.cells(1,3).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '85'
        object_path: objSAPDataExport.cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '86'
        object_path: objSAPDataExport.cells(1,4)
        action: value
        args: = "Object"
    - step:
        id: '87'
        object_path: objSAPDataExport.cells(1,4).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '88'
        object_path: objSAPDataExport.cells(1,4).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '89'
        object_path: objSAPDataExport.cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '90'
        object_path: objSAPDataExport.cells(1,5)
        action: value
        args: = "Cost Element"
    - step:
        id: '91'
        object_path: objSAPDataExport.cells(1,5).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '92'
        object_path: objSAPDataExport.cells(1,5).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '93'
        object_path: objSAPDataExport.cells(1,5).Font
        action: Bold
        args: = True
    - step:
        id: '94'
        object_path: objSAPDataExport.cells(1,6)
        action: value
        args: = "Personnel Number"
    - step:
        id: '95'
        object_path: objSAPDataExport.cells(1,6).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '96'
        object_path: objSAPDataExport.cells(1,6).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '97'
        object_path: objSAPDataExport.cells(1,6).Font
        action: Bold
        args: = True
    - step:
        id: '98'
        object_path: objSAPDataExport.cells(1,7)
        action: value
        args: = "Total Quantity"
    - step:
        id: '99'
        object_path: objSAPDataExport.cells(1,7).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '100'
        object_path: objSAPDataExport.cells(1,7).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '101'
        object_path: objSAPDataExport.cells(1,7).Font
        action: Bold
        args: = True
    - step:
        id: '102'
        object_path: objSAPDataExport.cells(1,8)
        action: value
        args: = "Value TranCurr"
    - step:
        id: '103'
        object_path: objSAPDataExport.cells(1,8).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '104'
        object_path: objSAPDataExport.cells(1,8).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '105'
        object_path: objSAPDataExport.cells(1,8).Font
        action: Bold
        args: = True
    - step:
        id: '106'
        object_path: objSAPDataExport.cells(1,9)
        action: value
        args: = "Partner-CCtr"
    - step:
        id: '107'
        object_path: objSAPDataExport.cells(1,9).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '108'
        object_path: objSAPDataExport.cells(1,9).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '109'
        object_path: objSAPDataExport.cells(1,9).Font
        action: Bold
        args: = True
    - step:
        id: '110'
        object_path: objSAPDataExport.cells(1,10)
        action: value
        args: = "ParActivity"
    - step:
        id: '111'
        object_path: objSAPDataExport.cells(1,10).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '112'
        object_path: objSAPDataExport.cells(1,10).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '113'
        object_path: objSAPDataExport.cells(1,10).Font
        action: Bold
        args: = True
    - step:
        id: '114'
        object_path: objSAPDataExport.cells(1,11)
        action: value
        args: = "Network Activity"
    - step:
        id: '115'
        object_path: objSAPDataExport.cells(1,11).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '116'
        object_path: objSAPDataExport.cells(1,11).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '117'
        object_path: objSAPDataExport.cells(1,11).Font
        action: Bold
        args: = True
    - step:
        id: '118'
        object_path: objSAPDataExport.cells(1,12)
        action: value
        args: = "New Order"
    - step:
        id: '119'
        object_path: objSAPDataExport.cells(1,12).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '120'
        object_path: objSAPDataExport.cells(1,12).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '121'
        object_path: objSAPDataExport.cells(1,12).Font
        action: Bold
        args: = True
    - step:
        id: '122'
        action: Script
        object_path: Set objSAPDataExport = Nothing
    - step:
        id: '123'
        action: Script
        object_path: ''''''''
    - step:
        id: '124'
        action: Script
        object_path: Set objComputation = objSupportFile.Worksheets("Computation Tab")
    - step:
        id: '125'
        object_path: objComputation.UsedRange
        action: Delete
    - step:
        id: '126'
        object_path: objComputation.cells(1,1)
        action: value
        args: = "Cost Centre"
    - step:
        id: '127'
        object_path: objComputation.cells(1,1).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '128'
        object_path: objComputation.cells(1,1).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '129'
        object_path: objComputation.cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '130'
        object_path: objComputation.cells(1,2)
        action: value
        args: = "Order"
    - step:
        id: '131'
        object_path: objComputation.cells(1,2).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '132'
        object_path: objComputation.cells(1,2).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '133'
        object_path: objComputation.cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '134'
        object_path: objComputation.cells(1,3)
        action: value
        args: = "Network Activity"
    - step:
        id: '135'
        object_path: objComputation.cells(1,3).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '136'
        object_path: objComputation.cells(1,3).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '137'
        object_path: objComputation.cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '138'
        object_path: objComputation.cells(1,4)
        action: value
        args: = "New Order"
    - step:
        id: '139'
        object_path: objComputation.cells(1,4).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '140'
        object_path: objComputation.cells(1,4).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '141'
        object_path: objComputation.cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '142'
        object_path: objComputation.cells(1,5)
        action: value
        args: = "ParActivity"
    - step:
        id: '143'
        object_path: objComputation.cells(1,5).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '144'
        object_path: objComputation.cells(1,5).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '145'
        object_path: objComputation.cells(1,5).Font
        action: Bold
        args: = True
    - step:
        id: '146'
        object_path: objComputation.cells(1,6)
        action: value
        args: = "Sum of Value TranCurr"
    - step:
        id: '147'
        object_path: objComputation.cells(1,6).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '148'
        object_path: objComputation.cells(1,6).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '149'
        object_path: objComputation.cells(1,6).Font
        action: Bold
        args: = True
    - step:
        id: '150'
        object_path: objComputation.cells(1,7)
        action: value
        args: = "Sum of Total Quantity"
    - step:
        id: '151'
        object_path: objComputation.cells(1,7).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '152'
        object_path: objComputation.cells(1,7).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '153'
        object_path: objComputation.cells(1,7).Font
        action: Bold
        args: = True
    - step:
        id: '154'
        object_path: objComputation.cells(1,8)
        action: value
        args: = "New Cost Centre"
    - step:
        id: '155'
        object_path: objComputation.cells(1,8).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '156'
        object_path: objComputation.cells(1,8).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '157'
        object_path: objComputation.cells(1,8).Font
        action: Bold
        args: = True
    - step:
        id: '158'
        object_path: objComputation.cells(1,9)
        action: value
        args: = "New Activity"
    - step:
        id: '159'
        object_path: objComputation.cells(1,9).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '160'
        object_path: objComputation.cells(1,9).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '161'
        object_path: objComputation.cells(1,9).Font
        action: Bold
        args: = True
    - step:
        id: '162'
        object_path: objComputation.cells(1,10)
        action: value
        args: = "New Rate"
    - step:
        id: '163'
        object_path: objComputation.cells(1,10).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '164'
        object_path: objComputation.cells(1,10).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '165'
        object_path: objComputation.cells(1,10).Font
        action: Bold
        args: = True
    - step:
        id: '166'
        object_path: objComputation.cells(1,11)
        action: value
        args: = "Hours"
    - step:
        id: '167'
        object_path: objComputation.cells(1,11).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '168'
        object_path: objComputation.cells(1,11).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '169'
        object_path: objComputation.cells(1,11).Font
        action: Bold
        args: = True
    - step:
        id: '170'
        object_path: objComputation.cells(1,12)
        action: value
        args: = "Dr New Order/Activity"
    - step:
        id: '171'
        object_path: objComputation.cells(1,12).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '172'
        object_path: objComputation.cells(1,12).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '173'
        object_path: objComputation.cells(1,12).Font
        action: Bold
        args: = True
    - step:
        id: '174'
        object_path: objComputation.cells(1,13)
        action: value
        args: = "Cr Order/Activity"
    - step:
        id: '175'
        object_path: objComputation.cells(1,13).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '176'
        object_path: objComputation.cells(1,13).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '177'
        object_path: objComputation.cells(1,13).Font
        action: Bold
        args: = True
    - step:
        id: '178'
        object_path: objComputation.cells(1,14)
        action: value
        args: = "Total"
    - step:
        id: '179'
        object_path: objComputation.cells(1,14).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '180'
        object_path: objComputation.cells(1,14).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '181'
        object_path: objComputation.cells(1,14).Font
        action: Bold
        args: = True
    - step:
        id: '182'
        object_path: objComputation.cells(1,15)
        action: value
        args: = "Difference"
    - step:
        id: '183'
        object_path: objComputation.cells(1,15).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '184'
        object_path: objComputation.cells(1,15).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '185'
        object_path: objComputation.cells(1,15).Font
        action: Bold
        args: = True
    - step:
        id: '186'
        object_path: objComputation.cells(1,16)
        action: value
        args: = ""
    - step:
        id: '187'
        object_path: objComputation.cells(1,16).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '188'
        object_path: objComputation.cells(1,16).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '189'
        object_path: objComputation.cells(1,16).Font
        action: Bold
        args: = True
    - step:
        id: '190'
        object_path: objComputation.cells(1,17)
        action: value
        args: = "Lookup"
    - step:
        id: '191'
        object_path: objComputation.cells(1,17).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '192'
        object_path: objComputation.cells(1,17).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '193'
        object_path: objComputation.cells(1,17).Font
        action: Bold
        args: = True
    - step:
        id: '194'
        object_path: objComputation.cells(1,18)
        action: value
        args: = "Rounded Hours"
    - step:
        id: '195'
        object_path: objComputation.cells(1,18).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '196'
        object_path: objComputation.cells(1,18).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '197'
        object_path: objComputation.cells(1,18).Font
        action: Bold
        args: = True
    - step:
        id: '198'
        action: Script
        object_path: Set objComputation = Nothing
    - step:
        id: '199'
        action: Script
        object_path: ''''''''
    - step:
        id: '200'
        action: Script
        object_path: Set objSAPDataExportOH = objSupportFile.Worksheets("SAP Data
          Export OH")
    - step:
        id: '201'
        object_path: objSAPDataExportOH.UsedRange
        action: Delete
    - step:
        id: '202'
        object_path: objSAPDataExportOH.cells(1,1)
        action: value
        args: = "Project Definition"
    - step:
        id: '203'
        object_path: objSAPDataExportOH.cells(1,1).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '204'
        object_path: objSAPDataExportOH.cells(1,1).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '205'
        object_path: objSAPDataExportOH.cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '206'
        object_path: objSAPDataExportOH.cells(1,2)
        action: value
        args: = "WBS Element"
    - step:
        id: '207'
        object_path: objSAPDataExportOH.cells(1,2).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '208'
        object_path: objSAPDataExportOH.cells(1,2).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '209'
        object_path: objSAPDataExportOH.cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '210'
        object_path: objSAPDataExportOH.cells(1,3)
        action: value
        args: = "Order"
    - step:
        id: '211'
        object_path: objSAPDataExportOH.cells(1,3).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '212'
        object_path: objSAPDataExportOH.cells(1,3).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '213'
        object_path: objSAPDataExportOH.cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '214'
        object_path: objSAPDataExportOH.cells(1,4)
        action: value
        args: = "Object"
    - step:
        id: '215'
        object_path: objSAPDataExportOH.cells(1,4).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '216'
        object_path: objSAPDataExportOH.cells(1,4).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '217'
        object_path: objSAPDataExportOH.cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '218'
        object_path: objSAPDataExportOH.cells(1,5)
        action: value
        args: = "Cost Element"
    - step:
        id: '219'
        object_path: objSAPDataExportOH.cells(1,5).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '220'
        object_path: objSAPDataExportOH.cells(1,5).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '221'
        object_path: objSAPDataExportOH.cells(1,5).Font
        action: Bold
        args: = True
    - step:
        id: '222'
        object_path: objSAPDataExportOH.cells(1,6)
        action: value
        args: = "Personnel Number"
    - step:
        id: '223'
        object_path: objSAPDataExportOH.cells(1,6).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '224'
        object_path: objSAPDataExportOH.cells(1,6).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '225'
        object_path: objSAPDataExportOH.cells(1,6).Font
        action: Bold
        args: = True
    - step:
        id: '226'
        object_path: objSAPDataExportOH.cells(1,7)
        action: value
        args: = "Total Quantity"
    - step:
        id: '227'
        object_path: objSAPDataExportOH.cells(1,7).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '228'
        object_path: objSAPDataExportOH.cells(1,7).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '229'
        object_path: objSAPDataExportOH.cells(1,7).Font
        action: Bold
        args: = True
    - step:
        id: '230'
        object_path: objSAPDataExportOH.cells(1,8)
        action: value
        args: = "Value TranCurr"
    - step:
        id: '231'
        object_path: objSAPDataExportOH.cells(1,8).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '232'
        object_path: objSAPDataExportOH.cells(1,8).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '233'
        object_path: objSAPDataExportOH.cells(1,8).Font
        action: Bold
        args: = True
    - step:
        id: '234'
        object_path: objSAPDataExportOH.cells(1,9)
        action: value
        args: = "Partner-CCtr"
    - step:
        id: '235'
        object_path: objSAPDataExportOH.cells(1,9).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '236'
        object_path: objSAPDataExportOH.cells(1,9).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '237'
        object_path: objSAPDataExportOH.cells(1,9).Font
        action: Bold
        args: = True
    - step:
        id: '238'
        object_path: objSAPDataExportOH.cells(1,10)
        action: value
        args: = "ParActivity"
    - step:
        id: '239'
        object_path: objSAPDataExportOH.cells(1,10).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '240'
        object_path: objSAPDataExportOH.cells(1,10).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '241'
        object_path: objSAPDataExportOH.cells(1,10).Font
        action: Bold
        args: = True
    - step:
        id: '242'
        object_path: objSAPDataExportOH.cells(1,11)
        action: value
        args: = "Network Activity"
    - step:
        id: '243'
        object_path: objSAPDataExportOH.cells(1,11).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '244'
        object_path: objSAPDataExportOH.cells(1,11).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '245'
        object_path: objSAPDataExportOH.cells(1,11).Font
        action: Bold
        args: = True
    - step:
        id: '246'
        object_path: objSAPDataExportOH.cells(1,12)
        action: value
        args: = "New Order"
    - step:
        id: '247'
        object_path: objSAPDataExportOH.cells(1,12).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '248'
        object_path: objSAPDataExportOH.cells(1,12).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '249'
        object_path: objSAPDataExportOH.cells(1,12).Font
        action: Bold
        args: = True
    - step:
        id: '250'
        action: Script
        object_path: Set objSAPDataExportOH = Nothing
    - step:
        id: '251'
        object_path: objSupportFile
        action: save
    - step:
        id: '252'
        object_path: objSupportFile
        action: close
    - step:
        id: '253'
        object_path: objExcel
        action: Quit
    - step:
        id: '254'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '255'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '256'
        action: Script
        object_path: '''''CREATE EXCEL OBJECT'
    - step:
        id: '257'
        action: Script
        object_path: '''Set objExcel = CreateObject("Excel.Application")'
    - step:
        id: '258'
        object_path: '''objExcel'
        action: visible
        args: = true
    - step:
        id: '259'
        action: Script
        object_path: '''''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '260'
        action: Script
        object_path: '''Set objSupportFile = objExcel.Workbooks.open(Parameter("fileLocation")&Parameter("supportFile"))'
    - step:
        id: '261'
        action: Script
        object_path: '''''OPEN PROJECTS TO BE EXPENSED TAB'
    - step:
        id: '262'
        action: Script
        object_path: '''Set objProjectsToBeExpenses = objSupportFile.Worksheets("Projects
          To Be Expensed")'
    - step:
        id: '263'
        action: Script
        object_path: '''''GET ROW COUNT OF PROJECTS TO BE EXPENSED'
    - step:
        id: '264'
        action: Script
        object_path: '''numberOfProj = objProjectsToBeExpenses.usedrange.Rows.Count'
    - step:
        id: '265'
        action: Script
        object_path: '''''CLEAR PROJECTS TO BE EXPENSED ERROR COLUMN ''UPDATE PROJECTS
          TO BE EXPENSED TO ENSURE 6 DIGITS AND NO SPACES'
    - step:
        id: '266'
        action: Script
        object_path: '''For c = 2 To numberOfProj'
    - step:
        id: '267'
        action: Script
        object_path: "'\tprojNum = objProjectsToBeExpenses.cells(c,1).value"
    - step:
        id: '268'
        action: Script
        object_path: "'\tIf projNum = \"\" Then"
    - step:
        id: '269'
        action: Script
        object_path: "'\t\tExit For"
    - step:
        id: '270'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '271'
        action: Script
        object_path: "'\tprojNum = Trim(projNum)"
    - step:
        id: '272'
        action: Script
        object_path: "'\tIf len(projNum) = 8 Then"
    - step:
        id: '273'
        action: Script
        object_path: "'\t\tnewProj = Split(projNum,\"-\")"
    - step:
        id: '274'
        action: Script
        object_path: "'\t\tprojNum = newProj(0)&\"-0\"&newProj(1)"
    - step:
        id: '275'
        action: Script
        object_path: "'\tElseIf len(projNum) = 7 Then"
    - step:
        id: '276'
        action: Script
        object_path: "'\t\tnewProj = Split(projNum,\"-\")"
    - step:
        id: '277'
        action: Script
        object_path: "'\t\tprojNum = newProj(0)&\"-00\"&newProj(1)"
    - step:
        id: '278'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '279'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,1).value = projNum"
    - step:
        id: '280'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,2).value = \"=VLOOKUP(A\"\
          &c&\",'CN43n Export'!$A:$I,4,FALSE)\""
    - step:
        id: '281'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,3).value = \"=VLOOKUP(B\"\
          &c&\",'Work Order Lookup'!$A:$D,2,FALSE)\""
    - step:
        id: '282'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,4).clearcontents"
    - step:
        id: '283'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,5).clearcontents"
    - step:
        id: '284'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,6).clearcontents"
    - step:
        id: '285'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,7).clearcontents"
    - step:
        id: '286'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,8).clearcontents"
    - step:
        id: '287'
        action: Script
        object_path: "'\tobjProjectsToBeExpenses.cells(c,9).clearcontents"
    - step:
        id: '288'
        action: Script
        object_path: '''Next'
    - step:
        id: '289'
        action: Script
        object_path: '''''CLOSE PROJECTS TO BE EXPENSED TAB'
    - step:
        id: '290'
        action: Script
        object_path: '''Set objProjectsToBeExpenses = Nothing'
    - step:
        id: '291'
        action: Script
        object_path: '''''OPEN CN43N EXPORT TAB'
    - step:
        id: '292'
        action: Script
        object_path: '''Set objCN43nExport = objSupportFile.Worksheets("CN43n Export")'
    - step:
        id: '293'
        action: Script
        object_path: '''''GET ROW COUNT OF CN43N EXPORT TAB'
    - step:
        id: '294'
        action: Script
        object_path: '''numberOfCN43n = objCN43nExport.usedrange.Rows.Count'
    - step:
        id: '295'
        action: Script
        object_path: '''''CLEAR CN43N EXPORT TAB'
    - step:
        id: '296'
        action: Script
        object_path: '''For c = 2 To numberOfCN43n'
    - step:
        id: '297'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,1).clearcontents"
    - step:
        id: '298'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,2).clearcontents"
    - step:
        id: '299'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,3).clearcontents"
    - step:
        id: '300'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,4).clearcontents"
    - step:
        id: '301'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,5).clearcontents"
    - step:
        id: '302'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,6).clearcontents"
    - step:
        id: '303'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,7).clearcontents"
    - step:
        id: '304'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,8).clearcontents"
    - step:
        id: '305'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,9).clearcontents"
    - step:
        id: '306'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,10).clearcontents"
    - step:
        id: '307'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,11).clearcontents"
    - step:
        id: '308'
        action: Script
        object_path: "'\tobjCN43nExport.cells(c,12).clearcontents"
    - step:
        id: '309'
        action: Script
        object_path: '''Next'
    - step:
        id: '310'
        action: Script
        object_path: '''''CLOSE CN43N EXPORT TAB'
    - step:
        id: '311'
        action: Script
        object_path: '''Set objCN43nExport = Nothing'
    - step:
        id: '312'
        action: Script
        object_path: '''''OPEN SAP DATA EXPORT TAB'
    - step:
        id: '313'
        action: Script
        object_path: '''Set objSAPDataExport = objSupportFile.Worksheets("SAP Data
          Export")'
    - step:
        id: '314'
        action: Script
        object_path: '''''GET ROW COUNT OF SAP DATA EXPORT TAB'
    - step:
        id: '315'
        action: Script
        object_path: '''numberOfSAPData = objSAPDataExport.usedrange.Rows.Count'
    - step:
        id: '316'
        action: Script
        object_path: '''''CLEAR SAP DATA EXPORT TAB'
    - step:
        id: '317'
        action: Script
        object_path: '''For c = 2 To numberOfSAPData'
    - step:
        id: '318'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,1).clearcontents"
    - step:
        id: '319'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,2).clearcontents"
    - step:
        id: '320'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,3).clearcontents"
    - step:
        id: '321'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,4).clearcontents"
    - step:
        id: '322'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,5).clearcontents"
    - step:
        id: '323'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,6).clearcontents"
    - step:
        id: '324'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,7).clearcontents"
    - step:
        id: '325'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,8).clearcontents"
    - step:
        id: '326'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,9).clearcontents"
    - step:
        id: '327'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,10).clearcontents"
    - step:
        id: '328'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,11).clearcontents"
    - step:
        id: '329'
        action: Script
        object_path: "'\tobjSAPDataExport.cells(c,12).clearcontents"
    - step:
        id: '330'
        action: Script
        object_path: '''Next'
    - step:
        id: '331'
        action: Script
        object_path: '''''CLOSE SAP DATA EXPORT TAB'
    - step:
        id: '332'
        action: Script
        object_path: '''Set objSAPDataExport = Nothing'
    - step:
        id: '333'
        action: Script
        object_path: '''''OPEN COMPUTATION TAB'
    - step:
        id: '334'
        action: Script
        object_path: '''Set objComputation = objSupportFile.Worksheets("Computation
          Tab")'
    - step:
        id: '335'
        action: Script
        object_path: '''''GET ROW COUNT OF COMPUTATION TAB'
    - step:
        id: '336'
        action: Script
        object_path: '''numberOfComputation = objComputation.usedrange.Rows.Count'
    - step:
        id: '337'
        action: Script
        object_path: '''''CLEAR COMPUTATION TAB'
    - step:
        id: '338'
        action: Script
        object_path: '''For c = 2 To numberOfComputation'
    - step:
        id: '339'
        action: Script
        object_path: "'\tobjComputation.cells(c,1).clearcontents"
    - step:
        id: '340'
        action: Script
        object_path: "'\tobjComputation.cells(c,2).clearcontents"
    - step:
        id: '341'
        action: Script
        object_path: "'\tobjComputation.cells(c,3).clearcontents"
    - step:
        id: '342'
        action: Script
        object_path: "'\tobjComputation.cells(c,4).clearcontents"
    - step:
        id: '343'
        action: Script
        object_path: "'\tobjComputation.cells(c,5).clearcontents"
    - step:
        id: '344'
        action: Script
        object_path: "'\tobjComputation.cells(c,6).clearcontents"
    - step:
        id: '345'
        action: Script
        object_path: "'\tobjComputation.cells(c,7).clearcontents"
    - step:
        id: '346'
        action: Script
        object_path: "'\tobjComputation.cells(c,8).clearcontents"
    - step:
        id: '347'
        action: Script
        object_path: "'\tobjComputation.cells(c,9).clearcontents"
    - step:
        id: '348'
        action: Script
        object_path: "'\tobjComputation.cells(c,10).clearcontents"
    - step:
        id: '349'
        action: Script
        object_path: "'\tobjComputation.cells(c,11).clearcontents"
    - step:
        id: '350'
        action: Script
        object_path: "'\tobjComputation.cells(c,12).clearcontents"
    - step:
        id: '351'
        action: Script
        object_path: "'\tobjComputation.cells(c,13).clearcontents"
    - step:
        id: '352'
        action: Script
        object_path: "'\tobjComputation.cells(c,14).clearcontents"
    - step:
        id: '353'
        action: Script
        object_path: "'\tobjComputation.cells(c,15).clearcontents"
    - step:
        id: '354'
        action: Script
        object_path: "'\tobjComputation.cells(c,16).clearcontents"
    - step:
        id: '355'
        action: Script
        object_path: "'\tobjComputation.cells(c,17).clearcontents"
    - step:
        id: '356'
        action: Script
        object_path: "'\tobjComputation.cells(c,18).clearcontents"
    - step:
        id: '357'
        action: Script
        object_path: '''Next'
    - step:
        id: '358'
        action: Script
        object_path: '''''CLOSE COMPUTATION TAB'
    - step:
        id: '359'
        action: Script
        object_path: '''Set objComputation = Nothing'
    - step:
        id: '360'
        action: Script
        object_path: '''''OPEN SAP DATA EXPORT OH TAB'
    - step:
        id: '361'
        action: Script
        object_path: '''Set objSAPDataExportOH = objSupportFile.Worksheets("SAP Data
          Export OH")'
    - step:
        id: '362'
        action: Script
        object_path: '''''GET ROW COUNT OF SAP DATA EXPORT TAB'
    - step:
        id: '363'
        action: Script
        object_path: '''numberOfSAPData = objSAPDataExportOH.usedrange.Rows.Count'
    - step:
        id: '364'
        action: Script
        object_path: '''''CLEAR SAP DATA EXPORT TAB'
    - step:
        id: '365'
        action: Script
        object_path: '''For c = 2 To numberOfSAPData'
    - step:
        id: '366'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,1).clearcontents"
    - step:
        id: '367'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,2).clearcontents"
    - step:
        id: '368'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,3).clearcontents"
    - step:
        id: '369'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,4).clearcontents"
    - step:
        id: '370'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,5).clearcontents"
    - step:
        id: '371'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,6).clearcontents"
    - step:
        id: '372'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,7).clearcontents"
    - step:
        id: '373'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,8).clearcontents"
    - step:
        id: '374'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,9).clearcontents"
    - step:
        id: '375'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,10).clearcontents"
    - step:
        id: '376'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,11).clearcontents"
    - step:
        id: '377'
        action: Script
        object_path: "'\tobjSAPDataExportOH.cells(c,12).clearcontents"
    - step:
        id: '378'
        action: Script
        object_path: '''Next'
    - step:
        id: '379'
        action: Script
        object_path: '''''CLOSE SAP DATA EXPORT TAB'
    - step:
        id: '380'
        action: Script
        object_path: '''Set objSAPDataExportOH = Nothing'
    - step:
        id: '381'
        action: Script
        object_path: '''''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '382'
        object_path: '''objSupportFile'
        action: save
    - step:
        id: '383'
        object_path: '''objSupportFile'
        action: close
    - step:
        id: '384'
        object_path: '''objExcel'
        action: Quit
    - step:
        id: '385'
        action: Script
        object_path: '''''RELEASE OBJECTS'
    - step:
        id: '386'
        action: Script
        object_path: '''Set objExcel = Nothing'
    - step:
        id: '387'
        action: Script
        object_path: '''Set objSupportFile = Nothing'
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
      last_update_time: Monday, 3 April 2023 2:46:43 PM
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Project Info System: WBS_2'
          properties:
          - property:
              value:
                value: CN43N
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
                value: SAPLPSIS_SINGLE01
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: Project Definitions
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
                    value: wnd[0]/usr/cntlALVCONTAINER/shellcont/shell
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Project Info System: WBS'
          properties:
          - property:
              value:
                value: CN43N
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
                value: RPSISPE000
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Layout
              properties:
              - property:
                  value:
                    value: P_DISVAR
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
                    value: wnd[0]/usr/ctxtP_DISVAR
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: CN43N
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile
          properties:
          - property:
              value:
                value: CN43N
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
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
              last_update_time: Monday, 3 April 2023 2:46:43 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Define Selection Options
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '651'
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
          last_update_time: Monday, 3 April 2023 2:46:43 PM
          child_objects: []
  check_points_and_outputs: []
  parameters: []
