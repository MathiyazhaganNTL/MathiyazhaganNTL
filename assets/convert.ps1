$bytes = [System.IO.File]::ReadAllBytes("g:\github\MathiyazhaganNTL\assets\developer-cartoon.png")
$b64 = [System.Convert]::ToBase64String($bytes)
$b64 | Out-File -FilePath "g:\github\MathiyazhaganNTL\assets\b64.txt" -NoNewline -Encoding ascii
Write-Host "Base64 length: $($b64.Length)"
