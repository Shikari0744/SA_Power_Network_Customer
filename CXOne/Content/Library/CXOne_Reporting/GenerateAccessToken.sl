namespace: CXOne_Reporting
operation:
  name: GenerateAccessToken
  inputs:
    - cxAccessKeySecret:
        sensitive: true
    - cxAccessKeyId:
        sensitive: true
  python_action:
    use_jython: false
    script: "def execute(cxAccessKeyId, cxAccessKeySecret):\n    import requests\n    import json\n    \n    accessToken = \"\"\n    result = \"\"\n    \n    accessKeyId = '\"' + cxAccessKeyId  + '\"'\n    accessKeySecret = '\"' + cxAccessKeySecret  + '\"'\n    URL = 'https://au1.nice-incontact.com/authentication/v1/token/access-key'\n    body = '{\"accessKeyId\":'+ accessKeyId + ',\"accessKeySecret\":' + accessKeySecret +'}'\n    head = {\"Content-Type\": \"application/json\"}\n    response = requests.post(URL, headers=head, data = body)\n    if not (response.status_code >= 200 and response.status_code < 300):\n        result = response.text\n    else:\n        json_data = json.loads(response.text)\n        accessToken = json_data['access_token']\n    \n    return{'AccessToken':accessToken,\"result\":result}"
  outputs:
    - AccessToken
    - result
  results:
    - FAILURE: '${result != ""}'
    - SUCCESS
