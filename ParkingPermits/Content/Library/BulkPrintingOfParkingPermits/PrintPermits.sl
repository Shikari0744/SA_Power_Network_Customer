namespace: BulkPrintingOfParkingPermits
operation:
  name: PrintPermits
  inputs:
  - permit: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Parking
      Permits Bulk Printing\ParkingPermits.xlsx
  - employee: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Parking
      Permits Bulk Printing\
  sequential_action:
    gav: com.microfocus.seq:BulkPrintingOfParkingPermits.PrintPermits:1.0.0
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
        object_path: ''''
    - step:
        id: '2'
        action: Script
        object_path: ''''
    - step:
        id: '3'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''2023'
    - step:
        id: '4'
        action: Script
        object_path: ''''
    - step:
        id: '5'
        action: Script
        object_path: ''''
    - step:
        id: '6'
        action: Script
        object_path: files = Array("Staff returning 2nd week of January.xlsx","Staff
          returning 3rd week of January.xlsx")
    - step:
        id: '7'
        action: Script
        object_path: '''files = Array("Staff returning 1st week of January.xlsx","Staff
          returning 2nd week of January.xlsx","Staff returning 3rd week of January.xlsx")'
    - step:
        id: '8'
        action: Script
        object_path: For each file in files
    - step:
        id: '9'
        action: Script
        object_path: employee = Parameter("employee") & file
    - step:
        id: '10'
        action: Script
        object_path: '''GET EMPLOYEE IDS AND PRINT PARKING PERMITS'
    - step:
        id: '11'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '12'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '13'
        action: Script
        object_path: Set objEmployeeIDs = objExcel.Workbooks.open(employee)
    - step:
        id: '14'
        action: Script
        object_path: Set objEmployeeSheet = objEmployeeIDs.Worksheets(1)
    - step:
        id: '15'
        action: Script
        object_path: Set objPermits = objExcel.Workbooks.open(Parameter("permit"))
    - step:
        id: '16'
        action: Script
        object_path: Set objPermitSheet = objPermits.Worksheets(1)
    - step:
        id: '17'
        action: Script
        object_path: rowcount = objEmployeeSheet.usedrange.Rows.Count
    - step:
        id: '18'
        action: Script
        object_path: '''PRINT SINGLE PERMITS'
    - step:
        id: '19'
        action: Script
        object_path: permitsToPrint = ""
    - step:
        id: '20'
        action: Script
        object_path: x = 0
    - step:
        id: '21'
        action: Script
        object_path: For i = 1 To rowcount
    - step:
        id: '22'
        action: Script
        object_path: If objEmployeeSheet.cells(i,4).value = "" Then
    - step:
        id: '23'
        action: Script
        object_path: employeeID = objEmployeeSheet.cells(i,1).value
    - step:
        id: '24'
        action: Script
        object_path: If employeeID <> "Number" and employeeID <> ""  Then
    - step:
        id: '25'
        action: Script
        object_path: firstVehicle = objEmployeeSheet.cells(i,2).value
    - step:
        id: '26'
        action: Script
        object_path: secondVehicle = objEmployeeSheet.cells(i,3).value
    - step:
        id: '27'
        action: Script
        object_path: If (secondVehicle = empty or secondVehicle = "NA") Then
    - step:
        id: '28'
        action: Script
        object_path: permitsToPrint = permitsToPrint & "," & employeeID
    - step:
        id: '29'
        object_path: objEmployeeSheet.cells(i,4)
        action: value
        args: = "Y"
    - step:
        id: '30'
        action: Script
        object_path: x = x + 1
    - step:
        id: '31'
        action: Script
        object_path: End If
    - step:
        id: '32'
        action: Script
        object_path: If x = 4 or i = rowcount Then
    - step:
        id: '33'
        action: Script
        object_path: employeeID = Split(permitsToPrint,",")
    - step:
        id: '34'
        action: Script
        object_path: employeeIDlength = UBound(employeeID)
    - step:
        id: '35'
        action: Script
        object_path: If employeeIDlength = 4 Then
    - step:
        id: '36'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '37'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = employeeID(2)
    - step:
        id: '38'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = employeeID(3)
    - step:
        id: '39'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = employeeID(4)
    - step:
        id: '40'
        action: Script
        object_path: ElseIf employeeIDlength = 3 Then
    - step:
        id: '41'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '42'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = employeeID(2)
    - step:
        id: '43'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = employeeID(3)
    - step:
        id: '44'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = ""
    - step:
        id: '45'
        action: Script
        object_path: ElseIf employeeIDlength = 2 Then
    - step:
        id: '46'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '47'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = employeeID(2)
    - step:
        id: '48'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = ""
    - step:
        id: '49'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = ""
    - step:
        id: '50'
        action: Script
        object_path: ElseIf employeeIDlength = 1 Then
    - step:
        id: '51'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '52'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = ""
    - step:
        id: '53'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = ""
    - step:
        id: '54'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = ""
    - step:
        id: '55'
        action: Script
        object_path: End If
    - step:
        id: '56'
        object_path: Window("Excel_2").WinObject("Ribbon").WinButton("File Tab")
        action: Click
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '57'
        object_path: Window("Excel_2").WinObject("WinObject").WinList("File")
        action: Select
        args: '"Print"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '58'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '59'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '60'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '61'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '4130268'
    - step:
        id: '62'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '63'
        object_path: Window("Excel_2").WinObject("WinObject").WinButton("Print")
        action: Click
    - step:
        id: '64'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '65'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '66'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '67'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '68'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '69'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '70'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '71'
        action: Script
        object_path: permitsToPrint = ""
    - step:
        id: '72'
        action: Script
        object_path: x = 0
    - step:
        id: '73'
        action: Script
        object_path: End If
    - step:
        id: '74'
        action: Script
        object_path: End If
    - step:
        id: '75'
        action: Script
        object_path: employeeID = ""
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
        action: Script
        object_path: Next
    - step:
        id: '79'
        action: Script
        object_path: '''PRINT DOUBLE PERMITS'
    - step:
        id: '80'
        action: Script
        object_path: permitsToPrint = ""
    - step:
        id: '81'
        action: Script
        object_path: x = 0
    - step:
        id: '82'
        action: Script
        object_path: For i = 1 To rowcount
    - step:
        id: '83'
        action: Script
        object_path: If objEmployeeSheet.cells(i,4).value = "" Then
    - step:
        id: '84'
        action: Script
        object_path: employeeID = objEmployeeSheet.cells(i,1).value
    - step:
        id: '85'
        action: Script
        object_path: If employeeID <> "Number" and employeeID <> ""  Then
    - step:
        id: '86'
        action: Script
        object_path: firstVehicle = objEmployeeSheet.cells(i,2).value
    - step:
        id: '87'
        action: Script
        object_path: secondVehicle = objEmployeeSheet.cells(i,3).value
    - step:
        id: '88'
        action: Script
        object_path: If secondVehicle <> "" Then
    - step:
        id: '89'
        action: Script
        object_path: permitsToPrint = permitsToPrint & "," & employeeID
    - step:
        id: '90'
        object_path: objEmployeeSheet.cells(i,4)
        action: value
        args: = "Y"
    - step:
        id: '91'
        action: Script
        object_path: x = x + 1
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: If x = 2 or i = rowcount Then
    - step:
        id: '94'
        action: Script
        object_path: employeeID = Split(permitsToPrint,",")
    - step:
        id: '95'
        action: Script
        object_path: employeeIDlength = UBound(employeeID)
    - step:
        id: '96'
        action: Script
        object_path: If employeeIDlength = 2 Then
    - step:
        id: '97'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '98'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = employeeID(1)
    - step:
        id: '99'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = employeeID(2)
    - step:
        id: '100'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = employeeID(2)
    - step:
        id: '101'
        action: Script
        object_path: ElseIf employeeIDlength = 1 Then
    - step:
        id: '102'
        object_path: objPermitSheet.cells(5,3)
        action: value
        args: = employeeID(1)
    - step:
        id: '103'
        object_path: objPermitSheet.cells(5,12)
        action: value
        args: = employeeID(1)
    - step:
        id: '104'
        object_path: objPermitSheet.cells(23,3)
        action: value
        args: = ""
    - step:
        id: '105'
        object_path: objPermitSheet.cells(23,12)
        action: value
        args: = ""
    - step:
        id: '106'
        action: Script
        object_path: End If
    - step:
        id: '107'
        object_path: Window("Excel_2").WinObject("Ribbon").WinButton("File Tab")
        action: Click
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '108'
        object_path: Window("Excel_2").WinObject("WinObject").WinList("File")
        action: Select
        args: '"Print"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '109'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '110'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '111'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '112'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
    - step:
        id: '113'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '114'
        object_path: Window("Excel_2").WinObject("WinObject").WinButton("Print")
        action: Click
    - step:
        id: '115'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '116'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '117'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '118'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '119'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '120'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '121'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '122'
        action: Script
        object_path: permitsToPrint = ""
    - step:
        id: '123'
        action: Script
        object_path: x = 0
    - step:
        id: '124'
        action: Script
        object_path: End If
    - step:
        id: '125'
        action: Script
        object_path: End If
    - step:
        id: '126'
        action: Script
        object_path: employeeID = ""
    - step:
        id: '127'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '128'
        action: Script
        object_path: End If
    - step:
        id: '129'
        action: Script
        object_path: Next
    - step:
        id: '130'
        object_path: objPermits
        action: save
    - step:
        id: '131'
        object_path: objPermits
        action: close
    - step:
        id: '132'
        object_path: objExcel
        action: Quit
    - step:
        id: '133'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '134'
        action: Script
        object_path: Set objPermits = Nothing
    - step:
        id: '135'
        action: Script
        object_path: Set objPermitSheet = Nothing
    - step:
        id: '136'
        action: Script
        object_path: Next
    - step:
        id: '137'
        action: Script
        object_path: ''''
    - step:
        id: '138'
        action: Script
        object_path: ''''
    - step:
        id: '139'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''2022'
    - step:
        id: '140'
        action: Script
        object_path: ''''
    - step:
        id: '141'
        action: Script
        object_path: ''''
    - step:
        id: '142'
        action: Script
        object_path: '''''GET EMPLOYEE IDS AND PRINT PARKING PERMITS'
    - step:
        id: '143'
        action: Script
        object_path: '''Set objExcel = CreateObject("Excel.Application")'
    - step:
        id: '144'
        object_path: '''objExcel'
        action: visible
        args: = true
    - step:
        id: '145'
        action: Script
        object_path: '''Set objEmployeeIDs = objExcel.Workbooks.open("C:\Users\haasj0\OneDrive
          - SA Power Networks\Documents\Process Automation\Parking Permits Bulk Printing\2022
          car park permit for 1RR(1-93).xlsx")'
    - step:
        id: '146'
        action: Script
        object_path: '''Set objEmployeeSheet = objEmployeeIDs.Worksheets(2)'
    - step:
        id: '147'
        action: Script
        object_path: '''Set objPermits = objExcel.Workbooks.open("C:\Users\haasj0\OneDrive
          - SA Power Networks\Documents\Process Automation\Parking Permits Bulk Printing\ParkingPermits.xlsx")'
    - step:
        id: '148'
        action: Script
        object_path: '''Set objPermitSheet = objPermits.Worksheets(1)'
    - step:
        id: '149'
        action: Script
        object_path: '''rowcount = objEmployeeSheet.usedrange.Rows.Count'
    - step:
        id: '150'
        action: Script
        object_path: '''''PRINT SINGLE PERMITS'
    - step:
        id: '151'
        action: Script
        object_path: '''permitsToPrint = ""'
    - step:
        id: '152'
        action: Script
        object_path: '''x = 0'
    - step:
        id: '153'
        action: Script
        object_path: '''For i = 1 To rowcount'
    - step:
        id: '154'
        action: Script
        object_path: "'\tID = objEmployeeSheet.cells(i,1).value"
    - step:
        id: '155'
        action: Script
        object_path: "'\tIf ID <> \"ID\" Then"
    - step:
        id: '156'
        action: Script
        object_path: "'\t\temployeeID = objEmployeeSheet.cells(i,7).value"
    - step:
        id: '157'
        action: Script
        object_path: "'\t\tsecondVehicle = objEmployeeSheet.cells(i,9).value"
    - step:
        id: '158'
        action: Script
        object_path: "'\t\tthirdVehicle = objEmployeeSheet.cells(i,10).value"
    - step:
        id: '159'
        action: Script
        object_path: "'\t\tfourthVehicle = objEmployeeSheet.cells(i,11).value"
    - step:
        id: '160'
        action: Script
        object_path: "'\t\tfifthVehicle = objEmployeeSheet.cells(i,12).value"
    - step:
        id: '161'
        action: Script
        object_path: "'\t\tIf employeeID <> \"\" and (secondVehicle = empty or secondVehicle\
          \ = \"NA\") and (thirdVehicle = empty or thirdVehicle = \"NA\") and (fourthVehicle\
          \ = empty or fourthVehicle = \"NA\") and (fifthVehicle = empty or fifthVehicle\
          \ = \"NA\") Then"
    - step:
        id: '162'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = permitsToPrint & \",\" & employeeID"
    - step:
        id: '163'
        action: Script
        object_path: "'\t\t\tx = x + 1"
    - step:
        id: '164'
        action: Script
        object_path: "'\t\t\tprint employeeID"
    - step:
        id: '165'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '166'
        action: Script
        object_path: "'\t\tIf x = 4 or i = rowcount Then"
    - step:
        id: '167'
        action: Script
        object_path: "'\t\t\temployeeID = Split(permitsToPrint,\",\")"
    - step:
        id: '168'
        action: Script
        object_path: "'\t\t\temployeeIDlength = UBound(employeeID)"
    - step:
        id: '169'
        action: Script
        object_path: "'\t\t\tIf employeeIDlength = 4 Then"
    - step:
        id: '170'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '171'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = employeeID(2)"
    - step:
        id: '172'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = employeeID(3)"
    - step:
        id: '173'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = employeeID(4)"
    - step:
        id: '174'
        action: Script
        object_path: "'\t\t\tElseIf employeeIDlength = 3 Then"
    - step:
        id: '175'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '176'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = employeeID(2)"
    - step:
        id: '177'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = employeeID(3)"
    - step:
        id: '178'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = \"\""
    - step:
        id: '179'
        action: Script
        object_path: "'\t\t\tElseIf employeeIDlength = 2 Then"
    - step:
        id: '180'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '181'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = employeeID(2)"
    - step:
        id: '182'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = \"\""
    - step:
        id: '183'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = \"\""
    - step:
        id: '184'
        action: Script
        object_path: "'\t\t\tElseIf employeeIDlength = 1 Then"
    - step:
        id: '185'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '186'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = \"\""
    - step:
        id: '187'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = \"\""
    - step:
        id: '188'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = \"\""
    - step:
        id: '189'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '190'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '191'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '192'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '193'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '194'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '195'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '4130268'
    - step:
        id: '196'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '197'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '198'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '199'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '200'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '201'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '202'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '203'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '204'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '205'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = \"\""
    - step:
        id: '206'
        action: Script
        object_path: "'\t\t\tx = 0"
    - step:
        id: '207'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '208'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '209'
        action: Script
        object_path: "'\tID = \"\""
    - step:
        id: '210'
        action: Script
        object_path: '''Next'
    - step:
        id: '211'
        action: Script
        object_path: '''''PRINT DOUBLE PERMITS'
    - step:
        id: '212'
        action: Script
        object_path: '''permitsToPrint = ""'
    - step:
        id: '213'
        action: Script
        object_path: '''x = 0'
    - step:
        id: '214'
        action: Script
        object_path: '''For i = 1 To rowcount'
    - step:
        id: '215'
        action: Script
        object_path: "'\tID = objEmployeeSheet.cells(i,1).value"
    - step:
        id: '216'
        action: Script
        object_path: "'\tIf ID <> \"ID\" Then"
    - step:
        id: '217'
        action: Script
        object_path: "'\t\temployeeID = objEmployeeSheet.cells(i,7).value"
    - step:
        id: '218'
        action: Script
        object_path: "'\t\tsecondVehicle = objEmployeeSheet.cells(i,9).value"
    - step:
        id: '219'
        action: Script
        object_path: "'\t\tthirdVehicle = objEmployeeSheet.cells(i,10).value"
    - step:
        id: '220'
        action: Script
        object_path: "'\t\tfourthVehicle = objEmployeeSheet.cells(i,11).value"
    - step:
        id: '221'
        action: Script
        object_path: "'\t\tfifthVehicle = objEmployeeSheet.cells(i,12).value"
    - step:
        id: '222'
        action: Script
        object_path: "'\t\tIf employeeID <> \"\" and secondVehicle <> \"\" and (thirdVehicle\
          \ = empty or thirdVehicle = \"NA\") and (fourthVehicle = empty or fourthVehicle\
          \ = \"NA\") and (fifthVehicle = empty or fifthVehicle = \"NA\") Then"
    - step:
        id: '223'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = permitsToPrint & \",\" & employeeID"
    - step:
        id: '224'
        action: Script
        object_path: "'\t\t\tx = x + 1"
    - step:
        id: '225'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '226'
        action: Script
        object_path: "'\t\tIf x = 2 or i = rowcount Then"
    - step:
        id: '227'
        action: Script
        object_path: "'\t\t\temployeeID = Split(permitsToPrint,\",\")"
    - step:
        id: '228'
        action: Script
        object_path: "'\t\t\temployeeIDlength = UBound(employeeID)"
    - step:
        id: '229'
        action: Script
        object_path: "'\t\t\tIf employeeIDlength = 2 Then"
    - step:
        id: '230'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '231'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = employeeID(1)"
    - step:
        id: '232'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = employeeID(2)"
    - step:
        id: '233'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = employeeID(2)"
    - step:
        id: '234'
        action: Script
        object_path: "'\t\t\tElseIf employeeIDlength = 1 Then"
    - step:
        id: '235'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,3).value = employeeID(1)"
    - step:
        id: '236'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(5,12).value = employeeID(1)"
    - step:
        id: '237'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,3).value = \"\""
    - step:
        id: '238'
        action: Script
        object_path: "'\t\t\t\tobjPermitSheet.cells(23,12).value = \"\""
    - step:
        id: '239'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '240'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '241'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '242'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '243'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '244'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '245'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
    - step:
        id: '246'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '247'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '248'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '249'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '250'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '251'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '252'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '253'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '254'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '255'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = \"\""
    - step:
        id: '256'
        action: Script
        object_path: "'\t\t\tx = 0"
    - step:
        id: '257'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '258'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '259'
        action: Script
        object_path: "'\tID = \"\""
    - step:
        id: '260'
        action: Script
        object_path: '''Next'
    - step:
        id: '261'
        action: Script
        object_path: '''''PRINT TRIPLE PERMITS'
    - step:
        id: '262'
        action: Script
        object_path: '''permitsToPrint = ""'
    - step:
        id: '263'
        action: Script
        object_path: '''x = 0'
    - step:
        id: '264'
        action: Script
        object_path: '''For i = 1 To rowcount'
    - step:
        id: '265'
        action: Script
        object_path: "'\tID = objEmployeeSheet.cells(i,1).value"
    - step:
        id: '266'
        action: Script
        object_path: "'\tIf ID <> \"ID\" Then"
    - step:
        id: '267'
        action: Script
        object_path: "'\t\temployeeID = objEmployeeSheet.cells(i,7).value"
    - step:
        id: '268'
        action: Script
        object_path: "'\t\tsecondVehicle = objEmployeeSheet.cells(i,9).value"
    - step:
        id: '269'
        action: Script
        object_path: "'\t\tthirdVehicle = objEmployeeSheet.cells(i,10).value"
    - step:
        id: '270'
        action: Script
        object_path: "'\t\tfourthVehicle = objEmployeeSheet.cells(i,11).value"
    - step:
        id: '271'
        action: Script
        object_path: "'\t\tfifthVehicle = objEmployeeSheet.cells(i,12).value"
    - step:
        id: '272'
        action: Script
        object_path: "'\t\tIf employeeID <> \"\" and secondVehicle <> \"\" and thirdVehicle\
          \ <> \"\" and (fourthVehicle = empty or fourthVehicle = \"NA\") and (fifthVehicle\
          \ = empty or fifthVehicle = \"NA\") Then"
    - step:
        id: '273'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = employeeID"
    - step:
        id: '274'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(5,3).value = employeeID"
    - step:
        id: '275'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(5,12).value = employeeID"
    - step:
        id: '276'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(23,3).value = employeeID"
    - step:
        id: '277'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(23,12).value = \"\""
    - step:
        id: '278'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '279'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '280'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '281'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '282'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '283'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
    - step:
        id: '284'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '285'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '286'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '287'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '288'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '289'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '290'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '291'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '292'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '293'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = \"\""
    - step:
        id: '294'
        action: Script
        object_path: "'\t\t\tx = 0"
    - step:
        id: '295'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '296'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '297'
        action: Script
        object_path: "'\tID = \"\""
    - step:
        id: '298'
        action: Script
        object_path: '''Next'
    - step:
        id: '299'
        action: Script
        object_path: '''''PRINT QUAD PERMITS'
    - step:
        id: '300'
        action: Script
        object_path: '''permitsToPrint = ""'
    - step:
        id: '301'
        action: Script
        object_path: '''x = 0'
    - step:
        id: '302'
        action: Script
        object_path: '''For i = 1 To rowcount'
    - step:
        id: '303'
        action: Script
        object_path: "'\tID = objEmployeeSheet.cells(i,1).value"
    - step:
        id: '304'
        action: Script
        object_path: "'\tIf ID <> \"ID\" Then"
    - step:
        id: '305'
        action: Script
        object_path: "'\t\temployeeID = objEmployeeSheet.cells(i,7).value"
    - step:
        id: '306'
        action: Script
        object_path: "'\t\tsecondVehicle = objEmployeeSheet.cells(i,9).value"
    - step:
        id: '307'
        action: Script
        object_path: "'\t\tthirdVehicle = objEmployeeSheet.cells(i,10).value"
    - step:
        id: '308'
        action: Script
        object_path: "'\t\tfourthVehicle = objEmployeeSheet.cells(i,11).value"
    - step:
        id: '309'
        action: Script
        object_path: "'\t\tfifthVehicle = objEmployeeSheet.cells(i,12).value"
    - step:
        id: '310'
        action: Script
        object_path: "'\t\tIf employeeID <> \"\" and secondVehicle <> \"\" and thirdVehicle\
          \ <> \"\" and fourthVehicle <> \"\" Then"
    - step:
        id: '311'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = employeeID"
    - step:
        id: '312'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(5,3).value = employeeID"
    - step:
        id: '313'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(5,12).value = employeeID"
    - step:
        id: '314'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(23,3).value = employeeID"
    - step:
        id: '315'
        action: Script
        object_path: "'\t\t\tobjPermitSheet.cells(23,12).value = employeeID"
    - step:
        id: '316'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2052043952'
    - step:
        id: '317'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2058679264'
    - step:
        id: '318'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '319'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2060668568'
    - step:
        id: '320'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67668'
    - step:
        id: '321'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Color/ Black and White:\").Select \"Color\""
    - step:
        id: '322'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel_2\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '67510'
    - step:
        id: '323'
        action: Script
        object_path: "'\t\t\tWindow(\"Excel_2\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '324'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"Ribbon\").WinButton(\"\
          File Tab\").Click"
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2128363296'
    - step:
        id: '325'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinList(\"\
          File\").Select \"Print\""
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2063808848'
    - step:
        id: '326'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Printer Properties\").Click"
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2053604520'
    - step:
        id: '327'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinComboBox(\"Input Tray:\").Select \"Bypass Tray\""
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '67756'
    - step:
        id: '328'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").Dialog(\"\\\\print900\\Print_Metro\"\
          ).WinButton(\"OK\").Click"
    - step:
        id: '329'
        action: Script
        object_path: "'\t\t\t'\t\t\tWindow(\"Excel\").WinObject(\"WinObject\").WinButton(\"\
          Print\").Click"
    - step:
        id: '330'
        action: Script
        object_path: "'\t\t\tWait 3"
    - step:
        id: '331'
        action: Script
        object_path: "'\t\t\tpermitsToPrint = \"\""
    - step:
        id: '332'
        action: Script
        object_path: "'\t\t\tx = 0"
    - step:
        id: '333'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '334'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '335'
        action: Script
        object_path: "'\tID = \"\""
    - step:
        id: '336'
        action: Script
        object_path: '''Next'
    - step:
        id: '337'
        object_path: '''objPermits'
        action: save
    - step:
        id: '338'
        object_path: '''objPermits'
        action: close
    - step:
        id: '339'
        object_path: '''objExcel'
        action: Quit
    - step:
        id: '340'
        action: Script
        object_path: '''Set objExcel = Nothing'
    - step:
        id: '341'
        action: Script
        object_path: '''Set objPermits = Nothing'
    - step:
        id: '342'
        action: Script
        object_path: '''Set objPermitSheet = Nothing'
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
      class: Window
      name: Excel_2
      properties:
      - property:
          value:
            value: ParkingPermits.xlsx - Excel
            regular_expression: false
          name: text
          hidden: false
          read_only: false
          type: STRING
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
        - text
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
      last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
              name: Printer Properties
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
                    value: link
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Printer Properties
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
                  value: link
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
              name: Print
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
                    value: Print
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
      - object:
          class: Dialog
          name: \\print900\Print_Metro
          properties:
          - property:
              value:
                value: \\print900\Print_Metro Properties
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
          child_objects:
          - object:
              class: WinComboBox
              name: 'Input Tray:'
              properties:
              - property:
                  value:
                    value: ComboBox
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '&Input Tray:'
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
                  value: ComboBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinComboBox
              name: 'Color/ Black and White:'
              properties:
              - property:
                  value:
                    value: ComboBox
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '&Color/ Black and White:'
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
                  value: ComboBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
      last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
              name: Printer Properties
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
                    value: link
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Printer Properties
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
                  value: link
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
              name: Print
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
                    value: Print
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
      - object:
          class: Dialog
          name: \\print900\Print_Metro
          properties:
          - property:
              value:
                value: \\print900\Print_Metro Properties
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
          last_update_time: Thursday, 22 December 2022 11:55:53 AM
          child_objects:
          - object:
              class: WinComboBox
              name: 'Input Tray:'
              properties:
              - property:
                  value:
                    value: ComboBox
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '&Input Tray:'
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
                  value: ComboBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
          - object:
              class: WinButton
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
              last_update_time: Thursday, 22 December 2022 11:55:53 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
