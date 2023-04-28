namespace: GenericActivities
operation:
  name: GetAccessToken_HTTP
  inputs:
    - username
    - password:
        sensitive: true
  python_action:
    use_jython: false
    script: "def execute(username, password): \n    import requests\n    import json\n    \n    url = \"https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/v2.0/token\"\n    payload = 'grant_type=client_credentials&client_id=a7e41e17-18cf-4fd3-9dbb-d1322ad23e3f&client_secret=Ao3l_06%7EDf_q3W.kIl9woUVC8Xlc3A_Ys9&scope=https%3A//graph.microsoft.com/.default&userName='+username+'&password='+password\n    headers = {\"Content-Type\": \"application/x-www-form-urlencoded\"}\n    response = requests.request(\"POST\", url, headers=headers, data = payload)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n        result = \"Successful\"\n    \n    json_data = json.loads(response.text)\n    accessToken = json_data['access_token']     \n    return {'accessToken':accessToken,\"result\":result}"
  outputs:
    - accessToken
    - result
  results:
    - FAILURE: '${result == ""}'
    - SUCCESS
