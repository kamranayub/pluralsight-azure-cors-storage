# First, retrieve the storage account
$StorageAccount = Get-AzStorageAccount `
    -Name psazurestoragecors `
    -ResourceGroupName psazurestoragecors

# Then, create an array representing our CORS rule objects.
# PowerShell is pretty lenient, we can use arrays for multi-values
# and strings for single values
$Rules = @(
    @{ 
        AllowedOrigins = @("http://localhost:5000");
        AllowedMethods = "GET";
        AllowedHeaders = "x-api-key";
        ExposedHeaders = @("x-ms-request-id", "x-ms-lease-status");        
        MaxAgeInSeconds = 10
    },
    @{ 
        AllowedOrigins = @("http://localhost:5001");
        AllowedMethods = @("GET", "HEAD");
        AllowedHeaders = "content-type";
        ExposedHeaders = "x-*";        
        MaxAgeInSeconds = 5
    },
    @{ 
        AllowedOrigins = @("http://localhost:5000", "http://localhost:5001");
        AllowedMethods = @("POST");
        AllowedHeaders = @("x-api-key", "x-app-*");
        ExposedHeaders = "*";        
        MaxAgeInSeconds = 5
    },
    @{ 
        AllowedOrigins = "*";
        AllowedMethods = "GET";
        AllowedHeaders = "*";
        ExposedHeaders = "*";        
        MaxAgeInSeconds = 30
    }
)

# Now, pass rules to cmdlet. In this example
# we are setting Blob service rules. Ensure
# we pass the StorageContext as well.
Set-AzureStorageCORSRule `
    -ServiceType Blob `
    -Context $StorageAccount.Context `
    -CorsRules $Rules
