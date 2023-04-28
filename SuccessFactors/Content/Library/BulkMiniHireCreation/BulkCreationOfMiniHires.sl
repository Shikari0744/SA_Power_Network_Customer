########################################################################################################################
#!!
#! @input url_sf: https://performancemanager10.successfactors.com/sf/home?saml2=disabled#/companyEntry
#! @input companyID: sapowernet
#!!#
########################################################################################################################
namespace: BulkMiniHireCreation
flow:
  name: BulkCreationOfMiniHires
  inputs:
    - user_sf
    - pass_sf:
        sensitive: true
    - location: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Bulk Mini Hires\\May 2022 Intake Mini Hire.xlsx"
    - url_sf: 'https://performancemanager10.successfactors.com/sf/home?saml2=disabled#/companyEntry'
    - companyID: sapowernet
    - robot: B601
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - SuccessFactorsLogin:
        robot_group: '${robot}'
        do:
          BulkMiniHireCreation.SuccessFactorsLogin:
            - url: '${url_sf}'
            - companyID: '${companyID}'
            - userID: '${user_sf}'
            - userPass: '${pass_sf}'
        navigate:
          - SUCCESS: BulkMiniHires
          - WARNING: BulkMiniHires
          - FAILURE: on_failure
    - BulkMiniHires:
        robot_group: '${robot}'
        do:
          BulkMiniHireCreation.BulkMiniHires:
            - miniHiresTrackingDocument: '${location}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - GetAccessToken_Teams:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('svcrpabotAPIuser')}"
            - Password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: DownloadFromTeams
    - GetAccessToken_Teams_1:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: '${location}'
            - Password:
                value: '${companyID}'
                sensitive: true
        navigate:
          - FAILURE: on_failure
          - SUCCESS: UploadToTeams
    - DownloadFromTeams:
        do:
          BulkMiniHireCreation.DownloadFromTeams:
            - accessToken: '${accessToken}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SuccessFactorsLogin
    - UploadToTeams:
        do:
          BulkMiniHireCreation.UploadToTeams:
            - accessToken: '${pass_sf}'
            - new_file: '${accessToken}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Kill_ProcessByName_1
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      SuccessFactorsLogin:
        x: 1000
        'y': 150
      BulkMiniHires:
        x: 1300
        'y': 150
      Kill_ProcessByName_1:
        x: 2200
        'y': 150
        navigate:
          ca796eb5-7994-d8e1-fcba-708e8de08ba6:
            targetId: bc027ab8-ae20-6607-83b0-45d3546768dd
            port: SUCCESS
          ecb75676-5d4c-2635-32a0-6e16e11a7daf:
            targetId: bc027ab8-ae20-6607-83b0-45d3546768dd
            port: WARNING
      GetAccessToken_Teams:
        x: 400
        'y': 150
      GetAccessToken_Teams_1:
        x: 1600
        'y': 150
      DownloadFromTeams:
        x: 700
        'y': 150
      UploadToTeams:
        x: 1900
        'y': 150
    results:
      SUCCESS:
        bc027ab8-ae20-6607-83b0-45d3546768dd:
          x: 2500
          'y': 150
