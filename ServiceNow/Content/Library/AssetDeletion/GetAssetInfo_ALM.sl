namespace: AssetDeletion
operation:
  name: GetAssetInfo_ALM
  inputs:
    - asset_id
    - access_token
  python_action:
    use_jython: false
    script: "def execute(asset_id, access_token): \n    import requests\n    \n    url = \"https://platform1.sapowernetworks.com.au/api/now/table/alm_hardware?sysparm_query=ci.name=\"+asset_id+\"&sysparm_limit=1\" \n    headers = {'Authorization': \"Bearer \" + access_token}\n    responseCode = requests.request(\"GET\", url, data=None, headers=headers)\n    response_ALM = responseCode.text\n    \n    def find_between(response, first, last):\n        try:\n            start = response.index(first) + len(first)\n            end = response.index(last, start)\n            return response[start:end]\n        except ValueError: []\n        return \"\"\n    \n    sys_id_ALM = find_between(response_ALM, '\"sys_id\":\"', '\",\"')\n    \n    return {'sys_id_ALM':sys_id_ALM,'responseCode':responseCode}"
  outputs:
    - sys_id_ALM
    - responseCode
  results:
    - SUCCESS
