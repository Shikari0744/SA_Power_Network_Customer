namespace: AEMOSnapshots
flow:
  name: AEMO_Snapshots
  inputs:
    - location: 'D:/AEMO Snapshots/'
  workflow:
    - CreateLogFile:
        worker_group: B604
        do:
          AEMOSnapshots.CreateLogFile:
            - filelocation: '${location}'
        publish:
          - oracleLog
          - downloadlog
          - toBeCompletedLogFolder: '${toBeCompletedLog}'
          - failedLog
          - csvLog
        navigate:
          - SUCCESS: GetAccessToken_Teams
    - GetAccessToken_Teams:
        worker_group: B604
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('svcrpabotAPIuser')}"
            - Password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: NumberOfXML
    - SetUpOracleCommands:
        do:
          AEMOSnapshots.SetUpOracleCommands:
            - filepath: '${location}'
            - oracleLog: '${oracleLog}'
            - tbcLog: '${toBeCompletedLogFolder}'
            - failedLog: '${failedLog}'
            - cmr: '${combinedLocation_CMR}'
            - cnd: '${combinedLocation_CND}'
            - cnds: '${combinedLocation_CNDS}'
            - cnpr: '${combinedLocation_CNPR}'
            - cri: '${combinedLocation_CRI}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - NumberOfXML:
        worker_group: B604
        do:
          AEMOSnapshots.NumberOfXML:
            - accessToken: '${accessToken}'
        publish:
          - cmr
          - cnd
          - cnds
          - cnpr
          - cri
        navigate:
          - SUCCESS: CMR
    - CMR:
        do:
          AEMOSnapshots.CMR:
            - cmrFolder: '${cmr}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CMR: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CND
    - CND:
        do:
          AEMOSnapshots.CND:
            - folder: '${cnd}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CND: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CNDS
    - CNDS:
        do:
          AEMOSnapshots.CNDS:
            - location: '${location}'
            - folder: '${cnds}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CNDS: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CNPR
    - CNPR:
        do:
          AEMOSnapshots.CNPR:
            - location: '${location}'
            - folder: '${cnpr}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CNPR: '${folderName}'
        navigate:
          - SUCCESS: CRI
          - FAILURE: on_failure
    - CRI:
        do:
          AEMOSnapshots.CRI:
            - location: '${location}'
            - folder: '${cri}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CRI: '${folderName}'
        navigate:
          - SUCCESS: Combine_All_CSV_CMR
          - FAILURE: on_failure
    - Combine_All_CSV_CMR:
        worker_group: B604
        do:
          AEMOSnapshots.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CMR}'
        publish:
          - combinedLocation_CMR: '${combinedLocation}'
        navigate:
          - SUCCESS: Combine_All_CSV_CND
    - Combine_All_CSV_CND:
        worker_group: B604
        do:
          AEMOSnapshots.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CND}'
        publish:
          - combinedLocation_CND: '${combinedLocation}'
        navigate:
          - SUCCESS: Combine_All_CSV_CNDS
    - Combine_All_CSV_CNDS:
        worker_group: B604
        do:
          AEMOSnapshots.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CNDS}'
        publish:
          - combinedLocation_CNDS: '${combinedLocation}'
        navigate:
          - SUCCESS: Combine_All_CSV_CNPR
    - Combine_All_CSV_CNPR:
        worker_group: B604
        do:
          AEMOSnapshots.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CNPR}'
        publish:
          - combinedLocation_CNPR: '${combinedLocation}'
        navigate:
          - SUCCESS: Combine_All_CSV_CRI
    - Combine_All_CSV_CRI:
        worker_group: B604
        do:
          AEMOSnapshots.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CRI}'
        publish:
          - combinedLocation_CRI: '${combinedLocation}'
        navigate:
          - SUCCESS: SetUpOracleCommands
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Combine_All_CSV_CND:
        x: 2800
        'y': 150
      Combine_All_CSV_CRI:
        x: 3700
        'y': 150
      SetUpOracleCommands:
        x: 4000
        'y': 150
        navigate:
          f16e9982-5663-c7ca-2f5c-856dbbd8dff8:
            targetId: 3416790e-c7c8-e983-7ab4-4d18a56f14f3
            port: SUCCESS
      CreateLogFile:
        x: 100
        'y': 150
      Combine_All_CSV_CNPR:
        x: 3400
        'y': 150
      CMR:
        x: 1000
        'y': 150
      CNPR:
        x: 1900
        'y': 150
      Combine_All_CSV_CNDS:
        x: 3100
        'y': 150
      Combine_All_CSV_CMR:
        x: 2500
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      NumberOfXML:
        x: 700
        'y': 150
      CND:
        x: 1300
        'y': 150
      CRI:
        x: 2200
        'y': 150
      CNDS:
        x: 1600
        'y': 150
    results:
      SUCCESS:
        3416790e-c7c8-e983-7ab4-4d18a56f14f3:
          x: 4300
          'y': 150
