namespace: AEMOSnapshotsToOracle
flow:
  name: AEMO_Snapshots
  inputs:
    - location: 'D:/AEMO Snapshots/'
  workflow:
    - CreateLogFile:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.CreateLogFile:
            - filelocation: '${location}'
        publish:
          - oracleLog
          - downloadlog
          - toBeCompletedLog
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
    - NumberOfXML:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.NumberOfXML:
            - accessToken: '${accessToken}'
        publish:
          - cmr
          - cnd
          - cnds
          - cnpr
          - cri
        navigate:
          - SUCCESS: CSVFolder_CMR
    - CSVFolder_CMR:
        do:
          AEMOSnapshotsToOracle.CSVFolder:
            - csvFolder: '${cmr}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CMR: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CSVFolder_CND
    - CSVFolder_CND:
        do:
          AEMOSnapshotsToOracle.CSVFolder:
            - csvFolder: '${cnd}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CND: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CSVFolder_CNDS
    - CSVFolder_CNDS:
        do:
          AEMOSnapshotsToOracle.CSVFolder:
            - csvFolder: '${cnds}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CNDS: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CSVFolder_CNPR
    - CSVFolder_CNPR:
        do:
          AEMOSnapshotsToOracle.CSVFolder:
            - csvFolder: '${cnpr}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CNPR: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CSVFolder_CRI
    - CSVFolder_CRI:
        do:
          AEMOSnapshotsToOracle.CSVFolder:
            - csvFolder: '${cri}'
            - location: '${location}'
            - downloadLog: '${downloadlog}'
        publish:
          - folderName_CRI: '${folderName}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Combine_All_CSV_CMR
    - Combine_All_CSV_CMR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CMR}'
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CND
    - Combine_All_CSV_CND:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CND}'
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CNDS
    - Combine_All_CSV_CNDS:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CNDS}'
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CNPR
    - Combine_All_CSV_CNPR:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CNPR}'
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: Combine_All_CSV_CRI
    - Combine_All_CSV_CRI:
        worker_group: B604
        do:
          AEMOSnapshotsToOracle.Combine_All_CSV:
            - filePath: '${location}'
            - csvlog: '${csvLog}'
            - folderType: '${folderName_CRI}'
        publish:
          - combinedLocation
        navigate:
          - SUCCESS: SetUpOracleCommands
    - SetUpOracleCommands:
        do:
          AEMOSnapshotsToOracle.SetUpOracleCommands:
            - filepath: '${location}'
            - oracleLog: '${oracleLog}'
            - tbcPath: '${toBeCompletedLog}'
            - failedLog: '${failedLog}'
            - cmr: '${cmr}'
            - cnd: '${cnd}'
            - cnds: '${cnds}'
            - cnpr: '${cnpr}'
            - cri: '${cri}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
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
          84cfe58a-7139-29b0-9dab-2227700b557d:
            targetId: 5edc9ac5-b687-45c5-296f-76da9b12d29e
            port: SUCCESS
      CreateLogFile:
        x: 100
        'y': 150
      Combine_All_CSV_CNPR:
        x: 3400
        'y': 150
      CSVFolder_CNDS:
        x: 1600
        'y': 150
      CSVFolder_CND:
        x: 1300
        'y': 150
      CSVFolder_CRI:
        x: 2200
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
      CSVFolder_CNPR:
        x: 1900
        'y': 150
      CSVFolder_CMR:
        x: 1000
        'y': 150
    results:
      SUCCESS:
        5edc9ac5-b687-45c5-296f-76da9b12d29e:
          x: 4300
          'y': 150
