########################################################################################################################
#!!
#! @input hoursJournalNumber: N-{month}-{hoursJournalNumber}-A Project Expense DL
#! @input costsJournalNumber: N-{month}-{costsJournalNumber}-A Project Expense Other Costs
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PreJournal_SSXSetUp
  inputs:
    - hoursJournalNumber
    - costsJournalNumber
    - userEmail
  workflow:
    - PreJournal:
        do:
          ProjectExpensing.PreJournal:
            - hoursJournalNumber: '${hoursJournalNumber}'
            - costsJournalNumber: '${costsJournalNumber}'
            - userEmail: '${userEmail}'
            - robot: B602
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
          - CUSTOM: SUCCESS
          - CUSTOM_1: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      PreJournal:
        x: 100
        'y': 150
        navigate:
          add461eb-a873-1df6-e864-2dec10c03290:
            targetId: 460d3446-ba61-4772-687a-75c42bed0b0c
            port: SUCCESS
          b9b4b8f8-889b-dc2f-ebfc-22b3d26802cc:
            targetId: 460d3446-ba61-4772-687a-75c42bed0b0c
            port: CUSTOM
          e8ce42b2-9f17-68de-24cd-e173aeb6b2a4:
            targetId: 460d3446-ba61-4772-687a-75c42bed0b0c
            port: CUSTOM_1
    results:
      SUCCESS:
        460d3446-ba61-4772-687a-75c42bed0b0c:
          x: 400
          'y': 150
