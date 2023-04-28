namespace: GenericActivities
flow:
  name: CreateAccessTokenForCustomer
  inputs:
    - email
    - password:
        sensitive: true
  workflow:
    - GetAccessToken_Teams:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: '${username}'
            - Password:
                value: '${password}'
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: GetAccessToken_HTTP
          - SUCCESS: GetAccessToken_HTTP
    - GetAccessToken_HTTP:
        do:
          GenericActivities.GetAccessToken_HTTP:
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: SUCCESS
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      GetAccessToken_HTTP:
        x: 400
        'y': 150
        navigate:
          1f817673-57f2-ed99-609a-87f747dd9383:
            targetId: 7adc65c7-736f-43f1-fee4-30559115ff94
            port: FAILURE
          1762774a-7abd-c5ea-7fde-b577e51d71f3:
            targetId: 7adc65c7-736f-43f1-fee4-30559115ff94
            port: SUCCESS
    results:
      SUCCESS:
        7adc65c7-736f-43f1-fee4-30559115ff94:
          x: 700
          'y': 150
