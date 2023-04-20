namespace: FieldServicesLeaveReporting
operation:
  name: ConvertToTable
  inputs:
    - filepath
  sequential_action:
    gav: 'com.microfocus.seq:FieldServicesLeaveReporting.ConvertToTable:1.0.0'
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
          object_path: Const xlOpenXMLWorkbook = 51
      - step:
          id: '2'
          action: Script
          object_path: Const xlYes = 1
      - step:
          id: '3'
          action: Script
          object_path: Const xlSrcRange = 1
      - step:
          id: '4'
          action: Script
          object_path: 'Dim wb,sht'
      - step:
          id: '5'
          action: Script
          object_path: 'Set xl = CreateObject("Excel.Application")'
      - step:
          id: '6'
          object_path: xl
          action: visible=true
      - step:
          id: '7'
          action: Script
          object_path: 'Set wb = xl.Workbooks.open(Parameter("filepath"))'
      - step:
          id: '8'
          action: Script
          object_path: Set sht = wb.worksheets(1)
      - step:
          id: '9'
          action: Script
          object_path: "'create a new listobject from the Range with top-left=A1"
      - step:
          id: '10'
          object_path: 'sht.ListObjects.Add xlSrcRange, sht.Range("A1")'
          action: 'CurrentRegion,'
          args: ', xlYes'
      - step:
          id: '11'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '12'
          action: Script
          object_path: Set sht = wb.worksheets(2)
      - step:
          id: '13'
          action: Script
          object_path: "'create a new listobject from the Range with top-left=A1"
      - step:
          id: '14'
          object_path: 'sht.ListObjects.Add xlSrcRange, sht.Range("A1")'
          action: 'CurrentRegion,'
          args: ', xlYes'
      - step:
          id: '15'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '16'
          action: Script
          object_path: Set sht = wb.worksheets(3)
      - step:
          id: '17'
          action: Script
          object_path: "'create a new listobject from the Range with top-left=A1"
      - step:
          id: '18'
          object_path: 'sht.ListObjects.Add xlSrcRange, sht.Range("A1")'
          action: 'CurrentRegion,'
          args: ', xlYes'
      - step:
          id: '19'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '20'
          action: Script
          object_path: Set sht = wb.worksheets(4)
      - step:
          id: '21'
          action: Script
          object_path: "'create a new listobject from the Range with top-left=A1"
      - step:
          id: '22'
          object_path: 'sht.ListObjects.Add xlSrcRange, sht.Range("A1")'
          action: 'CurrentRegion,'
          args: ', xlYes'
      - step:
          id: '23'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '24'
          action: Script
          object_path: Set sht = wb.worksheets(5)
      - step:
          id: '25'
          action: Script
          object_path: "'create a new listobject from the Range with top-left=A1"
      - step:
          id: '26'
          object_path: 'sht.ListObjects.Add xlSrcRange, sht.Range("A1")'
          action: 'CurrentRegion,'
          args: ', xlYes'
      - step:
          id: '27'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '28'
          object_path: xl
          comment: "don't show \"a file already exists...\""
          action: DisplayAlerts
          args: = False
      - step:
          id: '29'
          object_path: wb
          action: Save
      - step:
          id: '30'
          object_path: xl
          action: DisplayAlerts
          args: = True
      - step:
          id: '31'
          object_path: wb
          action: Close
      - step:
          id: '32'
          object_path: xl
          action: Quit
      - step:
          id: '33'
          action: Script
          object_path: Set wb = Nothing
      - step:
          id: '34'
          action: Script
          object_path: Set sht = Nothing
      - step:
          id: '35'
          action: Script
          object_path: Set xl = Nothing
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
