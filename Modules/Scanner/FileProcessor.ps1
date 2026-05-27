# ==============================================================================
# TIDYAI - FILE PROCESSING FUNCTIONS
# ==============================================================================

function New-BatchJson {
    param([array]$Items, [array]$ExistingStructure = @(), [string]$Context = "General")
    
    # Create minimal data structure for batch (name + type only to keep payload small)
    $minimalItems = @()
    foreach ($item in $Items) {
        if ([string]::IsNullOrEmpty($item.name)) { continue }
        $minimalItems += @{ name = $item.name; type = $item.type }
    }
    
    # Include existing folder structure for context
    $existingFolders = @()
    foreach ($folder in $ExistingStructure) {
        if (![string]::IsNullOrEmpty($folder.folderName)) {
            $existingFolders += $folder.folderName
        }
    }
    
    $batchInfo = @{ items = $minimalItems }
    
    # Debug: Show what we're sending to AI
    # $fileCount = ($minimalItems | Where-Object { $_.type -eq "file" }).Count
    # $folderCount = ($minimalItems | Where-Object { $_.type -eq "folder" }).Count
    # Write-ColorText "DEBUG: Sending $($minimalItems.Count) items to AI ($fileCount files, $folderCount folders)" $Colors.Warning
    # if ($minimalItems.Count -gt 0) {
    #     $sampleItem = $minimalItems[0]
    #     Write-ColorText "DEBUG: Sample item: $($sampleItem.name) (type: $($sampleItem.type))" $Colors.Warning
    #     if ($folderCount -gt 0) {
    #         $sampleFolder = $minimalItems | Where-Object { $_.type -eq "folder" } | Select-Object -First 1
    #         if ($sampleFolder) {
    #             Write-ColorText "DEBUG: Sample folder: $($sampleFolder.name) ($($sampleFolder.fileCount) files inside)" $Colors.Warning
    #         }
    #     }
    # }
    
    return $batchInfo | ConvertTo-Json -Depth 5
}
