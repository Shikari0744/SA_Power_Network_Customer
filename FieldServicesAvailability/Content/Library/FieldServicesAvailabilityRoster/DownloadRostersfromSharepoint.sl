namespace: FieldServicesAvailabilityRoster
operation:
  name: DownloadRostersfromSharepoint
  inputs:
    - accessToken
    - downloadFolder
    - RegionalRosterName: Regional Availability Roster_Macro.xlsm
    - MetroRosterName: 23092019 Metro Weekly Availability Roster with Print Button Sep 2019.xlsm
    - EnervenListName: 'Enerven & Crane Employee List.xlsx'
  python_action:
    use_jython: false
    script: "def execute(accessToken,RegionalRosterName,MetroRosterName,EnervenListName,downloadFolder): \r\n    import requests\r\n    \r\n    #DOWNLOAD METRO ROSTER\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUouOJ8MRtcDQa3_DDbtsfzo/root:/23092019%20Metro%20Weekly%20Availability%20Roster%20with%20Print%20Button%20Sep%202019.xlsm:/content'\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    metroResponse = response.status_code\r\n\r\n    metroRosterLocation = downloadFolder + MetroRosterName\r\n    with open(metroRosterLocation, 'wb') as f:\r\n        f.write(response.content)\r\n    #download a copy to an Archive folder\r\n    metroRosterLocationArch = downloadFolder + \"Archive/\" + MetroRosterName\r\n    with open(metroRosterLocationArch, 'wb') as f:\r\n        f.write(response.content)\r\n       \r\n    #DOWNLOAD REGIONAL ROSTER \r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUouOJ8MRtcDQa3_DDbtsfzo/root:/Regional%20Availability%20Roster_Macro.xlsm:/content'\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    regionalResponse = response.status_code\r\n\r\n    regionalRosterLocation = downloadFolder + RegionalRosterName\r\n    with open(regionalRosterLocation, 'wb') as f:\r\n        f.write(response.content)\r\n    #download a copy to an Archive folder\r\n    regionalRosterLocationArch = downloadFolder + \"Archive/\" + RegionalRosterName\r\n    with open(regionalRosterLocationArch, 'wb') as f:\r\n        f.write(response.content)\r\n    \r\n    #DOWNLOAD EMPLOYEE LIST\r\n    url = 'https://graph.microsoft.com/v1.0/drives/b!pIaNaQC66EODn3_pR5ehHB4SxLv8qcFKnqTEzT3mIUqFVwPxFsHFSLeN7k0ppl5q/root:/Enerven%20%26%20Crane%20Employee%20List/Enerven%20%26%20Crane%20Employee%20List.xlsx:/content'\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    enervenResponse = response.status_code\r\n\r\n    enervenListLocation = downloadFolder + EnervenListName\r\n    with open(enervenListLocation, 'wb') as f:\r\n        f.write(response.content)\r\n        \r\n    return {\"enervenResponse\":enervenResponse,\"metroResponse\":metroResponse,\"regionalResponse\":regionalResponse,\"enervenListLocation\":enervenListLocation,\"metroRosterLocation\":metroRosterLocation,\"regionalRosterLocation\":regionalRosterLocation}"
  outputs:
    - enervenResponse
    - enervenListLocation
    - metroResponse
    - metroRosterLocation
    - regionalResponse
    - regionalRosterLocation
  results:
    - SUCCESS
