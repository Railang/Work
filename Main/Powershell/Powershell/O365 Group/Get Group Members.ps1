#Get Credentials to connect
$Cred = Get-Credential
 
#Connect to AzureAD
Connect-AzureAD -Credential $Cred
 
#Get the Group
$Group = Get-AzureADGroup -Filter "DisplayName eq 'DISPLAYNAME'"
 
#Get Group Members
Get-AzureADGroupMember -ObjectId $Group.ObjectId