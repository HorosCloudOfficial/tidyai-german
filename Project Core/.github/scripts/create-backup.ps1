# Mediathekk Project Backup Script
# Erstellt automatische Backups mit Timestamp

param(
    [string]$ProjectPath = "d:\Mediathekk",
    [string]$BackupPath = "d:\Mediathekk-Backups"
)

# Erstelle Backup-Verzeichnis wenn nicht vorhanden
if (-not (Test-Path $BackupPath)) {
    New-Item -ItemType Directory -Path $BackupPath -Force | Out-Null
    Write-Host "✓ Backup-Verzeichnis erstellt: $BackupPath" -ForegroundColor Green
}

# Timestamp für Backup-Namen
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupName = "Mediathekk_Backup_$timestamp"
$backupFullPath = Join-Path $BackupPath $backupName

Write-Host "`n🔄 Erstelle Backup..." -ForegroundColor Cyan
Write-Host "Quelle: $ProjectPath" -ForegroundColor Gray
Write-Host "Ziel: $backupFullPath" -ForegroundColor Gray

try {
    # Verwende robocopy für schnelles, zuverlässiges Kopieren
    $excludeDirs = @(
        "node_modules",
        ".git",
        "dist",
        "build",
        ".next",
        "__pycache__",
        ".vscode",
        "Mediathekk-Backups",
        "bin",
        "obj"
    )
    
    # Erstelle exclude-Parameter für robocopy
    $excludeParams = @()
    foreach ($dir in $excludeDirs) {
        $excludeParams += "/XD"
        $excludeParams += $dir
    }
    
    # Kopiere mit robocopy (alle Dateien und Ordner, ohne ausgeschlossene)
    $robocopyArgs = @(
        $ProjectPath,
        $backupFullPath,
        "/E",           # Alle Unterverzeichnisse einschließlich leerer
        "/NFL",         # Keine Dateiliste
        "/NDL",         # Keine Verzeichnisliste
        "/NJH",         # Keinen Job-Header
        "/NJS",         # Keine Job-Zusammenfassung
        "/R:0",         # Keine Wiederholungen bei Fehlern
        "/W:0"          # Keine Wartezeit zwischen Wiederholungen
    ) + $excludeParams
    
    Write-Host "📦 Kopiere Dateien..." -ForegroundColor Cyan
    $result = & robocopy @robocopyArgs
    
    # Robocopy exit codes: 0-7 sind OK, >7 ist Fehler
    if ($LASTEXITCODE -gt 7) {
        throw "Robocopy failed with exit code $LASTEXITCODE"
    }
    
    # Erstelle Info-Datei
    $infoContent = @"
Mediathekk Backup Information
=============================
Backup erstellt: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Quelle: $ProjectPath
Backup-Name: $backupName

Ausgeschlossene Verzeichnisse:
$($excludeDirs -join "`n")
"@
    
    $infoContent | Out-File -FilePath (Join-Path $backupFullPath "BACKUP_INFO.txt") -Encoding UTF8
    
    # Berechne Backup-Größe
    $backupSize = (Get-ChildItem -Path $backupFullPath -Recurse | Measure-Object -Property Length -Sum).Sum
    $backupSizeMB = [math]::Round($backupSize / 1MB, 2)
    
    Write-Host "`n✅ Backup erfolgreich erstellt!" -ForegroundColor Green
    Write-Host "📁 Speicherort: $backupFullPath" -ForegroundColor Cyan
    Write-Host "📊 Größe: $backupSizeMB MB" -ForegroundColor Cyan
    
    # Liste der letzten 5 Backups anzeigen
    Write-Host "`n📋 Letzte Backups:" -ForegroundColor Yellow
    Get-ChildItem -Path $BackupPath -Directory | 
        Sort-Object CreationTime -Descending | 
        Select-Object -First 5 | 
        ForEach-Object {
            $size = [math]::Round(((Get-ChildItem -Path $_.FullName -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB), 2)
            Write-Host "  • $($_.Name) ($size MB) - $($_.CreationTime.ToString('yyyy-MM-dd HH:mm'))" -ForegroundColor Gray
        }
    
    # Cleanup alte Backups (behalte nur die letzten 10)
    $allBackups = Get-ChildItem -Path $BackupPath -Directory | Sort-Object CreationTime -Descending
    if ($allBackups.Count -gt 10) {
        Write-Host "`n🧹 Bereinige alte Backups (behalte nur die letzten 10)..." -ForegroundColor Yellow
        $allBackups | Select-Object -Skip 10 | ForEach-Object {
            Remove-Item -Path $_.FullName -Recurse -Force
            Write-Host "  ✓ Gelöscht: $($_.Name)" -ForegroundColor Gray
        }
    }
    
} catch {
    Write-Host "`n❌ Fehler beim Erstellen des Backups!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

Write-Host "`n✨ Backup-Prozess abgeschlossen!`n" -ForegroundColor Green
