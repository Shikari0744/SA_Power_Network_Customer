namespace: APITest
operation:
  name: apilooptest
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute():
          import requests
          i = 0
          x = ""
          while i < 11:
              response = requests.get('https://dog.ceo/api/breeds/image/random')
              x = x + "," + str(response)
              i = i + 1
          return{'outcome':x}
          # code goes here
      # you can add additional helper methods below.
  outputs:
    - outcome
  results:
    - SUCCESS
