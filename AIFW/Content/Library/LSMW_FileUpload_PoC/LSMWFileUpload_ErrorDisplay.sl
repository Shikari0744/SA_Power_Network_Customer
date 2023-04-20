namespace: LSMW_FileUpload_PoC
flow:
  name: LSMWFileUpload_ErrorDisplay
  inputs:
    - Project
    - SubProject
    - Object
    - SAP_UserID
    - SAP_Password:
        sensitive: true
    - FilePath
    - BatchSize
    - email
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        publish: []
        navigate:
          - SUCCESS: LSMW_File_Upload_Error_Display
          - WARNING: LSMW_File_Upload_Error_Display
          - FAILURE: on_failure
    - LSMW_File_Upload_Error_Display:
        do:
          LSMW_FileUpload_PoC.LSMW_File_Upload_Error_Display:
            - Project: '${Project}'
            - SubProject: '${SubProject}'
            - Object: '${Object}'
            - SAP_UserID: '${SAP_UserID}'
            - SAP_Password: '${SAP_Password}'
            - FilePath: '${FilePath}'
            - BatchSize: '${BatchSize}'
            - email: '${email}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      LSMW_File_Upload_Error_Display:
        x: 400
        'y': 150
        navigate:
          6b14df5d-3e1e-3db8-06d6-d0958ade8812:
            targetId: b1cf4a8d-9d50-889d-2f0b-f4f8f6b890fa
            port: SUCCESS
          b7d6b405-7026-0d8e-9f25-556c823eaeda:
            targetId: b1cf4a8d-9d50-889d-2f0b-f4f8f6b890fa
            port: WARNING
    results:
      SUCCESS:
        b1cf4a8d-9d50-889d-2f0b-f4f8f6b890fa:
          x: 700
          'y': 150
