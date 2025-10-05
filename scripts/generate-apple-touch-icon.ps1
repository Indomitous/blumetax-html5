param(
  [string] $Source = "../assets/icons/android-chrome-192x192.png",
  [string] $Destination = "../assets/icons/apple-touch-icon-180x180.png"
)

Write-Host "Generating Apple touch icon (180x180) from: $Source -> $Destination"

try {
  Add-Type -AssemblyName System.Drawing -ErrorAction Stop
} catch {
  Write-Error "Failed to load System.Drawing. On Windows PowerShell 5.1, this should be available. $_"
  exit 1
}

$srcPath = Resolve-Path -LiteralPath $Source -ErrorAction SilentlyContinue
if (-not $srcPath) {
  Write-Error "Source image not found: $Source"
  exit 1
}

$destFull = Resolve-Path -LiteralPath (Split-Path -Parent $Destination) -ErrorAction SilentlyContinue
if (-not $destFull) {
  New-Item -ItemType Directory -Path (Split-Path -Parent $Destination) -Force | Out-Null
}

try {
  $img = [System.Drawing.Image]::FromFile($srcPath.Path)
  $bmp = New-Object System.Drawing.Bitmap 180,180
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.DrawImage($img, 0, 0, 180, 180)
  $bmp.Save($Destination, [System.Drawing.Imaging.ImageFormat]::Png)
} finally {
  if ($g) { $g.Dispose() }
  if ($bmp) { $bmp.Dispose() }
  if ($img) { $img.Dispose() }
}

Write-Host "Apple touch icon generated at: $Destination"
