namespace: AEMOSnapshots
operation:
  name: SendLogResults
  inputs:
    - to
    - attachments
  python_action:
    use_jython: false
    script: "def execute(to,attachments):\r\n    global pd, date, timedelta, wincom32Client, os, root\r\n    import win32com.client as wincom32Client\r\n    import os\r\n    from datetime import date, timedelta\r\n    import pandas as pd\r\n\r\n    subject = \"AEMO Snapshots - Oracle Upload Results\"\r\n    body = \"Hi,<br><br>Please find attached the results from the Oracle uploads.<br><br>Thanks,<br>IT Automation Team<br><br>\"\r\n    \r\n    sendEmail(to, subject, body, attachments)\r\n\r\ndef sendEmail(to, subject, HTMLbody, files):\r\n\t\r\n    iConf = wincom32Client.Dispatch(\"CDO.Configuration\")\r\n    Flds = iConf.Fields\r\n    Flds(\"http://schemas.microsoft.com/cdo/configuration/smtpserver\").Value = \"emanager\"\r\n    Flds(\"http://schemas.microsoft.com/cdo/configuration/smtpserverport\").Value = 25\r\n    Flds(\"http://schemas.microsoft.com/cdo/configuration/sendusing\").Value = 2\r\n    Flds('http://schemas.microsoft.com/cdo/configuration/smtpauthenticate').Value = 0\r\n    Flds.Update()\r\n    emailAddresses = to.split(\",\")\r\n    iMsg = wincom32Client.Dispatch(\"CDO.Message\")\r\n    iMsg.Configuration = iConf\r\n    iMsg.To = \";\".join(emailAddresses)\r\n    iMsg.From = \"Process_Automation@sapowernetworks.com.au\"\r\n    iMsg.Subject = subject\r\n    iMsg.HTMLBody = HTMLbody\r\n    files = files.split(\",\")\r\n    for file in files:\r\n        iMsg.AddAttachment(file)\r\n    iMsg.Send()"
  results:
    - SUCCESS
