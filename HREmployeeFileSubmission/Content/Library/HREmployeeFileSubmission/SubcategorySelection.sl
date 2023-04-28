namespace: HREmployeeFileSubmission
operation:
  name: SubcategorySelection
  inputs:
    - actionType
  python_action:
    use_jython: false
    script: "def execute(actionType):\n    \n    if \"Internal Appointment\" in actionType or \"Term Renewal\" in actionType:\n        subcategory = \"Internal Appointment\"    \n    elif \"Perm Contract\" in actionType or \"Supp to Term\" in actionType or \"TermOffer\" in actionType or \"New Employee\" in actionType or \"Apprentice\" in actionType:\n        subcategory = \"New Starter\"\n    #elif \"\" in actionType:\n    #    subcategory = \"Contract Extension\"        \n    elif \"Reclassification\" in actionType:\n        subcategory = \"Reclassification\"        \n    elif \"Secondment\" in actionType:\n        subcategory = \"Secondment\"\n    #elif \"\" in actionType:\n    #    subcategory = \"THCH\"\n    elif \"G&B\" in actionType:\n        subcategory = \"Other\"\n    else:\n        subcategory = \"Other\"\n    \n    return{\"subcategory\":subcategory}"
  outputs:
    - subcategory
  results:
    - SUCCESS
