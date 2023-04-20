namespace: AEMOSnapshots
flow:
  name: RecoverFailedCommands
  inputs:
    - mainPath: "D:\\AEMO Snapshots\\"
    - failedLog: "D:\\AEMO Snapshots\\Logs\\AEMO Snapshots Failed Queries.txt"
    - existingLoopCount:
        required: false
  workflow:
    - DeleteOldFailedQueries:
        worker_group: B604
        do:
          AEMOSnapshots.DeleteOldFailedQueries:
            - fileLocation: '${mainPath}'
            - existingLoopCount: '${existingLoopCount}'
        navigate:
          - SUCCESS: CreateFailedQueries
    - CreateFailedQueries:
        worker_group: B604
        do:
          AEMOSnapshots.CreateFailedQueries:
            - fileLocation: '${mainPath}'
            - failedQueryLog: '${failedLog}'
            - existingLoopCount: '${existingLoopCount}'
        publish:
          - retryLocation
          - totalFiles
        navigate:
          - SUCCESS: FailedQueryLoopcount
    - LoadFailedToOracle:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_1
    - FailedQueryLoopcount:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '0'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle
    - FailedQueryLoopcount_1:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_1
    - LoadFailedToOracle_1:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_2
    - FailedQueryLoopcount_2:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_2
    - LoadFailedToOracle_2:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_3
    - FailedQueryLoopcount_3:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_3
    - LoadFailedToOracle_3:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_4
    - FailedQueryLoopcount_4:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_4
    - LoadFailedToOracle_4:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_5
    - FailedQueryLoopcount_5:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_5
    - LoadFailedToOracle_5:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: FailedQueryLoopcount_6
    - FailedQueryLoopcount_6:
        do:
          AEMOSnapshots.FailedQueryLoopcount:
            - loopCount: '${totalFiles}'
            - loopBeginner: '${nextLoop}'
        publish:
          - array
          - nextLoop
        navigate:
          - SUCCESS: LoadFailedToOracle_6
    - LoadFailedToOracle_6:
        loop:
          for: x in array
          do:
            AEMOSnapshots.LoadFailedToOracle:
              - retryLocation: '${retryLocation}'
              - iteration: '${x}'
          break: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      FailedQueryLoopcount:
        x: 700
        'y': 150
      CreateFailedQueries:
        x: 400
        'y': 150
      DeleteOldFailedQueries:
        x: 100
        'y': 150
      LoadFailedToOracle_1:
        x: 1600
        'y': 150
      LoadFailedToOracle_2:
        x: 2200
        'y': 150
      LoadFailedToOracle_3:
        x: 2800
        'y': 150
      LoadFailedToOracle_4:
        x: 3400
        'y': 150
      FailedQueryLoopcount_1:
        x: 1300
        'y': 150
      LoadFailedToOracle_5:
        x: 4000
        'y': 150
      FailedQueryLoopcount_2:
        x: 1900
        'y': 150
      LoadFailedToOracle_6:
        x: 4600
        'y': 150
        navigate:
          3c253c88-b029-4a6a-ef2a-01fb1bdb09b5:
            targetId: 813160aa-a492-c54d-3d4f-1539ee5515ac
            port: SUCCESS
      FailedQueryLoopcount_3:
        x: 2500
        'y': 150
      FailedQueryLoopcount_4:
        x: 3100
        'y': 150
      FailedQueryLoopcount_5:
        x: 3700
        'y': 150
      FailedQueryLoopcount_6:
        x: 4300
        'y': 150
      LoadFailedToOracle:
        x: 1000
        'y': 150
    results:
      SUCCESS:
        813160aa-a492-c54d-3d4f-1539ee5515ac:
          x: 4900
          'y': 150
