namespace: ActionBPEMs
flow:
  name: FailureFlow
  inputs:
    - attachmentLink:
        required: false
  workflow:
    - CloseExcelObjects:
        do:
          ActionBPEMs.CloseExcelObjects: []
        navigate:
          - SUCCESS: Send_Email_Failure_1
          - WARNING: Send_Email_Failure_1
          - FAILURE: on_failure
    - Send_Email_Failure_1:
        do:
          ActionBPEMs.Send_Email_Failure_1:
            - Attachment: '${attachmentLink}'
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
      CloseExcelObjects:
        x: 100
        'y': 150
      Send_Email_Failure_1:
        x: 400
        'y': 150
        navigate:
          594f3ec4-4f38-c943-db1d-fa3f8bd26ecc:
            targetId: 9b121dd7-bb91-4b2f-a3a5-7604f985e010
            port: SUCCESS
          008e9eb7-de41-b6d6-6170-128f39575a40:
            targetId: 9b121dd7-bb91-4b2f-a3a5-7604f985e010
            port: WARNING
    results:
      SUCCESS:
        9b121dd7-bb91-4b2f-a3a5-7604f985e010:
          x: 700
          'y': 150
