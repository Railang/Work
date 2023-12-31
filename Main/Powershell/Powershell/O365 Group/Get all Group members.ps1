Connect-ExchangeOnline
$Groups = Get-UnifiedGroup -ResultSize Unlimited
$Groups | ForEach-Object {
$group = $_
Get-UnifiedGroupLinks -Identity $group.Name -LinkType Members -ResultSize Unlimited | ForEach-Object {
      New-Object -TypeName PSObject -Property @{
       Group = $group.DisplayName
       GroupEmail = $group.PrimarySmtpAddress
       Member = $_.Name
       EmailAddress = $_.PrimarySMTPAddress
       RecipientType= $_.RecipientType
}}} | Export-CSV "C:\Main\Office365GroupMembers.csv" -NoTypeInformation -Encoding UTF8