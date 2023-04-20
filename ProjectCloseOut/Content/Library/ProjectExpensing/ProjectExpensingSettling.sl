########################################################################################################################
#!!
#! @input hoursJournalNumber: N-{month}-{hoursJournalNumber}-A Project Expense DL
#! @input costsJournalNumber: N-{month}-{costsJournalNumber}-A Project Expense Other Costs
#! @input settlementNumber: 1403268-{settlementNumber}
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: ProjectExpensingSettling
  inputs:
    - hoursJournalNumber
    - costsJournalNumber
    - settlementNumber
    - hoursJournalFile: Hours Journal.xlsm
    - costsJournalFile: Costs Journal.xlsm
    - projectSupportFile: Project Expensing Support File.xlsm
    - reportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Project Close Out/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
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
          - SUCCESS:
              next_step: Journal1
              ROI: '100'
          - WARNING: Journal1
          - FAILURE: on_failure
    - Journal1:
        do:
          ProjectExpensing.Journal1:
            - hoursJournal: '${hoursJournalFile}'
            - SAPuser: "${get_sp('projectexpensingUSER')}"
            - SAPpass1: "${get_sp('projectexpensingPASS')}"
            - hoursJournalNumber: '${hoursJournalNumber}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        publish:
          - exception
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
            - SAPuser: "${get_sp('projectexpensingUSER')}"
            - SAPpass1: "${get_sp('projectexpensingPASS')}"
            - costsJournalNumber: '${costsJournalNumber}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
        publish:
          - exception
        navigate:
          - SUCCESS: SAPDataExportOH
          - WARNING: SAPDataExportOH
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
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
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
    - UploadProjectSupportFiles:
        do:
          ProjectExpensing.UploadProjectSupportFiles:
            - accessToken: '${accessToken}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - hoursJournal: '${hoursJournalFile}'
            - costsJournal: '${costsJournalFile}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: CompletionEmail
    - CompletionEmail:
        do:
          ProjectExpensing.CompletionEmail:
            - ToEmail: 'Ross.Moutos@sapowernetworks.com.au,Karan.Kumar@sapowernetworks.com.au,Tarek.Elkady@sapowernetworks.com.au,Katie.Wiese@sapowernetworks.com.au'
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
          - SUCCESS: ClearPreviousExports
          - WARNING: ClearPreviousExports
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
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
          - SUCCESS: DownloadProjectSupportFiles
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
          - SUCCESS: UploadProjectSupportFiles
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      CompletionEmail:
        x: 4300
        'y': 150
      SAPDataExport:
        x: 1900
        'y': 150
      UploadProjectSupportFiles:
        x: 4000
        'y': 150
      Kill_ProcessByName_1:
        x: 4600
        'y': 150
        navigate:
          ccb4288b-57c8-2f18-81a9-b88fd8c09fbe:
            targetId: 2d35e665-7fcd-5c36-8d67-3d5de9697dc3
            port: SUCCESS
          ae435f61-0276-64df-6f7f-6fb50589737f:
            targetId: 2d35e665-7fcd-5c36-8d67-3d5de9697dc3
            port: WARNING
      GetAccessToken_Teams_1:
        x: 3700
        'y': 150
      Settlement:
        x: 3400
        'y': 150
      ComputationTab:
        x: 2200
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
      CN43nExport:
        x: 1600
        'y': 150
      SAPDataExportOH:
        x: 3100
        'y': 150
      DownloadProjectSupportFiles:
        x: 700
        'y': 150
      Journal1:
        x: 2500
        'y': 150
      ClearPreviousExports:
        x: 1300
        'y': 150
      Journal2:
        x: 2800
        'y': 150
    results:
      SUCCESS:
        2d35e665-7fcd-5c36-8d67-3d5de9697dc3:
          x: 4900
          'y': 150
