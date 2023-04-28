namespace: GoCanvasUploads
flow:
  name: GoCanvastoISU
  inputs:
    - fileLocation
    - username_sap
    - password_sap:
        sensitive: true
    - loggingLocation
  workflow:
    - GetPDFDetails:
        do:
          GoCanvasUploads.GetPDFDetails:
            - filePath: '${fileLocation}'
        publish:
          - pdfName
        navigate:
          - SUCCESS: ExtractMeterSerial
    - ExtractMeterSerial:
        do:
          GoCanvasUploads.ExtractMeterSerial:
            - pdf_name: '${pdfName}'
            - pdf_location: '${fileLocation}'
            - log_file: '${loggingLocation}'
        navigate:
          - SUCCESS: MoveCompletedPDF
          - WARNING: MoveCompletedPDF
          - FAILURE: on_failure
    - MoveCompletedPDF:
        do:
          GoCanvasUploads.MoveCompletedPDF:
            - filePath: '${fileLocation}'
            - fileName: '${pdfName}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetPDFDetails:
        x: 100
        'y': 150
      ExtractMeterSerial:
        x: 400
        'y': 150
      MoveCompletedPDF:
        x: 700
        'y': 150
        navigate:
          46b4fb8c-1df3-10a4-e34b-3c53d035994c:
            targetId: b8238602-086a-d30d-b113-0d8e1940c101
            port: SUCCESS
    results:
      SUCCESS:
        b8238602-086a-d30d-b113-0d8e1940c101:
          x: 1000
          'y': 150
