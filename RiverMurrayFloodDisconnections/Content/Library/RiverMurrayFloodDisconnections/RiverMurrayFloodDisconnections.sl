namespace: RiverMurrayFloodDisconnections
flow:
  name: RiverMurrayFloodDisconnections
  inputs:
    - username
    - password:
        sensitive: true
    - flowCheck:
        required: true
    - cidCheck
  workflow:
    - FlowCheck:
        do:
          RiverMurrayFloodDisconnections.FlowCheck:
            - flowCheck: '${flowCheck}'
        publish:
          - flowResult
        navigate:
          - EASE: EASE
          - BULK: BULK
          - SUCCESS: BULK
    - BULK:
        do:
          RiverMurrayFloodDisconnections.BulkDisconnections:
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
            - B2BAction: Imported Bulk Disconnections
            - SourceOfDEEN: Bulk Disconnections
            - cidCheck: '${cidCheck}'
            - flowType: '${flowResult}'
        navigate:
          - FAILURE: BULK
          - SUCCESS: SUCCESS
          - SUCCESS_2: SUCCESS
          - SUCCESS_1: SUCCESS
    - EASE:
        do:
          RiverMurrayFloodDisconnections.EASE:
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
            - B2BAction: Requires Processing
            - SourceOfDEEN: EASE
            - cidCheck: '${cidCheck}'
            - flowType: '${flowResult}'
        navigate:
          - FAILURE: EASE
          - SUCCESS: SUCCESS
          - SUCCESS_2: SUCCESS
          - SUCCESS_1: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      FlowCheck:
        x: 100
        'y': 250
      BULK:
        x: 400
        'y': 375
        navigate:
          6fb845d8-60e3-abda-345d-50b518cdc3de:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS
          941f8cc6-9872-8c29-e6b1-fb5bd1347e29:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS_2
          1c9cb0d7-40d7-79a1-ea87-b03f2fead65b:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS_1
      EASE:
        x: 400
        'y': 125
        navigate:
          567bb223-1875-d4dc-9631-dad9a594d68f:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS
          cf9e2fbc-45f3-abd1-a63d-472d16c63dd2:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS_2
          d002af5a-0ccb-1b15-adb2-fb3b5d2ace93:
            targetId: f882c240-278a-04ac-891b-bb52a3ea36bb
            port: SUCCESS_1
    results:
      SUCCESS:
        f882c240-278a-04ac-891b-bb52a3ea36bb:
          x: 700
          'y': 250
