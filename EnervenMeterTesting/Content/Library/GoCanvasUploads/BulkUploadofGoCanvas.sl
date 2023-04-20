namespace: GoCanvasUploads
flow:
  name: BulkUploadofGoCanvas
  inputs:
    - sap_user: KELLL3
    - sap_pass:
        default: LachlanKeller_22
        sensitive: false
    - findPDFsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Enerven Go Canvas Test Results/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: LogFileCreation
          - WARNING: LogFileCreation
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - UploadtoISU:
        do:
          GoCanvasUploads.UploadtoISU:
            - log_file: '${loggingFile}'
            - sap_pass: '${sap_user}'
            - sap_user: '${sap_pass}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - LogFileCreation:
        do:
          GoCanvasUploads.LogFileCreation:
            - filesLocation: '${findPDFsHere}'
        publish:
          - loggingFile
        navigate:
          - SUCCESS: ExtractMeterSerial
          - WARNING: ExtractMeterSerial
          - FAILURE: on_failure
    - ExtractMeterSerial:
        do:
          GoCanvasUploads.ExtractMeterSerial:
            - pdf_location: '${findPDFsHere}'
            - log_file: '${loggingFile}'
        navigate:
          - SUCCESS: UploadtoISU
          - WARNING: UploadtoISU
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
      LogFileCreation:
        x: 400
        'y': 150
      ExtractMeterSerial:
        x: 700
        'y': 150
      UploadtoISU:
        x: 1000
        'y': 150
      Kill_ProcessByName_1:
        x: 1300
        'y': 150
        navigate:
          4a7ff0ff-7446-d407-ea7a-e4313cde054d:
            targetId: d330f4b6-6f7d-4d33-e5bf-9d1e656e1bf7
            port: SUCCESS
          d744d6e8-c0f8-66f8-3654-9cd6931f14c2:
            targetId: d330f4b6-6f7d-4d33-e5bf-9d1e656e1bf7
            port: WARNING
    results:
      SUCCESS:
        d330f4b6-6f7d-4d33-e5bf-9d1e656e1bf7:
          x: 1600
          'y': 150
