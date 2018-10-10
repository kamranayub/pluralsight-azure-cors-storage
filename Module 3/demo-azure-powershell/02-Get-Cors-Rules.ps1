# First, retrieve the storage account
$StorageAccount = Get-AzureRmStorageAccount `
    -Name psazurestoragecors `
    -ResourceGroupName psazurestoragecors

# Then, list CORS rules for Blob service, if any,
# passing the previous storage context
$Cors = Get-AzureStorageCORSRule `
    -ServiceType Blob `
    -Context $StorageAccount.Context

# Finally, format as a table (aka `ft`)
$Cors | Format-Table
