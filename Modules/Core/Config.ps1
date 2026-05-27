# ==============================================================================
# TIDYAI - KONFIGURATION & KONSTANTEN
# ==============================================================================

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

# Groq API Configuration (kostenlos: https://console.groq.com)
# Registry-Fallback: User-Umgebungsvariablen werden von Child-Prozessen nicht immer geerbt
if ([string]::IsNullOrWhiteSpace($env:TidyAIGroqAPIKey)) {
    $regVal = (Get-ItemProperty -Path "HKCU:\Environment" -Name "TidyAIGroqAPIKey" -ErrorAction SilentlyContinue).TidyAIGroqAPIKey
    if ($regVal) { $env:TidyAIGroqAPIKey = $regVal }
}
$OPENAI_API_KEY = if ($env:TidyAIGroqAPIKey) { $env:TidyAIGroqAPIKey } else { $env:TidyAIOpenAIAPIKey }
$OPENAI_API_URL = "https://api.groq.com/openai/v1/chat/completions"

# Check if API key is configured
if ([string]::IsNullOrWhiteSpace($OPENAI_API_KEY)) {
    Write-ColorText "Fehler: Groq API-Schlüssel nicht konfiguriert!" $Colors.Error
    Write-Host ""
    Write-ColorText "Kostenlosen Schlüssel holen: https://console.groq.com" $Colors.Info
    Write-ColorText "Dann setzen mit:" $Colors.Info
    Write-ColorText "  `$env:TidyAIGroqAPIKey = 'gsk_...'" $Colors.Accent
    Write-Host ""
    Write-ColorText "Oder dauerhaft:" $Colors.Info
    Write-ColorText "  [Environment]::SetEnvironmentVariable('TidyAIGroqAPIKey', 'gsk_...', 'User')" $Colors.Accent
    Write-Host ""
    Read-Host "Drücke Enter zum Beenden"
    return
}

# File type icons for better visual representation (ASCII only)
$FileEmojis = @{
    ".txt"      = "[TXT]"
    ".doc"      = "[DOC]"
    ".docx"     = "[DOC]"
    ".pdf"      = "[PDF]"
    ".jpg"      = "[IMG]"
    ".jpeg"     = "[IMG]"
    ".png"      = "[IMG]"
    ".gif"      = "[IMG]"
    ".mp4"      = "[VID]"
    ".avi"      = "[VID]"
    ".mkv"      = "[VID]"
    ".mp3"      = "[AUD]"
    ".wav"      = "[AUD]"
    ".zip"      = "[ZIP]"
    ".rar"      = "[ZIP]"
    ".exe"      = "[EXE]"
    ".msi"      = "[EXE]"
    ".lnk"      = "[LNK]"
    ".cmd"      = "[CMD]"
    ".py"       = "[PY]"
    ".js"       = "[JS]"
    ".html"     = "[HTM]"
    ".css"      = "[CSS]"
    ".json"     = "[JSN]"
    ".xml"      = "[XML]"
    ".csv"      = "[CSV]"
    ".xlsx"     = "[XLS]"
    ".xls"      = "[XLS]"
    "folder"    = "[DIR]"
    "default"   = "[FILE]"
}
