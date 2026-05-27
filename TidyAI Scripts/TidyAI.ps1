# ==============================================================================
# TIDYAI - INTELLIGENTES ORDNERORGANISATIONS-TOOL
# Version 2.0.0 - Modulare Architektur
# ==============================================================================

param(
    [Parameter(Mandatory=$false)]
    [string]$FolderPath
)

# ==============================================================================
# MODUL-IMPORTE
# ==============================================================================

# Get the script directory to build module paths
# TidyAI.ps1 liegt in 'TidyAI Scripts\' - Modules sind eine Ebene hoeher
$ScriptRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# Ordnerauswahl-GUI wenn kein Pfad angegeben
if ([string]::IsNullOrWhiteSpace($FolderPath)) {
    Add-Type -AssemblyName System.Windows.Forms
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $dialog.Description = "Ordner auswaehlen, den TidyAI organisieren soll"
    $dialog.ShowNewFolderButton = $false
    $dialog.RootFolder = [System.Environment+SpecialFolder]::MyComputer
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $FolderPath = $dialog.SelectedPath
    } else {
        Write-Host "Kein Ordner ausgewaehlt. Abbruch."
        exit 0
    }
}

# Import Core modules
. (Join-Path $ScriptRoot "Modules\Core\Config.ps1")
. (Join-Path $ScriptRoot "Modules\Core\Utils.ps1")
. (Join-Path $ScriptRoot "Modules\Core\UI.ps1")
. (Join-Path $ScriptRoot "Modules\Core\UndoSystem.ps1")

# Import Scanner modules
. (Join-Path $ScriptRoot "Modules\Scanner\FolderScanner.ps1")
. (Join-Path $ScriptRoot "Modules\Scanner\FileProcessor.ps1")

# Import AI modules
. (Join-Path $ScriptRoot "Modules\AI\OpenAIClient.ps1")
. (Join-Path $ScriptRoot "Modules\AI\ResponseParser.ps1")
. (Join-Path $ScriptRoot "Modules\AI\PromptBuilder.ps1")

# Import Organizer modules
. (Join-Path $ScriptRoot "Modules\Organizer\OrganizationPlanner.ps1")
. (Join-Path $ScriptRoot "Modules\Organizer\FileOrganizer.ps1")

# ==============================================================================
# HAUPT-AUSFÜHRUNGS-FUNKTION
# ==============================================================================

function Main {
    param([string]$TargetFolder)
    
    # Show beautiful logo
    Show-Logo
    
    # Sanitize the folder path (remove extra quotes and normalize)
    $TargetFolder = $TargetFolder.Trim('"').Trim()
    
    # If path ends with a quote, it might be malformed - try to fix it
    if ($TargetFolder.EndsWith('"')) {
        $TargetFolder = $TargetFolder.TrimEnd('"')
    }
    
    # Convert relative paths to absolute paths
    if (-not [System.IO.Path]::IsPathRooted($TargetFolder)) {
        $TargetFolder = Resolve-Path $TargetFolder -ErrorAction SilentlyContinue
        if (-not $TargetFolder) {
            $TargetFolder = Get-Location
        }
    }
    
    # Validate folder path
    if (-not (Test-Path $TargetFolder -PathType Container)) {
        Write-ColorText "Fehler: Ordnerpfad existiert nicht oder ist nicht zugänglich." $Colors.Error
        Write-ColorText "   Pfad: $TargetFolder" $Colors.Warning
        Read-Host "Drücke Enter zum Beenden"
        return
    }
    
    # Store target path for use in Apply-Organization function
    $script:CurrentTargetPath = $TargetFolder
    
    Write-ColorText "Zielordner: " $Colors.Info -NoNewline
    Write-ColorText $TargetFolder $Colors.Accent
    Write-Host ""
    
    # Check for existing undo file and prompt user
    if (Test-UndoFileExists -TargetPath $TargetFolder) {
        $undoPerformed = Show-UndoPrompt -TargetPath $TargetFolder
        if ($undoPerformed) {
            Write-Host ""
            Write-ColorText "Rückgängig-Vorgang abgeschlossen. Beende..." $Colors.Success
            Read-Host "Drücke Enter zum Beenden"
            return
        }
        Write-Host ""
    }
    
    # Step 1: Scan the folder
    $items = Scan-Folder -Path $TargetFolder
    
    if ($items.Count -eq 0) {
        Write-ColorText "Der Ordner scheint leer oder nicht zugänglich zu sein." $Colors.Warning
        Read-Host "Drücke Enter zum Beenden"
        return
    }
    
    # Step 2: Process folder organization
    Start-FileOrganization -Items $items
    
    # Wait for user input before closing
    Write-ColorText "Drücke Enter zum Beenden..." $Colors.Info
    Read-Host
}

# ==============================================================================
# SKRIPT-EINSTIEGSPUNKT
# ==============================================================================

# Ensure we're running in a proper console
if ($Host.Name -eq "ConsoleHost") {
    # Set console properties for better display
    try {
        $Host.UI.RawUI.WindowTitle = "TidyAI - Intelligent Folder Organization"
        $Host.UI.RawUI.BackgroundColor = "Black"
        $Host.UI.RawUI.ForegroundColor = "White"
    }
    catch {
        # Ignore console customization errors
    }
}

# Run the main application
Main -TargetFolder $FolderPath
