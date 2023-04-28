namespace: GenericActivities
operation:
  name: Wait
  inputs:
    - seconds: '30'
  python_action:
    use_jython: false
    script: |-
      def execute(seconds):
          import time
          time.sleep(seconds)
  results:
    - SUCCESS
