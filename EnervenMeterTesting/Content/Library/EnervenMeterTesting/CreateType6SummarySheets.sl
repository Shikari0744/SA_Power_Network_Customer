namespace: EnervenMeterTesting
flow:
  name: CreateType6SummarySheets
  inputs:
    - location: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Enerven Meter Testing/Type 6/'
  workflow:
    - GetAccessToken_Teams:
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
          - SUCCESS: DownloadSampleLotResults_Type6
    - CreateSummaryTestSheet_Type6:
        do:
          EnervenMeterTesting.CreateSummaryTestSheet_Type6:
            - filelocation: '${location}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - GetAccessToken_Teams_1:
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
          - SUCCESS: UploadAllFilesAndAttachments_Type6
    - UploadAllFilesAndAttachments_Type6:
        do:
          EnervenMeterTesting.UploadAllFilesAndAttachments_Type6:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
    - DownloadSampleLotResults_Type6:
        do:
          EnervenMeterTesting.DownloadSampleLotResults_Type6:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
        publish:
          - resultsfound
          - resultsDownloaded
        navigate:
          - SUCCESS: FindSummarySheetRequirements_Type6
    - FindSummarySheetRequirements_Type6:
        do:
          EnervenMeterTesting.FindSummarySheetRequirements_Type6:
            - mypath: '${location}'
        publish:
          - summarySheetDict
        navigate:
          - SUCCESS: DownloadAttachments_Type6
    - DownloadAttachments_Type6:
        do:
          EnervenMeterTesting.DownloadAttachments_Type6:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
            - summarySheetsDict: '${summarySheetDict}'
        publish:
          - resultsfound
          - resultsDownloaded
        navigate:
          - SUCCESS: CreateSummaryTestSheet_Type6
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      DownloadSampleLotResults_Type6:
        x: 400
        'y': 150
      FindSummarySheetRequirements_Type6:
        x: 700
        'y': 150
      DownloadAttachments_Type6:
        x: 1000
        'y': 150
      CreateSummaryTestSheet_Type6:
        x: 1300
        'y': 150
      GetAccessToken_Teams_1:
        x: 1600
        'y': 150
      UploadAllFilesAndAttachments_Type6:
        x: 1900
        'y': 150
        navigate:
          c204cb05-bce9-7926-013b-d9cfe4c04228:
            targetId: 03f1b714-8d28-b36d-b627-5b9cfbd93116
            port: SUCCESS
    results:
      SUCCESS:
        03f1b714-8d28-b36d-b627-5b9cfbd93116:
          x: 2200
          'y': 150
