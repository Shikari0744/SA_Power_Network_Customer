########################################################################################################################
#!!
#! @result NOACTION: skip
#! @result NOPAGEUP: no pageup extraction, myhr ticket still required
#!!#
########################################################################################################################
namespace: HREmployeeFileSubmission
operation:
  name: GetEmailInfo
  inputs:
    - subject
  python_action:
    use_jython: false
    script: |-
      def execute(subject):
          employeeID = ""
          lastName = ""
          firstName = ""
          actionType = ""
          pageUpNumber = ""
          processDate = ""
          if "G&B" in subject or "Secondment Letter" in subject or "Internal Appointment" in subject or "Term Renewal" in subject or "SecondmentExtension" in subject or "Reclassification" in subject:
              temp1 = subject.split("_")
              if len(temp1) == 6:
                  employeeID = temp1[0]
                  lastName = temp1[1]
                  firstName = temp1[2]
                  actionType = temp1[3]
                  pageUpNumber = temp1[4]
                  temp2 = temp1[5]
                  temp3 = temp2.split(" ")
                  processDate = temp3[0]
              else:
                  employeeID = temp1[0]
                  lastName = temp1[1]
                  firstName = temp1[2]
                  actionType = temp1[3]
                  temp2 = temp1[4]
                  temp3 = temp2.split(" ")
                  processDate = temp3[0]
          elif "Perm Contract" in subject or "Supp to Perm" in subject or "TermOffer" in subject or "Apprentice" in subject or "Term Contract" in subject:
              temp1 = subject.split("_")
              if len(temp1) == 5:
                  employeeID = ""
                  lastName = temp1[0]
                  firstName = temp1[1]
                  actionType = temp1[2]
                  pageUpNumber = temp1[3]
                  temp2 = temp1[4]
                  temp3 = temp2.split(" ")
                  processDate = temp3[0]
              else:
                  employeeID = ""
                  lastName = temp1[0]
                  firstName = temp1[1]
                  actionType = temp1[2]
                  temp2 = temp1[3]
                  temp3 = temp2.split(" ")
                  processDate = temp3[0]
          else:
              pageUpNumber = "do not process"

          return{"employeeID":employeeID,"lastName":lastName,"firstName":firstName,"actionType":actionType,"pageUpNumber":pageUpNumber,"processDate":processDate}
  outputs:
    - employeeID
    - lastName
    - firstName
    - actionType
    - pageUpNumber
    - processDate
  results:
    - NOACTION: '${pageUpNumber == "do not process"}'
      CUSTOM_0: '${pageUpNumber == "do not process"}'
    - NOPAGEUP: '${pageUpNumber == ""}'
    - SUCCESS
