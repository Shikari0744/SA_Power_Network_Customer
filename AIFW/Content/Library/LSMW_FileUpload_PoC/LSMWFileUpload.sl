namespace: LSMW_FileUpload_PoC
flow:
  name: LSMWFileUpload
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
          - SUCCESS: LSMW_File_Upload
          - WARNING: LSMW_File_Upload
          - FAILURE: on_failure
    - LSMW_File_Upload:
        do:
          LSMW_FileUpload_PoC.LSMW_File_Upload:
            - Project: '${Project}'
            - SubProject: '${SubProject}'
            - Object: '${Object}'
            - SAP_UserID: '${SAP_UserID}'
            - SAP_Password:
                value: '${SAP_Password}'
                sensitive: true
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
      LSMW_File_Upload:
        x: 400
        'y': 150
        navigate:
          9bc21ffd-c759-49fb-41f3-95c37facce73:
            targetId: 5c3a1d9b-5418-f372-a961-ba95b2cb85bf
            port: SUCCESS
          5522fa26-1e2e-31b3-cca4-14adf3a9c1f3:
            targetId: 5c3a1d9b-5418-f372-a961-ba95b2cb85bf
            port: WARNING
    results:
      SUCCESS:
        5c3a1d9b-5418-f372-a961-ba95b2cb85bf:
          x: 700
          'y': 150
