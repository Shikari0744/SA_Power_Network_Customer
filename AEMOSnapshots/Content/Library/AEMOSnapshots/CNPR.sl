namespace: AEMOSnapshots
flow:
  name: CNPR
  inputs:
    - location
    - folder
    - downloadLog
  workflow:
    - GetLoopCount_CNPR:
        worker_group: B604
        do:
          AEMOSnapshots.GetLoopCount:
            - folder: '${folder}'
        publish:
          - folderName_CNPR: '${folderName}'
          - loopCount_CNPR: '${loopCount}'
        navigate:
          - SUCCESS: XMLsToCSVs_CNPR
    - XMLsToCSVs_CNPR:
        loop:
          for: x in loopCount_CNPR
          do:
            AEMOSnapshots.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName_CNPR}'
              - folder: '${folder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName_CNPR}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetLoopCount_CNPR:
        x: 100
        'y': 150
      XMLsToCSVs_CNPR:
        x: 400
        'y': 150
        navigate:
          a9e10818-fb4c-a72e-4fd7-b726fcd3da50:
            targetId: de18db77-c8bd-c57a-d382-7a7938ce6537
            port: SUCCESS
    results:
      SUCCESS:
        de18db77-c8bd-c57a-d382-7a7938ce6537:
          x: 700
          'y': 150
