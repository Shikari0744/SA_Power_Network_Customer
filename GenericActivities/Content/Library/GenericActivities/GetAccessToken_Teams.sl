namespace: GenericActivities
operation:
  name: GetAccessToken_Teams
  inputs:
    - UserName
    - Password:
        sensitive: true
  python_action:
    use_jython: false
    script: "def execute(UserName, Password): \n    import msal \n    from msal import PublicClientApplication\n    app = PublicClientApplication(\"a7e41e17-18cf-4fd3-9dbb-d1322ad23e3f\", authority=\"https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910\")\n    result = None\n    accessToken = \"\"\n    result = \"\"\n    accounts = app.get_accounts(username=UserName)\n    if accounts:\n        result = app.acquire_token_silent(\"User.Read\", account=accounts[0])\n    \n    if not result:\n        result = app.acquire_token_by_username_password(UserName, Password, scopes=[\"User.Read\"])\n      \n    if \"access_token\" in result:\n        accessToken = result['access_token']\n    else:    \n        result = \"\"\n       \n    return{'accessToken':accessToken,\"result\":result}"
  outputs:
    - accessToken
    - result
  results:
    - FAILURE: '${result == ""}'
    - SUCCESS
