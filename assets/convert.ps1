param(
    [string]$InputFile = "$PSScriptRoot\developer-cartoon.png",
    [string]$OutputFile = "$PSScriptRoot\b64.txt"
)

$bytes = [System.IO.File]::ReadAllBytes($InputFile)
$b64 = [System.Convert]::ToBase64String($bytes)
$b64 | Out-File -FilePath $OutputFile -NoNewline -Encoding ascii
Write-Host "Base64 length: $($b64.Length)"
