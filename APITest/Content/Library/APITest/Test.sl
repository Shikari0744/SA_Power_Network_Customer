namespace: APITest
flow:
  name: Test
  workflow:
    - RPASingleGet:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: 'https://dog.ceo/api/breeds/image/random'
            - content_type: text/JSON
        publish:
          - url
        navigate:
          - SUCCESS: apitest
          - FAILURE: on_failure
    - RPALoopGet:
        loop:
          for: x in Loop
          do:
            io.cloudslang.base.http.http_client_get:
              - url: 'https://dog.ceo/api/breeds/image/random'
              - content_type: text/JSON
          break:
            - FAILURE
          publish:
            - return_result
        navigate:
          - SUCCESS: apitest_1
          - FAILURE: on_failure
    - apitest:
        do:
          APITest.apitest: []
        publish:
          - outcome
          - Loop: '1,1,1,1,1,1,1,1,1,1'
        navigate:
          - SUCCESS: RPALoopGet
    - apitest_1:
        loop:
          for: x in Loop
          do:
            APITest.apitest: []
          break: []
          publish:
            - outcome
        navigate:
          - SUCCESS: apilooptest
    - apilooptest:
        do:
          APITest.apilooptest: []
        publish:
          - outcome
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      RPASingleGet:
        x: 100
        'y': 150
      apitest:
        x: 400
        'y': 150
      RPALoopGet:
        x: 700
        'y': 150
      apitest_1:
        x: 1000
        'y': 150
      apilooptest:
        x: 1300
        'y': 150
        navigate:
          322e0932-6347-6684-f8e9-25d2a2e480ee:
            targetId: 9b67ba46-b40f-49aa-2969-137d451814a2
            port: SUCCESS
    results:
      SUCCESS:
        9b67ba46-b40f-49aa-2969-137d451814a2:
          x: 1600
          'y': 150
