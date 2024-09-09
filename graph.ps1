#Find-MgGraphCommand -command Get-MgUser | Select-Object -First 1 -ExpandProperty Permissions
    #Connect-MgGraph -Scopes "User.ReadWrite.All","User.Read.All","Group.ReadWrite.All","Mail.Read","Mail.ReadWrite"
    #Get-MgUser -Filter "displayName eq 'David Heinz'"
#'8816a8f1-ac20-4adb-9776-836f0d98ded1'
    #Get-MgUserJoinedTeam -UserID 8816a8f1-ac20-4adb-9776-836f0d98ded1
# IT Security Team ID 90ecfbe0-62f9-435c-a4f8-439640c0b236
    #Get-MgTeamChannel -TeamId 90ecfbe0-62f9-435c-a4f8-439640c0b236
# Channel ID 19:Lrwfnl6QUdFaLwunkfd8JQ4EbDhB0sYNbW0HlDqBFfM1@thread.tacv2
    #New-MgTeamChannelMessage -TeamId 90ecfbe0-62f9-435c-a4f8-439640c0b236 -ChannelId 19:Lrwfnl6QUdFaLwunkfd8JQ4EbDhB0sYNbW0HlDqBFfM1@thread.tacv2 -Body @{ Content="Hello World" }


###### MAIL WORK ########

### Connect to Graph, with the following permissions: User.ReadWrite.All, User.Read.All, Group.ReadWrite.All, Mail.Read, Mail.ReadWrite
Connect-MgGraph -Scopes "User.ReadWrite.All","User.Read.All","Group.ReadWrite.All","Mail.Read","Mail.ReadWrite"

## Identify the userid of the mailbox you want to search
$User = Get-MgUser -Filter "displayName eq 'Mario Marcone'" | Format-List Id
write-output $User
Start-Sleep -Seconds 5
Import-Module Microsoft.Graph.Mail # To work on Mail Accounts
$userId = '8816a8f1-ac20-4adb-9776-836f0d98ded1'
#$userId = 'a250734e-9f95-4aa9-b61e-3f881961e913'
Get-MgUserMessage -UserId $userId -Filter "from/emailAddress/address eq 'bdriver@riolasvegas.com'" -Select "subject,from,receivedDateTime,isRead" -Top 20

#GET https://graph.microsoft.com/v1.0/users/{8816a8f1-ac20-4adb-9776-836f0d98ded1}/messages?$filter=from/emailAddress/address eq 'xxx@xxxx.com'&$select=subject,from,receivedDateTime,isRead&$top=1


