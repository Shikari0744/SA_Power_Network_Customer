########################################################################################################################
#!!
#! @input boltOrders: comma separated
#!!#
########################################################################################################################
namespace: BoltOrderCreation
flow:
  name: BoltOrderAutomation
  inputs:
    - boltOrders
  workflow:
    - OrderCheck:
        do:
          BoltOrderCreation.OrderCheck:
            - orders: '${boltOrders}'
        publish:
          - boltOrders
        navigate:
          - SUCCESS: Kill_ProcessByName
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcboltorderUSER')}"
            - pass:
                value: "${get_sp('svcboltorderPASS')}"
                sensitive: true
            - environment: PRD
            - system: ERP
        navigate:
          - SUCCESS: BoltOrder
          - WARNING: BoltOrder
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - BoltOrder:
        do:
          BoltOrderCreation.BoltOrder:
            - productionOrderNumbers: '${boltOrders}'
            - location: "C:\\Users\\SVCRPABOT\\OneDrive - SA Power Networks\\Bolt Order Creation\\"
        publish:
          - materialNumberCharges
          - materialNumberCredits
          - documentNumbers
          - pickingDate
          - errorMessagesGoodsOrder
          - errorMessagesGoodsIssue
          - log
        navigate:
          - SUCCESS: CompletionEmail
          - WARNING: CompletionEmail
          - FAILURE: on_failure
    - CompletionEmail:
        do:
          BoltOrderCreation.CompletionEmail:
            - boltOrders: '${boltOrders}'
            - documentNumbers: '${documentNumbers}'
            - materialCharges: '${materialNumberCharges}'
            - materialCredits: '${materialNumberCredits}'
            - pickingDate: '${pickingDate}'
            - goodsIssueError: '${errorMessagesGoodsIssue}'
            - goodsOrderError: '${errorMessagesGoodsOrder}'
            - loggingtextfile: '${log}'
        publish:
          - body
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51031'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      OrderCheck:
        x: 100
        'y': 150
      Kill_ProcessByName:
        x: 400
        'y': 150
      OpenSAP:
        x: 700
        'y': 150
      Kill_ProcessByName_1:
        x: 1600
        'y': 150
      BoltOrder:
        x: 1000
        'y': 150
      CompletionEmail:
        x: 1300
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1900
        'y': 150
        navigate:
          e44d7b96-88eb-ead6-35e5-512af5c472e9:
            targetId: ba01d5cd-23f3-7a98-c705-4b8c5c85ba4c
            port: SUCCESS
    results:
      SUCCESS:
        ba01d5cd-23f3-7a98-c705-4b8c5c85ba4c:
          x: 2200
          'y': 150
