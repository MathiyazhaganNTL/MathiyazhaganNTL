Add-Type -AssemblyName System.Drawing

$bgFile = "g:\github\MathiyazhaganNTL\Finspark_Hackathon_Template (2).pptx.png"
$avatarFile = "g:\github\MathiyazhaganNTL\Black_court_Mathi.png"

# 1. Optimize Background Image to JPEG (1200x520)
$srcBg = [System.Drawing.Image]::FromFile($bgFile)
$bmpBg = New-Object System.Drawing.Bitmap 1200, 520
$gBg = [System.Drawing.Graphics]::FromImage($bmpBg)
$gBg.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gBg.DrawImage($srcBg, 0, 0, 1200, 520)
$bmpBg.Save("g:\github\MathiyazhaganNTL\assets\header-bg.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$gBg.Dispose()
$bmpBg.Dispose()
$srcBg.Dispose()

# 2. Optimize Avatar Photo to JPEG (400x400)
$srcAv = [System.Drawing.Image]::FromFile($avatarFile)
$bmpAv = New-Object System.Drawing.Bitmap 400, 400
$gAv = [System.Drawing.Graphics]::FromImage($bmpAv)
$gAv.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gAv.DrawImage($srcAv, 0, 0, 400, 400)
$bmpAv.Save("g:\github\MathiyazhaganNTL\assets\avatar-opt.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$gAv.Dispose()
$bmpAv.Dispose()
$srcAv.Dispose()

Write-Host "Successfully generated lightweight JPEGs!"
