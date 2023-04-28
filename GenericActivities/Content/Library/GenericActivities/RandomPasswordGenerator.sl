namespace: GenericActivities
operation:
  name: RandomPasswordGenerator
  python_action:
    use_jython: false
    script: "def execute(): \n    import random, string\n    password = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits + string.punctuation) for _ in range(16))\n    passwordSen = password\n    return{\"password\":password, 'passwordSen':passwordSen}"
  outputs:
    - password:
        sensitive: false
    - passwordSen:
        sensitive: true
  results:
    - SUCCESS
