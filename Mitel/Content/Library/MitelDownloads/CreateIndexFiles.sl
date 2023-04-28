namespace: MitelDownloads
operation:
  name: CreateIndexFiles
  sequential_action:
    gav: 'com.microfocus.seq:MitelDownloads.CreateIndexFiles:1.0.0'
    skills:
      - ActiveX
      - Java
      - PowerBuilder
      - SAP NWBC Desktop
      - SAP
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - UI Automation
      - Visual Basic
      - Web
      - .NET
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
          object_path: "'xlsx format"
      - step:
          id: '2'
          action: Script
          object_path: 'yearExcel = Array("2017","2018","2019","2020","2021")'
      - step:
          id: '3'
          action: Script
          object_path: 'monthExcel = Array("01","02","03","04","05","06","07","08","09","10","11","12")'
      - step:
          id: '4'
          action: Script
          object_path: For Each y in yearExcel
      - step:
          id: '5'
          action: Script
          object_path: For Each m in monthExcel
      - step:
          id: '6'
          action: Script
          object_path: "strFileName = \"C:\\temp\\Mitel\\index\"&y&\"-\"&m&\".xlsx\""
      - step:
          id: '7'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '8'
          object_path: objExcel
          action: Visible
          args: = True
      - step:
          id: '9'
          action: Script
          object_path: Set objWorkbook = objExcel.Workbooks.Add()
      - step:
          id: '10'
          object_path: objWorkbook
          action: SaveAs(strFileName)
      - step:
          id: '11'
          object_path: objExcel
          action: Quit
      - step:
          id: '12'
          action: Script
          object_path: Set objWB = objExcel.WorkBooks.Open(strFileName)
      - step:
          id: '13'
          action: Script
          object_path: 'Set objWS = objExcel.ActiveWorkBook.WorkSheets("Sheet1")'
      - step:
          id: '14'
          action: Script
          object_path: With objWS
      - step:
          id: '15'
          action: Script
          object_path: '.Rows("1:1").Insert'
      - step:
          id: '16'
          action: Script
          object_path: '.Range("A1").Value = "Start Time"'
      - step:
          id: '17'
          action: Script
          object_path: '.Range("A1").Interior.ColorIndex = "15"'
      - step:
          id: '18'
          action: Script
          object_path: '.Range("A1").Borders.ColorIndex = "1"'
      - step:
          id: '19'
          action: Script
          object_path: '.Range("A1").ColumnWidth = "15"'
      - step:
          id: '20'
          action: Script
          object_path: '.Range("B1").Value = "Duration"'
      - step:
          id: '21'
          action: Script
          object_path: '.Range("B1").Interior.ColorIndex = "15"'
      - step:
          id: '22'
          action: Script
          object_path: '.Range("B1").Borders.ColorIndex = "1"'
      - step:
          id: '23'
          action: Script
          object_path: '.Range("B1").ColumnWidth = "10"'
      - step:
          id: '24'
          action: Script
          object_path: '.Range("C1").value = "Extension"'
      - step:
          id: '25'
          action: Script
          object_path: '.Range("C1").Interior.ColorIndex = "15"'
      - step:
          id: '26'
          action: Script
          object_path: '.Range("C1").Borders.ColorIndex = "1"'
      - step:
          id: '27'
          action: Script
          object_path: '.Range("C1").ColumnWidth = "10"'
      - step:
          id: '28'
          action: Script
          object_path: '.Range("D1").value = "Other Party"'
      - step:
          id: '29'
          action: Script
          object_path: '.Range("D1").Interior.ColorIndex = "15"'
      - step:
          id: '30'
          action: Script
          object_path: '.Range("D1").Borders.ColorIndex = "1"'
      - step:
          id: '31'
          action: Script
          object_path: '.Range("D1").ColumnWidth = "15"'
      - step:
          id: '32'
          action: Script
          object_path: '.Range("E1").value = "Direction"'
      - step:
          id: '33'
          action: Script
          object_path: '.Range("E1").Interior.ColorIndex = "15"'
      - step:
          id: '34'
          action: Script
          object_path: '.Range("E1").Borders.ColorIndex = "1"'
      - step:
          id: '35'
          action: Script
          object_path: '.Range("E1").ColumnWidth = "10"'
      - step:
          id: '36'
          action: Script
          object_path: '.Range("F1").value = "Channel Name"'
      - step:
          id: '37'
          action: Script
          object_path: '.Range("F1").Interior.ColorIndex = "15"'
      - step:
          id: '38'
          action: Script
          object_path: '.Range("F1").Borders.ColorIndex = "1"'
      - step:
          id: '39'
          action: Script
          object_path: '.Range("F1").ColumnWidth = "15"'
      - step:
          id: '40'
          action: Script
          object_path: '.Range("G1").value = "Caller Number"'
      - step:
          id: '41'
          action: Script
          object_path: '.Range("G1").Interior.ColorIndex = "15"'
      - step:
          id: '42'
          action: Script
          object_path: '.Range("G1").Borders.ColorIndex = "1"'
      - step:
          id: '43'
          action: Script
          object_path: '.Range("G1").ColumnWidth = "15"'
      - step:
          id: '44'
          action: Script
          object_path: '.Range("H1").value = "Called Number"'
      - step:
          id: '45'
          action: Script
          object_path: '.Range("H1").Interior.ColorIndex = "15"'
      - step:
          id: '46'
          action: Script
          object_path: '.Range("H1").Borders.ColorIndex = "1"'
      - step:
          id: '47'
          action: Script
          object_path: '.Range("H1").ColumnWidth = "15"'
      - step:
          id: '48'
          action: Script
          object_path: '.Range("I1").value = "File Location"'
      - step:
          id: '49'
          action: Script
          object_path: '.Range("I1").Interior.ColorIndex = "15"'
      - step:
          id: '50'
          action: Script
          object_path: '.Range("I1").Borders.ColorIndex = "1"'
      - step:
          id: '51'
          action: Script
          object_path: '.Range("I1").ColumnWidth = "45"'
      - step:
          id: '52'
          action: Script
          object_path: end With
      - step:
          id: '53'
          object_path: objWB
          action: save
      - step:
          id: '54'
          object_path: objWB
          action: Close
      - step:
          id: '55'
          object_path: objExcel
          action: Quit
      - step:
          id: '56'
          action: Script
          object_path: Next
      - step:
          id: '57'
          action: Script
          object_path: Next
      - step:
          id: '58'
          action: Script
          object_path: "'csv format"
      - step:
          id: '59'
          action: Script
          object_path: 'Dim csvFilePath,csvColumns'
      - step:
          id: '60'
          action: Script
          object_path: Const ForWriting = 2
      - step:
          id: '61'
          action: Script
          object_path: 'yearExcel = Array("2017","2018","2019","2020","2021")'
      - step:
          id: '62'
          action: Script
          object_path: 'monthExcel = Array("01","02","03","04","05","06","07","08","09","10","11","12")'
      - step:
          id: '63'
          action: Script
          object_path: For Each y in yearExcel
      - step:
          id: '64'
          action: Script
          object_path: For Each m in monthExcel
      - step:
          id: '65'
          action: Script
          object_path: "' Create new CSV file"
      - step:
          id: '66'
          action: Script
          object_path: "csvFilePath = \"C:\\temp\\Mitel\\index\"&y&\"-\"&m&\".csv\""
      - step:
          id: '67'
          action: Script
          object_path: 'Set objFSO = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '68'
          action: Script
          object_path: 'Set objCSVFile = objFSO.CreateTextFile(csvFilePath, _'
      - step:
          id: '69'
          action: Script
          object_path: 'ForWriting, False)'
      - step:
          id: '70'
          action: Script
          object_path: "' Write comma delimited list of columns in new CSV file."
      - step:
          id: '71'
          action: Script
          object_path: 'csvColumns = "Start Time,Duration,Extension,Other Party, Direction, Channel Name, Caller Number, Called Number, File Location"'
      - step:
          id: '72'
          object_path: objCSVFile
          action: Write
          args: csvColumns
      - step:
          id: '73'
          object_path: objCSVFile
          action: Writeline
      - step:
          id: '74'
          action: Script
          object_path: Next
      - step:
          id: '75'
          action: Script
          object_path: Next
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
