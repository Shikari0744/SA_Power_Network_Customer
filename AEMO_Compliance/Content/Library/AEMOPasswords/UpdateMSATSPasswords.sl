namespace: AEMOPasswords
flow:
  name: UpdateMSATSPasswords
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: PasswordUpdates
          - WARNING: PasswordUpdates
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - PasswordUpdates:
        do:
          AEMOPasswords.PasswordUpdates:
            - old_password: "${get_sp('lnspbot1PASS')}"
        publish:
          - preprod_results
          - prod_results
          - new_password
        navigate:
          - SUCCESS: SendEmail
          - WARNING: SendEmail
          - FAILURE: SendEmailFail
    - SendEmail:
        do:
          AEMOPasswords.SendEmail:
            - new_password: '${new_password}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - SendEmailFail:
        do:
          AEMOPasswords.SendEmailFail:
            - new_password: '${new_password}'
            - preprod_error: '${preprod_results}'
            - prod_error: '${prod_results}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 250
      Kill_ProcessByName_1:
        x: 1000
        'y': 250
        navigate:
          d3408393-c5c8-997b-c1ec-db76697802d6:
            targetId: b94962d6-fc3a-ffb0-d4ec-67aa774db497
            port: SUCCESS
          d409dbc6-88d4-e4f1-85b9-b715cb329da3:
            targetId: b94962d6-fc3a-ffb0-d4ec-67aa774db497
            port: WARNING
      PasswordUpdates:
        x: 400
        'y': 250
      SendEmail:
        x: 700
        'y': 125
      SendEmailFail:
        x: 700
        'y': 375
    results:
      SUCCESS:
        b94962d6-fc3a-ffb0-d4ec-67aa774db497:
          x: 1300
          'y': 250
