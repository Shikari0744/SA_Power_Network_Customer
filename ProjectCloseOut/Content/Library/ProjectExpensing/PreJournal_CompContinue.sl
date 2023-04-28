########################################################################################################################
#!!
#! @input hoursJournalNumber: N-{month}-{hoursJournalNumber}-A Project Expense DL
#! @input costsJournalNumber: N-{month}-{costsJournalNumber}-A Project Expense Other Costs
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PreJournal_CompContinue
  inputs:
    - hoursJournalNumber
    - costsJournalNumber
    - reportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Project Close Out/'
    - projectSupportFile: Project Expensing Support File.xlsm
    - hoursJournalFile: 1. Hours Journal.xlsm
    - costsJournalFile: 2. Costs Journal.xlsm
    - userEmail
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
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
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
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
          - SUCCESS: ComputationTab
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
    - ComputationTab:
        do:
          ProjectExpensing.ComputationTab:
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        navigate:
          - SUCCESS: Journal1
          - WARNING: Journal1
          - FAILURE: on_failure
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
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 2800
        'y': 150
      GetAccessToken_Teams_1:
        x: 1900
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 3100
        'y': 150
        navigate:
          c5cde8c9-57f3-9730-548b-2be3a75579b8:
            targetId: 5a0444eb-5e26-b93c-8a2d-cf83bf197ff9
            port: SUCCESS
      PreJournalCompletionEmail:
        x: 2500
        'y': 150
      ComputationTab:
        x: 1000
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      UploadProjectSupportFiles_PreJournal:
        x: 2200
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      DownloadProjectSupportFiles:
        x: 700
        'y': 150
      Journal1:
        x: 1300
        'y': 150
      Journal2:
        x: 1600
        'y': 150
    results:
      SUCCESS:
        5a0444eb-5e26-b93c-8a2d-cf83bf197ff9:
          x: 3400
          'y': 150
