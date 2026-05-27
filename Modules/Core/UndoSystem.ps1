# ==============================================================================
# TIDYAI - RÜCKGÄNGIG-SYSTEM
# Verwaltet Sicherung und Wiederherstellung der Ordnerorganisation
# ==============================================================================

function Test-UndoFileExists {
    param([string]$TargetPath)
    
    $undoFilePath = Join-Path $TargetPath ".tidyai"
    return Test-Path $undoFilePath
}

function Get-UndoFilePath {
    param([string]$TargetPath)
    
    return Join-Path $TargetPath ".tidyai"
}

function Save-OrganizationState {
    param(
        [string]$TargetPath,
        [array]$OriginalStructure,
        [array]$NewStructure
    )
    
    try {
        $undoFilePath = Get-UndoFilePath -TargetPath $TargetPath
        
        # Create undo data structure
        $undoData = @{
            timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            targetPath = $TargetPath
            originalStructure = $OriginalStructure
            newStructure = $NewStructure
            version = "2.0.0"
        }
        
        # Save as JSON with hidden attribute
        $jsonData = $undoData | ConvertTo-Json -Depth 10
        $jsonData | Out-File -FilePath $undoFilePath -Encoding UTF8
        
        # Make file hidden
        $file = Get-Item $undoFilePath
        $file.Attributes = $file.Attributes -bor [System.IO.FileAttributes]::Hidden
        
        Write-ColorText "Rückgängig-Informationen erfolgreich gespeichert" $Colors.Success
        return $true
    }
    catch {
        Write-ColorText "Fehler beim Speichern der Rückgängig-Informationen: $($_.Exception.Message)" $Colors.Error
        return $false
    }
}

function Get-UndoData {
    param([string]$TargetPath)
    
    try {
        $undoFilePath = Get-UndoFilePath -TargetPath $TargetPath
        
        if (-not (Test-Path $undoFilePath)) {
            return $null
        }
        
        $jsonContent = Get-Content $undoFilePath -Raw -Encoding UTF8
        $undoData = $jsonContent | ConvertFrom-Json
        
        return $undoData
    }
    catch {
        Write-ColorText "Fehler beim Lesen der Rückgängig-Daten: $($_.Exception.Message)" $Colors.Error
        return $null
    }
}

function Invoke-UndoOrganization {
    param([string]$TargetPath)
    
    try {
        Write-ColorText "Starte Rückgängig-Vorgang..." $Colors.Info
        
        $undoData = Get-UndoData -TargetPath $TargetPath
        if (-not $undoData) {
            Write-ColorText "Keine Rückgängig-Daten gefunden" $Colors.Error
            return $false
        }
        
        Write-ColorText "Stelle ursprüngliche Ordnerstruktur wieder her..." $Colors.Info
        Write-ColorText "Organisation von: $($undoData.timestamp)" $Colors.Accent
        
        # Use the original structure data to restore files properly
        $restoredCount = 0
        $skippedCount = 0
        
        # Get all organized folders (created by TidyAI)
        $organizedFolders = Get-ChildItem $TargetPath -Directory -Force | Where-Object { $_.Name -ne ".tidyai" }
        
        foreach ($folder in $organizedFolders) {
            Write-ColorText "  Verarbeite Ordner: $($folder.Name)" $Colors.Accent
            $folderContents = Get-ChildItem $folder.FullName -Force
            
            foreach ($content in $folderContents) {
                $destinationPath = Join-Path $TargetPath $content.Name
                
                try {
                    if (Test-Path $destinationPath) {
                        # File already exists in root - this indicates a conflict or duplicate
                        Write-ColorText "    Konflikt: $($content.Name) existiert bereits im Hauptverzeichnis - überschreibe" $Colors.Warning
                        Remove-Item $destinationPath -Force
                    }
                    
                    # Move the file back to root
                    Move-Item $content.FullName $destinationPath -Force
                    Write-ColorText "    Wiederhergestellt: $($content.Name)" $Colors.Info
                    $restoredCount++
                }
                catch {
                    Write-ColorText "    Fehler beim Wiederherstellen: $($content.Name) - $($_.Exception.Message)" $Colors.Error
                    $skippedCount++
                }
            }
            
            # Remove the organized folder if it's empty
            $remainingContents = Get-ChildItem $folder.FullName -Force
            if ($remainingContents.Count -eq 0) {
                Remove-Item $folder.FullName -Force
                Write-ColorText "    Leeren Ordner entfernt: $($folder.Name)" $Colors.Success
            } else {
                Write-ColorText "    Warnung: Ordner $($folder.Name) enthält noch $($remainingContents.Count) Elemente" $Colors.Warning
            }
        }
        
        Write-ColorText "Wiederherstellungszusammenfassung: $restoredCount Dateien wiederhergestellt, $skippedCount fehlgeschlagen" $Colors.Info
        
        # Remove undo file
        $undoFilePath = Get-UndoFilePath -TargetPath $TargetPath
        Remove-Item $undoFilePath -Force
        
        Write-ColorText "Rückgängig erfolgreich abgeschlossen!" $Colors.Success
        Write-ColorText "Ursprüngliche Ordnerstruktur wurde wiederhergestellt." $Colors.Info
        
        return $true
    }
    catch {
        Write-ColorText "Fehler während Rückgängig-Vorgang: $($_.Exception.Message)" $Colors.Error
        return $false
    }
}

function Show-UndoPrompt {
    param([string]$TargetPath)
    
    $undoData = Get-UndoData -TargetPath $TargetPath
    if (-not $undoData) {
        return $false
    }
    
    Write-ColorText "========================================" $Colors.Primary
    Write-ColorText "TIDYAI WAR SCHON EINMAL HIER!" $Colors.Warning
    Write-ColorText "========================================" $Colors.Primary
    Write-ColorText "Dieser Ordner wurde organisiert am: $($undoData.timestamp)" $Colors.Info
    Write-ColorText "Pfad: $($undoData.targetPath)" $Colors.Accent
    Write-Host ""
    Write-ColorText "Was möchtest du tun?" $Colors.Info
    Write-ColorText "  [J] Rückgängig - Stelle die ursprüngliche chaotische Struktur wieder her" $Colors.Warning
    Write-ColorText "  [N] Fortfahren - Organisiere erneut mit frischen KI-Vorschlägen" $Colors.Success
    Write-Host ""
    
    $response = Read-Host "Deine Wahl (J/N)"
    
    if ($response -match '^[JjYy]') {
        return Invoke-UndoOrganization -TargetPath $TargetPath
    } else {
        Write-ColorText "Behalte aktuelle Organisation. Fahre mit neuer Organisation fort..." $Colors.Info
        # Remove old undo file since user wants to keep current state
        $undoFilePath = Get-UndoFilePath -TargetPath $TargetPath
        Remove-Item $undoFilePath -Force -ErrorAction SilentlyContinue
        return $false
    }
}

function Show-PostOrganizationPrompt {
    param([string]$TargetPath)
    
    Write-Host ""
    Write-ColorText "========================================" $Colors.Primary
    Write-ColorText "*** ORGANISATION ABGESCHLOSSEN! ***" $Colors.Success
    Write-ColorText "========================================" $Colors.Primary
    Write-ColorText "Deine Dateien wurden erfolgreich organisiert!" $Colors.Info
    Write-Host ""
    Write-ColorText "Wie sieht es aus?" $Colors.Info
    Write-ColorText "  [B] Behalten - Ich liebe die neue Organisation!" $Colors.Success
    Write-ColorText "  [R] Rückgängig - Stelle alles wieder her, wie es war" $Colors.Warning
    Write-Host ""
    
    $response = Read-Host "Deine Entscheidung (B/R)"
    
    if ($response -match '^[RrUu]') {
        Write-Host ""
        if (Invoke-UndoOrganization -TargetPath $TargetPath) {
            Write-ColorText "Organisation wurde erfolgreich rückgängig gemacht!" $Colors.Success
        } else {
            Write-ColorText "Fehler beim Rückgängigmachen der Organisation" $Colors.Error
        }
    } else {
        Write-ColorText "Behalte die neue Organisation. Rückgängig-Daten bleiben verfügbar." $Colors.Success
        Write-ColorText "Du kannst TidyAI später erneut ausführen, um diese Organisation rückgängig zu machen." $Colors.Info
    }
}
