
#Parameters
$GroupName = "testforscript"
$GroupUPN = "testforscript@alianza.com"
$DefaultUser = "ian.neil@alianza.com"
$OwnerUPN = "jason.simpson@alianza.com"

# Connect to the proper services
Connect-MgGraph -ClientId "016858c2-6835-41af-9a6e-889e3bced179" -TenantId "953b1fa2-3955-4e8a-b2e8-77ee05d4700a" -CertificateThumbprint B6F7B03D36DAE66CF324B21463E2A81097E72A4A

# Create the Group
New-UnifiedGroup -DisplayName $GroupName -Alias $GroupName -EmailAddresses $GroupUPN -Owner $OwnerUPN -AccessType Private

# Turn off Welcome Email
Set-UnifiedGroup -Identity $GroupName -UnifiedGroupWelcomeMessageEnable:$false

# Set AutoSubscribeNewMembers to True
Set-UnifiedGroup -Identity $GroupName -AutoSubscribeNewMembers

# Import Members to Office 365 group from CSV (GroupID|Member = SMTP)
Import-CSV "C:\temp\Scripting\GroupMembers.csv" | ForEach-Object {
    $member = $_.Member
    $groupMembers = Get-UnifiedGroupMembers -Identity $GroupUPN

    # Check if the member is already a part of the group
    if ($groupMembers.SmtpAddress -notcontains $member) {
        # Add member to the group
        Add-UnifiedGroupLinks -Identity $GroupUPN -LinkType Members -Links $member
        Write-Host -ForegroundColor Green "Added Member '$member' to Office 365 Group '$GroupUPN'"
    }
}



$params = @{
	description = "blank"
	displayName = "$GroupName"
	groupTypes = @(
		"Unified"
	)
	mailEnabled = $true
	mailNickname = "$GroupName"
	securityEnabled = $false
	visibility = "Private"
	"owners@odata.bind" = @(
		"https://graph.microsoft.com/v1.0/users/9a926640-8b47-47fb-bf3e-17d28dade132"
	)
}

$params = @{
	proxyAddresses = @("SMTP:$GroupUPN")
	isFavoriteByDefault = $true
	isSubscribedByMail = $true
}