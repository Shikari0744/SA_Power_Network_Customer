namespace: GenericActivities
operation:
  name: SenPasswordGenerator
  inputs:
    - PwdLength
  python_action:
    use_jython: false
    script: "# do not remove the execute function \ndef execute(PwdLength): \n    # code goes here\n# you can add additional helper methods below.\n    import random, string\n    PwdLength = int(PwdLength)\n    password = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(PwdLength))\n    passwordSen = password\n    return{'passwordSen':passwordSen, 'password':password}"
  outputs:
    - passwordSen:
        sensitive: true
    - password
  results:
    - SUCCESS
