Connect-ExchangeOnline
#PowerShell to Import Members to office 365 group from CSV (GroupID|Member = SMTP)
Import-CSV "C:\temp\Scripting\GroupMembers.csv" | ForEach-Object {
    Add-UnifiedGroupLinks -Identity $_.GroupID -LinkType Members -Links $_.Member
    Write-host -f Green "Added Member '$($_.Member)' to Office 365 Group '$($_.GroupID)'"
}
Pause