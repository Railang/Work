$Alias = "salestrials@alianza.com"

# Search for the alias in distribution groups
$DistributionGroups = Get-DistributionGroup | Where-Object {$_.EmailAddresses -like "*$Alias*"}

# Search for the alias in mailboxes
$Mailboxes = Get-Mailbox | Where-Object {$_.EmailAddresses -like "*$Alias*"}

if ($DistributionGroups) {
    Write-Output "Alias '$Alias' is associated with the following distribution groups:"
    $DistributionGroups | Select-Object Name, PrimarySmtpAddress
    Write-Output ""
}

if ($Mailboxes) {
    Write-Output "Alias '$Alias' is associated with the following mailboxes:"
    $Mailboxes | Select-Object Name, PrimarySmtpAddress
    Write-Output ""
}

if (-not $DistributionGroups -and -not $Mailboxes) {
    Write-Output "No groups or mailboxes found with the alias '$Alias'."
}
