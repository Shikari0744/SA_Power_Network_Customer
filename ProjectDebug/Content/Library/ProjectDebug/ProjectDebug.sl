namespace: ProjectDebug
flow:
  name: ProjectDebug
  workflow:
    - failuretest:
        do:
          ProjectDebug.failuretest: []
        publish:
          - error_message
        navigate:
          - SUCCESS: failuretest2
          - WARNING: failuretest2
          - FAILURE: failuretest2
    - SNowIncidentEmail:
        do:
          ProjectDebug.SNowIncidentEmail:
            - environment: dev
            - processname: ProjectDebug
            - pythonerror: '${x}'
            - vbscripterror: '${error_message}'
            - customeremail: jasmin.haas@sapowernetworks.com.au
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - failuretest2:
        do:
          ProjectDebug.failuretest2: []
        publish:
          - x
        navigate:
          - FAILURE: SNowIncidentEmail
          - SUCCESS: SNowIncidentEmail
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      failuretest:
        x: 100
        'y': 150
      failuretest2:
        x: 400
        'y': 150
      SNowIncidentEmail:
        x: 700
        'y': 150
        navigate:
          8efeb78b-8e52-8ac2-8eda-729942c0111b:
            targetId: 08210908-16c2-291d-bb11-ce22a45ae05f
            port: SUCCESS
          3a4a7b31-5187-7294-738d-a91aaf53fc3f:
            targetId: 08210908-16c2-291d-bb11-ce22a45ae05f
            port: WARNING
    results:
      SUCCESS:
        08210908-16c2-291d-bb11-ce22a45ae05f:
          x: 1000
          'y': 150
