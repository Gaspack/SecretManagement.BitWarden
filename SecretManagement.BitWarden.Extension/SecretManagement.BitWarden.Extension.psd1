@{
    ModuleVersion = '0.1.0'
    RootModule = 'SecretManagement.BitWarden.Extension.psm1'
    FunctionsToExport = @('Set-Secret','Get-Secret','Remove-Secret','Get-SecretInfo','Test-SecretVault','Unlock-BWSession','Get-SecretTemplate')
}
