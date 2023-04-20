########################################################################################################################
#!!
#! @input hoursJournalNumber: N-{month}-{hoursJournalNumber}-A Project Expense DL
#! @input costsJournalNumber: N-{month}-{costsJournalNumber}-A Project Expense Other Costs
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PreJournal
  inputs:
    - hoursJournalNumber
    - costsJournalNumber
    - reportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Project Close Out/'
    - projectSupportFile: Project Expensing Support File.xlsm
    - hoursJournalFile: 1. Hours Journal.xlsm
    - costsJournalFile: 2. Costs Journal.xlsm
    - userEmail
  workflow:
    - inputCheck:
        do:
          ProjectExpensing.inputCheck:
            - hours: '${hoursJournalNumber}'
            - costs: '${costsJournalNumber}'
        publish:
          - hours1
          - costs1
        navigate:
          - SUCCESS: Kill_ProcessByName
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - CN43nExport:
        do:
          ProjectExpensing.CN43nExport:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: SAPDataExport
          - WARNING: SAPDataExport
          - FAILURE: on_failure
    - SAPDataExport:
        do:
          ProjectExpensing.SAPDataExport:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        publish:
          - flag
        navigate:
          - SUCCESS:
              next_step: ComputationTab
              ROI: '100'
          - WARNING: ComputationTab
          - FAILURE: on_failure
    - ComputationTab:
        do:
          ProjectExpensing.ComputationTab:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: ComputationErrorCheck
          - WARNING: ComputationErrorCheck
          - FAILURE: on_failure
    - Journal1:
        do:
          ProjectExpensing.Journal1:
            - hoursJournal: '${hoursJournalFile}'
            - SAPuser: "${get_sp('svcprjcloseUSER')}"
            - SAPpass1: "${get_sp('svcprjclosePASS')}"
            - hoursJournalNumber: '${hoursJournalNumber}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        publish:
          - desc
        navigate:
          - SUCCESS:
              next_step: Journal2
              ROI: '100'
          - WARNING: Journal2
          - FAILURE: on_failure
    - Journal2:
        do:
          ProjectExpensing.Journal2:
            - costsJournal: '${costsJournalFile}'
            - SAPuser: "${get_sp('svcprjcloseUSER')}"
            - SAPpass1: "${get_sp('svcprjclosePASS')}"
            - costsJournalNumber: '${costsJournalNumber}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        publish:
          - desc
        navigate:
          - SUCCESS: GetAccessToken_Teams_2
          - WARNING: GetAccessToken_Teams_2
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - GetAccessToken_Teams_2:
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
          - SUCCESS: DownloadProjectSupportFiles
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
          - SUCCESS: ClearPreviousExports
          - WARNING: CUSTOM_1
          - FAILURE: on_failure
    - ClearPreviousExports:
        do:
          ProjectExpensing.ClearPreviousExports:
            - fileLocation: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: CN43nExport
          - WARNING: CN43nExport
          - FAILURE: on_failure
    - PreJournalCompletionEmail:
        do:
          ProjectExpensing.PreJournalCompletionEmail:
            - ToEmail: '${userEmail}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
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
          - SUCCESS: PreJournalCompletionEmail
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51992'
        navigate:
          - SUCCESS: SUCCESS
    - ComputationErrorCheck:
        do:
          ProjectExpensing.ComputationErrorCheck:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - email: '${userEmail}'
        navigate:
          - SUCCESS: Journal1
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
          - SUCCESS: UploadProjectSupportFiles_PreJournal_1
    - UploadProjectSupportFiles_PreJournal_1:
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
          - SUCCESS: CUSTOM
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
    - CUSTOM_1
extensions:
  graph:
    steps:
      SAPDataExport:
        x: 2200
        'y': 250
      Kill_ProcessByName_1:
        x: 4600
        'y': 250
      UploadProjectSupportFiles_PreJournal_1:
        x: 3400
        'y': 375
        navigate:
          18ae4d5d-0f6a-4c27-c53a-03746a4ed330:
            targetId: 24e6cf02-a5c1-f815-c9d7-8bf10f1442ea
            port: SUCCESS
      ComputationErrorCheck:
        x: 2800
        'y': 250
      GetAccessToken_Teams_1:
        x: 3100
        'y': 375
      STATS_IncreaseRunCountInDevOps:
        x: 4900
        'y': 250
        navigate:
          b2a5ded3-c4f8-bb4f-5fba-63c7df75c692:
            targetId: 1120d607-f8d6-08c8-ceaa-51a29c258975
            port: SUCCESS
      GetAccessToken_Teams_2:
        x: 3700
        'y': 125
      PreJournalCompletionEmail:
        x: 4300
        'y': 250
      ComputationTab:
        x: 2500
        'y': 250
      Kill_ProcessByName:
        x: 400
        'y': 250
      UploadProjectSupportFiles_PreJournal:
        x: 4000
        'y': 250
      GetAccessToken_Teams:
        x: 700
        'y': 250
      OpenSAP:
        x: 1300
        'y': 250
        navigate:
          ab1e980c-724b-d355-2908-e3c8d7f00b7a:
            targetId: a1ea1e28-eceb-73e3-dcdf-7cdf3be121a9
            port: WARNING
      CN43nExport:
        x: 1900
        'y': 250
      DownloadProjectSupportFiles:
        x: 1000
        'y': 250
      Journal1:
        x: 3100
        'y': 125
      ClearPreviousExports:
        x: 1600
        'y': 125
      Journal2:
        x: 3400
        'y': 125
      inputCheck:
        x: 100
        'y': 250
    results:
      CUSTOM_1:
        a1ea1e28-eceb-73e3-dcdf-7cdf3be121a9:
          x: 1600
          'y': 375
      SUCCESS:
        1120d607-f8d6-08c8-ceaa-51a29c258975:
          x: 5200
          'y': 250
      CUSTOM:
        24e6cf02-a5c1-f815-c9d7-8bf10f1442ea:
          x: 3700
          'y': 375
