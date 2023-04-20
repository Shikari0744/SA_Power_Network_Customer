########################################################################################################################
#!!
#! @result FAILURE: errorMessage_asset == null
#!!#
########################################################################################################################
namespace: AssetDeletion
operation:
  name: ExcelDocumentOfAssets
  inputs:
    - excelLocation:
        required: false
    - singleAsset_ID:
        required: false
    - singleAsset_status:
        required: false
    - singleAsset_stockroom:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:AssetDeletion.ExcelDocumentOfAssets:1.0.0'
    skills:
      - Delphi
      - Java
      - Oracle
      - SAP NWBC Desktop
      - SAP
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
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
          object_path: 'excelLocation = Parameter("excelLocation")'
      - step:
          id: '2'
          action: Script
          object_path: 'singleAsset_ID = Parameter("singleAsset_ID")'
      - step:
          id: '3'
          action: Script
          object_path: 'If singleAsset_ID = "" Then'
      - step:
          id: '4'
          object_path: DataTable
          action: ImportSheet
          args: 'excelLocation, "Global", "Global"'
      - step:
          id: '5'
          action: Script
          object_path: rowCount = DataTable.GlobalSheet.GetRowCount
      - step:
          id: '6'
          action: Script
          object_path: For i = 1 To rowCount
      - step:
          id: '7'
          object_path: DataTable.GlobalSheet
          action: SetCurrentRow(i)
      - step:
          id: '8'
          action: Script
          object_path: 'assetID_1 = DataTable.Value("AssetID", "Global")'
      - step:
          id: '9'
          action: Script
          object_path: 'status_1 = DataTable.Value("Status", "Global")'
      - step:
          id: '10'
          action: Script
          object_path: 'stockroom_1 = DataTable.Value("Stockroom", "Global")'
      - step:
          id: '11'
          action: Script
          object_path: 'If assetID_1 <> "" Then'
      - step:
          id: '12'
          action: Script
          object_path: 'asset_info1 = assetID_1 & "/" & status_1 & "/" & stockroom_1'
      - step:
          id: '13'
          action: Script
          object_path: 'asset_info = asset_info & "," & asset_info1'
      - step:
          id: '14'
          object_path: DataTable
          action: 'Value("AssetID",'
          args: '"Global") = ""'
      - step:
          id: '15'
          object_path: DataTable
          action: 'Value("Status",'
          args: '"Global") = ""'
      - step:
          id: '16'
          object_path: DataTable
          action: 'Value("Stockroom",'
          args: '"Global") = ""'
      - step:
          id: '17'
          action: Script
          object_path: Else
      - step:
          id: '18'
          action: Script
          object_path: Exit For
      - step:
          id: '19'
          action: Script
          object_path: End If
      - step:
          id: '20'
          action: Script
          object_path: Next
      - step:
          id: '21'
          object_path: DataTable
          action: ExportSheet
          args: 'excelLocation,1'
      - step:
          id: '22'
          action: Script
          object_path: 'asset_info = Replace(asset_info, ",", "", 1, 1)'
      - step:
          id: '23'
          action: Script
          object_path: asset_info = UCase(asset_info)
      - step:
          id: '24'
          action: Script
          object_path: 'Parameter("asset_info") = asset_info'
      - step:
          id: '25'
          action: Script
          object_path: Else
      - step:
          id: '26'
          action: Script
          object_path: 'assetID_0 = Parameter("singleAsset_ID")'
      - step:
          id: '27'
          action: Script
          object_path: 'status_0 = Parameter("singleAsset_status")'
      - step:
          id: '28'
          action: Script
          object_path: 'stockroom_0 = Parameter("singleAsset_stockroom")'
      - step:
          id: '29'
          action: Script
          object_path: 'asset_info0 = assetID_0 & "/" & status_0 & "/" & stockroom_0'
      - step:
          id: '30'
          action: Script
          object_path: asset_info0 = UCase(asset_info0)
      - step:
          id: '31'
          action: Script
          object_path: 'Parameter("asset_info") = asset_info0'
      - step:
          id: '32'
          action: Script
          object_path: End If
      - step:
          id: '33'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '34'
          action: Script
          object_path: 'If asset_info0 = "" Then'
      - step:
          id: '35'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "errorMessage_asset == null", "errorMessage_asset == null"'
      - step:
          id: '36'
          action: Script
          object_path: End If
      - step:
          id: '37'
          action: Wait
          args: '"2"'
          default_args: '"1"'
  outputs:
    - asset_info:
        robot: true
        value: '${asset_info}'
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
