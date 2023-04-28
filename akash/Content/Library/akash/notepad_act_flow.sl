namespace: akash
flow:
  name: notepad_act_flow
  workflow:
  - notepad_act:
      do:
        akash.notepad_act: []
      publish:
      - return_result
      - error_message
      navigate:
      - SUCCESS: SUCCESS
      - WARNING: SUCCESS
      - FAILURE: on_failure
  outputs:
  - return_result
  - error_message
  results:
  - SUCCESS
  - FAILURE
