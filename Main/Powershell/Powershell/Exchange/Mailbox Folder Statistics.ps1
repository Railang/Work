#   Gives information on the folders and oflder information on a user's mailbox.
Get-EXOMailboxFolderStatistics -identity user@domain.com | ft folderpath , folderandsub*