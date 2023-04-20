namespace: GenericActivities
operation:
  name: UploadToTeams
  inputs:
    - accessToken
    - new_file
  python_action:
    use_jython: false
    script: "#for teams\ndef execute(accessToken, new_file): \n    import requests\n    import os.path\n    import urllib.parse\n    import os\n    from os import path\n    from msal import PublicClientApplication\n    from os import listdir\n    import datetime\n    import shutil\n\n    filePath = \"C:/Temp/23092019 Metro Weekly Availability Roster with Print Button Sep 2019 - RPA.xlsm\"\n    \n    # read file into binary\n    body = open(filePath, 'rb').read()\n    #url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUouOJ8MRtcDQa3_DDbtsfzo/root:/23092019%20Metro%20Weekly%20Availability%20Roster%20with%20Print%20Button%20Sep%202019.xlsm:/content'\n    url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/WEEKLY%20AVAILABILITY%20ROSTER/23092019%20Metro%20Weekly%20Availability%20Roster%20with%20Print%20Button%20Sep%202019 - RPA.xlsm:/content'\n\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n    response = requests.put(url, data=body, headers=head)\n    \n    if response.status_code >= 200 and response.status_code < 300:\n     \tsuccessfulResult = response.reason\n     \tfailureResult = \"\"\n    else:\n        successfulResult = \"\"\n        failureResult = response.reason\n    \n    return{\"successfulResult\":successfulResult,\"failureResult\":failureResult}"
  outputs:
    - successfulResult
    - failureResult
  results:
    - FAILURE: '${failureResult != ""}'
    - SUCCESS
