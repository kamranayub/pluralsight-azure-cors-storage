if (!(Test-Path .\.materials)) {
    mkdir .\.materials
}

$CommonPaths = @(
    ".\blob-container-files",
    ".\LICENSE",
    ".\README.md"
)

# Module 2
Compress-Archive -DestinationPath .\.materials\Module-3.zip -Update -Path ($CommonPaths + @(
    ".\Module 2"
))

# Module 2
Compress-Archive -DestinationPath .\.materials\Module-4.zip -Update -Path ($CommonPaths + @(
    ".\Module 2"
))