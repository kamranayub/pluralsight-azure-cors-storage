# First, retrieve the storage account
$StorageAccount = Get-AzStorageAccount `
    -Name psazurestoragecors `
    -ResourceGroupName psazurestoragecors

# Then, remove CORS rules for the specified
# service type. This removes ALL rules.
Remove-AzStorageCORSRule `
    -ServiceType Blob `
    -Context $StorageAccount.Context

# To remove only a specific rule, we'd need to
# get the CORS rules, then filter out the ones to delete,
# then use the Set-AzStorageCORSRule cmdlet again with the
# manipulated list.
