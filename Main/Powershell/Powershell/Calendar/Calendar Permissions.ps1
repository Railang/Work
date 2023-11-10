#   This is for getting, adding and setting calendar permissions for users through Powershell in O365. These are the commonly used commands by Ian.

#   Get Calendar permissions for each user
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\calendar') -User Default -AccessRights LimitedDetails}

#   Get Calendar permissions for a speicifc user
Get-MailboxFolderPermission -Identity User1@mail.com:\calendar

#   Get Spelling for the user's calendar (if their language is different than english)
get-mailboxfolderstatistics -identity user@domain.com | ft folderpath , folderandsub*

#   Add User2 to User1's calendar permissions exceptions
Add-MailboxFolderPermission -Identity user1@mail.com:\calendar -User user2@mail.com -AccessRights LimitedDetails

#   Set User2's permissions on User1's calendar permissions exceptions
Set-MailboxFolderPermission -Identity user1@mail.com:\calendar -User user2@mail.com -AccessRights LimitedDetails

#   Remove User2's permissions on User1's calendar permissions exceptions
Remove-MailboxFolderPermission -Identity user1@mail.com:\calendar -User user2@mail.com

#   Set Calendar permissions default for a specific user
Set-MailboxFolderPermission -Identity User1@mail.com:\calendar -User Default -AccessRights LimitedDetails

#   Available Calendar Permissions
#   Owner.  Allows read, create, modify and delete all items and folders. Also allows manage items permissions
#   PublishingEditor.  Allows read, create, modify and delete items/subfolders.
#   Editor.  Allows read, create, modify and delete items.
#   PublishingAuthor.  Allows read, create all items/subfolders. You can modify and delete only items you create.
#   Author.  Allows create and read items; edit and delete own items.
#   NonEditingAuthor.  Allows full read access and create items. You can delete only your own items.
#   Reviewer.  Read only.
#   Contributor.  Allows create items and folders.
#   AvailabilityOnly.  Allows read free/busy information from calendar
#   LimitedDetails.  Allows view of the subject and location.
#   None.  No permissions to access folder and files

#   Scripts used at Alianza

#   Adding and Setting permissions for the confrence room calendars.
Add-MailboxFolderPermission -Identity edison@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity lakeview@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity northside@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity southside@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity morse@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity jackson@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity croak@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Add-MailboxFolderPermission -Identity lamarr@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails

Set-MailboxFolderPermission -Identity edison@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity lakeview@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity northside@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity southside@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity morse@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity jackson@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity croak@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity lamarr@alianza.com:\calendar -User ashley.gruendell@alianza.com -AccessRights LimitedDetails

# Default Calendar Permissions Set

foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\calendar') -User Default -AccessRights LimitedDetails}
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\Calendário') -User Default -AccessRights LimitedDetails}
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\Календарь') -User Default -AccessRights LimitedDetails}
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\Календар') -User Default -AccessRights LimitedDetails}
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {Set-MailboxFolderPermission -Identity ($user.alias+':\Kalendar') -User Default -AccessRights LimitedDetails}

#   Known different language user scripts for Calendar permissions

#   Russian 1
Set-MailboxFolderPermission -Identity anton.nakonechnyi:\Календар -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity sergii.sibirtsev:\Календар -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity andrew.kolos:\Календар -User Default -AccessRights LimitedDetails

#   Russian 2
Set-MailboxFolderPermission -Identity mykhailo.sych:\Календарь -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity oleksandr.kravets:\Календарь -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity mykyta.lebid:\Календарь -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity vitaliy.kravchenko:\Календарь -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity maxim.boykin:\Календарь -User Default -AccessRights LimitedDetails

#   Portuguese
Set-MailboxFolderPermission -Identity carla.firmino:\Calendário -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity jose.pinto:\Calendário -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity daniel.lima:\Calendário -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity vitor.shinohara:\Calendário -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity luis.palma:\Calendário -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity mariana.arduini:\Calendário -User Default -AccessRights LimitedDetails

#   Malay
Set-MailboxFolderPermission -Identity stanislava.veselinovic:\Kalendar -User Default -AccessRights LimitedDetails
Set-MailboxFolderPermission -Identity vukasin.petrovic:\Kalendar -User Default -AccessRights LimitedDetails

Set-MailboxFolderPermission -Identity alianza-brazil-socials@alianza.com:\calendar -User Default -AccessRights Author
Set-MailboxFolderPermission -Identity alianza-canada-socials@alianza.com:\calendar -User Default -AccessRights Author
Set-MailboxFolderPermission -Identity alianza-global-socials@alianza.com:\calendar -User Default -AccessRights Author
Set-MailboxFolderPermission -Identity alianza-serbia-socials@alianza.com:\calendar -User Default -AccessRights Author