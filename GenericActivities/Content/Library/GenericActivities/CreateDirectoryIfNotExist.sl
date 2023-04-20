namespace: GenericActivities
operation:
  name: CreateDirectoryIfNotExist
  inputs:
    - path
  python_action:
    use_jython: false
    script: |-
      def execute(path):
          import os

          isExist = os.path.exists(path)
          if not isExist:
              os.makedirs(path)
  results:
    - SUCCESS
