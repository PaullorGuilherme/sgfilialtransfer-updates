param(
    [Parameter(Mandatory = $true)]
    [string]$BaseUrl,

    [string]$Version = "1.0.3",

    [string]$InstallerPath = "..\instalador\SGFilialTransfer_Instalador.exe",

    [string]$InstallerUrl = ""
)

$ErrorActionPreference = "Stop"

$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$releaseDir = Join-Path $repoDir "releases"
$installerName = "SGFilialTransfer_Instalador.exe"
$targetInstaller = Join-Path $releaseDir $installerName
if (![System.IO.Path]::IsPathRooted($InstallerPath)) {
    $InstallerPath = Join-Path $repoDir $InstallerPath
}

New-Item -ItemType Directory -Path $releaseDir -Force | Out-Null
Copy-Item -LiteralPath $InstallerPath -Destination $targetInstaller -Force

$hash = (Get-FileHash -LiteralPath $targetInstaller -Algorithm SHA256).Hash
$normalizedBaseUrl = $BaseUrl.TrimEnd("/")
if ([string]::IsNullOrWhiteSpace($InstallerUrl)) {
    $InstallerUrl = "$normalizedBaseUrl/releases/$installerName"
}

$manifest = [ordered]@{
    version = $Version
    installerUrl = $InstallerUrl
    sha256 = $hash
    notes = "Atualizacao SGFilialTransfer $Version"
}

$manifestPath = Join-Path $repoDir "manifest.json"
$manifest | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

Write-Host "Manifesto atualizado:"
Write-Host $manifestPath
Write-Host "Instalador:"
Write-Host $targetInstaller
