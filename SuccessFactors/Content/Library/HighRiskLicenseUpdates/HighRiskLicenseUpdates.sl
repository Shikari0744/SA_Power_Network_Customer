namespace: HighRiskLicenseUpdates
flow:
  name: HighRiskLicenseUpdates
  inputs:
    - sf_user: k
    - sf_pass:
        default: k
        sensitive: true
  workflow:
    - HighRiskLicense:
        robot_group: B603
        do:
          HighRiskLicenseUpdates.HighRiskLicense:
            - sf_user: '${sf_user}'
            - sf_pass: '${sf_pass}'
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
      HighRiskLicense:
        x: 100
        'y': 150
        navigate:
          956add22-e5d8-ecf7-06bf-649a99388fa1:
            targetId: 9bbaa49a-b4e1-b4c1-8028-f67ca40b4c9d
            port: SUCCESS
          225d2532-982b-d50b-9668-586ba5598a17:
            targetId: 9bbaa49a-b4e1-b4c1-8028-f67ca40b4c9d
            port: WARNING
    results:
      SUCCESS:
        9bbaa49a-b4e1-b4c1-8028-f67ca40b4c9d:
          x: 400
          'y': 150
