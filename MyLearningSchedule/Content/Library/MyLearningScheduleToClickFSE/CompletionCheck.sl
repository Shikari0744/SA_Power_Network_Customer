namespace: MyLearningScheduleToClickFSE
operation:
  name: CompletionCheck
  inputs:
    - completed
  python_action:
    use_jython: false
    script: |-
      def execute(completed):
          complete = ""
          if completed == "Completed":
              complete = "Yes"
          return{"complete":complete}
  outputs:
    - complete
  results:
    - FAILURE: '${complete == "Yes"}'
    - SUCCESS
