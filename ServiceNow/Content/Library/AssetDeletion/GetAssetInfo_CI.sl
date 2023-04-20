namespace: AssetDeletion
operation:
  name: GetAssetInfo_CI
  inputs:
    - asset_line_excel
    - access_token
  python_action:
    use_jython: false
    script: "def execute(asset_line_excel, access_token): \n    import requests\n    \n    x = asset_line_excel.split(\"/\")\n    asset_id = x[0]\n    status = x[1]\n    storeroom = x[2]\n    \n    url = \"https://platform1.sapowernetworks.com.au/api/now/table/cmdb_ci_computer?sysparm_query=name%3D\"+asset_id+\"&sysparm_limit=1\" \n    headers = {'Authorization': \"Bearer \" + access_token}\n    responseCode = requests.request(\"GET\", url, data=None, headers=headers)\n    response = responseCode.text\n    \n    def find_between(response, first, last):\n        try:\n            start = response.index(first) + len(first)\n            end = response.index(last, start)\n            return response[start:end]\n        except ValueError: []\n        return \"\"\n    \n    sys_id_CI = find_between(response, 'sys_id\":\"','\",\"')\n    \n    return {'sys_id_CI':sys_id_CI,'asset_id':asset_id,'status':status,'storeroom':storeroom,'responseCode':responseCode}"
  outputs:
    - sys_id_CI
    - responseCode
    - storeroom
    - asset_id
    - status
  results:
    - SUCCESS
