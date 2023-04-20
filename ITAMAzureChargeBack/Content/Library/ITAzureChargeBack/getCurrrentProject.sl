namespace: ITAzureChargeBack
operation:
  name: getCurrrentProject
  inputs:
    - activeProjects
    - email
    - firstName
    - lastName
    - sapCode
    - loopCount
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute(activeProjects, email, firstName, lastName, sapCode, loopCount):
          projects = activeProjects.split(', ')
          emails = email.split(', ')
          firstNames = firstName.split(', ')
          lastNames = lastName.split(', ')
          sapCodes = sapCode.split(', ')
          loopCount = int(loopCount)
          return{"currentProject":projects[loopCount], "currentEmail":emails[loopCount], "currentFirstName":firstNames[loopCount],"currentLastName":lastNames[loopCount],"currentSapCode":sapCodes[loopCount]}
  outputs:
    - currentProject
    - currentSapCode
    - currentFirstName
    - currentLastName
    - currentEmail
  results:
    - SUCCESS
