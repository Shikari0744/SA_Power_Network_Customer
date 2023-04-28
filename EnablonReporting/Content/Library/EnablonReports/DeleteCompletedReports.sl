namespace: EnablonReports
operation:
  name: DeleteCompletedReports
  inputs:
  - FO_electrical
  - FO_metroNorth
  - FO_metroSouth
  - FO_ops
  - FO_planning
  - FO_regionalNorth
  - FO_regionalSouth
  - WI_electrical
  - WI_metroNorth
  - WI_metroSouth
  - WI_ops
  - WI_planning
  - WI_regionalNorth
  - WI_regionalSouth
  - CombinedFO_electrical
  - CombinedFO_metro
  - CombinedFO_ops
  - CombinedFO_regional
  - CombinedWI_electrical
  - CombinedWI_metro
  - CombinedWI_ops
  - CombinedWI_regional
  sequential_action:
    gav: com.microfocus.seq:EnablonReports.DeleteCompletedReports:1.0.0
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
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '2'
        action: Script
        object_path: allFOFiles = Array(Parameter("FO_electrical"),Parameter("FO_metroNorth"),Parameter("FO_metroSouth"),Parameter("FO_ops"),Parameter("FO_planning"),Parameter("FO_regionalNorth"),Parameter("FO_regionalSouth"))
    - step:
        id: '3'
        action: Script
        object_path: For Each file in allFOFiles
    - step:
        id: '4'
        action: Script
        object_path: If fso.FileExists("C:\Users\svcrpabot\OneDrive - SA Power Networks\Enablon
          Reports\"&file)Then
    - step:
        id: '5'
        object_path: fso
        action: DeleteFile("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Enablon Reports\"&file)'
    - step:
        id: '6'
        action: Script
        object_path: End If
    - step:
        id: '7'
        action: Script
        object_path: Next
    - step:
        id: '8'
        action: Script
        object_path: allWIFiles = Array(Parameter("WI_electrical"),Parameter("WI_metroNorth"),Parameter("WI_metroSouth"),Parameter("WI_ops"),Parameter("WI_planning"),Parameter("WI_regionalNorth"),Parameter("WI_regionalSouth"))
    - step:
        id: '9'
        action: Script
        object_path: For Each file in allWIFiles
    - step:
        id: '10'
        action: Script
        object_path: If fso.FileExists("C:\Users\svcrpabot\OneDrive - SA Power Networks\Enablon
          Reports\"&file)Then
    - step:
        id: '11'
        object_path: fso
        action: DeleteFile("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Enablon Reports\"&file)'
    - step:
        id: '12'
        action: Script
        object_path: End If
    - step:
        id: '13'
        action: Script
        object_path: Next
    - step:
        id: '14'
        action: Script
        object_path: allCombinedFiles = Array(Parameter("CombinedFO_electrical"),Parameter("CombinedFO_metro"),Parameter("CombinedFO_ops"),Parameter("CombinedFO_regional"),Parameter("CombinedWI_electrical"),Parameter("CombinedWI_metro"),Parameter("CombinedWI_ops"),Parameter("CombinedWI_regional"))
    - step:
        id: '15'
        action: Script
        object_path: For Each file in allCombinedFiles
    - step:
        id: '16'
        action: Script
        object_path: If fso.FileExists("C:\Users\svcrpabot\OneDrive - SA Power Networks\Enablon
          Reports\"&file)Then
    - step:
        id: '17'
        object_path: fso
        action: DeleteFile("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Enablon Reports\"&file)'
    - step:
        id: '18'
        action: Script
        object_path: End If
    - step:
        id: '19'
        action: Script
        object_path: Next
    - step:
        id: '20'
        action: Script
        object_path: Set fso = Nothing
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
