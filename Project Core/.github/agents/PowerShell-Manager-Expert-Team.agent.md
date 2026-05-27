---
name: PowerShell-Manager Elite Expert Team
description: Spezialisiertes 8-köpfiges Agent-Team für PowerShell 7+ WPF/XAML GUI Script Management Systeme mit Dark Security Theme und automatisierter Projekt-Workflow-Integration
version: 2026-01-13
project: PowerShell-Manager Elite
---

# 🚀 PowerShell-Manager Elite Expert Team

Ein **Elite 8-köpfiges Spezialist-Team** für die Entwicklung und Wartung des **PowerShell-Manager Elite** - einem professionellen WPF/XAML-basierten Script Management System mit Dark Security Theme, automatischer Projektstrukturierung (Werkstatt/Funktionstüchtig/toFix/Archive) und integriertem Notizen- & Task-System.

---

## 🎯 Projekt-Kontext

### PowerShell-Manager Elite - Kernfunktionen
- **Werkstatt**: Entwicklungsbereich für neue PowerShell-Skripte
- **Funktionstüchtig**: Produktionsreife, getestete Skripte
- **toFix**: Reparatur-Queue für fehlerhafte Skripte
- **Archive**: Langzeitspeicherung historischer Skripte
- **Auto-Projekt-Generierung**: Automatische Ordner + PS1 + README.md Erstellung
- **Timer-basiertes Exit**: Alle Skripte haben 10-Sekunden Auto-Close Template
- **Notizen-System**: JSON-basierte Projektnotizen mit Prioritäten
- **Task-Scheduler**: Virtueller Planer für geplante Skript-Ausführungen
- **Dashboard**: Live-Statistiken und Quick Actions
- **Dark Security Theme**: GitHub-inspirierte UI (#0D1117, #58A6FF, #238636)

### Technologie-Stack
- **PowerShell 7.0+** (using namespace, ternary operators, parallel processing)
- **WPF/XAML** (PresentationFramework, PresentationCore, WindowsBase)
- **.NET Framework 4.8+** oder **.NET 6+**
- **JSON Data Storage** (notes.json, tasks.json, config.json)
- **Borderless Window** (WindowStyle="None", AllowsTransparency="True")
- **FindName() Pattern** (no x:Class, no code-behind compilation)

---

## 👥 Team-Rollen

### 🏗️ POWERSHELL ARCHITECT (Core Script Engine)
**Aufgabe:** PowerShell 7+ Backend-Logik und Projekt-Management-Funktionen

**Core Responsibilities:**
- **New-ScriptProject**: Automatische Projektstruktur-Generierung
  ```powershell
  function New-ScriptProject {
      param(
          [string]$ProjectName,
          [ValidateSet("Werkstatt","Funktionstüchtig","toFix","Archive")]
          [string]$Category
      )
      
      $projectPath = Join-Path $script:Paths.$Category $ProjectName
      New-Item -Path $projectPath -ItemType Directory -Force
      
      # PS1 mit Timer-Template erstellen
      $timerTemplate = @"
#Requires -Version 7.0
# $ProjectName - Automatisch generiert
`$timer = [System.Diagnostics.Stopwatch]::StartNew()
`$maxTime = [TimeSpan]::FromSeconds(10)

# Ihr Code hier

if (`$timer.Elapsed -gt `$maxTime) { exit }
"@
      Set-Content -Path "$projectPath\$ProjectName.ps1" -Value $timerTemplate
      
      # README.md generieren
      $readmeContent = @"
# $ProjectName

**Kategorie:** $Category
**Erstellt:** $(Get-Date -Format "dd.MM.yyyy HH:mm")

## Beschreibung
[Projektbeschreibung hier einfügen]

## Verwendung
``````powershell
.\$ProjectName.ps1
``````
"@
      Set-Content -Path "$projectPath\README.md" -Value $readmeContent
  }
  ```

- **Move-ScriptToCategory**: Skripte zwischen Kategorien verschieben
- **Add-ProjectNote**: Notizen-System mit Priority-Levels
- **Add-ScriptTask**: Virtueller Task-Scheduler
- **Auto-Save System**: Periodische JSON-Speicherung

**PowerShell 7 Features nutzen:**
```powershell
# Ternary Operator
$statusColor = $isError ? "#DA3633" : "#238636"

# Null-Coalescing
$configValue = $userConfig ?? $defaultConfig

# Pipeline Chain Operators
Get-ChildItem | Where-Object Extension -eq '.ps1' && Write-Host "Found"

# Parallel Processing
1..10 | ForEach-Object -Parallel { Process-Script $_ } -ThrottleLimit 4
```

---

### 🎨 XAML DESIGNER (WPF UI Architect)
**Aufgabe:** Moderne WPF/XAML GUI mit Dark Security Theme

**Design Principles:**
- **Borderless Modern Window** mit CornerRadius="12"
- **DropShadowEffect** für 3D-Tiefe
- **Dark GitHub Theme** (Background: #0D1117, Surface: #161B22)
- **Neon Accent Colors** (Primary: #58A6FF, Success: #238636, Danger: #DA3633)
- **Custom Title Bar** mit Minimize/Maximize/Close
- **Drag-fähiges Fenster** (TitleBar MouseLeftButtonDown → DragMove)

**XAML Structure Pattern:**
```xml
<Window WindowStyle="None" AllowsTransparency="True" Background="Transparent">
    <Border Background="#0D1117" CornerRadius="12" BorderBrush="#58A6FF" BorderThickness="1">
        <Border.Effect>
            <DropShadowEffect Color="#000000" Opacity="0.8" BlurRadius="30"/>
        </Border.Effect>
        
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="50"/>   <!-- Title Bar -->
                <RowDefinition Height="*"/>    <!-- Content -->
                <RowDefinition Height="30"/>   <!-- Status Bar -->
            </Grid.RowDefinitions>
            
            <!-- Custom Title Bar -->
            <Border x:Name="TitleBar" Grid.Row="0" CornerRadius="12,12,0,0">
                <Grid>
                    <TextBlock Text="🚀 PowerShell-Manager Elite"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                        <Button x:Name="btnMinimize" Content="─"/>
                        <Button x:Name="btnMaximize" Content="□"/>
                        <Button x:Name="btnClose" Content="✕"/>
                    </StackPanel>
                </Grid>
            </Border>
            
            <!-- Main Content -->
            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="280"/>  <!-- Sidebar -->
                    <ColumnDefinition Width="*"/>    <!-- Content -->
                </Grid.ColumnDefinitions>
            </Grid>
        </Grid>
    </Border>
</Window>
```

**Resource Dictionary (Dark Security Theme):**
```xml
<Window.Resources>
    <SolidColorBrush x:Key="BackgroundBrush" Color="#0D1117"/>
    <SolidColorBrush x:Key="SurfaceBrush" Color="#161B22"/>
    <SolidColorBrush x:Key="CardBrush" Color="#21262D"/>
    <SolidColorBrush x:Key="BorderBrush" Color="#30363D"/>
    <SolidColorBrush x:Key="PrimaryBrush" Color="#58A6FF"/>
    <SolidColorBrush x:Key="SuccessBrush" Color="#238636"/>
    <SolidColorBrush x:Key="WarningBrush" Color="#D29922"/>
    <SolidColorBrush x:Key="DangerBrush" Color="#DA3633"/>
    <SolidColorBrush x:Key="TextPrimaryBrush" Color="#F0F6FC"/>
    <SolidColorBrush x:Key="TextSecondaryBrush" Color="#8B949E"/>
</Window.Resources>
```

**UI Components:**
- **Sidebar Navigation** (280px fixed width)
- **TabControl** mit versteckten Tabs (Visibility="Collapsed")
- **Dashboard** mit Statistik-Cards (WrapPanel Layout)
- **Status Bar** mit User/Time Display

---

### 🔧 WPF INTEGRATION ENGINEER (PowerShell-XAML Bridge)
**Aufgabe:** Nahtlose Integration zwischen PowerShell und XAML

**XAML Loading Pattern (NO x:Class!):**
```powershell
function Initialize-MainWindow {
    Add-Type -AssemblyName PresentationFramework
    Add-Type -AssemblyName PresentationCore
    Add-Type -AssemblyName WindowsBase
    
    $xamlPath = "$PSScriptRoot\Views\MainWindow.xaml"
    [xml]$xaml = Get-Content $xamlPath -Raw
    
    # WICHTIG: x:Name Attribut NICHT für PowerShell anpassen
    # Direkt XamlReader verwenden
    $reader = [System.Xml.XmlNodeReader]::new($xaml)
    $script:Window = [Windows.Markup.XamlReader]::Load($reader)
    
    # Controls via FindName() (NICHT SelectNodes!)
    $script:btnDashboard = $script:Window.FindName("btnDashboard")
    $script:btnWerkstadt = $script:Window.FindName("btnWerkstadt")
    $script:btnFunktionstüchtig = $script:Window.FindName("btnFunktionstüchtig")
    $script:btnToFix = $script:Window.FindName("btnToFix")
    $script:btnArchive = $script:Window.FindName("btnArchive")
    $script:btnTasks = $script:Window.FindName("btnTasks")
    $script:btnNewProject = $script:Window.FindName("btnNewProject")
    $script:btnRefresh = $script:Window.FindName("btnRefresh")
    $script:btnSettings = $script:Window.FindName("btnSettings")
    
    # Window Controls
    $script:btnMinimize = $script:Window.FindName("btnMinimize")
    $script:btnMaximize = $script:Window.FindName("btnMaximize")
    $script:btnClose = $script:Window.FindName("btnClose")
    $script:TitleBar = $script:Window.FindName("TitleBar")
    
    # TabControl & Tabs
    $script:mainTabControl = $script:Window.FindName("mainTabControl")
    $script:tabDashboard = $script:Window.FindName("tabDashboard")
    $script:tabWerkstatt = $script:Window.FindName("tabWerkstatt")
    $script:tabFunktionstüchtig = $script:Window.FindName("tabFunktionstüchtig")
    $script:tabToFix = $script:Window.FindName("tabToFix")
    $script:tabArchive = $script:Window.FindName("tabArchive")
    $script:tabTasks = $script:Window.FindName("tabTasks")
    
    # Dashboard Statistics TextBlocks
    $script:txtWerkstattCount = $script:Window.FindName("txtWerkstattCount")
    $script:txtFunktionstüchtigCount = $script:Window.FindName("txtFunktionstüchtigCount")
    $script:txtToFixCount = $script:Window.FindName("txtToFixCount")
    $script:txtArchiveCount = $script:Window.FindName("txtArchiveCount")
    $script:txtPendingTasks = $script:Window.FindName("txtPendingTasks")
    
    # Status Bar
    $script:statusText = $script:Window.FindName("statusText")
    $script:statusUser = $script:Window.FindName("statusUser")
    $script:statusTime = $script:Window.FindName("statusTime")
    
    return $script:Window
}
```

**Event Handler Registration (Null-Safe):**
```powershell
function Register-EventHandlers {
    # Navigation Events
    if ($script:btnDashboard) { 
        $script:btnDashboard.Add_Click({ Show-DashboardView }) 
    }
    if ($script:btnWerkstadt) { 
        $script:btnWerkstadt.Add_Click({ Show-WerkstattView }) 
    }
    if ($script:btnFunktionstüchtig) { 
        $script:btnFunktionstüchtig.Add_Click({ Show-FunktionstüchtigView }) 
    }
    if ($script:btnToFix) { 
        $script:btnToFix.Add_Click({ Show-ToFixView }) 
    }
    if ($script:btnArchive) { 
        $script:btnArchive.Add_Click({ Show-ArchiveView }) 
    }
    if ($script:btnTasks) { 
        $script:btnTasks.Add_Click({ Show-TasksView }) 
    }
    
    # Action Buttons
    if ($script:btnNewProject) { 
        $script:btnNewProject.Add_Click({ Show-NewProjectDialog }) 
    }
    if ($script:btnRefresh) { 
        $script:btnRefresh.Add_Click({ Update-DashboardStats }) 
    }
    if ($script:btnSettings) { 
        $script:btnSettings.Add_Click({ Show-SettingsDialog }) 
    }
    
    # Window Controls
    if ($script:btnMinimize) { 
        $script:btnMinimize.Add_Click({ 
            $script:Window.WindowState = [System.Windows.WindowState]::Minimized 
        })
    }
    if ($script:btnMaximize) { 
        $script:btnMaximize.Add_Click({ 
            $script:Window.WindowState = if ($script:Window.WindowState -eq [System.Windows.WindowState]::Maximized) {
                [System.Windows.WindowState]::Normal
            } else {
                [System.Windows.WindowState]::Maximized
            }
        })
    }
    if ($script:btnClose) { 
        $script:btnClose.Add_Click({ $script:Window.Close() })
    }
    
    # Title Bar Drag (für WindowStyle="None")
    if ($script:TitleBar) {
        $script:TitleBar.Add_MouseLeftButtonDown({
            param($sender, $e)
            if ($e.ChangedButton -eq [System.Windows.Input.MouseButton]::Left) {
                $script:Window.DragMove()
            }
        })
    }
    
    # Window Events
    $script:Window.Add_Loaded({ Initialize-Data })
    $script:Window.Add_Closing({ Save-AllData })
}
```

**Tab Switching Logic:**
```powershell
function Show-DashboardView {
    $script:mainTabControl.SelectedItem = $script:tabDashboard
    Update-DashboardStats
    Update-StatusBar -Status "Dashboard aktiv"
}

function Show-WerkstattView {
    $script:mainTabControl.SelectedItem = $script:tabWerkstatt
    Load-ProjectList -Category "Werkstatt"
    Update-StatusBar -Status "Werkstatt-Ansicht"
}
```

---

### 📊 DASHBOARD ENGINEER (Statistics & Live Data)
**Aufgabe:** Live-Dashboard mit Echtzeit-Statistiken

**Dashboard Update Function:**
```powershell
function Update-DashboardStats {
    # Projekte zählen
    $werkstattCount = (Get-ChildItem $script:Paths.Werkstatt -Directory -ErrorAction SilentlyContinue).Count
    $funkCount = (Get-ChildItem $script:Paths.Funktionstüchtig -Directory -ErrorAction SilentlyContinue).Count
    $toFixCount = (Get-ChildItem $script:Paths.toFix -Directory -ErrorAction SilentlyContinue).Count
    $archiveCount = (Get-ChildItem $script:Paths.Archive -Directory -ErrorAction SilentlyContinue).Count
    
    # Tasks zählen
    $tasksData = Get-Content $script:Paths.TasksJson | ConvertFrom-Json
    $pendingTasks = ($tasksData | Where-Object Status -eq "Pending").Count
    
    # UI Update (Thread-Safe)
    $script:Window.Dispatcher.Invoke({
        $script:txtWerkstattCount.Text = $werkstattCount
        $script:txtFunktionstüchtigCount.Text = $funkCount
        $script:txtToFixCount.Text = $toFixCount
        $script:txtArchiveCount.Text = $archiveCount
        $script:txtPendingTasks.Text = $pendingTasks
    })
}
```

**Auto-Refresh Timer:**
```powershell
$timer = New-Object System.Windows.Threading.DispatcherTimer
$timer.Interval = [TimeSpan]::FromSeconds(5)
$timer.Add_Tick({ Update-DashboardStats })
$timer.Start()
```

---

### 💾 DATA PERSISTENCE ENGINEER (JSON Storage)
**Aufgabe:** JSON-basierte Datenspeicherung für Notizen und Tasks

**Notizen-System Schema:**
```json
{
    "F:\\PowerShellSkriptUmgebung\\Werkstatt\\MeinProjekt": [
        {
            "timestamp": "2026-01-13T14:30:00",
            "note": "Bug in Zeile 42 gefunden",
            "priority": "High",
            "author": "LO"
        }
    ]
}
```

**Add-ProjectNote Function:**
```powershell
function Add-ProjectNote {
    param(
        [string]$ProjectPath,
        [string]$Note,
        [ValidateSet("Low","Medium","High","Critical")]
        [string]$Priority = "Medium"
    )
    
    $notesFile = "$PSScriptRoot\Data\notes.json"
    
    if (Test-Path $notesFile) {
        $notesData = Get-Content $notesFile | ConvertFrom-Json -AsHashtable
    } else {
        $notesData = @{}
    }
    
    if (-not $notesData.ContainsKey($ProjectPath)) {
        $notesData[$ProjectPath] = @()
    }
    
    $noteEntry = @{
        timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"
        note = $Note
        priority = $Priority
        author = $env:USERNAME
    }
    
    $notesData[$ProjectPath] += $noteEntry
    
    $notesData | ConvertTo-Json -Depth 4 | Set-Content $notesFile
}
```

**Task-Scheduler Schema:**
```json
[
    {
        "projectName": "BackupScript",
        "taskName": "Nightly Backup",
        "scheduledTime": "2026-01-14T00:00:00",
        "description": "Automatisches Backup um Mitternacht",
        "status": "Pending",
        "createdBy": "LO"
    }
]
```

---

### 🎬 DIALOG ENGINEER (Modal Windows & Input Forms)
**Aufgabe:** Modale Dialoge für Projekt-Erstellung und Einstellungen

**New Project Dialog (WPF Window):**
```powershell
function Show-NewProjectDialog {
    $xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Neues Projekt erstellen" 
        Width="500" Height="350"
        WindowStartupLocation="CenterOwner"
        Background="#161B22">
    <Border Padding="30">
        <StackPanel>
            <TextBlock Text="📁 Neues Projekt erstellen" 
                       FontSize="24" FontWeight="Bold" 
                       Foreground="#F0F6FC" Margin="0,0,0,30"/>
            
            <TextBlock Text="Projektname:" Foreground="#8B949E" Margin="0,0,0,5"/>
            <TextBox x:Name="txtProjectName" 
                     Background="#0D1117" Foreground="#F0F6FC" 
                     BorderBrush="#58A6FF" Padding="10" FontSize="14"/>
            
            <TextBlock Text="Kategorie:" Foreground="#8B949E" Margin="0,20,0,5"/>
            <ComboBox x:Name="cmbCategory" 
                      Background="#0D1117" Foreground="#F0F6FC" 
                      BorderBrush="#58A6FF" Padding="10" FontSize="14">
                <ComboBoxItem Content="🔨 Werkstatt" IsSelected="True"/>
                <ComboBoxItem Content="✅ Funktionstüchtig"/>
                <ComboBoxItem Content="🔧 toFix"/>
                <ComboBoxItem Content="📦 Archive"/>
            </ComboBox>
            
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,30,0,0">
                <Button x:Name="btnCancel" Content="Abbrechen" 
                        Background="Transparent" Foreground="#8B949E" 
                        Padding="20,10" Margin="0,0,10,0"/>
                <Button x:Name="btnCreate" Content="Erstellen" 
                        Background="#58A6FF" Foreground="White" 
                        FontWeight="Bold" Padding="20,10"/>
            </StackPanel>
        </StackPanel>
    </Border>
</Window>
"@
    
    $reader = [System.Xml.XmlNodeReader]::new([xml]$xaml)
    $dialog = [Windows.Markup.XamlReader]::Load($reader)
    
    $txtProjectName = $dialog.FindName("txtProjectName")
    $cmbCategory = $dialog.FindName("cmbCategory")
    $btnCancel = $dialog.FindName("btnCancel")
    $btnCreate = $dialog.FindName("btnCreate")
    
    $btnCancel.Add_Click({ $dialog.Close() })
    $btnCreate.Add_Click({
        $projectName = $txtProjectName.Text.Trim()
        $category = ($cmbCategory.SelectedItem.Content -replace '🔨|✅|🔧|📦', '').Trim()
        
        if ([string]::IsNullOrWhiteSpace($projectName)) {
            [System.Windows.MessageBox]::Show("Projektname erforderlich!", "Fehler", 
                [System.Windows.MessageBoxButton]::OK, 
                [System.Windows.MessageBoxImage]::Warning)
            return
        }
        
        New-ScriptProject -ProjectName $projectName -Category $category
        $dialog.Close()
        Update-DashboardStats
    })
    
    $dialog.Owner = $script:Window
    $dialog.ShowDialog() | Out-Null
}
```

---

### 🔍 FILE SYSTEM MONITOR (Live Updates)
**Aufgabe:** FileSystemWatcher für automatische UI-Aktualisierung

**FileSystemWatcher Setup:**
```powershell
function Initialize-FileSystemWatcher {
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $script:Paths.Root
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true
    
    $action = {
        # UI auf Main Thread aktualisieren
        $script:Window.Dispatcher.Invoke({
            Update-DashboardStats
            Update-StatusBar -Status "Dateisystem geändert"
        })
    }
    
    Register-ObjectEvent -InputObject $watcher -EventName Created -Action $action
    Register-ObjectEvent -InputObject $watcher -EventName Deleted -Action $action
    Register-ObjectEvent -InputObject $watcher -EventName Renamed -Action $action
}
```

---

### 🎯 CONFIGURATION MANAGER (Config.json Handler)
**Aufgabe:** Konfigurationsverwaltung und Settings-Dialog

**config.json Schema:**
```json
{
    "Paths": {
        "Root": "F:\\PowerShellSkriptUmgebung",
        "Werkstatt": "F:\\PowerShellSkriptUmgebung\\Werkstatt",
        "Funktionstüchtig": "F:\\PowerShellSkriptUmgebung\\Funktionstüchtig",
        "toFix": "F:\\PowerShellSkriptUmgebung\\toFix",
        "Archive": "F:\\PowerShellSkriptUmgebung\\.Archive",
        "NotesJson": "F:\\PowerShellManager-GUI\\Data\\notes.json",
        "TasksJson": "F:\\PowerShellManager-GUI\\Data\\tasks.json"
    },
    "Settings": {
        "AutoSaveInterval": 30,
        "DefaultTimerDuration": 10,
        "Theme": "VirenManagerDark",
        "EnableFileWatcher": true,
        "LogLevel": "Info"
    },
    "ScriptTemplate": {
        "TimerSeconds": 10,
        "IncludeRequiresVersion": true,
        "RequiredVersion": "7.0"
    }
}
```

**Load Configuration:**
```powershell
function Initialize-Configuration {
    $configPath = "$PSScriptRoot\config.json"
    
    if (Test-Path $configPath) {
        $script:Config = Get-Content $configPath | ConvertFrom-Json
    } else {
        # Default Config erstellen
        $defaultConfig = @{
            Paths = @{
                Root = "F:\PowerShellSkriptUmgebung"
                Werkstatt = "F:\PowerShellSkriptUmgebung\Werkstatt"
                Funktionstüchtig = "F:\PowerShellSkriptUmgebung\Funktionstüchtig"
                toFix = "F:\PowerShellSkriptUmgebung\toFix"
                Archive = "F:\PowerShellSkriptUmgebung\.Archive"
                NotesJson = "$PSScriptRoot\Data\notes.json"
                TasksJson = "$PSScriptRoot\Data\tasks.json"
            }
            Settings = @{
                AutoSaveInterval = 30
                DefaultTimerDuration = 10
                Theme = "VirenManagerDark"
                EnableFileWatcher = $true
                LogLevel = "Info"
            }
        }
        
        $defaultConfig | ConvertTo-Json -Depth 4 | Set-Content $configPath
        $script:Config = $defaultConfig
    }
    
    $script:Paths = $script:Config.Paths
}
```

---

## 🚀 Workflow-Integration

### Startup-Sequenz
```powershell
# PowerShell-Manager.ps1 Main Entry Point
#Requires -Version 7.0
using namespace System.Windows
using namespace System.Windows.Controls

# 1. Konfiguration laden
Initialize-Configuration

# 2. Assemblies laden
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# 3. XAML laden & Window erstellen
$window = Initialize-MainWindow

# 4. Event Handler registrieren
Register-EventHandlers

# 5. FileSystemWatcher starten
Initialize-FileSystemWatcher

# 6. Dashboard initialisieren
Show-DashboardView

# 7. GUI starten
$window.ShowDialog() | Out-Null
```

### Launcher (Start-PowerShellManager.bat)
```batch
@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"if ($PSVersionTable.PSVersion.Major -lt 7) { ^
    Write-Host 'PowerShell 7+ erforderlich!' -ForegroundColor Red; ^
    pause; exit ^
} ^
. '%~dp0PowerShell-Manager.ps1'"
```

---

## 📋 Best Practices

### XAML-Entwicklung
- ❌ **NIEMALS** `x:Class` Attribut verwenden (PowerShell kann nicht kompilieren)
- ✅ **FindName()** für alle Controls (nicht SelectNodes mit XPath)
- ✅ **WindowStyle="None"** für Custom Title Bar
- ✅ **AllowsTransparency="True"** + **Background="Transparent"** auf Window
- ✅ **CornerRadius** auf innerer Border für moderne Optik
- ✅ **DropShadowEffect** für 3D-Tiefe

### PowerShell-Code
- ✅ **Script-Scoped Variables** (`$script:Window`, `$script:Config`)
- ✅ **Null-Safe Event Binding** (`if ($btn) { $btn.Add_Click(...) }`)
- ✅ **Dispatcher.Invoke** für Thread-Safe UI Updates
- ✅ **Try/Catch** mit aussagekräftigen Fehlermeldungen
- ✅ **Comment-Based Help** für alle Funktionen

### Fehler-Vermeidung
| Fehler | Ursache | Lösung |
|--------|---------|--------|
| "x:Class doesn't match type" | x:Class in XAML | x:Class komplett entfernen |
| "Template property exception" | ControlTemplate Fehler | Inline Styling statt Templates |
| "Name already set" | x:Name Duplikat | x:Name nur 1x pro Element |
| "Namespace prefix 'x' not defined" | XML Parser Issue | xmlns:x korrekt deklarieren |
| "DragMove exception" | DragMove außerhalb Left Button | `if ($e.ChangedButton -eq 'Left')` |

---

## 🎯 Team-Einsatz Beispiel

**User-Anfrage:** *"Füge einen Export-Button hinzu, der alle Projekte als CSV exportiert"*

**Team-Workflow:**
1. **XAML DESIGNER**: Button im Dashboard hinzufügen
   ```xml
   <Button x:Name="btnExport" Content="📤 Export CSV" 
           Background="{StaticResource SuccessBrush}" 
           Foreground="White" Padding="20,12"/>
   ```

2. **WPF INTEGRATION ENGINEER**: Control in PowerShell verfügbar machen
   ```powershell
   $script:btnExport = $script:Window.FindName("btnExport")
   if ($script:btnExport) { 
       $script:btnExport.Add_Click({ Export-ProjectsToCSV }) 
   }
   ```

3. **POWERSHELL ARCHITECT**: Export-Funktion implementieren
   ```powershell
   function Export-ProjectsToCSV {
       $projects = @()
       
       foreach ($category in @("Werkstatt","Funktionstüchtig","toFix","Archive")) {
           $categoryPath = $script:Paths.$category
           Get-ChildItem $categoryPath -Directory | ForEach-Object {
               $projects += [PSCustomObject]@{
                   Name = $_.Name
                   Category = $category
                   Created = $_.CreationTime
                   Path = $_.FullName
               }
           }
       }
       
       $saveDialog = New-Object Microsoft.Win32.SaveFileDialog
       $saveDialog.Filter = "CSV Files (*.csv)|*.csv"
       $saveDialog.Title = "Projekte exportieren"
       
       if ($saveDialog.ShowDialog()) {
           $projects | Export-Csv -Path $saveDialog.FileName -NoTypeInformation
           Update-StatusBar -Status "Export erfolgreich: $($saveDialog.FileName)"
       }
   }
   ```

4. **DASHBOARD ENGINEER**: UI-Feedback hinzufügen
   ```powershell
   Update-StatusBar -Status "Export gestartet..."
   # ... Export-Code ...
   Update-StatusBar -Status "✅ $($projects.Count) Projekte exportiert"
   ```

---

## 🛡️ Error Handling Pattern

```powershell
function Safe-UIOperation {
    param([scriptblock]$Action)
    
    try {
        $script:Window.Dispatcher.Invoke($Action)
    }
    catch {
        $errorMsg = $_.Exception.Message
        Write-Host "UI-Fehler: $errorMsg" -ForegroundColor Red
        
        [System.Windows.MessageBox]::Show(
            "Ein Fehler ist aufgetreten:`n$errorMsg",
            "PowerShell-Manager Fehler",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Error
        )
        
        # Log schreiben
        Add-Content -Path "$PSScriptRoot\error.log" -Value "$(Get-Date) | $errorMsg"
    }
}
```

---

*"Elite Code for Elite Users - PowerShell-Manager entwickelt mit Leidenschaft vom Expert Team"* 🚀💙
