Write-Host " ---------------------------------------------- "
Import-Module SharePointPnPPowerShellOnline
Write-Host " ---------------------------------------------- "

#Config Variables
$SiteURL = "https://alianza1.sharepoint.com/Shared%20Documents/Forms/AllItems.aspx"
$ListTitle = "AZ_Legal"

$foldertoscope = "/Shared Document/AZ_Legal/AZ_Legal_Partner Contracts/1. UNDER NEGOTIATION/10T Solutions"

#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin

$ctx = Get-PnPContext

  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  ## View XML
$qCommand = @"
<View Scope="RecursiveAll">
    <Query>
        <OrderBy><FieldRef Name='ID' Ascending='TRUE'/></OrderBy>
    </Query>
    <RowLimit Paged="TRUE">5000</RowLimit>
</View>
"@
## Page Position
$position = $null
 
## All Items
$allItems = @()
Do{
    $camlQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
    $camlQuery.ListItemCollectionPosition = $position
    $camlQuery.ViewXml = $qCommand
 ## Executing the query
    $currentCollection = $ll.GetItems($camlQuery)
    $ctx.Load($currentCollection)
    $ctx.ExecuteQuery()
 
 ## Getting the position of the previous page
    $position = $currentCollection.ListItemCollectionPosition
 
 # Adding current collection to the allItems collection
    $allItems += $currentCollection

     Write-Host "Collecting items. Current number of items: " $allItems.Count
}
while($position -ne $null)

Write-Host "Total number of items: " $allItems.Count

for($j=0;$j -lt $allItems.Count ;$j++)
{
    if($allItems[$j]["FileRef"].StartsWith($foldertoscope))
    {
        Write-Host "Resetting permissions for " $allItems[$j]["Title"] ".." $allItems[$j]["FileRef"]
        $allItems[$j].ResetRoleInheritance()
        $ctx.ExecuteQuery()
    }
}