namespace: GenericActivities
operation:
  name: GetAccessToken_ServiceNow
  inputs:
    - username
    - password:
        sensitive: true
  python_action:
    use_jython: false
    script: "def execute(username, password): \n    import requests\n    \n    url = \"https://sapndev.service-now.com/oauth_token.do\" \n    payload = \"grant_type=password&client_id=a1ec81d6ad32e8109ae6e79c34cf613f&client_secret=3SponROg5F&username=\"+username+\"&password=\"+password\n    headers = {'Content-Type': \"application/x-www-form-urlencoded\",'Cache-Control': \"no-cache\"}\n\n    responseCode = requests.request(\"POST\", url, data=payload, headers=headers)\n    response = responseCode.text\n    \n    def find_between(response, first, last):\n        try:\n            start = response.index(first) + len(first)\n            end = response.index(last, start)\n            return response[start:end]\n        except ValueError: []\n        return \"\"\n    \n    access_token = find_between(response, '\"access_token\":\"', '\",\"')\n    refresh_token = find_between(response, '\"refresh_token\":\"', '\",\"')\n    \n    return {'access_token':access_token,'refresh_token':refresh_token,'responseCode':responseCode}"
  outputs:
    - access_token
    - refresh_token
    - responseCode
  results:
    - SUCCESS
