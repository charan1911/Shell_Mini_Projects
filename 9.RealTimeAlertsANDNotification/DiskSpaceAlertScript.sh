#!/bin/bash

powershell.exe -Command "
Import-Module BurntToast -ErrorAction SilentlyContinue

# Desktop notification
New-BurntToastNotification -Text 'Hello Charan','Your SMP script just ran successfully'

# Email details
\$From='gummadicharan37@gmail.com'
\$To='gummadiicharann37@gmail.com'
\$Subject='SMP content test Email'
\$Body='Hello Charan, your SMP script just ran successfully.'
\$SMTP='smtp.gmail.com'

# Gmail App Password credentials
\$Cred = New-Object System.Management.Automation.PSCredential(
  'gummadicharan37@gmail.com',
  (ConvertTo-SecureString 'kbgmywzqtvpfbfoj' -AsPlainText -Force)
)

# Send email (NO backticks)
Send-MailMessage -From \$From -To \$To -Subject \$Subject -Body \$Body -SmtpServer \$SMTP -Port 587 -UseSsl -Credential \$Cred
"

