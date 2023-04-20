namespace: GoCanvasUploads
operation:
  name: LogFileCreation
  inputs:
  - filesLocation: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process
      Automation\Enerven Meter Testing\Bulk Upload of Go Canvas Results\2021\
  sequential_action:
    gav: com.microfocus.seq:GoCanvasUploads.LogFileCreation:1.0.0
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
        object_path: pdflocation = Parameter("filesLocation")
    - step:
        id: '2'
        action: Script
        object_path: pdflocation = Replace(pdflocation, "/", "\")
    - step:
        id: '3'
        action: Script
        object_path: filename = pdflocation&"Bulk Upload of Meter Testing Results.xlsx"
    - step:
        id: '4'
        action: Script
        object_path: Set FSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '5'
        action: Script
        object_path: If FSO.FileExists(filename) Then
    - step:
        id: '6'
        object_path: fso
        action: DeleteFile(filename)
    - step:
        id: '7'
        action: Script
        object_path: End If
    - step:
        id: '8'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '9'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '10'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Add()
    - step:
        id: '11'
        action: Script
        object_path: Set objSheet = objWorkbook.sheets.Add
    - step:
        id: '12'
        object_path: objSheet
        action: name
        args: = "Uploads"
    - step:
        id: '13'
        object_path: objSheet.cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '14'
        object_path: objSheet.cells(1,1)
        action: ColumnWidth
        args: = 18
    - step:
        id: '15'
        object_path: objSheet.cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '16'
        object_path: objSheet.cells(1,1)
        action: value
        args: = "NMI"
    - step:
        id: '17'
        object_path: objSheet.cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '18'
        object_path: objSheet.cells(1,2)
        action: ColumnWidth
        args: = 18
    - step:
        id: '19'
        object_path: objSheet.cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '20'
        object_path: objSheet.cells(1,2)
        action: value
        args: = "Type"
    - step:
        id: '21'
        object_path: objSheet.cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '22'
        object_path: objSheet.cells(1,3)
        action: ColumnWidth
        args: = 18
    - step:
        id: '23'
        object_path: objSheet.cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '24'
        object_path: objSheet.cells(1,3)
        action: value
        args: = "CTB"
    - step:
        id: '25'
        object_path: objSheet.cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '26'
        object_path: objSheet.cells(1,4)
        action: ColumnWidth
        args: = 18
    - step:
        id: '27'
        object_path: objSheet.cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '28'
        object_path: objSheet.cells(1,4)
        action: value
        args: = "CTR"
    - step:
        id: '29'
        object_path: objSheet.cells(1,5).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '30'
        object_path: objSheet.cells(1,5)
        action: ColumnWidth
        args: = 18
    - step:
        id: '31'
        object_path: objSheet.cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '32'
        object_path: objSheet.cells(1,5)
        action: value
        args: = "CTW"
    - step:
        id: '33'
        object_path: objSheet.cells(1,6).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '34'
        object_path: objSheet.cells(1,6)
        action: ColumnWidth
        args: = 18
    - step:
        id: '35'
        object_path: objSheet.cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '36'
        object_path: objSheet.cells(1,6)
        action: value
        args: = "Material Number"
    - step:
        id: '37'
        object_path: objSheet.cells(1,7).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '38'
        object_path: objSheet.cells(1,7)
        action: ColumnWidth
        args: = 18
    - step:
        id: '39'
        object_path: objSheet.cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '40'
        object_path: objSheet.cells(1,7)
        action: value
        args: = "Serial Number"
    - step:
        id: '41'
        object_path: objSheet.cells(1,8).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '42'
        object_path: objSheet.cells(1,8)
        action: ColumnWidth
        args: = 18
    - step:
        id: '43'
        object_path: objSheet.cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '44'
        object_path: objSheet.cells(1,8)
        action: value
        args: = "Date of Test"
    - step:
        id: '45'
        object_path: objSheet.cells(1,9).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '46'
        object_path: objSheet.cells(1,9)
        action: ColumnWidth
        args: = 18
    - step:
        id: '47'
        object_path: objSheet.cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '48'
        object_path: objSheet.cells(1,9)
        action: value
        args: = "PDF Name"
    - step:
        id: '49'
        object_path: objSheet.cells(1,10).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '50'
        object_path: objSheet.cells(1,10)
        action: ColumnWidth
        args: = 18
    - step:
        id: '51'
        object_path: objSheet.cells(1,10)
        action: WrapText
        args: = true
    - step:
        id: '52'
        object_path: objSheet.cells(1,10)
        action: value
        args: = "PDF Location"
    - step:
        id: '53'
        object_path: objSheet.cells(1,11).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '54'
        object_path: objSheet.cells(1,11)
        action: ColumnWidth
        args: = 18
    - step:
        id: '55'
        object_path: objSheet.cells(1,11)
        action: WrapText
        args: = true
    - step:
        id: '56'
        object_path: objSheet.cells(1,11)
        action: value
        args: = "Result"
    - step:
        id: '57'
        action: Script
        object_path: On error resume next
    - step:
        id: '58'
        object_path: objWorkbook
        action: SaveAs(filename)
    - step:
        id: '59'
        object_path: objWorkbook
        action: Close
    - step:
        id: '60'
        object_path: objExcel
        action: Quit
    - step:
        id: '61'
        action: Script
        object_path: On error goto 0
    - step:
        id: '62'
        action: Script
        object_path: Parameter("loggingFile") = filename
  outputs:
  - loggingFile:
      robot: true
      value: ${loggingFile}
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
