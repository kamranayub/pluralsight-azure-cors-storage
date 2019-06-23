# Microsoft Azure Developer: Configuring CORS Access for Storage Pluralsight Course Materials

These materials are for the Pluralsight course **[Microsoft Azure Developer: Configuring CORS Access for Storage](http://bit.ly/PSAzureStorageCORS)**. The license is Apache 2.0. Static site image content is royalty free and available for any use through Pexels, see `blob-container-files/credits.txt`.

## Table of Contents

1. [Organization](#organization)
1. [Azure Storage Postman Collection](#postman)
1. [Errata](#errata)
1. [Updates](#updates)
1. [Troubleshooting](#troubleshooting)
1. [Additional Resources](#additional-resources)

## Organization

Course materials are organized by module number and clip descriptions. The `blob-container-files` are the files you can upload to your own Azure Storage account to demo with.

## Azure Storage Postman Collection

I've built a [Postman][getpostman] collection that contains some pre-request scripts that automatically generate the appropriate `Authorization` HTTP header with signature to sign requests.

To use the collection:

1. Download the JSON file under `Module 3\demo-azure-rest\Azure Storage REST API.postman_collection.json`
1. Open the Postman app
1. Click the orange "Import" button
1. Choose the file
1. Import it
1. Edit the new collection using the "..." menu
1. Go to the **Variables** tab
1. Fill in the variables for:
   - *azure_storage_account* - Your Azure Storage account name
   - *azure_storage_key* - Your secret Storage key

The rest of the variables will be filled in automatically.

You should now be able to take advantage of the Postman requests I've created for the REST API demo and to create other Azure Storage REST requests if you wish.

The Postman collection is open source and you can contribute to it: https://github.com/kamranayub/azure-storage-rest-postman

## Errata

*None yet*

Please report course issues using the [Issues](https://github.com/kamranayub/pluralsight-azure-cors-storage/issues) page or the Pluralsight discussion page.

## Updates

- **Jun 2019**
  - _Enhancement:_ Update content to use `Az` PowerShell module

- **Oct 2018**
  - Initial release 🎉

## Common Issues

### Creating the Demo Storage Account

The demo storage account used (`psazurestoragecors`) is a General Purpose v2 Storage Account, see [Quickstart: Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=portal).

You can then upload the contents of the `blob-container-files` folder to a blob container named `cors`. After that, you can follow along with the demos.

### Ensure you are on the right subscription for automation

To manage the storage account and other resources we create in the demos, you will need to ensure you have the right Azure Subscription set by default when running commands. You only need to do this if you have multiple subscriptions.

In Azure PowerShell SDK:

    Set-AzContext -SubscriptionId <Subscription ID>

In Azure CLI:

    az account set -s <Subscription ID>

### Ensure you have the correct Az and Azure.Storage PowerShell modules installed

If some commands are failing or you don't see what I'm showing during the course, you may have incorrect modules installed that are overwriting newer ones.

Execute the following commands:

```powershell
Get-Module -ListAvailable -Name Az -Refresh
Get-Module -ListAvailable -Name Azure.Storage -Refresh
```

**If you see more than one entry** for each module, it means you may have an old SDK installed. Remove all but the latest versions you installed when walking through the course demos.

### For Azure CLI, set your environment variables

For the Azure CLI demos, you will need to set the following storage account environment variables:

```sh
export AZURE_STORAGE_ACCOUNT=<storage account name>
export AZURE_STORAGE_KEY="<storage account key>"
```

Replace the values with actual values from your Azure account. Note the quotes (`"`) are important around the key as it may contain special characters.

## Additional Resources

### Azure Storage

- [Configure and Manage Azure Storage course][psazurestorage]
- [CORS Support in Azure Storage][azurecors]

[azurecors]: https://bit.ly/AzureStorageCORS
[psazurestorage]: https://app.pluralsight.com/library/courses/microsoft-azure-creating-configuring-storage-accounts/table-of-contents

### Tools and SDKs

- [Azure Tools and SDKs][azuretools]
- [Install Azure PowerShell][psinstall]
- [Azure.Storage PowerShell Docs][psstoragedocs]
- [Installing Azure CLI][cliinstall]
- [Microsoft REST API Browser][restbrowser]
- [Postman][getpostman]
- [Working With ARM Templates][armtemplates]

[azuretools]: https://azure.microsoft.com/en-us/tools/
[psinstall]: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps
[cliinstall]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest
[armtemplates]: https://bit.ly/azurermtemplates
[restbrowser]: https://bit.ly/azureapidocs
[getpostman]: https://getpostman.com/apps
[psstoragedocs]: https://docs.microsoft.com/en-us/powershell/module/azure.storage

### CORS

- [MDN Cors Overview][mdncors]

[mdncors]: https://bit.ly/mdncors
