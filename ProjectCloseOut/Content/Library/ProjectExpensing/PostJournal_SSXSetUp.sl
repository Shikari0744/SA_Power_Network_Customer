########################################################################################################################
#!!
#! @input settlementNumber: 1403268-{settlementNumber}
#!!#
########################################################################################################################
namespace: ProjectExpensing
flow:
  name: PostJournal_SSXSetUp
  inputs:
    - settlementNumber
    - userEmail
  workflow:
    - PostJournal:
        do:
          ProjectExpensing.PostJournal:
            - settlementNumber: '${settlementNumber}'
            - userEmail: '${userEmail}'
            - robot: B602
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
          - CUSTOM: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      PostJournal:
        x: 100
        'y': 150
        navigate:
          c67a7083-7cd1-5ed3-002b-7813936b4491:
            targetId: 413790db-0f98-b78b-e1ca-5ea3b25e053c
            port: SUCCESS
          54a6cbc3-10f5-eb0e-1936-1296b515615d:
            targetId: 413790db-0f98-b78b-e1ca-5ea3b25e053c
            port: CUSTOM
    results:
      SUCCESS:
        413790db-0f98-b78b-e1ca-5ea3b25e053c:
          x: 400
          'y': 150
