########################################################################################################################
#!!
#! @result EASE: if flowResult equal EASE
#! @result BULK: if flowResult equal BULK
#!!#
########################################################################################################################
namespace: RiverMurrayFloodDisconnections
operation:
  name: FlowCheck
  inputs:
    - flowCheck:
        required: true
  python_action:
    use_jython: false
    script: "def execute(flowCheck):\n    \n    flowResult = flowCheck.upper()\n    \n    return{\"flowResult\":flowResult}"
  outputs:
    - flowResult
  results:
    - EASE: '${flowResult == "EASE"}'
    - BULK: '${flowResult == "BULK"}'
    - SUCCESS
