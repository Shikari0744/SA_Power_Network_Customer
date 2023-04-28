namespace: PortfolioInsightsReport
operation:
  name: DownloadMilestoneFile
  inputs:
    - filepath
    - accesstoken
  python_action:
    use_jython: false
    script: |-
      def execute(filepath,accesstoken):
          import requests
          import json

          url = 'https://graph.microsoft.com/v1.0/drives/b!BT6H_au50U6Pn9MJvsBiGPVO5H_QO2VAvBTB9S7j-BAIgyA2t4CBQ6zsWbCAZV7x/root:/General/Primavera Milestone Analysis:/children'
          body = None
          head = { "Authorization": "Bearer " + accesstoken}
          response = requests.get(url, data=body, headers=head)
          if response.status_code >= 200 and response.status_code < 300:
              json_data = json.loads(response.text)
              for x in json_data['value']:
                  filename = x['name']
                  if filename == "Milestone Analysis.xlsx":
                      url = 'https://graph.microsoft.com/v1.0/drives/b!BT6H_au50U6Pn9MJvsBiGPVO5H_QO2VAvBTB9S7j-BAIgyA2t4CBQ6zsWbCAZV7x/root:/General/Primavera Milestone Analysis/'+ filename +':/content'
                      body = None
                      head = {"Authorization": "Bearer " + accesstoken}
                      response = requests.get(url, data=body, headers=head)
                      if response.status_code >= 200 and response.status_code < 300:
                          with open(filepath + filename, 'wb') as f:
                              f.write(response.content)
                          return{"completepath":filepath + filename}
  outputs:
    - completepath
  results:
    - SUCCESS
