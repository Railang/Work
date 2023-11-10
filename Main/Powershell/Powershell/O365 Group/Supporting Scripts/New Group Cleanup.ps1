Connect-ExchangeOnline
# Name of the Microsoft 365 Group
$groupName = "corp-marketing-revops"
# Turn off Welcome Email
Set-UnifiedGroup -Identity $groupName -UnifiedGroupWelcomeMessageEnable:$false
# Set AutoSubscribeNewMembers to True
Set-UnifiedGroup -Identity $groupName -AutoSubscribeNewMembers
# Subscribe all current members to emails
$groupMembers = Get-UnifiedGroupLinks -Identity $groupName -LinkType Members
foreach ($member in $groupMembers) {
    Add-UnifiedGroupLinks -Identity $groupName -LinkType Subscribers -Links $member.PrimarySmtpAddress
}