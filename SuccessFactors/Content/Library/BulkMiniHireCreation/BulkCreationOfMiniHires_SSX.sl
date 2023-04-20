namespace: BulkMiniHireCreation
flow:
  name: BulkCreationOfMiniHires_SSX
  inputs:
    - successfactors_username
    - successfactors_password:
        sensitive: true
  workflow:
    - BulkCreationOfMiniHires:
        do:
          BulkMiniHireCreation.BulkCreationOfMiniHires:
            - user_sf: '${successfactors_username}'
            - pass_sf:
                value: '${successfactors_password}'
                sensitive: true
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      BulkCreationOfMiniHires:
        x: 100
        'y': 150
        navigate:
          dcde2fd0-594c-0885-990e-c018678fafce:
            targetId: d00447cc-2807-38de-6c33-9c7f3a9a1715
            port: SUCCESS
    results:
      SUCCESS:
        d00447cc-2807-38de-6c33-9c7f3a9a1715:
          x: 400
          'y': 150
