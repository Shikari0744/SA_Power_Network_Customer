namespace: ProjectExpensing
operation:
  name: ExceptionValue
  inputs:
    - exceptionValue:
        required: false
  python_action:
    use_jython: false
    script: |-
      def execute(exceptionValue):
          if exceptionValue != "":
              exception = exceptionValue
          else:
              exception = ""
          return{"exception":exception}
  outputs:
    - exception
  results:
    - SUCCESS
