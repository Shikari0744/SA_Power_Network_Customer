namespace: BCRM_T02_Task_Closure
flow:
  name: FailureFlow
  inputs:
    - attachmentLink:
        required: false
  workflow:
    - CloseExcelObjects:
        do:
          BCRM_T02_Task_Closure.CloseExcelObjects: []
        navigate:
          - SUCCESS: Email_Failure
          - WARNING: Email_Failure
          - FAILURE: on_failure
    - Email_Failure:
        do:
          BCRM_T02_Task_Closure.Email_Failure:
            - location: '${attachmentLink}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      CloseExcelObjects:
        x: 100
        'y': 150
      Email_Failure:
        x: 400
        'y': 150
        navigate:
          78036cc6-45ed-2c9a-bc65-e50a08d0bba8:
            targetId: 8fa9a069-5f9b-5182-3540-fb7311e479a1
            port: SUCCESS
          229db39b-40ac-1212-c3b9-3857391293a4:
            targetId: 8fa9a069-5f9b-5182-3540-fb7311e479a1
            port: WARNING
    results:
      SUCCESS:
        8fa9a069-5f9b-5182-3540-fb7311e479a1:
          x: 700
          'y': 150
