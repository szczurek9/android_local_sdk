
# ==========================================
# Android SDK - User Environment Setup
# No Administrator privileges required
# ==========================================

$DevPath = "$env:USERPROFILE\Dev"

$JavaPath = "$DevPath\jdk-21"
$AndroidPath = "$DevPath\AndroidSdk"

# Check directories
if (!(Test-Path $JavaPath)) {
    Write-Host "ERROR: JDK not found: $JavaPath" -ForegroundColor Red
    exit 1
}

if (!(Test-Path "$AndroidPath\cmdline-tools\latest\bin")) {
    Write-Host "ERROR: Android SDK cmdline-tools not found!" -ForegroundColor Red
    exit 1
}

# Set user environment variables
[Environment]::SetEnvironmentVariable(
    "JAVA_HOME", $JavaPath, "User"
)

[Environment]::SetEnvironmentVariable(
    "ANDROID_HOME", $AndroidPath, "User"
)

# Update user PATH
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")

$NewEntries = @(
    "%JAVA_HOME%\bin"
    "%ANDROID_HOME%\cmdline-tools\latest\bin"
)

foreach ($Entry in $NewEntries) {
    if ($UserPath -notlike "*$Entry*") {
        if ($UserPath) {
            $UserPath += ";$Entry"
        } else {
            $UserPath = $Entry
        }
    }
}

[Environment]::SetEnvironmentVariable(
    "Path", $UserPath, "User"
)

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host " Android environment configured!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green

Write-Host "JAVA_HOME:    $JavaPath"
Write-Host "ANDROID_HOME: $AndroidPath"
Write-Host ""
Write-Host "Restart your terminal to apply changes."
