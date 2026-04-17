param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath
)

# Resolve lib path
$libPath = Join-Path $ProjectPath "lib"

# Basic validation
if (-not (Test-Path $libPath)) {
    Write-Host "Error: lib folder not found at $libPath" -ForegroundColor Red
    exit 1
}

# Folder structure definition (BLoC + Clean Architecture)
$folders = @(
    # CORE LAYER
    "core\constants",
    "core\errors",
    "core\utils",
    "core\theme",
    "core\network",
    "core\services",

    # SHARED (cross-feature reusable code)
    "shared\widgets",
    "shared\models",
    "shared\extensions",
    "shared\enums",

    # FEATURES

    # HOME FEATURE
    "features\home\data\datasources",
    "features\home\data\models",
    "features\home\data\repositories",

    "features\home\domain\entities",
    "features\home\domain\repositories",
    "features\home\domain\usecases",

    "features\home\presentation\bloc",
    "features\home\presentation\pages",
    "features\home\presentation\widgets"
)

Write-Host "Creating Flutter BLoC folder structure in: $libPath" -ForegroundColor Cyan

foreach ($folder in $folders) {
    $fullPath = Join-Path $libPath $folder

    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created: $folder" -ForegroundColor Green
    }
    else {
        Write-Host "Exists:  $folder" -ForegroundColor Yellow
    }
}

Write-Host "`nDone. Flutter BLoC structure setup complete." -ForegroundColor Cyan