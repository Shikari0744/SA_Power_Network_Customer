########################################################################################################################
#!!
#! @result CUSTOM: if allSubjects is blank, no excel file was created
#!!#
########################################################################################################################
namespace: HREmployeeFileSubmission
operation:
  name: GetDataLine
  inputs:
    - filename
  python_action:
    use_jython: false
    script: "def execute(filename):\n    import os\n    from openpyxl import load_workbook\n    \n    allSubjects = \"\"\n    \n    if os.path.exists(filename):\n        workbook = load_workbook(filename=filename,read_only=False)\n        worksheet = workbook.active\n        rowcount = worksheet.max_row + 1\n        \n        for row in range(1,rowcount):\n            check = worksheet[\"A\"+str(row)].value\n            if check != \"SubjectLine\":\n                tempSubject = worksheet[\"A\"+str(row)].value\n                subject, temp = tempSubject.split(\"between SA Power Networks\")\n                if \",\" in subject:\n                    subject = subject.replace(\", \",\"_\")                \n                allSubjects = subject + \",\" + allSubjects\n        workbook.close()\n        \n    return{\"allSubjects\":allSubjects}"
  outputs:
    - allSubjects
  results:
    - CUSTOM: '${allSubjects == ""}'
    - SUCCESS
