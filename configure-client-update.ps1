param(
    [Parameter(Mandatory = $true)]
    [string]$ManifestUrl,

    [string]$ConfigPath = "C:\SGBR\SGFilial\AppConfig.json"
)

$ErrorActionPreference = "Stop"

if (!(Test-Path $ConfigPath)) {
    throw "AppConfig.json nao encontrado em $ConfigPath"
}

$config = Get-Content -LiteralPath $ConfigPath -Raw | ConvertFrom-Json
if ($null -eq $config.Update) {
    $config | Add-Member -MemberType NoteProperty -Name Update -Value ([pscustomobject]@{})
}

$config.Update | Add-Member -MemberType NoteProperty -Name AutoUpdateEnabled -Value $true -Force
$config.Update | Add-Member -MemberType NoteProperty -Name ManifestUrl -Value $ManifestUrl -Force
$config.Update | Add-Member -MemberType NoteProperty -Name CheckIntervalHours -Value 6 -Force

$config | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $ConfigPath -Encoding UTF8
Write-Host "Atualizacao automatica configurada em $ConfigPath"
