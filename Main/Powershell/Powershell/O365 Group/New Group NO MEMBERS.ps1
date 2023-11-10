#Parameters
$GroupName = "Team_Voice_Plus"
$GroupUPN = "Team_Voice_Plus@alianza.com"
$OwnerUPN = "sa-alianza-it@alianza.com"
$Description = "Description"

# Connect to the proper services
Connect-ExchangeOnline

# Create the Group
New-UnifiedGroup -DisplayName $GroupName -Alias $GroupName -EmailAddresses $GroupUPN -Owner $OwnerUPN -AccessType Private

# Turn off Welcome Email
Set-UnifiedGroup -Identity $groupName -UnifiedGroupWelcomeMessageEnable:$false

# Set AutoSubscribeNewMembers to True
Set-UnifiedGroup -Identity $groupName -AutoSubscribeNewMembers
Pause