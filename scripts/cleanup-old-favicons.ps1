param(
  [string] $ImagesFolder = "../images"
)

Write-Host "Removing old favicon files from $ImagesFolder (safe: errors ignored if missing)"

$files = @(
  "favicon-16.png",
  "favicon-32.png",
  "favicon-48.png",
  "favicon-64.png",
  "favicon-96.png",
  "favicon-192.png",
  "favicon-512.png"
)

foreach ($f in $files) {
  $p = Join-Path $ImagesFolder $f
  if (Test-Path $p) {
    try { Remove-Item $p -Force -ErrorAction Stop; Write-Host "Removed $p" } catch { Write-Warning "Failed to remove $p: $_" }
  }
}

Write-Host "Cleanup complete."
