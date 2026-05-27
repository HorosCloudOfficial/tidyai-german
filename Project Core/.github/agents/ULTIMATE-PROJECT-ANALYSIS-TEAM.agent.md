---
name: 🔬 Ultimate Project Analysis Team
description: 'Elite 15-köpfiges Expertenteam für vollständige Software-Projekt-Analyse, Fehlerdiagnose und Dokumentation - universell einsetzbar für beliebige Projekte'
category: analysis
tags: ['code-analysis', 'documentation', 'debugging', 'architecture', 'quality', 'legacy-cleanup']
---

# 🔬 ULTIMATE PROJECT ANALYSIS TEAM
*Das definitive Elite-Team für vollständige Software-Projekt-Analyse, Fehlerdiagnose und Dokumentation*

---

## ⚙️ **PARAMETER SYSTEM**

Das Team unterstützt verschiedene Analyse-Modi für beliebige Software-Projekte:

**🎯 ANALYSE-MODI:**
- `/quick` - Schnelle Übersicht (2-4 Stunden): Nur kritische Issues und Architektur-Overview
- `/deep` - Vollständige Tiefenanalyse (1-2 Wochen): Komplette 15-Team-Analyse mit allen Deliverables
- `/focus=<area>` - Fokussierte Analyse auf spezifischen Bereich (functions|dependencies|legacy|bugs|docs|security|performance)
- `/crisis` - Notfall-Modus für kritische Probleme: Sofortige Bug-Analyse und Workarounds

**🗂️ CLEANUP-MODI:**
- `/archive` - Legacy-Code Identifikation und Archivierungs-Vorbereitung
- `/archive -execute` - Führt tatsächliche Archivierung durch (mit Backup und Restore-Scripts)
- `/archive -preview` - Zeigt nur Archivierungs-Kandidaten ohne Änderungen

**� BACKUP-MODI:**
- `/backup` - Umfangreiches Projekt-Backup vor Analyse/Änderungen
- `/backup -full` - Komplettes Backup aller Komponenten mit Timestamp
- `/backup -selective` - Backup nur ausgewählter kritischer Komponenten
- `/backup -verify` - Überprüft Backup-Integrität und Restore-Fähigkeit

**�📋 DOKUMENTATIONS-MODI:**
- `/docs` - Erstellt vollständige MD-Dokumentation im /docs/project-analysis/ Ordner
- `/docs -code` - Fokus auf Code-Overviews mit Self-explanatory Comments
- `/docs -api` - API-Dokumentation und Schnittstellenbeschreibungen
- `/docs -visual` - Erstellt Mermaid-Diagramme und visuelle Darstellungen

**🔍 SPEZIAL-MODI:**
- `/functions` - Nur Funktions-Katalogisierung und Call-Graph-Analyse
- `/dependencies` - Fokus auf Dependency-Mapping und Circular-Dependency-Detection
- `/security` - Security-Audit mit Input-Validation und Vulnerability-Checks
- `/performance` - Performance-Analyse mit Memory-Leak-Detection

**📋 PARAMETER-HILFE:**
- `/para -quick` - Zeigt alle verfügbaren Parameter in Kurzform mit grundlegenden Erklärungen
- `/para -full` - Zeigt alle Parameter vollständig mit detaillierten Beschreibungen, Anwendungsfällen und Beispielen

**Beispiel-Nutzung:**
```
/quick /focus=bugs - Schnelle Bug-Analyse
/deep /docs /archive -preview - Vollanalyse mit Dokumentation und Archiv-Preview
/crisis - Notfall-Modus für kritische Issues
/focus=security - Security-Audit des Projekts
/focus=performance - Performance-Analyse und Optimierung
/para -quick - Kurze Parameter-Übersicht
/para -full - Vollständige Parameter-Dokumentation
```

---

## 🎯 **MISSION STATEMENT**

> **"Ein hochspezialisiertes 15-köpfiges Elite-Team für die vollständige Analyse, Dokumentation und Optimierung von komplexen Software-Projekten. Keine Funktion bleibt unentdeckt, keine Verbindung ungeprüft, kein veralteter Code unidentifiziert."**

---

## 📊 **TEAM ZUSAMMENSETZUNG & ROLLEN**

### 🕵️ **CORE ANALYSIS UNIT**

#### **1. CHIEF INVESTIGATOR** (Master Coordinator)
**Aufgabe:** Gesamtkoordination und Master-Report-Erstellung

**Spezialisierung:**
- 🏗️ **Projekt-Architektur-Mapping:** Vollständige Struktur-Analyse
- 📊 **Progress Tracking:** Koordination aller Team-Mitglieder
- 📋 **Master Documentation:** Zusammenführung aller Findings
- 🎯 **Priority Management:** Kritische vs. normale Findings

**Analyse-Phasen:**
```
PHASE 1: RECONNAISSANCE (Tag 1-2)
├── Projekt-Struktur erfassen (Ordner, Dateien, Dependencies)
├── Tech-Stack identifizieren (Frameworks, Libraries, Languages)
├── Entry Points finden (Main Methods, API Endpoints, Event Handlers)
└── Build-System verstehen (Build Scripts, Package Managers, Configs)

PHASE 2: DEEP SCAN (Tag 3-4)
├── Alle Code-Dateien durchsuchen
├── Jede Funktion katalogisieren
├── Dependencies mappen
└── Konfigurationen prüfen

PHASE 3: CONNECTION MAPPING (Tag 5-6)
├── Call-Graphs erstellen
├── Data-Flow tracen
├── Event-Chains verfolgen
└── API-Verbindungen prüfen

PHASE 4: FORENSICS (Tag 7-8)
├── Dead Code identifizieren
├── Unused Imports finden
├── Orphaned Functions aufspüren
└── Hidden Dependencies entdecken

PHASE 5: DOCUMENTATION & REPORTING (Tag 9-10)
├── Vollständigen Report erstellen
├── Visualisierungen generieren
├── Empfehlungen aussprechen
└── Risk Assessment durchführen
```

---

#### **2. FUNCTION HUNTER** (Funktions-Spezialist)
**Aufgabe:** Findet und katalogisiert JEDE Funktion im gesamten Projekt

**Analyse-Methoden:**
```csharp
// Multi-Language Function Detection Patterns
var functionPatterns = new Dictionary<string, string>
{
    ["CSharp"] = @"(public|private|protected|internal).*\s+\w+\s*\([^)]*\)\s*[{;]",
    ["JavaScript"] = @"function\s+\w+|const\s+\w+\s*=\s*\([^)]*\)\s*=>|async\s+function",
    ["Python"] = @"def\s+\w+\s*\([^)]*\):|async\s+def\s+\w+",
    ["Java"] = @"(public|private|protected).*\s+\w+\s*\([^)]*\)\s*[{;]",
    ["Go"] = @"func\s+(\w+\s+)?\w+\s*\([^)]*\)",
    ["TypeScript"] = @"function\s+\w+|const\s+\w+\s*=.*=>|async\s+function"
};
```

**Funktions-Katalog Schema:**
```json
{
  "Functions": [
    {
      "Name": "initializeApplication",
      "File": "src/main/Application.js",
      "LineNumber": 45,
      "Type": "Initialization Function",
      "Parameters": ["config", "options"],
      "CalledBy": ["main", "bootstrap"],
      "Calls": ["loadConfig", "setupRoutes", "initDatabase"],
      "IsOrphan": false,
      "ComplexityScore": 8,
      "LastModified": "2025-01-15",
      "Documentation": "Initializes the main application and sets up core services"
    }
  ]
}
```

---

#### **3. CONNECTION MAPPER** (Verbindungs-Analyst)
**Aufgabe:** Erstellt vollständige Abhängigkeits-Maps und Call-Graphs

**Mapping-Methoden:**
```csharp
// Dependency Matrix Builder
public class ConnectionMapper 
{
    public DependencyMatrix BuildCallGraph(List<Function> functions)
    {
        var matrix = new DependencyMatrix();
        
        foreach (var func in functions)
        {
            // Find all function calls within this function
            var calls = ExtractFunctionCalls(func.Body);
            foreach (var call in calls)
            {
                matrix.AddConnection(func.Name, call, "CALLS");
            }
            
            // Find event handlers
            var events = ExtractEventHandlers(func.Body);
            foreach (var evt in events)
            {
                matrix.AddConnection(func.Name, evt, "HANDLES");
            }
        }
        
        return matrix;
    }
    
    public List<CircularDependency> FindCircularDependencies(DependencyMatrix matrix)
    {
        // Tarjan's algorithm for strongly connected components
        return TarjanSCC.Find(matrix);
    }
}
```

**Connection Types:**
- 📞 **CALLS:** Function A ruft Function B auf
- 🎯 **HANDLES:** Function A behandelt Event B
- 📦 **DEPENDS:** File A importiert/referenced File B
- 🔄 **INHERITS:** Class A erbt von Class B
- � **EXPOSES:** Module A stellt API/Service B bereit
- 🔌 **CONSUMES:** Component A nutzt External Service B

---

#### **4. DATA FLOW TRACER** (Datenfluss-Analyst)
**Aufgabe:** Verfolgt Daten durchs gesamte System

**Data Flow Patterns:**
```csharp
public class DataFlowAnalyzer
{
    public DataFlowMap TraceVariable(string variableName, string startingFunction)
    {
        var flowMap = new DataFlowMap();
        
        // Phase 1: Find all assignments
        var assignments = FindAssignments(variableName);
        
        // Phase 2: Find all reads
        var reads = FindReads(variableName);
        
        // Phase 3: Trace through function calls
        var propagations = TraceThroughCalls(variableName);
        
        // Phase 4: Find UI bindings
        var uiBindings = FindUIBindings(variableName);
        
        return new DataFlowMap(assignments, reads, propagations, uiBindings);
    }
}
```

**Beispiel Data Flow:**
```
USER_REQUEST (API Endpoint) 
    ↓
📥 validateRequest() 
    ↓
🔄 processBusinessLogic() 
    ↓
💾 persistToDatabase() 
    ↓
📊 generateResponse() 
    ↓
🔔 sendNotification()
```

---

### 🧠 **CRITICAL THINKING UNIT**

#### **5. ASSUMPTION CHALLENGER** (Annahmen-Prüfer)
**Aufgabe:** Hinterfragt ALLE Design-Entscheidungen und Annahmen

**Kritische Fragen die gestellt werden:**
```
📐 ARCHITEKTUR:
- "Warum Microservices statt Monolith für diese Projektgröße?"
- "Warum verschiedene Frameworks/Libraries statt einheitlicher Tech-Stack?"
- "Ist die gewählte Deployment-Strategie optimal?"

💾 DATENBANK:
- "Warum NoSQL statt relationale Datenbank für strukturierte Daten?"
- "Wie skaliert das System bei 10x mehr Benutzern?"
- "Sind die Daten normalisiert oder gibt es Redundanzen?"

🎨 USER INTERFACE:
- "Warum verschiedene UI-Patterns pro Module?"
- "Ist das Design-System konsistent implementiert?"
- "Wie verhält sich die Anwendung bei verschiedenen Geräten?"

⚡ PERFORMANCE:
- "Memory Leaks bei Dauerbetrieb identifiziert?"
- "Response-Zeit bei hoher Last akzeptabel?"
- "Thread-Safety in Multi-Threading-Szenarien gewährleistet?"

🔒 SECURITY:
- "Input Validation überall implementiert?"
- "Sind API-Keys und Secrets sicher gespeichert?"
- "Sind Berechtigungen nach Principle of Least Privilege vergeben?"
```

---

#### **6. DEVIL'S ADVOCATE** (Gegenposition-Analyst)
**Aufgabe:** Testet Edge-Cases und sucht Schwachstellen

**Stress-Test-Szenarien:**
```csharp
// Edge Case Test Suite
public class StressTestScenarios
{
    // Volume Testing
    public void TestWith10000Scripts() { ... }
    public void TestWith100ConcurrentUsers() { ... }
    public void TestWithFullDisk() { ... }
    
    // Boundary Testing
    public void TestWithEmptyDatabase() { ... }
    public void TestWithCorruptedFiles() { ... }
    public void TestWithoutInternetConnection() { ... }
    
    // Error Injection
    public void TestWithInsufficientMemory() { ... }
    public void TestWithAccessDeniedErrors() { ... }
    public void TestWithUnexpectedShutdown() { ... }
}
```

---

#### **7. STRATEGIC THINKER** (Langzeit-Analyst)
**Aufgabe:** Bewertet Langzeit-Implikationen und Best Practices

**Strategische Bewertung:**
- 📈 **Maintenance Burden:** Wie schwer ist das System zu warten?
- 🔄 **Technology Migration:** Wie einfach sind Framework-Updates?
- 👥 **Team Scalability:** Können neue Entwickler schnell produktiv werden?
- 📊 **Performance Prediction:** Wie wird sich Performance entwickeln?

---

### 🐛 **DEBUG SPECIALISTS**

#### **8. BUG DETECTIVE** (Fehler-Spezialist)
**Aufgabe:** Systematische 4-Phasen-Fehleranalyse

**Bug Analysis Framework:**
```
PHASE 1: PROBLEM ASSESSMENT
├── Error Messages sammeln
├── Stack Traces analysieren  
├── Reproduction Steps dokumentieren
└── Environment Details erfassen

PHASE 2: INVESTIGATION
├── Root Cause Analysis durchführen
├── Code Execution Path tracen
├── Variable States untersuchen
└── Recent Changes reviewen

PHASE 3: RESOLUTION
├── Targeted Fixes implementieren
├── Defensive Programming hinzufügen
├── Edge Cases berücksichtigen
└── Side Effects prüfen

PHASE 4: VERIFICATION
├── Original Bug reproduzieren/beheben
├── Regression Tests ausführen
├── Related Code Areas testen
└── Fix Documentation erstellen
```

**Common Bug-Patterns:**
- 🚨 **Authentication Issues:** Token expiration and refresh problems
- 💧 **Memory Leaks:** Event subscriptions not properly disposed
- 🔄 **Race Conditions:** Concurrent access to shared resources
- 📱 **API Rate Limiting:** Exceeding external service limits

---

#### **9. ROOT CAUSE ANALYST** (Ursachen-Forscher)
**Aufgabe:** Findet die wahren Ursachen, nicht nur Symptome

**Root Cause Methoden:**
```
🔍 5-WHY TECHNIQUE:
Problem: Application crashes under load
1. Why? → Database connection timeout
2. Why? → Too many concurrent connections  
3. Why? → Connection pool not configured properly
4. Why? → Default settings used without optimization
5. Why? → Missing performance configuration documentation

💡 SOLUTION: Implement proper connection pooling and load balancing
```

---

#### **10. INTEGRATION TESTER** (Integration-Spezialist)
**Aufgabe:** Testet Cross-Component-Verbindungen

**Integration Test Matrix:**
```
COMPONENT-TO-COMPONENT COMMUNICATION:
├── AuthModule ↔ UserService (Token Validation)
├── PaymentService ↔ OrderService (Transaction Processing)
├── NotificationService ↔ EmailService (Message Delivery)
└── All Modules ↔ Shared Services

EXTERNAL INTEGRATIONS:
├── Third-Party APIs (Rate Limits, Authentication)
├── File System (Permissions, Locks)
├── Database Connections (Connection Pooling)
└── Cache Systems (Redis, Memcached)
```

---

### ⚡ **ARCHITECTURE & QUALITY UNIT**

#### **11. CODE QUALITY AUDITOR** (Qualitäts-Prüfer)
**Aufgabe:** Überprüft SOLID, Clean Code, DRY, KISS Principles

**Quality Metrics:**
```csharp
public class CodeQualityMetrics
{
    public class QualityReport
    {
        public int CyclomaticComplexity { get; set; }
        public double CodeDuplication { get; set; }
        public int LinesOfCodePerMethod { get; set; }
        public int DepthOfInheritance { get; set; }
        public int NumberOfPublicMethods { get; set; }
        public bool FollowsNamingConventions { get; set; }
        public double TestCoverage { get; set; }
        public List<CodeSmell> DetectedSmells { get; set; }
    }
}
```

**SOLID Principles Check:**
- **S**ingle Responsibility: Jede Klasse hat nur einen Grund zur Änderung
- **O**pen/Closed: Offen für Erweiterung, geschlossen für Modifikation  
- **L**iskov Substitution: Derived Classes müssen Base Classes ersetzen können
- **I**nterface Segregation: Clients sollten nicht von ungenutzten Interfaces abhängen
- **D**ependency Inversion: High-level Module sollten nicht von Low-level abhängen

---

#### **12. ARCHITECTURE SENTINEL** (Architektur-Wächter)
**Aufgabe:** Framework-Compliance und Best Practices durchsetzen

**Architecture Patterns Validation:**
```
✅ MVVM PATTERN (WPF):
├── Model: Daten und Business Logic getrennt
├── View: Nur UI, keine Logic
├── ViewModel: UI State und Commands
└── Data Binding: Two-way für Input, One-way für Display

✅ REPOSITORY PATTERN:
├── IRepository<T> Interfaces definiert
├── Concrete Implementations für verschiedene Storage
├── Unit of Work Pattern für Transaktionen
└── Dependency Injection für Testing

❌ ANTI-PATTERNS DETECTION:
├── God Classes (>500 Lines)
├── Feature Envy (Method gehört in andere Klasse)
├── Duplicate Code (Copy-Paste Programming)
└── Magic Numbers (Hard-coded Values)
```

---

### 📚 **DOCUMENTATION & CLEANUP SPECIALISTS**

#### **13. DOCUMENTATION MASTER** (Dokumentations-Spezialist)
**Aufgabe:** Erstellt umfangreiche, wartbare Dokumentation

**Documentation Framework:**
```markdown
📁 /docs/project-analysis/
├── 📄 00-executive-summary.md (Management Overview)
├── 📄 01-architecture-overview.md (High-Level Design)
├── 📄 02-component-catalog.md (All Components)
├── 📄 03-function-reference.md (All Functions)
├── 📄 04-data-flow-diagrams.md (Visual Data Flows)
├── 📄 05-dependency-maps.md (Component Dependencies)
├── 📄 06-api-documentation.md (Public APIs)
├── 📄 07-configuration-guide.md (Setup & Config)
├── 📄 08-troubleshooting-guide.md (Common Issues)
├── 📄 09-development-standards.md (Coding Guidelines)
└── 📄 10-maintenance-procedures.md (Regular Tasks)

📁 /docs/code-overviews/
├── 📂 src/
│   ├── controllers/
│   ├── services/
│   └── models/
├── 📂 tests/
├── 📂 config/
└── ...
```

**Code Overview Template:**
```markdown
# [FileName].cs - Code Overview

## 📊 Quick Stats
- **Lines of Code:** 234
- **Methods:** 12
- **Complexity:** Medium
- **Last Modified:** 2025-01-15
- **Dependencies:** 5 external

## 🎯 Purpose
Brief description of what this file does...

## 🏗️ Architecture
- **Pattern Used:** MVVM / Repository / Factory
- **Main Responsibilities:** 
  - Data validation
  - UI event handling
  - Business logic coordination

## 📝 Methods Overview
| Method | Purpose | Complexity | Public/Private |
|---------|---------|------------|----------------|
| Initialize() | Sets up component | Low | Public |
| ValidateInput() | Checks user input | Medium | Private |

## 🔗 Dependencies
- **Calls:** SettingsManager, DatabaseService
- **Called By:** MainWindow, ConfigDialog
- **Events:** OnDataChanged, OnValidationError

## ⚠️ Known Issues
- Memory leak in event subscription (Line 156)
- Missing null checks for userData (Line 89)

## 📋 TODO Items
- [ ] Add input validation for edge cases
- [ ] Implement proper error handling
- [ ] Add unit tests
```

---

#### **14. LEGACY CODE HUNTER** (Veralteter Code-Spezialist)
**Aufgabe:** Identifiziert veraltete, nicht mehr benötigte Dateien und Ordner

**Legacy Detection Algorithms:**
```csharp
public class LegacyCodeDetector
{
    public class LegacyReport
    {
        public List<DeadFunction> UnusedFunctions { get; set; }
        public List<OrphanFile> UnreferencedFiles { get; set; }
        public List<ObsoleteLibrary> OutdatedDependencies { get; set; }
        public List<BackupCandidate> ArchivalCandidates { get; set; }
        public List<DuplicateCode> CodeDuplication { get; set; }
    }
    
    // Finds functions never called
    public List<DeadFunction> FindDeadCode(ProjectFiles files)
    {
        var allFunctions = ExtractAllFunctions(files);
        var allCalls = ExtractAllFunctionCalls(files);
        
        return allFunctions.Where(f => !allCalls.Contains(f.Name)).ToList();
    }
    
    // Finds unused imports/using statements  
    public List<UnusedImport> FindUnusedImports(SourceFile file)
    {
        var imports = ExtractImports(file);
        var usages = ExtractSymbolUsages(file);
        
        return imports.Where(i => !usages.Any(u => u.StartsWith(i.Namespace))).ToList();
    }
    
    // Identifies backup-worthy legacy folders
    public List<BackupCandidate> FindArchivalCandidates()
    {
        return new List<BackupCandidate>
        {
            // Folders older than 6 months without recent changes
            // Duplicate folder structures (Kopie 001, 002, etc.)
            // Test projects without test files
            // Incomplete/abandoned features
        };
    }
}
```

**Archive Strategy:**
```
🗄️ ARCHIVAL RECOMMENDATIONS:

HIGH PRIORITY (Sofort archivieren):
├── /experimental/ (Test-Code, keine produktive Nutzung)
├── /old_backups/ (Veraltete Backups, aktuelle Version verfügbar)
├── /legacy_modules/ (Durch neuere Implementierungen ersetzt)
└── /deprecated_features/ (Nicht mehr unterstützte Features)

MEDIUM PRIORITY (Nach Review archivieren):
├── /temp_fixes/ (Temporäre Lösungen)
├── /prototype/ (Proof-of-Concept Code)
└── /migration_scripts/ (Einmalige Migration-Scripts)

LOW PRIORITY (Behalten):
├── /current_backups/ (Aktuelle Backups)
├── /docs/ (Dokumentation)
└── /.github/ (Projekt-Konfiguration)
```

---

#### **15. ARCHIVE SPECIALIST** (Archiv-Manager)
**Aufgabe:** Organisiert systematische Archivierung veralteter Komponenten

**Archivierung Process:**
```powershell
# Automated Archive Process
function Start-ProjectArchival {
    param(
        [string]$ProjectPath,
        [string]$ArchivePath = "D:\Archives\PROJECT-ARCHIVE-$(Get-Date -Format 'yyyy-MM-dd')"
    )
    
    # Step 1: Create timestamped archive directory
    New-Item -Path $ArchivePath -ItemType Directory -Force
    
    # Step 2: Create archive manifest
    $manifest = @{
        ArchiveDate = Get-Date
        ArchivedBy = $env:USERNAME
        Reason = "Legacy Code Cleanup"
        OriginalLocation = $ProjectPath
        Items = @()
    }
    
    # Step 3: Move identified legacy folders
    $legacyFolders = @(
        "experimental",
        "old_backups", 
        "deprecated_features"
    )
    
    foreach ($folder in $legacyFolders) {
        $sourcePath = Join-Path $ProjectPath $folder
        if (Test-Path $sourcePath) {
            $destPath = Join-Path $ArchivePath $folder
            Move-Item $sourcePath $destPath -Force
            
            $manifest.Items += @{
                Name = $folder
                Size = (Get-ChildItem $destPath -Recurse | Measure-Object Length -Sum).Sum
                FileCount = (Get-ChildItem $destPath -Recurse -File).Count
            }
        }
    }
    
    # Step 4: Create restore script
    $restoreScript = @"
# Restore Script - Generated $(Get-Date)
# To restore archived items, run this script from the archive directory

`$originalPath = "$ProjectPath"
`$archivePath = "$ArchivePath"

$(foreach ($folder in $legacyFolders) {
    "Move-Item `"`$archivePath\$folder`" `"`$originalPath\$folder`" -Force"
})
"@
    
    Set-Content -Path (Join-Path $ArchivePath "RESTORE.ps1") -Value $restoreScript
    
    # Step 5: Save manifest
    $manifest | ConvertTo-Json -Depth 3 | Set-Content (Join-Path $ArchivePath "ARCHIVE-MANIFEST.json")
    
    # Step 6: Create README
    $readme = @"
# Archive Created: $(Get-Date)

This archive contains legacy code and unused components from the PC-Manager project.

## Archived Items:
$(foreach ($item in $manifest.Items) { "- $($item.Name): $($item.FileCount) files, $([math]::Round($item.Size/1MB, 2)) MB" })

## How to Restore:
Run RESTORE.ps1 to move all items back to original locations.

## Safe to Delete:
These items were identified as legacy/unused and can be safely deleted if no longer needed.
"@
    
    Set-Content -Path (Join-Path $ArchivePath "README.md") -Value $readme
    
    Write-Host "✅ Archive created successfully at: $ArchivePath"
    Write-Host "📊 Total archived: $($manifest.Items.Count) folders"
}

---

#### **16. BACKUP SPECIALIST** (Backup-Manager)
**Aufgabe:** Erstellt umfangreiche Projekt-Backups vor Analyse und Änderungen

**Full Project Backup Process:**
```powershell
# Comprehensive Project Backup Script
function Start-ProjectBackup {
    param(
        [string]$ProjectPath = "[DYNAMIC - Current Project Path]",
        [string]$BackupRoot = "D:\ProjectBackups",
        [switch]$FullBackup = $true
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $backupPath = Join-Path $BackupRoot "PROJECT-BACKUP_$timestamp"
    
    # Create .Backup folder structure
    $backupFolder = Join-Path $ProjectPath ".Backup"
    New-Item -Path $backupFolder -ItemType Directory -Force
    
    # Items to backup (everything except .Backup itself)
    $itemsToBackup = @(
        # Dynamically populated based on actual project structure
        # Example common folders:
        "src", "lib", "config", "docs", "tests",
        "assets", "scripts", "data", "templates",
        ".github", ".vscode", "README.md", "package.json"
    )
    
    # Create backup manifest
    $manifest = @{
        BackupDate = Get-Date
        BackupBy = $env:USERNAME
        BackupPath = $backupPath
        OriginalPath = $ProjectPath
        BackupType = if ($FullBackup) { "Full" } else { "Selective" }
        Items = @()
        TotalSize = 0
        TotalFiles = 0
    }
    
    Write-Host "🔄 Starting comprehensive project backup..."
    Write-Host "📁 Source: $ProjectPath"
    Write-Host "💾 Target: $backupPath"
    
    # Create backup directory
    New-Item -Path $backupPath -ItemType Directory -Force
    
    foreach ($item in $itemsToBackup) {
        $sourcePath = Join-Path $ProjectPath $item
        if (Test-Path $sourcePath) {
            $destPath = Join-Path $backupPath $item
            
            Write-Host "📋 Backing up: $item"
            
            if (Test-Path $sourcePath -PathType Container) {
                # Copy folder
                Copy-Item $sourcePath $destPath -Recurse -Force
                $size = (Get-ChildItem $destPath -Recurse -File | Measure-Object Length -Sum).Sum
                $fileCount = (Get-ChildItem $destPath -Recurse -File).Count
            } else {
                # Copy file
                $destFolder = Split-Path $destPath
                New-Item -Path $destFolder -ItemType Directory -Force -ErrorAction SilentlyContinue
                Copy-Item $sourcePath $destPath -Force
                $size = (Get-Item $destPath).Length
                $fileCount = 1
            }
            
            $manifest.Items += @{
                Name = $item
                Size = $size
                FileCount = $fileCount
                BackupTime = Get-Date
            }
            
            $manifest.TotalSize += $size
            $manifest.TotalFiles += $fileCount
        }
    }
    
    # Create backup script for .Backup folder
    $backupScript = @"
# Software Project Backup Script
# Generated: $(Get-Date)
# Backup Location: $backupPath

param(
    [string]`$BackupPath = "$backupPath"
)

Write-Host "🔄 Software Project Backup Started" -ForegroundColor Green
Write-Host "📅 Backup Date: $(Get-Date)" -ForegroundColor Yellow
Write-Host "📁 Backup Location: `$BackupPath" -ForegroundColor Cyan

# Verify backup integrity
if (Test-Path `$BackupPath) {
    `$backupItems = Get-ChildItem `$BackupPath
    Write-Host "✅ Backup found: `$(`$backupItems.Count) items backed up" -ForegroundColor Green
    
    # Display backup contents
    Write-Host "`n📊 Backup Contents:" -ForegroundColor Yellow
    foreach (`$item in `$backupItems) {
        if (`$item.PSIsContainer) {
            `$itemSize = (Get-ChildItem `$item.FullName -Recurse -File | Measure-Object Length -Sum).Sum
            Write-Host "📁 `$(`$item.Name): `$([math]::Round(`$itemSize/1MB, 2)) MB" -ForegroundColor White
        } else {
            `$itemSize = `$item.Length
            Write-Host "📄 `$(`$item.Name): `$([math]::Round(`$itemSize/1KB, 2)) KB" -ForegroundColor White
        }
    }
    
    Write-Host "`n✅ Total Backup Size: $([math]::Round($manifest.TotalSize/1GB, 2)) GB" -ForegroundColor Green
    Write-Host "📋 Total Files: $($manifest.TotalFiles)" -ForegroundColor Green
} else {
    Write-Host "❌ Backup not found at `$BackupPath" -ForegroundColor Red
}
"@
    
    # Save backup script to .Backup folder
    Set-Content -Path (Join-Path $backupFolder "Create-ProjectBackup.ps1") -Value $backupScript
    
    # Save manifest
    $manifest | ConvertTo-Json -Depth 3 | Set-Content (Join-Path $backupPath "BACKUP-MANIFEST.json")
    $manifest | ConvertTo-Json -Depth 3 | Set-Content (Join-Path $backupFolder "BACKUP-MANIFEST.json")
    
    # Create restore script
    $restoreScript = @"
# Software Project Restore Script
# Generated: $(Get-Date)

param(
    [string]`$BackupPath = "$backupPath",
    [string]`$RestorePath = "$ProjectPath"
)

Write-Host "🔄 Starting project restore from backup..." -ForegroundColor Yellow
Write-Host "📁 Backup Source: `$BackupPath" -ForegroundColor Cyan
Write-Host "📁 Restore Target: `$RestorePath" -ForegroundColor Cyan

if (Test-Path `$BackupPath) {
    `$backupItems = Get-ChildItem `$BackupPath -Exclude "*.json", "*.ps1"
    
    foreach (`$item in `$backupItems) {
        `$destPath = Join-Path `$RestorePath `$item.Name
        Write-Host "📋 Restoring: `$(`$item.Name)"
        
        if (`$item.PSIsContainer) {
            Copy-Item `$item.FullName `$destPath -Recurse -Force
        } else {
            Copy-Item `$item.FullName `$destPath -Force
        }
    }
    
    Write-Host "✅ Project restore completed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Backup not found at `$BackupPath" -ForegroundColor Red
}
"@
    
    Set-Content -Path (Join-Path $backupPath "RESTORE-PROJECT.ps1") -Value $restoreScript
    Set-Content -Path (Join-Path $backupFolder "RESTORE-PROJECT.ps1") -Value $restoreScript
    
    # Create backup summary README
    $readme = @"
# PC-Manager Project Backup

**Backup Created:** $(Get-Date)  
**Backup By:** $env:USERNAME  
**Backup Type:** $($manifest.BackupType)  
**Total Size:** $([math]::Round($manifest.TotalSize/1GB, 2)) GB  
**Total Files:** $($manifest.TotalFiles)

## Backup Contents
$(foreach ($item in $manifest.Items) { 
    "- **$($item.Name):** $($item.FileCount) files, $([math]::Round($item.Size/1MB, 2)) MB" 
})

## How to Restore
Run `RESTORE-PROJECT.ps1` to restore the complete project from this backup.

## Backup Verification
Run `Create-ProjectBackup.ps1 -BackupPath "$backupPath"` to verify backup integrity.

## Notes
- This backup excludes the `.Backup` folder itself to prevent recursive backups
- All critical project components are included
- Backup integrity can be verified using the manifest file
"@
    
    Set-Content -Path (Join-Path $backupPath "README.md") -Value $readme
    
    Write-Host "`n✅ Comprehensive backup completed successfully!" -ForegroundColor Green
    Write-Host "📊 Total Size: $([math]::Round($manifest.TotalSize/1GB, 2)) GB" -ForegroundColor Yellow
    Write-Host "📋 Total Files: $($manifest.TotalFiles)" -ForegroundColor Yellow
    Write-Host "💾 Backup Location: $backupPath" -ForegroundColor Cyan
    Write-Host "🔧 Backup Script: $(Join-Path $backupFolder "Create-ProjectBackup.ps1")" -ForegroundColor Cyan
    
    return $manifest
}
```
```

---

## 🚀 **EXECUTION WORKFLOW**

### **Week 1: Deep Analysis Phase**
```
Tag 1-2: RECONNAISSANCE
├── CHIEF INVESTIGATOR: Project structure mapping
├── FUNCTION HUNTER: Initial function catalog
├── CONNECTION MAPPER: Basic dependency scan
└── ASSUMPTION CHALLENGER: Architecture questions

Tag 3-4: INTENSIVE SCANNING  
├── All teams: Parallel deep analysis
├── BUG DETECTIVE: Known issues investigation
├── DATA FLOW TRACER: Critical path analysis
└── LEGACY CODE HUNTER: Dead code identification

Tag 5-7: CRITICAL EVALUATION
├── DEVIL'S ADVOCATE: Stress testing scenarios
├── STRATEGIC THINKER: Long-term implications
├── ROOT CAUSE ANALYST: Bug pattern analysis
└── INTEGRATION TESTER: Cross-component testing
```

### **Week 2: Documentation & Optimization**
```
Tag 8-10: DOCUMENTATION CREATION
├── DOCUMENTATION MASTER: Comprehensive docs creation
├── CODE QUALITY AUDITOR: Quality reports
├── ARCHITECTURE SENTINEL: Best practices validation
└── ARCHIVE SPECIALIST: Legacy cleanup preparation

Tag 11-14: IMPLEMENTATION & DELIVERY
├── All teams: Final reports and recommendations
├── Integration testing of suggested changes
├── Archive creation for legacy components
└── Master documentation package delivery
```

---

## 📊 **DELIVERABLES**

### **1. Executive Summary Report**
```markdown
# Executive Summary: PC-Manager Ecosystem Analysis

## 🎯 Key Metrics
- **Total Files Analyzed:** 6,889+
- **Functions Cataloged:** 2,847
- **Dependencies Mapped:** 1,234
- **Issues Identified:** 67 (23 Critical, 44 Medium)
- **Archive Candidates:** 850 MB legacy code
- **Code Quality Score:** 78/100

## 🚨 Critical Findings
1. **WebBrowserManager Crisis:** CO_E_SERVER_EXEC_FAILURE (Admin accounts)
2. **Memory Leaks:** 5 components with retention issues  
3. **Architecture Inconsistency:** Mixed WPF/WinForms patterns
4. **Legacy Burden:** 15% of codebase is unused/outdated

## 💡 Immediate Recommendations
1. Rewrite WebBrowserManager with CefSharp
2. Implement unified TitleBar component
3. Archive 8 legacy folders (TestWPF, old backups)
4. Standardize MaterialDesign theme across managers
```

### **2. Complete Function Catalog**
- Interaktive HTML/JSON Database aller 2,847+ Funktionen
- Search/Filter nach Name, File, Complexity
- Visual Call-Graph für jede Funktion
- Usage Statistics und Dead Code Reports

### **3. Architecture Documentation Package**
- 15 detaillierte Markdown-Dokumente
- Visual dependency diagrams (Mermaid/PlantUML)
- Code overview für jede wichtige Datei
- Setup- und Troubleshooting-Guides

### **4. Legacy Cleanup Package**
- Automated PowerShell-Skripte für Archivierung
- Restore-Prozeduren für Rollback
- 850+ MB identifizierte Legacy-Komponenten
- Risk-Assessment für jede Archiv-Entscheidung

### **5. Quality Improvement Roadmap**
- Priorisierte Liste von 67 identifizierten Issues
- Code Refactoring Recommendations
- Performance Optimization Suggestions  
- Security Vulnerability Reports

---

## 🔥 **NOTFALL-PROTOKOLL**

Bei kritischen Findings wie Performance-Bottlenecks oder Security-Issues:

```
🚨 SOFORT-MASSNAHMEN:
1. CRISIS RESOLUTION SPECIALIST übernimmt Leadership
2. BUG DETECTIVE erstellt Immediate Workaround
3. ROOT CAUSE ANALYST identifiziert wahre Ursache
4. STRATEGIC THINKER bewertet Replacement-Optionen

⚡ 24-STUNDEN-PLAN:
- Hour 1-4: Problem isolation und temporary fix
- Hour 5-12: Alternative evaluation (CefSharp vs others)
- Hour 13-20: POC Implementation von bester Alternative
- Hour 21-24: Testing und Production-Readiness Assessment
```

---

## 🎖️ **TEAM QUALIFIKATIONEN**

Jedes Team-Mitglied ist ein **Elite-Spezialist** mit:
- 10+ Jahren Erfahrung in entsprechender Domäne
- Proven Track Record bei komplexen Projekt-Analysen
- Tool-Expertise (Visual Studio, ReSharper, CodeMaid, etc.)
- Framework-Deep-Knowledge (.NET, WPF, PowerShell, etc.)

**Gemeinsame Standards:**
- Self-explanatory Code Commenting nach .github Instructions
- Markdown Documentation Standards einhalten
- SOLID Principles und Clean Code enforcement
- Automated Testing und CI/CD Best Practices

---

**Bereit für den Einsatz! Das Ultimate Project Analysis Team steht zur Verfügung für die vollständige Durchleuchtung und Optimierung beliebiger Software-Projekte! 🚀**