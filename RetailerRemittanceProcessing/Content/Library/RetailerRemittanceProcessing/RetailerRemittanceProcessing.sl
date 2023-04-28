namespace: RetailerRemittanceProcessing
flow:
  name: RetailerRemittanceProcessing
  inputs:
    - filepath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Retailer Remittance Processing/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcremittproUSER')}"
            - pass:
                value: "${get_sp('svcremittproPASS')}"
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: CloseRemittanceBPEMs
          - WARNING: CloseRemittanceBPEMs
          - FAILURE: on_failure
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
          - SUCCESS: DownloadBPEMCaseFile
    - CloseRemittanceBPEMs:
        do:
          RetailerRemittanceProcessing.CloseRemittanceBPEMs:
            - bpemcasefile: '${bpemcasefile}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - DownloadBPEMCaseFile:
        do:
          RetailerRemittanceProcessing.DownloadBPEMCaseFile:
            - accessToken: '${accessToken}'
            - filePath: '${filepath}'
        publish:
          - bpemcasefile
          - result
        navigate:
          - SUCCESS: OpenSAP
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
          - SUCCESS: UploadBPEMCaseFile
    - UploadBPEMCaseFile:
        do:
          RetailerRemittanceProcessing.UploadBPEMCaseFile:
            - accessToken: '${accessToken}'
            - filePath: '${filepath}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62665'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 2200
        'y': 150
      UploadBPEMCaseFile:
        x: 1900
        'y': 150
      CloseRemittanceBPEMs:
        x: 1300
        'y': 150
      GetAccessToken_Teams_1:
        x: 1600
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 2500
        'y': 150
        navigate:
          9e6dc2a1-f756-c8d7-b521-cd9e6ddfda10:
            targetId: 33eddabf-b2d9-537c-c0e5-b2d3d2b81081
            port: SUCCESS
      DownloadBPEMCaseFile:
        x: 700
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      OpenSAP:
        x: 1000
        'y': 150
    results:
      SUCCESS:
        33eddabf-b2d9-537c-c0e5-b2d3d2b81081:
          x: 2800
          'y': 150
