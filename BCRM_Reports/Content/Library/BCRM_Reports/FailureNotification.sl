namespace: BCRM_Reports
flow:
  name: FailureNotification
  inputs:
    - robot
    - runDate:
        required: false
  workflow:
    - Send_Email_Failure:
        robot_group: '${robot}'
        do:
          BCRM_Reports.Send_Email_Failure:
            - RunDate: '${runDate}'
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
          38c9e632-fb5d-1533-a3dd-146424fa1699:
            targetId: a9fd3992-91b7-82c4-5ece-e64f30638ac8
            port: SUCCESS
          4fbedeb2-a063-8c10-501b-37ae8001f98a:
            targetId: a9fd3992-91b7-82c4-5ece-e64f30638ac8
            port: WARNING
    results:
      SUCCESS:
        a9fd3992-91b7-82c4-5ece-e64f30638ac8:
          x: 400
          'y': 150
