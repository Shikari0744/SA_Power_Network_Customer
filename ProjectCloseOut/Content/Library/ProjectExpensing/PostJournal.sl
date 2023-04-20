########################################################################################################################
#!!
#! @input settlementNumber: 1403268-{settlementNumber}
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PostJournal
  inputs:
    - settlementNumber
    - reportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Project Close Out/'
    - projectSupportFile: Project Expensing Support File.xlsm
    - hoursJournalFile: 1. Hours Journal.xlsm
    - costsJournalFile: 2. Costs Journal.xlsm
    - userEmail
  workflow:
    - inputCheck:
        do:
          ProjectExpensing.inputCheck:
            - settle: '${settlementNumber}'
        publish:
          - settle1
        navigate:
          - SUCCESS: Kill_ProcessByName
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - SAPDataExportOH:
        do:
          ProjectExpensing.SAPDataExportOH:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: Settlement
          - WARNING: Settlement
          - FAILURE: on_failure
    - Settlement:
        do:
          ProjectExpensing.Settlement:
            - settlementRule: '${settlementNumber}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - UploadProjectSupportFiles:
        do:
          ProjectExpensing.UploadProjectSupportFiles:
            - accessToken: '${accessToken}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - hoursJournal: '${hoursJournalFile}'
            - costsJournal: '${costsJournalFile}'
        publish:
          - newSupportFile
          - newHoursJournal
          - newCostsJournal
          - uploadResults
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CompletionEmail
    - CompletionEmail:
        do:
          ProjectExpensing.CompletionEmail:
            - ToEmail: '${userEmail}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprjcloseUSER')}"
            - pass:
                value: "${get_sp('svcprjclosePASS')}"
                sensitive: true
            - environment: prd
            - system: erp
        navigate:
          - SUCCESS: SAPDataExportOH
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
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
          - SUCCESS: UploadProjectSupportFiles_PreJournal
    - DownloadProjectSupportFiles:
        do:
          ProjectExpensing.DownloadProjectSupportFiles:
            - accessToken: '${accessToken}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - hoursJournal: '${hoursJournalFile}'
            - costsJournal: '${costsJournalFile}'
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
          - SUCCESS: DownloadProjectSupportFiles
    - UploadProjectSupportFiles_PreJournal:
        do:
          ProjectExpensing.UploadProjectSupportFiles_PreJournal:
            - accessToken: '${accessToken}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - hoursJournal: '${hoursJournalFile}'
            - costsJournal: '${costsJournalFile}'
        publish:
          - uploadResults
        navigate:
          - FAILURE: on_failure
          - SUCCESS: UploadProjectSupportFiles
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51992'
        navigate:
          - SUCCESS: SUCCESS
    - on_failure:
        - FailureFlow:
            do:
              ProjectExpensing.FailureFlow:
                - reportsHere: '${reportsHere}'
                - projectSupportFile: '${projectSupportFile}'
                - hoursJournalFile: '${hoursJournalFile}'
                - costsJournalFile: '${costsJournalFile}'
                - userEmail: '${userEmail}'
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      CompletionEmail:
        x: 3100
        'y': 250
      UploadProjectSupportFiles:
        x: 2800
        'y': 250
      Kill_ProcessByName_1:
        x: 3400
        'y': 250
      GetAccessToken_Teams_1:
        x: 700
        'y': 250
      STATS_IncreaseRunCountInDevOps:
        x: 3700
        'y': 250
        navigate:
          6e5f0e8b-0d4c-b03a-13a9-f14968dd93bf:
            targetId: 792cd6bb-04f0-d4f9-30b3-80497d2e0d62
            port: SUCCESS
      Settlement:
        x: 1900
        'y': 250
      Kill_ProcessByName:
        x: 400
        'y': 250
      UploadProjectSupportFiles_PreJournal:
        x: 2500
        'y': 250
      GetAccessToken_Teams:
        x: 2200
        'y': 250
      OpenSAP:
        x: 1300
        'y': 250
        navigate:
          ba3a5ecb-adef-838f-fb96-a494051eced7:
            targetId: 125e2950-366a-e490-19be-ae789981681b
            port: WARNING
      SAPDataExportOH:
        x: 1600
        'y': 125
      DownloadProjectSupportFiles:
        x: 1000
        'y': 250
      inputCheck:
        x: 100
        'y': 250
    results:
      CUSTOM:
        125e2950-366a-e490-19be-ae789981681b:
          x: 1600
          'y': 375
      SUCCESS:
        792cd6bb-04f0-d4f9-30b3-80497d2e0d62:
          x: 4000
          'y': 250
