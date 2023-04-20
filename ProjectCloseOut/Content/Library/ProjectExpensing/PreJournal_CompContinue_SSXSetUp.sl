########################################################################################################################
#!!
#! @input hoursJournalNumber: N-{month}-{hoursJournalNumber}-A Project Expense DL
#! @input costsJournalNumber: N-{month}-{costsJournalNumber}-A Project Expense Other Costs
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PreJournal_CompContinue_SSXSetUp
  inputs:
    - hoursJournalNumber
    - costsJournalNumber
    - userEmail
  workflow:
    - PreJournal_CompContinue:
        do:
          ProjectExpensing.PreJournal_CompContinue:
            - hoursJournalNumber: '${hoursJournalNumber}'
            - costsJournalNumber: '${costsJournalNumber}'
            - userEmail: '${userEmail}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      PreJournal_CompContinue:
        x: 100
        'y': 150
        navigate:
          326fcaa5-5127-a4ba-8fb4-c848cdf76ebf:
            targetId: cba87372-f399-9beb-0e68-1a47149574b8
            port: SUCCESS
    results:
      SUCCESS:
        cba87372-f399-9beb-0e68-1a47149574b8:
          x: 400
          'y': 150
