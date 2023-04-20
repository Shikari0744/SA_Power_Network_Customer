namespace: FieldServicesLeaveReporting
operation:
  name: CreateFolderForDateofRun
  python_action:
    use_jython: false
    script: "def execute():\n    import requests\n    from os import path\n    from msal import PublicClientApplication\n    from os import listdir\n    from datetime import datetime\n    \n    #TO GET ACCESS TOKEN\n    app = PublicClientApplication(\"a7e41e17-18cf-4fd3-9dbb-d1322ad23e3f\",authority=\"https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910\")\n    result = None\n    accounts = app.get_accounts(username=\"utilities\\svcrpabot@sapowernetworks.com.au\")\n    if accounts:\n        result = app.acquire_token_silent(\"User.Read\", account=accounts[0])\n    if not result:\n        result = app.acquire_token_by_username_password(\"svcrpabot@sapowernetworks.com.au\", \"KNWdrW0gmkuckoTyNl89\", scopes=[\"User.Read\"])\n    if \"access_token\" in result:\n        accessToken = result[\"access_token\"]\n    else:\n        noAccess = result.get(\"error\")\n        \n    folderLocations = [\"POWERLINE%20REGIONAL\",\"METRO%20OPERATIONS\",\"POWERLINE%20METRO\"]\n    \n    today = datetime.now()\n    date = today.strftime(\"%d-%m-%Y\")\n    month = today.strftime(\"%Y %B\")      \n    \n    #TO CREATE FOLDER FOR THE DAY\n    for folder in folderLocations:\n        body = None\n        head = { \"Content-Type\": \"application/json\", \"Authorization\": \"Bearer \" + accessToken}\n        url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/HR%20LEAVE%20REPORTS/'+ folder +'/'+month+':/children'\n        response = requests.post(url, json={\"name\": date,\"folder\": {},\"@microsoft.graph.conflictBehavior\": \"rename\"},  headers=head)"
  outputs:
    - response
  results:
    - SUCCESS
