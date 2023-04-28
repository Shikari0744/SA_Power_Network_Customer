namespace: ProjectExpensing
operation:
  name: ComputationTab
  inputs:
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks (1)\Project Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.ComputationTab:1.0.0
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
        object_path: '''STEP 3: UPDATE COMPUTATION TAB'
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
        object_path: '''OPEN HOURS PIVOT TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objHoursPivot = objSupportFile.Worksheets("Hours Pivot")
    - step:
        id: '9'
        action: Script
        object_path: '''OPEN COMPUTATION TAB'
    - step:
        id: '10'
        action: Script
        object_path: Set objComputation = objSupportFile.Worksheets("Computation Tab")
    - step:
        id: '11'
        action: Script
        object_path: ''''''
    - step:
        id: '12'
        object_path: objComputation.UsedRange
        action: Delete
    - step:
        id: '13'
        object_path: objComputation.cells(1,1)
        action: value
        args: = "Cost Centre"
    - step:
        id: '14'
        object_path: objComputation.cells(1,1).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '15'
        object_path: objComputation.cells(1,1).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '16'
        object_path: objComputation.cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '17'
        object_path: objComputation.cells(1,2)
        action: value
        args: = "Order"
    - step:
        id: '18'
        object_path: objComputation.cells(1,2).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '19'
        object_path: objComputation.cells(1,2).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '20'
        object_path: objComputation.cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '21'
        object_path: objComputation.cells(1,3)
        action: value
        args: = "Network Activity"
    - step:
        id: '22'
        object_path: objComputation.cells(1,3).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '23'
        object_path: objComputation.cells(1,3).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '24'
        object_path: objComputation.cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '25'
        object_path: objComputation.cells(1,4)
        action: value
        args: = "New Order"
    - step:
        id: '26'
        object_path: objComputation.cells(1,4).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '27'
        object_path: objComputation.cells(1,4).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '28'
        object_path: objComputation.cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '29'
        object_path: objComputation.cells(1,5)
        action: value
        args: = "ParActivity"
    - step:
        id: '30'
        object_path: objComputation.cells(1,5).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '31'
        object_path: objComputation.cells(1,5).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '32'
        object_path: objComputation.cells(1,5).Font
        action: Bold
        args: = True
    - step:
        id: '33'
        object_path: objComputation.cells(1,6)
        action: value
        args: = "Sum of Value TranCurr"
    - step:
        id: '34'
        object_path: objComputation.cells(1,6).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '35'
        object_path: objComputation.cells(1,6).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '36'
        object_path: objComputation.cells(1,6).Font
        action: Bold
        args: = True
    - step:
        id: '37'
        object_path: objComputation.cells(1,7)
        action: value
        args: = "Sum of Total Quantity"
    - step:
        id: '38'
        object_path: objComputation.cells(1,7).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '39'
        object_path: objComputation.cells(1,7).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '40'
        object_path: objComputation.cells(1,7).Font
        action: Bold
        args: = True
    - step:
        id: '41'
        object_path: objComputation.cells(1,8)
        action: value
        args: = "New Cost Centre"
    - step:
        id: '42'
        object_path: objComputation.cells(1,8).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '43'
        object_path: objComputation.cells(1,8).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '44'
        object_path: objComputation.cells(1,8).Font
        action: Bold
        args: = True
    - step:
        id: '45'
        object_path: objComputation.cells(1,9)
        action: value
        args: = "New Activity"
    - step:
        id: '46'
        object_path: objComputation.cells(1,9).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '47'
        object_path: objComputation.cells(1,9).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '48'
        object_path: objComputation.cells(1,9).Font
        action: Bold
        args: = True
    - step:
        id: '49'
        object_path: objComputation.cells(1,10)
        action: value
        args: = "New Rate"
    - step:
        id: '50'
        object_path: objComputation.cells(1,10).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '51'
        object_path: objComputation.cells(1,10).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '52'
        object_path: objComputation.cells(1,10).Font
        action: Bold
        args: = True
    - step:
        id: '53'
        object_path: objComputation.cells(1,11)
        action: value
        args: = "Hours"
    - step:
        id: '54'
        object_path: objComputation.cells(1,11).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '55'
        object_path: objComputation.cells(1,11).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '56'
        object_path: objComputation.cells(1,11).Font
        action: Bold
        args: = True
    - step:
        id: '57'
        object_path: objComputation.cells(1,12)
        action: value
        args: = "Dr New Order/Activity"
    - step:
        id: '58'
        object_path: objComputation.cells(1,12).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '59'
        object_path: objComputation.cells(1,12).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '60'
        object_path: objComputation.cells(1,12).Font
        action: Bold
        args: = True
    - step:
        id: '61'
        object_path: objComputation.cells(1,13)
        action: value
        args: = "Cr Order/Activity"
    - step:
        id: '62'
        object_path: objComputation.cells(1,13).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '63'
        object_path: objComputation.cells(1,13).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '64'
        object_path: objComputation.cells(1,13).Font
        action: Bold
        args: = True
    - step:
        id: '65'
        object_path: objComputation.cells(1,14)
        action: value
        args: = "Total"
    - step:
        id: '66'
        object_path: objComputation.cells(1,14).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '67'
        object_path: objComputation.cells(1,14).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '68'
        object_path: objComputation.cells(1,14).Font
        action: Bold
        args: = True
    - step:
        id: '69'
        object_path: objComputation.cells(1,15)
        action: value
        args: = "Difference"
    - step:
        id: '70'
        object_path: objComputation.cells(1,15).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '71'
        object_path: objComputation.cells(1,15).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '72'
        object_path: objComputation.cells(1,15).Font
        action: Bold
        args: = True
    - step:
        id: '73'
        object_path: objComputation.cells(1,16)
        action: value
        args: = ""
    - step:
        id: '74'
        object_path: objComputation.cells(1,16).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '75'
        object_path: objComputation.cells(1,16).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '76'
        object_path: objComputation.cells(1,16).Font
        action: Bold
        args: = True
    - step:
        id: '77'
        object_path: objComputation.cells(1,17)
        action: value
        args: = "Lookup"
    - step:
        id: '78'
        object_path: objComputation.cells(1,17).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '79'
        object_path: objComputation.cells(1,17).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '80'
        object_path: objComputation.cells(1,17).Font
        action: Bold
        args: = True
    - step:
        id: '81'
        object_path: objComputation.cells(1,18)
        action: value
        args: = "Rounded Hours"
    - step:
        id: '82'
        object_path: objComputation.cells(1,18).Font
        action: ColorIndex
        args: = 1
    - step:
        id: '83'
        object_path: objComputation.cells(1,18).Interior
        action: ColorIndex
        args: = 23
    - step:
        id: '84'
        object_path: objComputation.cells(1,18).Font
        action: Bold
        args: = True
    - step:
        id: '85'
        action: Script
        object_path: '''FIND BOTTOM OF THE PIVOT TABLE'
    - step:
        id: '86'
        action: Script
        object_path: endOfPivotRow = objHoursPivot.Range("A1048576").End(-4162).Row
          - 1
    - step:
        id: '87'
        action: Script
        object_path: '''FIND BOTTOM OF THE COMPUTATION TAB'
    - step:
        id: '88'
        action: Script
        object_path: compRow = objComputation.Range("A1048576").End(-4162).Row + 1
    - step:
        id: '89'
        action: Script
        object_path: '''SET ROW NUMBER OF COMPUTATION TAB'
    - step:
        id: '90'
        action: Script
        object_path: '''numberOfComputation = objComputation.usedrange.Rows.Count'
    - step:
        id: '91'
        action: Script
        object_path: o = compRow
    - step:
        id: '92'
        action: Script
        object_path: For i = 1 To endofPivotRow
    - step:
        id: '93'
        action: Script
        object_path: rowLabel = objHoursPivot.cells(i,1).value
    - step:
        id: '94'
        action: Script
        object_path: '''ONLY GRAB DATA IF NUMERIC AND NOT EMPTY'
    - step:
        id: '95'
        action: Script
        object_path: If IsNumeric(rowLabel) and rowLabel <> "" Then
    - step:
        id: '96'
        action: Script
        object_path: '''GRAB DATA FROM PIVOT TABLE'
    - step:
        id: '97'
        action: Script
        object_path: costCentre = objHoursPivot.cells(i,1).value
    - step:
        id: '98'
        action: Script
        object_path: order = objHoursPivot.cells(i,2).value
    - step:
        id: '99'
        action: Script
        object_path: parActivity = objHoursPivot.cells(i,3).value
    - step:
        id: '100'
        action: Script
        object_path: networkActivity = objHoursPivot.cells(i,4).value
    - step:
        id: '101'
        action: Script
        object_path: newOrder = objHoursPivot.cells(i,5).value
    - step:
        id: '102'
        action: Script
        object_path: valueTranCurr = objHoursPivot.cells(i,6).value
    - step:
        id: '103'
        action: Script
        object_path: totalQuantity = objHoursPivot.cells(i,7).value
    - step:
        id: '104'
        action: Script
        object_path: '''ADD DATA TO COMPUTATION TAB'
    - step:
        id: '105'
        object_path: objComputation.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '106'
        object_path: objComputation.cells(o,2)
        action: value
        args: = order
    - step:
        id: '107'
        action: Script
        object_path: If networkActivity <> "" Then
    - step:
        id: '108'
        object_path: objComputation.cells(o,3)
        action: value
        args: = "=BASE("&networkActivity&",10,4)"
    - step:
        id: '109'
        action: Script
        object_path: End If
    - step:
        id: '110'
        object_path: objComputation.cells(o,4)
        action: value
        args: = newOrder
    - step:
        id: '111'
        object_path: objComputation.cells(o,5)
        action: value
        args: = parActivity
    - step:
        id: '112'
        object_path: objComputation.cells(o,6)
        action: value
        args: = valueTranCurr
    - step:
        id: '113'
        object_path: objComputation.cells(o,7)
        action: value
        args: = totalQuantity
    - step:
        id: '114'
        object_path: objComputation.cells(o,8)
        action: value
        args: = "=VLOOKUP(A"&o&",'Cost Centre Lookup'!$A:$B,2,FALSE)"
    - step:
        id: '115'
        object_path: objComputation.cells(o,9)
        action: value
        args: = "=E"&o
    - step:
        id: '116'
        object_path: objComputation.cells(o,10)
        action: value
        args: = "=VLOOKUP(Q"&o&",'Labour Rate Export'!A:J,7,FALSE)"
    - step:
        id: '117'
        object_path: objComputation.cells(o,11)
        action: value
        args: = "=F"&o&"/J"&o
    - step:
        id: '118'
        object_path: objComputation.cells(o,12)
        action: value
        args: = "=ROUND(K"&o&",2)"
    - step:
        id: '119'
        object_path: objComputation.cells(o,13)
        action: value
        args: = "=L"&o&"*-1"
    - step:
        id: '120'
        object_path: objComputation.cells(o,14)
        action: value
        args: = "=L"&o&"*J"&o
    - step:
        id: '121'
        object_path: objComputation.cells(o,15)
        action: value
        args: = "=F"&o&"-N"&o
    - step:
        id: '122'
        object_path: objComputation.cells(o,16)
        action: value
        args: = ""
    - step:
        id: '123'
        object_path: objComputation.cells(o,17)
        action: value
        args: = "=H"&o&"&""_""&I"&o
    - step:
        id: '124'
        object_path: objComputation.cells(o,18)
        action: value
        args: = "=ROUND(K"&o&",2)"
    - step:
        id: '125'
        action: Script
        object_path: o = o + 1
    - step:
        id: '126'
        action: Script
        object_path: End If
    - step:
        id: '127'
        action: Script
        object_path: Next
    - step:
        id: '128'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '129'
        object_path: objSupportFile
        action: save
    - step:
        id: '130'
        object_path: objSupportFile
        action: close
    - step:
        id: '131'
        object_path: objExcel
        action: Quit
    - step:
        id: '132'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '133'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '134'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '135'
        action: Script
        object_path: Set objComputation = Nothing
    - step:
        id: '136'
        action: Script
        object_path: Set objHoursPivot = Nothing
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
