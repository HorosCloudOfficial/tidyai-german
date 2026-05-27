# ==============================================================================
# TidyAI Deinstallationsprogramm
# Version 2.0.0 - Modulare Architektur
# Entfernt TidyAI vollständig vom System
# ==============================================================================

# Ensure we're running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Dieses Skript erfordert Administratorrechte. Bitte als Administrator ausführen." -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

# Console Colors
$Colors = @{
    Primary   = "DarkRed"
    Secondary = "Yellow"
    Accent    = "DarkYellow"
    Success   = "Yellow"
    Warning   = "DarkYellow"
    Error     = "Red"
    Info      = "White"
}

# Installation paths
$INSTALL_DIR = "$env:ProgramFiles\TidyAI"

# Registry paths for context menu
$REGISTRY_KEY = "HKCR:\Directory\shell\TidyAI"
$REGISTRY_BACKGROUND_KEY = "HKCR:\Directory\Background\shell\TidyAI"
$REGISTRY_DESKTOP_KEY = "HKCR:\DesktopBackground\Shell\TidyAI"

# Registry paths for Windows uninstaller
$UNINSTALL_KEY = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TidyAI"

function Show-UninstallerLogo {
    Clear-Host
    Write-Host ""
    Write-Host "    ############ #### ########   ####  ####     ##########    ####" -ForegroundColor $Colors.Primary
    Write-Host "    ############ #### ########   ####  ####     ##########    ####" -ForegroundColor $Colors.Primary
    Write-Host "        ####     #### ####  #### ####  ####     ####  ####    ####" -ForegroundColor $Colors.Primary
    Write-Host "        ####     #### ####  #### ####  ####     ####  ####    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####     #### ####  ####  ########      ##########    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####     #### ####  ####   ######       ##########    ####" -ForegroundColor $Colors.Accent
    Write-Host "        ####     #### ####  ####    ####        ####  ####    ####" -ForegroundColor $Colors.Secondary
    Write-Host "        ####     #### ########      ####        ####  ####    ####" -ForegroundColor $Colors.Secondary
    Write-Host "        ####     #### ########      ####        ####  #### ## ####" -ForegroundColor $Colors.Secondary
    Write-Host ""
    Write-Host "    ================================================================" -ForegroundColor $Colors.Primary
    Write-Host "    ||                                                            ||" -ForegroundColor $Colors.Primary
    Write-Host "    ||                   DEINSTALLATIONSPROGRAMM v1.0.0            ||" -ForegroundColor $Colors.Warning
    Write-Host "    ||                                                            ||" -ForegroundColor $Colors.Primary
    Write-Host "    ||                 ENTFERNE TIDYAI                           ||" -ForegroundColor $Colors.Error
    Write-Host "    ||                                                            ||" -ForegroundColor $Colors.Primary
    Write-Host "    ================================================================" -ForegroundColor $Colors.Primary
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

function Show-ProgressStep {
    param(
        [string]$Message,
        [string]$Status = "Info"
    )
    
    $statusColor = switch ($Status) {
        "Success" { $Colors.Success }
        "Warning" { $Colors.Warning }
        "Error" { $Colors.Error }
        default { $Colors.Info }
    }
    
    $statusSymbol = switch ($Status) {
        "Success" { "[OK]" }
        "Warning" { "[WARN]" }
        "Error" { "[ERROR]" }
        default { "[INFO]" }
    }
    
    Write-ColorText "$statusSymbol $Message" $statusColor
}

function Uninstall-TidyAI {
    Show-UninstallerLogo
    
    Write-ColorText "Starte TidyAI-Deinstallation..." $Colors.Warning
    Write-Host ""
    
    # Confirm uninstallation
    Write-ColorText "Bist du sicher, dass du TidyAI vollständig von deinem System entfernen möchtest?" $Colors.Warning
    Write-ColorText "Dies entfernt alle Dateien, Kontextmenü-Einträge und Registrierungseinträge." $Colors.Info
    Write-Host ""
    $confirm = Read-Host "Gib 'JA' ein, um die Deinstallation zu bestätigen"
    
    if ($confirm -ne "JA") {
        Write-ColorText "Deinstallation abgebrochen." $Colors.Info
        Read-Host "Drücke Enter zum Beenden"
        return
    }
    
    Write-Host ""
    Write-ColorText "Fahre mit Deinstallation fort..." $Colors.Warning
    Write-Host ""
    
    try {
        # Step 1: Create HKCR drive if it doesn't exist
        Show-ProgressStep "Richte Registrierungszugriff ein"
        if (-not (Get-PSDrive -Name HKCR -ErrorAction SilentlyContinue)) {
            New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
        }
        Show-ProgressStep "Registrierungszugriff konfiguriert" "Success"
        
        # Step 2: Remove context menu registry entries
        Show-ProgressStep "Entferne Kontextmenü-Einträge"
        
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
        
        # Step 3: Remove Windows uninstaller registry entries
        Show-ProgressStep "Entferne Windows-Deinstallations-Einträge"
        if (Test-Path $UNINSTALL_KEY) {
            Remove-Item -Path $UNINSTALL_KEY -Recurse -Force
            Show-ProgressStep "Windows-Deinstallations-Einträge entfernt" "Success"
        } else {
            Show-ProgressStep "Windows-Deinstallations-Einträge nicht gefunden" "Warning"
        }
        
        # Step 4: Remove API key environment variable
        Show-ProgressStep "Entferne API-Schlüssel-Umgebungsvariable"
        try {
            [Environment]::SetEnvironmentVariable("TidyAIOpenAIAPIKey", $null, "User")
            Show-ProgressStep "API-Schlüssel-Umgebungsvariable entfernt" "Success"
        } catch {
            Show-ProgressStep "API-Schlüssel-Entfernung fehlgeschlagen (unkritisch): $($_.Exception.Message)" "Warning"
        }
        
        # Step 5: Force refresh Windows Explorer context menus
        Show-ProgressStep "Aktualisiere Windows Explorer-Kontextmenüs"
        try {
            # Method 1: Notify shell of changes
            Add-Type -TypeDefinition @"
                using System;
                using System.Runtime.InteropServices;
                public class Shell32 {
                    [DllImport("shell32.dll", CharSet = CharSet.Auto, SetLastError = true)]
                    public static extern void SHChangeNotify(uint wEventId, uint uFlags, IntPtr dwItem1, IntPtr dwItem2);
                }
"@
            [Shell32]::SHChangeNotify(0x8000000, 0x1000, [IntPtr]::Zero, [IntPtr]::Zero)
            
            # Method 2: Restart Windows Explorer
            Show-ProgressStep "Starte Windows Explorer neu, um Kontextmenü-Cache zu leeren"
            $explorerProcesses = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
            if ($explorerProcesses) {
                $explorerProcesses | Stop-Process -Force
                Start-Sleep -Seconds 2
                Start-Process "explorer.exe"
                Show-ProgressStep "Windows Explorer neu gestartet" "Success"
            }
            
            Show-ProgressStep "Kontextmenü-Cache geleert" "Success"
        } catch {
            Show-ProgressStep "Kontextmenü-Aktualisierung fehlgeschlagen (unkritisch): $($_.Exception.Message)" "Warning"
        }
        
        # Step 5: Remove installation directory
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
        Write-ColorText "   Kontextmenüs wurden aktualisiert." $Colors.Info
        Write-ColorText "   Vielen Dank für die Verwendung von TidyAI!" $Colors.Accent
        Write-Host ""
        
    } catch {
        Show-ProgressStep "Deinstallation fehlgeschlagen: $($_.Exception.Message)" "Error"
        Write-Host ""
        Write-ColorText "Bitte versuche, das Deinstallationsprogramm als Administrator auszuführen." $Colors.Warning
        Write-Host ""
    }
    
    Read-Host "Drücke Enter zum Beenden"
}

# ==============================================================================
# HAUPT-AUSFÜHRUNG
# ==============================================================================

Uninstall-TidyAI
