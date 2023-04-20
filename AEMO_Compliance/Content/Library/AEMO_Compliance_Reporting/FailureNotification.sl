namespace: AEMO_Compliance_Reporting
flow:
  name: FailureNotification
  workflow:
    - Send_Email_Failure:
        do:
          AEMO_Compliance_Reporting.Send_Email_Failure: []
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
      Send_Email_Failure:
        x: 100
        'y': 150
        navigate:
          a88b817e-b58c-f96c-2fd5-44e3d828ded8:
            targetId: 41241672-3d48-6f43-936f-8fa9e2e098c6
            port: SUCCESS
          c4b68d32-7ae3-2693-f098-6ed0da422f90:
            targetId: 41241672-3d48-6f43-936f-8fa9e2e098c6
            port: WARNING
    results:
      SUCCESS:
        41241672-3d48-6f43-936f-8fa9e2e098c6:
          x: 400
          'y': 150
