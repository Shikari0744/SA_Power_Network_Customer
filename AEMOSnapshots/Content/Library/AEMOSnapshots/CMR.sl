namespace: AEMOSnapshots
flow:
  name: CMR
  inputs:
    - cmrFolder
    - location
    - downloadLog
  workflow:
    - GetLoopCount_CMR:
        worker_group: B604
        do:
          AEMOSnapshots.GetLoopCount:
            - folder: '${cmrFolder}'
        publish:
          - folderName_CMR: '${folderName}'
          - loopCount_CMR: '${loopCount}'
        navigate:
          - SUCCESS: XMLsToCSVs_CMR
    - XMLsToCSVs_CMR:
        loop:
          for: x in loopCount_CMR
          do:
            AEMOSnapshots.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName_CMR}'
              - folder: '${cmrFolder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName_CMR}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetLoopCount_CMR:
        x: 100
        'y': 150
      XMLsToCSVs_CMR:
        x: 400
        'y': 150
        navigate:
          d0424e17-a257-7b68-6403-5e341f64a6e8:
            targetId: c317a63c-8214-0e38-6d94-f90f6399f201
            port: SUCCESS
    results:
      SUCCESS:
        c317a63c-8214-0e38-6d94-f90f6399f201:
          x: 700
          'y': 150
