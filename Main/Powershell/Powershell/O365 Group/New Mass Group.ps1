# Connect to the proper services
Connect-ExchangeOnline

# Import the CSV file
$csvFile = "C:\temp\Scripting\MassGroup.csv"
$csvData = Import-Csv $csvFile

# Iterate over each row in the CSV
foreach ($row in $csvData) {
    $GroupName = $row.GroupName
    $GroupUPN = $row.GroupPrimaryEmail
    $OwnerUPN = "jbehling@alianza.com"
    $SecondOwner = "noah.commenator@alianza.com"

    # Create the Group with a description
    New-UnifiedGroup -DisplayName $GroupName -Alias $GroupName -EmailAddresses $GroupUPN -Owner $OwnerUPN -AccessType Private

    # Turn off Welcome Email
    Set-UnifiedGroup -Identity $GroupName -UnifiedGroupWelcomeMessageEnabled:$false

    # Allow Users from outside the org to email this group
    Set-UnifiedGroup -Identity $GroupName -RequireSenderAuthenticationEnabled $false

    # Hide from GAL
    Set-UnifiedGroup -Identity $GroupName -HiddenFromAddressListsEnabled $true

    # Set AutoSubscribeNewMembers to True
    Set-UnifiedGroup -Identity $GroupName -AutoSubscribeNewMembers:$true

    #Add A second Owner
    Add-UnifiedGroupLinks -Identity $GroupName -LinkType "Members" -Links $SecondOwner
    Add-UnifiedGroupLinks -Identity $GroupName -LinkType "Owners" -Links $SecondOwner
}

# Optional: Pause to keep the window open (you can remove this if not needed)
Pause
