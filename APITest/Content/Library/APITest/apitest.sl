namespace: APITest
operation:
  name: apitest
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute():
          import requests
          response = requests.get('https://dog.ceo/api/breeds/image/random')
          return{'outcome':response}
      # you can add additional helper methods below.
  outputs:
    - outcome
  results:
    - SUCCESS
