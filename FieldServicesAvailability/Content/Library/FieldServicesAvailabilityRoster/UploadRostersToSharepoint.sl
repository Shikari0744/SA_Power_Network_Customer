########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: FieldServicesAvailabilityRoster
operation:
  name: UploadRostersToSharepoint
  inputs:
    - accessToken
    - MetroRosterLocation:
        required: false
    - RegionalRosterLocation:
        required: false
  python_action:
    use_jython: false
    script: "def execute(accessToken,MetroRosterLocation,RegionalRosterLocation): \r\n    import requests\r\n    import time\r\n    \r\n    metroSubmitted = False\r\n    regionalSubmitted = False    \r\n    \r\n    if MetroRosterLocation != \"\"\r\n        #METRO UPLOAD - attempt upload to SharePoint site 3 times, if still a failure, upload to BSO leadership teams group     \r\n        for x in range(3):\r\n            body = open(MetroRosterLocation, 'rb').read()\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUouOJ8MRtcDQa3_DDbtsfzo/root:/23092019%20Metro%20Weekly%20Availability%20Roster%20with%20Print%20Button%20Sep%202019.xlsm:/content'\r\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n            response = requests.put(url, data=body, headers=head)\r\n            metroResponse = response.status_code\r\n            #\r\n            if metroResponse >= 200 and metroResponse < 300:\r\n                metroSubmitted = True\r\n                break\r\n            else:\r\n                time.sleep(10)\r\n            #\r\n        if metroSubmitted == True:\r\n            metroResponse = metroResponse\r\n        else:\r\n            body = open(MetroRosterLocation, 'rb').read()\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/WEEKLY%20AVAILABILITY%20ROSTER/23092019%20Metro%20Weekly%20Availability%20Roster%20with%20Print%20Button%20Sep%202019.xlsm:/content'\r\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n            response = requests.put(url, data=body, headers=head)    \r\n            metroResponse2 = response.status_code \r\n            #\r\n        if metroResponse2 >= 200 and metroResponse2 < 300:\r\n            metroResponse = \"Uploaded to BSO site: \" + str(metroResponse2)\r\n        else:\r\n            metroResponse = \"All upload attempts failed\"\r\n    \r\n    if RegionalRosterLocation != \"\":\r\n        #REGIONAL UPLOAD - attempt upload to SharePoint site 3 times, if still a failure, upload to BSO leadership teams group \r\n        for x in range(3):\r\n            body = open(RegionalRosterLocation, 'rb').read()\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUouOJ8MRtcDQa3_DDbtsfzo/root:/Regional%20Availability%20Roster_Macro.xlsm:/content'\r\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n            response = requests.put(url, data=body, headers=head)\r\n            regionalResponse = response.status_code\r\n            \r\n            if regionalResponse >= 200 and regionalResponse < 300:\r\n                regionalSubmitted = True\r\n                break\r\n            else:\r\n                time.sleep(10)\r\n            #\r\n        if regionalSubmitted == True:\r\n            regionalResponse = regionalResponse\r\n        else:\r\n            body = open(RegionalRosterLocation, 'rb').read()\r\n            url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/WEEKLY%20AVAILABILITY%20ROSTER/Regional%20Availability%20Roster_Macro.xlsm:/content'\r\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n            response = requests.put(url, data=body, headers=head)    \r\n            regionalResponse2 = response.status_code \r\n            #\r\n        if regionalResponse2 >= 200 and regionalResponse2 < 300:\r\n            regionalResponse = \"Uploaded to BSO site: \" + str(regionalResponse2)   \r\n        else:\r\n            regionalResponse = \"All upload attempts failed\"\r\n    \r\n    return{\"metroResponse\":metroResponse,\"regionalResponse\":regionalResponse}"
  outputs:
    - regionalResponse
    - metroResponse
  results:
    - SUCCESS
