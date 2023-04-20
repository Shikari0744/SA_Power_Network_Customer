########################################################################################################################
#!!
#! @result CID: if cidResult equal YES
#! @result NORMAL: if cidResult equal NO
#!!#
########################################################################################################################
namespace: RiverMurrayFloodDisconnections
operation:
  name: CIDCheck
  inputs:
    - cidCheck:
        required: true
  python_action:
    use_jython: false
    script: "def execute(cidCheck):\n    \n    cidResult = cidCheck.upper()\n    \n    return{\"cidResult\":cidResult}"
  outputs:
    - cidResult
  results:
    - CID: '${cidResult == "YES"}'
    - NORMAL: '${cidResult == "NO"}'
    - SUCCESS
