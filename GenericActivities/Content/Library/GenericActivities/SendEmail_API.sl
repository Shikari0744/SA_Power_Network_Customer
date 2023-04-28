namespace: GenericActivities
operation:
  name: SendEmail_API
  inputs:
    - accesstoken
  python_action:
    use_jython: false
    script: "def execute(accesstoken):\n    import requests\n    \n    url = \"https://graph.microsoft.com/v1.0/users/poleyardboltorders@sapowernetworks.com.au/sendMail\"\n    payload = \"{\\r\\n  \\\"message\\\": {\\r\\n    \\\"subject\\\": \\\"Test 123\\\",\\r\\n    \\\"body\\\": {\\r\\n      \\\"contentType\\\": \\\"Text\\\",\\r\\n      \\\"content\\\": \\\"Test email send from Postman\\\"\\r\\n    },\\r\\n    \\\"toRecipients\\\": [\\r\\n      {\\r\\n        \\\"emailAddress\\\": {\\r\\n          \\\"address\\\": \\\"jasminmayhaas18@gmail.com\\\"\\r\\n        }\\r\\n      }\\r\\n    ],\\r\\n    \\\"ccRecipients\\\": [\\r\\n      {\\r\\n        \\\"emailAddress\\\": {\\r\\n          \\\"address\\\": \\\"jasmin.haas@sapowernetworks.com.au\\\"\\r\\n        }\\r\\n      }\\r\\n    ]\\r\\n  },\\r\\n  \\\"saveToSentItems\\\": \\\"true\\\"\\r\\n}\"\n    headers = {\n      'Content-Type': 'application/json',\n      'SdkVersion': 'postman-graph/v1.0',\n      'Authorization': 'Bearer '+ accesstoken\n    }\n    \n    response = requests.request(\"POST\", url, headers=headers, data = payload)\n    \n    return{\"response\":response.status_code}"
  outputs:
    - response
  results:
    - SUCCESS
