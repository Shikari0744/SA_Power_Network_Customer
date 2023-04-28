namespace: AEMOSnapshots
flow:
  name: CNDS
  inputs:
    - location
    - folder
    - downloadLog
  workflow:
    - GetLoopCount_CNDS:
        worker_group: B604
        do:
          AEMOSnapshots.GetLoopCount:
            - folder: '${folder}'
        publish:
          - folderName_CNDS: '${folderName}'
          - loopCount_CNDS: '${loopCount}'
        navigate:
          - SUCCESS: XMLsToCSVs_CNDS
    - XMLsToCSVs_CNDS:
        loop:
          for: x in loopCount_CNDS
          do:
            AEMOSnapshots.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName_CNDS}'
              - folder: '${folder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName_CNDS}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetLoopCount_CNDS:
        x: 100
        'y': 150
      XMLsToCSVs_CNDS:
        x: 400
        'y': 150
        navigate:
          fbd79104-395a-174d-e3ec-f41284fbdeea:
            targetId: b988ebfb-31b8-4df5-a4b3-a79af1a7d323
            port: SUCCESS
    results:
      SUCCESS:
        b988ebfb-31b8-4df5-a4b3-a79af1a7d323:
          x: 700
          'y': 150
