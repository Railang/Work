#Parameters
$GroupName = "Team_Stretto"
$GroupUPN = "Team_Stretto@alianza.com"
$OwnerUPN = "jim.obrien@alianza.com"
$Description = "Description"

# Connect to the proper services
Connect-ExchangeOnline

# Create the Group
New-UnifiedGroup -DisplayName $GroupName -Alias $GroupName -EmailAddresses $GroupUPN -Owner $OwnerUPN -AccessType Private

# Turn off Welcome Email
Set-UnifiedGroup -Identity $groupName -UnifiedGroupWelcomeMessageEnable:$false

# Set AutoSubscribeNewMembers to True
Set-UnifiedGroup -Identity $groupName -AutoSubscribeNewMembers

#Import Members to office 365 group from CSV (GroupID|Member = SMTP)
Import-CSV "C:\temp\Scripting\GroupMembers.csv" | ForEach-Object {
    Add-UnifiedGroupLinks -Identity $GroupUPN -LinkType Members -Links $_.Member
    Write-host -f Green "Added Member '$($_.Member)' to Office 365 Group '$GroupUPN'"
}
Pause