# ==============================================================================
# TIDYAI - FILE ORGANIZATION OPERATIONS
# ==============================================================================

function Apply-Organization {
    param([array]$SuggestedStructure, [string]$TargetPath)
    
    Write-ColorText "Wende Organisationsänderungen an..." $Colors.Info
    Write-Host ""
    
    $totalMoves = 0
    $successfulMoves = 0
    $folderOperations = 0
    $successfulFolderOps = 0
    $errorMessages = @()
    
    try {
        foreach ($folder in $SuggestedStructure) {
            $folderPath = Join-Path $TargetPath $folder.folderName
            
            # Create folder if it doesn't exist
            if (-not (Test-Path $folderPath)) {
                New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
                Write-ColorText "Ordner erstellt: $($folder.folderName)" $Colors.Success
            }
            
            # Move items to the folder
            foreach ($item in $folder.items) {
                $sourcePath = Join-Path $TargetPath $item.name
                $destinationPath = Join-Path $folderPath $item.name
                
                try {
                    if (Test-Path $sourcePath) {
                        $sourceItem = Get-Item $sourcePath
                        # Write-ColorText "DEBUG: Processing item '$($item.name)' - IsContainer: $($sourceItem.PSIsContainer)" $Colors.Warning
                        
                        if ($sourceItem.PSIsContainer) {
                            # Moving a folder
                            $folderOperations++
                            # Write-ColorText "DEBUG: Moving folder from '$sourcePath' to '$destinationPath'" $Colors.Warning
                            Move-Item -Path $sourcePath -Destination $destinationPath -Force
                            Write-ColorText "  [DIR] Ordner verschoben: $($item.name)" $Colors.Accent
                            $successfulFolderOps++
                        } else {
                            # Moving a file
                            $totalMoves++
                            Move-Item -Path $sourcePath -Destination $destinationPath -Force
                            $emoji = Get-FileEmoji -Extension ([System.IO.Path]::GetExtension($item.name))
                            Write-ColorText "  $emoji Verschoben: $($item.name)" $Colors.Info
                            $successfulMoves++
                        }
                    } else {
                        # Item not found - this is normal for sample files from folder metadata, skip silently
                        # We never delete any files so we can skip this
                    }
                }
                catch {
                    $errorMessages += "Failed to move $($item.name): $($_.Exception.Message)"
                }
            }
        }
        
        Write-Host ""
        Write-ColorText "Organisation abgeschlossen!" $Colors.Success
        Write-ColorText "$successfulMoves Dateien und $successfulFolderOps Ordner erfolgreich verschoben" $Colors.Info
        
        if ($errorMessages.Count -gt 0) {
            Write-Host ""
            Write-ColorText "Aufgetretene Fehler:" $Colors.Warning
            foreach ($errorMsg in $errors) {
                Write-ColorText "  - $errorMsg" $Colors.Error
            }
        }
    }
    catch {
        Write-ColorText "Fehler während der Organisation: $($_.Exception.Message)" $Colors.Error
    }
}
