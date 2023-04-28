namespace: HREmployeeFileSubmission
flow:
  name: ProcessEmployee
  inputs:
    - subject
    - filepath
  workflow:
    - GetEmailInfo:
        do:
          HREmployeeFileSubmission.GetEmailInfo:
            - subject: '${subject}'
        publish:
          - employeeID
          - lastName
          - firstName
          - actionType
          - pageUpNumber
          - processDate
        navigate:
          - NOACTION: SUCCESS_1
          - NOPAGEUP: Concatenation
          - SUCCESS: PageUpExtraction
    - Concatenation:
        do:
          HREmployeeFileSubmission.Concatenation:
            - filepath: '${filepath}'
            - subject: '${subject}'
        publish:
          - combinedFile
          - result
          - filescombined
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SubcategorySelection
    - PageUpExtraction:
        do:
          HREmployeeFileSubmission.PageUpExtraction:
            - PageUpNumber: '${pageUpNumber}'
            - Location: '${filepath}'
            - FirstName: '${firstName}'
            - LastName: '${lastName}'
            - Subject: '${subject}'
        navigate:
          - SUCCESS: Concatenation
          - WARNING: Concatenation
          - FAILURE: on_failure
    - SubcategorySelection:
        do:
          HREmployeeFileSubmission.SubcategorySelection:
            - actionType: '${actionType}'
        publish:
          - subcategory
        navigate:
          - SUCCESS: TriggerMyHRRequest
    - TriggerMyHRRequest:
        do:
          HREmployeeFileSubmission.TriggerMyHRRequest:
            - customeremail: Jessica.Darzins@sapowernetworks.com.au
            - summary: '${subject}'
            - typeofchange: '${subcategory}'
            - detail: '${subject}'
            - attachment: '${combinedFile}'
            - subject: '${subject}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
    - SUCCESS_1
extensions:
  graph:
    steps:
      GetEmailInfo:
        x: 100
        'y': 350
        navigate:
          22582f2a-d02e-dd81-b1a4-55b4040b7ead:
            targetId: d671559d-f1e9-2b4b-5db8-6a6e7e5474b7
            port: NOACTION
      Concatenation:
        x: 400
        'y': 350
      SubcategorySelection:
        x: 700
        'y': 350
      TriggerMyHRRequest:
        x: 1000
        'y': 350
        navigate:
          541c8a60-a007-3814-720c-2a1d8d866e81:
            targetId: 3e5143a8-0b0f-c719-d73a-971076a923df
            port: SUCCESS
          3f01cf35-a838-ef6b-44aa-6e38032faa48:
            targetId: 3e5143a8-0b0f-c719-d73a-971076a923df
            port: WARNING
      PageUpExtraction:
        x: 400
        'y': 583.3333333333334
    results:
      SUCCESS:
        3e5143a8-0b0f-c719-d73a-971076a923df:
          x: 1300
          'y': 350
      SUCCESS_1:
        d671559d-f1e9-2b4b-5db8-6a6e7e5474b7:
          x: 400
          'y': 116.66666666666667
