namespace: AEMOSnapshots
flow:
  name: CRI
  inputs:
    - location
    - folder
    - downloadLog
  workflow:
    - GetLoopCount_CRI:
        worker_group: B604
        do:
          AEMOSnapshots.GetLoopCount:
            - folder: '${folder}'
        publish:
          - folderName_CRI: '${folderName}'
          - loopCount_CRI: '${loopCount}'
        navigate:
          - SUCCESS: XMLsToCSVs_CRI
    - XMLsToCSVs_CRI:
        loop:
          for: x in loopCount_CRI
          do:
            AEMOSnapshots.XMLsToCSVs:
              - location: '${location}'
              - downloadLog: '${downloadLog}'
              - folderName: '${folderName_CRI}'
              - folder: '${folder}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - folderName: '${folderName_CRI}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetLoopCount_CRI:
        x: 100
        'y': 150
      XMLsToCSVs_CRI:
        x: 400
        'y': 150
        navigate:
          3971266c-a6c3-d581-d0f8-bc258b3f24e0:
            targetId: 85716531-5f59-60bb-4782-28daad0fe67a
            port: SUCCESS
    results:
      SUCCESS:
        85716531-5f59-60bb-4782-28daad0fe67a:
          x: 700
          'y': 150
