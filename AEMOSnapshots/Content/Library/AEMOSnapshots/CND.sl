namespace: AEMOSnapshots
flow:
  name: CND
  inputs:
    - folder
    - location
    - downloadLog
  workflow:
    - GetLoopCount_CND:
        worker_group: B604
        do:
          AEMOSnapshots.GetLoopCount:
            - folder: '${folder}'
        publish:
          - folderName_CND: '${folderName}'
          - loopCount_CND: '${loopCount}'
        navigate:
          - SUCCESS: XMLsToCSVs_CND
    - XMLsToCSVs_CND:
        loop:
          for: x in loopCount_CND
          do:
            AEMOSnapshots.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName_CND}'
              - folder: '${folder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName_CND}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetLoopCount_CND:
        x: 100
        'y': 150
      XMLsToCSVs_CND:
        x: 400
        'y': 150
        navigate:
          4444c580-30b9-bb8e-0350-104b1e26a67f:
            targetId: c492bd5b-f6b3-2bcf-59bd-d057c9f3762d
            port: SUCCESS
    results:
      SUCCESS:
        c492bd5b-f6b3-2bcf-59bd-d057c9f3762d:
          x: 700
          'y': 150
