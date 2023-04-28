namespace: ProjectDebug
operation:
  name: failuretest2
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute():
          x = 1
          return{"x":x}
  outputs:
    - x
  results:
    - FAILURE: '${x == "1"}'
    - SUCCESS
