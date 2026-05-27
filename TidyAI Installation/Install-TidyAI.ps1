# ==============================================================================
# TidyAI Installer - Kontextmenü-Integration Einrichtung
# Version 2.0.0 - Modulare Architektur
# ==============================================================================

# Requires Administrator privileges
#Requires -RunAsAdministrator

param(
    [switch]$Uninstall
)

# ==============================================================================
# KONFIGURATION
# ==============================================================================

$SCRIPT_NAME = "TidyAI.ps1"
$INSTALL_DIR = "$env:ProgramFiles\TidyAI"
$SCRIPT_PATH = Join-Path $INSTALL_DIR $SCRIPT_NAME

# Registry paths for context menu
$REGISTRY_KEY = "HKCR:\Directory\shell\TidyAI"
$REGISTRY_COMMAND_KEY = "HKCR:\Directory\shell\TidyAI\command"

# Registry paths for folder background context menu
$REGISTRY_BACKGROUND_KEY = "HKCR:\Directory\Background\shell\TidyAI"
$REGISTRY_BACKGROUND_COMMAND_KEY = "HKCR:\Directory\Background\shell\TidyAI\command"

# Registry paths for desktop context menu
$REGISTRY_DESKTOP_KEY = "HKCR:\DesktopBackground\Shell\TidyAI"
$REGISTRY_DESKTOP_COMMAND_KEY = "HKCR:\DesktopBackground\Shell\TidyAI\command"

# Registry paths for Windows uninstaller
$UNINSTALL_KEY = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TidyAI"
$APP_VERSION = "2.0.0"
$APP_PUBLISHER = "TidyAI"
$APP_DISPLAY_NAME = "TidyAI - Intelligente Ordnerorganisation"

# Console Colors
$Colors = @{
    Primary = "DarkRed"
    Secondary = "Yellow" 
    Success = "Yellow"
    Warning = "DarkYellow"
    Error = "Red"
    Info = "White"
    Accent = "DarkYellow"
}

# ==============================================================================
# HILFSFUNKTIONEN
# ==============================================================================

function Show-InstallerLogo {
    Clear-Host
    Write-Host ""
    Write-Host "    ################## #### ########  ####   ####     ##########    ####" -ForegroundColor $Colors.Primary
    Write-Host "    ################## #### ########  ####   ####     ##########    ####" -ForegroundColor $Colors.Primary
    Write-Host "        ####           #### ####  #### ####  ####     ####  ####    ####" -ForegroundColor $Colors.Primary
    Write-Host "        ####           #### ####  #### ####  ####     ####  ####    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####           #### ####  ####  ########      ##########    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####           #### ####  ####  #######       ##########    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####           #### ####  ####   ####         ####  ####    ####" -ForegroundColor $Colors.Secondary
    Write-Host "        ####           #### ########     ####         ####  ####    ####" -ForegroundColor $Colors.Secondary
    Write-Host "        ####           #### ########     ####         ####  #### ## ####" -ForegroundColor $Colors.Secondary
    Write-Host ""
}

function Write-ColorText {
    param(
        [string]$Text,
        [string]$Color = $Colors.Info,
        [switch]$NoNewline
    )
    
    if ($NoNewline) {
        Write-Host $Text -ForegroundColor $Color -NoNewline
    } else {
        Write-Host $Text -ForegroundColor $Color
    }
}

function Add-ContextMenuEntries {
    Write-ColorText "Füge Kontextmenü-Einträge hinzu..." $Colors.Info
    
    try {
        # Commands for different contexts
        $folderCommand = "powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File `"$SCRIPT_PATH`" -FolderPath `"%1`""
        $backgroundCommand = "powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File `"$SCRIPT_PATH`" -FolderPath `"%V`""
        
        # Create folder context menu entry
        Write-ColorText "   Füge Ordner-Kontextmenü-Eintrag hinzu..." $Colors.Info
        if (-not (Test-Path $REGISTRY_KEY)) {
            New-Item -Path $REGISTRY_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_KEY -Name "(Default)" -Value "Mit TidyAI aufräumen"
        Set-ItemProperty -Path $REGISTRY_KEY -Name "Icon" -Value "shell32.dll,4"
        
        if (-not (Test-Path $REGISTRY_COMMAND_KEY)) {
            New-Item -Path $REGISTRY_COMMAND_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_COMMAND_KEY -Name "(Default)" -Value $folderCommand
        
        # Create folder background context menu entry
        Write-ColorText "   Füge Ordner-Hintergrund-Kontextmenü-Eintrag hinzu..." $Colors.Info
        if (-not (Test-Path $REGISTRY_BACKGROUND_KEY)) {
            New-Item -Path $REGISTRY_BACKGROUND_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_BACKGROUND_KEY -Name "(Default)" -Value "Mit TidyAI aufräumen"
        Set-ItemProperty -Path $REGISTRY_BACKGROUND_KEY -Name "Icon" -Value "shell32.dll,4"
        
        if (-not (Test-Path $REGISTRY_BACKGROUND_COMMAND_KEY)) {
            New-Item -Path $REGISTRY_BACKGROUND_COMMAND_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_BACKGROUND_COMMAND_KEY -Name "(Default)" -Value $backgroundCommand
        
        # Create desktop context menu entry
        Write-ColorText "   Füge Desktop-Kontextmenü-Eintrag hinzu..." $Colors.Info
        if (-not (Test-Path $REGISTRY_DESKTOP_KEY)) {
            New-Item -Path $REGISTRY_DESKTOP_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_DESKTOP_KEY -Name "(Default)" -Value "Mit TidyAI aufräumen"
        Set-ItemProperty -Path $REGISTRY_DESKTOP_KEY -Name "Icon" -Value "shell32.dll,4"
        
        if (-not (Test-Path $REGISTRY_DESKTOP_COMMAND_KEY)) {
            New-Item -Path $REGISTRY_DESKTOP_COMMAND_KEY -Force | Out-Null
        }
        Set-ItemProperty -Path $REGISTRY_DESKTOP_COMMAND_KEY -Name "(Default)" -Value $backgroundCommand
        
        Write-ColorText "   Alle Kontextmenü-Einträge erfolgreich hinzugefügt" $Colors.Success
        
        # Force refresh the shell to pick up changes immediately
        try {
            $shellApplication = New-Object -ComObject Shell.Application
            $shellApplication.RefreshMenu()
        } catch {
            # Refresh failed, but not critical
        }
        
    } catch {
        Write-ColorText "   Fehler beim Hinzufügen der Kontextmenü-Einträge: $($_.Exception.Message)" $Colors.Error
        throw
    }
}

function Test-AdminRights {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Show-ProgressStep {
    param(
        [string]$Step,
        [string]$Status = "In Progress"
    )
    
    $emoji = switch ($Status) {
        "Success" { "[OK]" }
        "Error" { "[ERROR]" }
        "Warning" { "[WARN]" }
        default { "[...]" }
    }
    
    $color = switch ($Status) {
        "Success" { $Colors.Success }
        "Error" { $Colors.Error }
        "Warning" { $Colors.Warning }
        default { $Colors.Info }
    }
    
    Write-ColorText "$emoji $Step" $color
}

function Get-OpenAIAPIKey {
    Write-ColorText "OpenAI API-Schlüssel Einrichtung" $Colors.Accent
    Write-Host ""
    Write-ColorText "TidyAI benötigt einen OpenAI API-Schlüssel zum Funktionieren." $Colors.Info
    Write-ColorText "Du kannst einen bekommen von: https://platform.openai.com/api-keys" $Colors.Accent
    Write-Host ""
    
    do {
        $apiKey = Read-Host "Bitte gib deinen OpenAI API-Schlüssel ein" -AsSecureString
        $plainKey = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiKey))
        
        if ([string]::IsNullOrWhiteSpace($plainKey)) {
            Write-ColorText "API-Schlüssel darf nicht leer sein. Bitte versuche es erneut." $Colors.Error
            continue
        }
        
        if (-not $plainKey.StartsWith("sk-")) {
            Write-ColorText "Warnung: OpenAI API-Schlüssel beginnen normalerweise mit 'sk-'. Bist du sicher, dass dies korrekt ist?" $Colors.Warning
            $confirm = Read-Host "Trotzdem fortfahren? (j/n)"
            if ($confirm -ne "j" -and $confirm -ne "J") {
                continue
            }
        }
        
        return $plainKey
        
    } while ($true)
}

function Set-APIKeyEnvironmentVariable {
    param([string]$ApiKey)
    
    try {
        Write-ColorText "Richte API-Schlüssel-Umgebungsvariable ein..." $Colors.Info
        [Environment]::SetEnvironmentVariable("TidyAIOpenAIAPIKey", $ApiKey, "User")
        Write-ColorText "   API-Schlüssel erfolgreich konfiguriert" $Colors.Success
        return $true
    } catch {
        Write-ColorText "   Fehler beim Setzen des API-Schlüssels: $($_.Exception.Message)" $Colors.Error
        return $false
    }
}

# ==============================================================================
# INSTALLATIONS-FUNKTIONEN
# ==============================================================================

function Install-TidyAI {
    Show-InstallerLogo
    
    Write-ColorText "Willkommen zur TidyAI-Installation!" $Colors.Info
    Write-Host ""
    
    # Step 1: Get and set API key
    $apiKey = Get-OpenAIAPIKey
    if (-not (Set-APIKeyEnvironmentVariable $apiKey)) {
        Write-ColorText "Fehler beim Konfigurieren des API-Schlüssels. Installation kann nicht fortgesetzt werden." $Colors.Error
        Read-Host "Drücke Enter zum Beenden"
        return $false
    }
    
    Write-Host ""
    Write-ColorText "Starte TidyAI-Installation..." $Colors.Info
    Write-Host ""
    
    try {
        # Step 1: Create installation directory
        Show-ProgressStep "Erstelle Installationsverzeichnis"
        if (-not (Test-Path $INSTALL_DIR)) {
            New-Item -Path $INSTALL_DIR -ItemType Directory -Force | Out-Null
        }
        Show-ProgressStep "Installationsverzeichnis erstellt" "Success"
        
        # Step 2: Copy TidyAI script and modules
        Show-ProgressStep "Kopiere TidyAI-Skript und Module"
        $currentScriptDir = if ($MyInvocation.MyCommand.Path) {
            Split-Path -Parent $MyInvocation.MyCommand.Path
        } else {
            Get-Location
        }
        $sourcePath = Join-Path $currentScriptDir $SCRIPT_NAME
        $modulesSourcePath = Join-Path $currentScriptDir "Modules"
        
        if (-not (Test-Path $sourcePath)) {
            Show-ProgressStep "TidyAI.ps1 nicht im aktuellen Verzeichnis gefunden" "Error"
            Write-ColorText "Bitte stelle sicher, dass TidyAI.ps1 im selben Ordner wie dieser Installer ist." $Colors.Warning
            return $false
        }
        
        if (-not (Test-Path $modulesSourcePath)) {
            Show-ProgressStep "Modules-Ordner nicht im aktuellen Verzeichnis gefunden" "Error"
            Write-ColorText "Bitte stelle sicher, dass der Modules-Ordner im selben Verzeichnis wie dieser Installer ist." $Colors.Warning
            return $false
        }
        
        # Copy main script
        Copy-Item $sourcePath $SCRIPT_PATH -Force
        Show-ProgressStep "TidyAI-Skript erfolgreich kopiert" "Success"
        
        # Copy Modules folder recursively
        $modulesDestPath = Join-Path $INSTALL_DIR "Modules"
        Copy-Item $modulesSourcePath $modulesDestPath -Recurse -Force
        Show-ProgressStep "TidyAI-Module erfolgreich kopiert" "Success"
        
        # Step 3: Create HKCR drive if it doesn't exist
        Show-ProgressStep "Richte Registrierungszugriff ein"
        if (-not (Get-PSDrive -Name HKCR -ErrorAction SilentlyContinue)) {
            New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
        }
        Show-ProgressStep "Registrierungszugriff konfiguriert" "Success"
        
        # Step 4: Create context menu registry entries
        Add-ContextMenuEntries
        
        # Step 5: Create Windows uninstaller registry entries
        Show-ProgressStep "Füge Windows-Deinstallations-Einträge hinzu"
        
        # Create uninstaller registry key
        if (-not (Test-Path $UNINSTALL_KEY)) {
            New-Item -Path $UNINSTALL_KEY -Force | Out-Null
        }
        
        # Calculate installation size (approximate)
        $installSize = if (Test-Path $SCRIPT_PATH) {
            [math]::Round((Get-Item $SCRIPT_PATH).Length / 1KB)
        } else {
            100  # Default size in KB
        }
        
        # Set uninstaller properties
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "DisplayName" -Value $APP_DISPLAY_NAME
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "DisplayVersion" -Value $APP_VERSION
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "Publisher" -Value $APP_PUBLISHER
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "InstallLocation" -Value $INSTALL_DIR
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "UninstallString" -Value "powershell.exe -ExecutionPolicy Bypass -File `"$PSCommandPath`" -Uninstall"
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "QuietUninstallString" -Value "powershell.exe -ExecutionPolicy Bypass -File `"$PSCommandPath`" -Uninstall"
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "NoModify" -Value 1 -Type DWord
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "NoRepair" -Value 1 -Type DWord
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "EstimatedSize" -Value $installSize -Type DWord
        Set-ItemProperty -Path $UNINSTALL_KEY -Name "InstallDate" -Value (Get-Date -Format "yyyyMMdd")
        
        Show-ProgressStep "Windows-Deinstallations-Einträge erstellt" "Success"
        
        # Step 6: Set execution policy for the script
        Show-ProgressStep "Konfiguriere PowerShell-Ausführungsrichtlinie"
        try {
            Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
            Show-ProgressStep "Ausführungsrichtlinie konfiguriert" "Success"
        }
        catch {
            Show-ProgressStep "Ausführungsrichtlinien-Konfiguration (manuelle Einrichtung könnte erforderlich sein)" "Warning"
        }
        
        Write-Host ""
        Write-ColorText "TidyAI-Installation abgeschlossen!" $Colors.Success
        Write-Host ""
        Write-ColorText "Installationszusammenfassung:" $Colors.Info
        Write-ColorText "   - Installiert in: $INSTALL_DIR" $Colors.Secondary
        Write-ColorText "   - Kontextmenü hinzugefügt: Rechtsklick auf beliebigen Ordner -> Mit TidyAI aufräumen" $Colors.Secondary
        Write-ColorText "   - API-Schlüssel konfiguriert und einsatzbereit!" $Colors.Secondary
        Write-Host ""
        
        return $true
    }
    catch {
        Show-ProgressStep "Installation fehlgeschlagen: $($_.Exception.Message)" "Error"
        return $false
    }
}

function Uninstall-TidyAI {
    Write-ColorText "Starte TidyAI-Deinstallation..." $Colors.Warning
    Write-Host ""
    
    try {
        # Step 1: Remove context menu registry entries
        Show-ProgressStep "Entferne Kontextmenü-Einträge"
        
        if (Get-PSDrive -Name HKCR -ErrorAction SilentlyContinue) {
            # Remove folder context menu
            if (Test-Path $REGISTRY_KEY) {
                Remove-Item -Path $REGISTRY_KEY -Recurse -Force
                Show-ProgressStep "Ordner-Kontextmenü-Einträge entfernt" "Success"
            } else {
                Show-ProgressStep "Ordner-Kontextmenü-Einträge nicht gefunden" "Warning"
            }
            
            # Remove folder background context menu
            if (Test-Path $REGISTRY_BACKGROUND_KEY) {
                Remove-Item -Path $REGISTRY_BACKGROUND_KEY -Recurse -Force
                Show-ProgressStep "Ordner-Hintergrund-Kontextmenü-Einträge entfernt" "Success"
            } else {
                Show-ProgressStep "Ordner-Hintergrund-Kontextmenü-Einträge nicht gefunden" "Warning"
            }
            
            # Remove desktop context menu
            if (Test-Path $REGISTRY_DESKTOP_KEY) {
                Remove-Item -Path $REGISTRY_DESKTOP_KEY -Recurse -Force
                Show-ProgressStep "Desktop-Kontextmenü-Einträge entfernt" "Success"
            } else {
                Show-ProgressStep "Desktop-Kontextmenü-Einträge nicht gefunden" "Warning"
            }
        }
        
        # Step 2: Remove Windows uninstaller registry entries
        Show-ProgressStep "Entferne Windows-Deinstallations-Einträge"
        if (Test-Path $UNINSTALL_KEY) {
            Remove-Item -Path $UNINSTALL_KEY -Recurse -Force
            Show-ProgressStep "Windows-Deinstallations-Einträge entfernt" "Success"
        } else {
            Show-ProgressStep "Windows-Deinstallations-Einträge nicht gefunden" "Warning"
        }
        
        # Step 3: Remove installation directory
        Show-ProgressStep "Entferne Installationsdateien"
        if (Test-Path $INSTALL_DIR) {
            Remove-Item -Path $INSTALL_DIR -Recurse -Force
            Show-ProgressStep "Installationsdateien entfernt" "Success"
        } else {
            Show-ProgressStep "Installationsverzeichnis nicht gefunden" "Warning"
        }
        
        Write-Host ""
        Write-ColorText "TidyAI-Deinstallation abgeschlossen!" $Colors.Success
        Write-ColorText "   Alle Dateien und Registrierungseinträge wurden entfernt." $Colors.Info
        Write-Host ""
        
        return $true
    }
    catch {
        Show-ProgressStep "Deinstallation fehlgeschlagen: $($_.Exception.Message)" "Error"
        return $false
    }
}

function Show-Usage {
    Write-ColorText "TidyAI Installer Verwendung:" $Colors.Info
    Write-Host ""
    Write-ColorText "TidyAI installieren:" $Colors.Secondary
    Write-ColorText "   .\Install-TidyAI.ps1" $Colors.Accent
    Write-Host ""
    Write-ColorText "TidyAI deinstallieren:" $Colors.Secondary
    Write-ColorText "   .\Install-TidyAI.ps1 -Uninstall" $Colors.Accent
    Write-Host ""
    Write-ColorText "Voraussetzungen:" $Colors.Warning
    Write-ColorText "   - Als Administrator ausführen" $Colors.Info
    Write-ColorText "   - TidyAI.ps1 muss im selben Ordner sein" $Colors.Info
    Write-ColorText "   - OpenAI API-Schlüssel (wird nach Installation gesetzt)" $Colors.Info
    Write-Host ""
}

# ==============================================================================
# HAUPT-AUSFÜHRUNG
# ==============================================================================

function Main {
    # Show installer logo
    Show-InstallerLogo
    
    # Check for administrator rights
    if (-not (Test-AdminRights)) {
        Write-ColorText "Administratorrechte erforderlich!" $Colors.Error
        Write-ColorText "   Bitte führe diesen Installer als Administrator aus." $Colors.Warning
        Write-ColorText "   Rechtsklick auf PowerShell und wähle Als Administrator ausführen" $Colors.Info
        Write-Host ""
        Show-Usage
        Read-Host "Drücke Enter zum Beenden"
        return
    }
    
    Write-ColorText "Wird mit Administratorrechten ausgeführt" $Colors.Success
    Write-Host ""
    
    # Determine operation
    if ($Uninstall) {
        $success = Uninstall-TidyAI
    } else {
        $success = Install-TidyAI
    }
    
    # Wait for user input
    if ($success) {
        Write-ColorText "Drücke Enter zum Beenden..." $Colors.Info
    } else {
        Write-ColorText "Drücke Enter zum Beenden (siehe Fehler oben)..." $Colors.Error
    }
    Read-Host
}

# ==============================================================================
# SKRIPT-EINSTIEGSPUNKT
# ==============================================================================

# Set console properties
try {
    $Host.UI.RawUI.WindowTitle = "TidyAI Installer"
    $Host.UI.RawUI.BackgroundColor = "Black"
    $Host.UI.RawUI.ForegroundColor = "White"
}
catch {
    # Ignore console customization errors
}

# Run the installer
Main
