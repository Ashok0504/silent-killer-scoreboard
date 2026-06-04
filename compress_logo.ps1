[Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$imgPath = "C:\Users\ADMIN\.gemini\antigravity\scratch\silent-killer-scoreboard\logo.png"
$outputPath = "C:\Users\ADMIN\.gemini\antigravity\scratch\silent-killer-scoreboard\logo_small.png"

if (Test-Path $imgPath) {
    Write-Host "Loading image..."
    $img = [System.Drawing.Image]::FromFile($imgPath)
    
    Write-Host "Resizing image to 256x256..."
    $newImg = New-Object System.Drawing.Bitmap(256, 256)
    $g = [System.Drawing.Graphics]::FromImage($newImg)
    $g.DrawImage($img, 0, 0, 256, 256)
    
    Write-Host "Saving compressed image to logo_small.png..."
    $newImg.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $g.Dispose()
    $newImg.Dispose()
    $img.Dispose()
    Write-Host "Success! Compressed image size:" (Get-Item $outputPath).Length "bytes"
} else {
    Write-Host "Error: logo.png not found at $imgPath"
}
