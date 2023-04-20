namespace: GenericActivities
operation:
  name: SendEmail_EmbeddedImage
  inputs:
  - recepient
  - subject
  - body
  - attachment
  - image
  sequential_action:
    gav: com.microfocus.seq:GenericActivities.SendEmail_EmbeddedImage:1.0.0
    skills:
    - Java
    - SAP NWBC Desktop
    - SAP
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Terminal Emulators
    - UI Automation
    - Web
    - WPF
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: false
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
    - step:
        id: '1'
        action: Script
        object_path: lastMonth = MonthName(Month(Date()) -1)
    - step:
        id: '2'
        action: Script
        object_path: currentMonth = MonthName(Month(Date()))
    - step:
        id: '3'
        action: Script
        object_path: Const PR_ATTACH_MIME_TAG = "http://schemas.microsoft.com/mapi/proptag/0x370E001E"
    - step:
        id: '4'
        action: Script
        object_path: Const PR_ATTACH_CONTENT_ID = "http://schemas.microsoft.com/mapi/proptag/0x3712001E"
    - step:
        id: '5'
        action: Script
        object_path: Const PR_ATTACHMENT_HIDDEN = "http://schemas.microsoft.com/mapi/proptag/0x7FFE000B"
    - step:
        id: '6'
        action: Script
        object_path: Dim ToAddress
    - step:
        id: '7'
        action: Script
        object_path: Dim FromAddress
    - step:
        id: '8'
        action: Script
        object_path: Dim MessageSubject
    - step:
        id: '9'
        action: Script
        object_path: Dim MyTime
    - step:
        id: '10'
        action: Script
        object_path: Dim MessageBody
    - step:
        id: '11'
        action: Script
        object_path: Dim MessageAttachment
    - step:
        id: '12'
        action: Script
        object_path: Dim ol, ns, newMail
    - step:
        id: '13'
        action: Script
        object_path: Dim realAttachment
    - step:
        id: '14'
        action: Script
        object_path: MyTime = Now
    - step:
        id: '15'
        action: Script
        object_path: ToAddress = Parameter("recepient")
    - step:
        id: '16'
        action: Script
        object_path: MessageSubject = Parameter("subject")
    - step:
        id: '17'
        action: Script
        object_path: MessageBody = Parameter("body")
    - step:
        id: '18'
        action: Script
        object_path: MessageAttachment = Parameter("attachment")
    - step:
        id: '19'
        action: Script
        object_path: MessageImage = Parameter("image")
    - step:
        id: '20'
        action: Script
        object_path: Set ns = Outlook.GetNamespace("MAPI")
    - step:
        id: '21'
        action: Script
        object_path: Set newMail = Outlook.CreateItem(olMailItem)
    - step:
        id: '22'
        object_path: newMail
        action: Subject
        args: = MessageSubject
    - step:
        id: '23'
        object_path: newMail
        action: Body
        args: = MessageBody
    - step:
        id: '24'
        object_path: newMail.Recipients
        action: Add
        args: (ToAddress)
    - step:
        id: '25'
        action: Script
        object_path: '''embedded'
    - step:
        id: '26'
        action: Script
        object_path: Set realAttachment = newMail.Attachments.Add(MessageImage)
    - step:
        id: '27'
        action: Script
        object_path: '''attached'
    - step:
        id: '28'
        object_path: newMail.Attachments
        action: Add(MessageAttachment)
    - step:
        id: '29'
        action: Script
        object_path: Set oPA = realAttachment.PropertyAccessor
    - step:
        id: '30'
        object_path: oPA
        action: SetProperty
        args: PR_ATTACH_MIME_TAG, "image/jpeg"
    - step:
        id: '31'
        object_path: oPA
        action: SetProperty
        args: PR_ATTACH_CONTENT_ID, "myident"
    - step:
        id: '32'
        object_path: newMail.HTMLBody = newMail
        action: HTMLBody
        args: '& "<IMG align=baseline border=0 hspace=0 src=cid:myident>"'
    - step:
        id: '33'
        object_path: newMail
        action: Send
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
