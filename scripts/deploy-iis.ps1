param(
  [Parameter(Mandatory = $true)]
  [string] $SitePath,       # e.g., C:\inetpub\wwwroot\blumetax
  [string] $SourcePath = (Resolve-Path "..\").Path,
  [switch] $AddMimeMap
)

Write-Host "Deploying from $SourcePath to $SitePath"

if (!(Test-Path $SitePath)) {
  New-Item -ItemType Directory -Path $SitePath | Out-Null
}

$exclude = @(
  'node_modules', '.git', '.vscode', '.github',
  'assets\sass',  # source only; compiled CSS lives in assets\css
  'scripts'
)

$items = Get-ChildItem -LiteralPath $SourcePath -Force
foreach ($item in $items) {
  $rel = Resolve-Path $item.FullName
  $skip = $false
  foreach ($ex in $exclude) {
    if ($item.FullName -like "*\$ex") { $skip = $true; break }
  }
  if ($skip) { continue }

  $dest = Join-Path $SitePath $item.Name
  if (Test-Path $dest) {
    if ($item.PSIsContainer) {
      robocopy $item.FullName $dest /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
    } else {
      Copy-Item $item.FullName -Destination $dest -Force
    }
  } else {
    Copy-Item $item.FullName -Destination $dest -Recurse -Force
  }
}

if ($AddMimeMap) {
  Import-Module WebAdministration
  $path = "MACHINE/WEBROOT/APPHOST"
  $mime = Get-WebConfigurationProperty -pspath $path -filter /system.webServer/staticContent -name "." |
    Select-Object -ExpandProperty collection |
    Where-Object { $_.fileExtension -eq ".webmanifest" }

  if (-not $mime) {
    Write-Host "Adding MIME map for .webmanifest => application/manifest+json"
    Add-WebConfigurationProperty -pspath $path -filter /system.webServer/staticContent -name "." -value @{
      fileExtension = ".webmanifest"; mimeType = "application/manifest+json"
    } | Out-Null
  } else {
    Write-Host ".webmanifest MIME map already exists."
  }
}

Write-Host "Deploy complete."
