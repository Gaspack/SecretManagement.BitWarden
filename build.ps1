[CmdletBinding()]
param (
    [Parameter()]
    [switch]
    $Test,

    [Parameter()]
    [switch]
    $Package,

    [Parameter()]
    [switch]
    $Publish
)

Push-Location $PSScriptRoot

if ($Test) {
    Invoke-Pester test
}

if ($Package) {
    $outDir = Join-Path 'out' 'SecretManagement.BitWarden'
    Remove-Item out -Recurse -Force -ErrorAction SilentlyContinue | Out-Null

    @(
        'SecretManagement.BitWarden.Extension'
        'SecretManagement.BitWarden.psd1'
        'LICENSE.txt'
        'README.md'
    ) | ForEach-Object {
        Copy-Item -Path $_ -Destination (Join-Path $outDir $_) -Force -Recurse
    }
}

if ($Publish) {
    Write-Host -ForegroundColor Green "Publishing module... here are the details:"
    $moduleData = Import-Module -Force ./out/SecretManagement.BitWarden -PassThru
    Write-Host "Version: $($moduleData.Version)"
    Write-Host "Prerelease: $($moduleData.PrivateData.PSData.Prerelease)"
    Write-Host -ForegroundColor Green "Here we go..."

    Publish-Module -Path ./out/SecretManagement.BitWarden -NuGetApiKey (Get-Secret -Name PowershellGalleryAPIKey)
}

Pop-Location