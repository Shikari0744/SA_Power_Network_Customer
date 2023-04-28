namespace: EnervenMeterTesting
flow:
  name: CreateType5SummarySheets
  inputs:
    - location: 'C:/Users/haasj0/OneDrive - SA Power Networks/Documents/Process Automation/Enerven Meter Testing/Type 5/New folder/'
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
          - SUCCESS: DownloadSampleLotResults_Type5
    - CreateSummaryTestSheet_Type5:
        do:
          EnervenMeterTesting.CreateSummaryTestSheet_Type5:
            - filelocation: '${location}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - UploadAllFilesAndAttachments_Type5:
        do:
          EnervenMeterTesting.UploadAllFilesAndAttachments_Type5:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
        publish:
          - allresponsesSampleLot
          - allresponsesAttachments
          - allresponsesSummarySheet
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
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
          - SUCCESS: UploadAllFilesAndAttachments_Type5
    - DownloadSampleLotResults_Type5:
        do:
          EnervenMeterTesting.DownloadSampleLotResults_Type5:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
        publish:
          - resultsfound
          - resultsDownloaded
        navigate:
          - SUCCESS: FindSummarySheetRequirements_Type5
    - FindSummarySheetRequirements_Type5:
        do:
          EnervenMeterTesting.FindSummarySheetRequirements_Type5:
            - mypath: '${location}'
        publish:
          - summarySheetDict
        navigate:
          - SUCCESS: DownloadAttachments_Type5
    - DownloadAttachments_Type5:
        do:
          EnervenMeterTesting.DownloadAttachments_Type5:
            - accessToken: '${accessToken}'
            - filePath: '${location}'
            - summarySheetsDict: '${summarySheetDict}'
        publish:
          - resultsfound
          - resultsDownloaded
        navigate:
          - SUCCESS: CreateSummaryTestSheet_Type5
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      DownloadSampleLotResults_Type5:
        x: 400
        'y': 150
      FindSummarySheetRequirements_Type5:
        x: 700
        'y': 150
      DownloadAttachments_Type5:
        x: 1000
        'y': 150
      CreateSummaryTestSheet_Type5:
        x: 1300
        'y': 150
      GetAccessToken_Teams_1:
        x: 1600
        'y': 150
      UploadAllFilesAndAttachments_Type5:
        x: 1900
        'y': 150
        navigate:
          05a2454a-e77a-210e-5f9e-6d3f9062d039:
            targetId: 960c0eee-f3eb-7b8d-65e7-ee4fd1150ef2
            port: SUCCESS
    results:
      SUCCESS:
        960c0eee-f3eb-7b8d-65e7-ee4fd1150ef2:
          x: 2200
          'y': 150
