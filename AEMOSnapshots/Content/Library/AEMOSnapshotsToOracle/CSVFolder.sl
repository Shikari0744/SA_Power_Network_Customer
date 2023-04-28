namespace: AEMOSnapshotsToOracle
flow:
  name: CSVFolder
  inputs:
    - csvFolder
    - location
    - downloadLog
  workflow:
    - GetLoopCount:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.GetLoopCount:
            - folder: '${csvFolder}'
        publish:
          - folderName
          - loopCount
        navigate:
          - SUCCESS: XMLsToCSVs_CMR
    - XMLsToCSVs_CMR:
        loop:
          for: x in loopCount
          do:
            AEMOSnapshotsToOracle.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName}'
              - folder: '${csvFolder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetLoopCount:
        x: 100
        'y': 150
      XMLsToCSVs_CMR:
        x: 400
        'y': 150
        navigate:
          eecc037e-6045-ba8a-599e-2864b8500cc4:
            targetId: 6ba1e48e-ca76-a801-f3d3-3bbff0b7ffca
            port: SUCCESS
    results:
      SUCCESS:
        6ba1e48e-ca76-a801-f3d3-3bbff0b7ffca:
          x: 700
          'y': 150
