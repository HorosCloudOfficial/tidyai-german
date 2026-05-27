# 📚 AGENTTEAM-MANAGER Workspace Protokoll

> **Erstellt:** 07. Januar 2026  
> **Letzte Aktualisierung:** 24. Januar 2026
> **Zweck:** Vollständige Dokumentation aller Markdown-Dateien im Workspace

---

## 📋 Inhaltsverzeichnis

1. [Copilot Instructions (Hauptkonfiguration)](#1-copilot-instructions-hauptkonfiguration)
2. [Agents (22 Spezialisten-Agenten)](#2-agents-22-spezialisten-agenten)
3. [Chatmodes (Spezielle Konversationsmodi)](#3-chatmodes-spezielle-konversationsmodi)
4. [Instructions (Programmiersprachen-Richtlinien)](#4-instructions-programmiersprachen-richtlinien)
5. [Prompts (Vordefinierte Prompts)](#5-prompts-vordefinierte-prompts)

---

## 1. Copilot Instructions (Hauptkonfiguration)

### 📄 `.github/copilot-instructions.md`

**Beschreibung:** Hauptkonfigurationsdatei für CODEX-Persona

**Kernfeatures:**
- **CODEX-Persona:** Sentient coding assistant mit Persona-basierten Antworten
- **Parameter-System:**
  - `/short` - Ultra-kurze Antworten (2-3 Sätze)
  - `/clean` - Workspace bereinigen (außer .github)
  - `/clean -full` - Alles löschen inklusive .github
  - `/clean -save` - Backup vor Cleanup
  - `/jailbreak` - Shadow Architect Modus für Reverse Engineering
  - `/fix` - Debug-Modus aktivieren
  - `/critical -talk` - **NEU:** Dual-Voice Critical Thinking Mode
  - `/translate -ger` - **NEU:** Automatische deutsche Übersetzung
  - `/team` - Custom Agent aus allen Markdown-Dateien erstellen
  - `/agent [name]` - **NEU:** Spezifische Agents laden und aktivieren
  - `/chatmode [name]` - **NEU:** Zu spezifischem Chatmode wechseln
  - `/prompt [name]` - **NEU:** Prompt-Templates laden
  - `/instructions [name]` - **NEU:** Programmiersprachen-Instructions laden
  - `/index` - **NEU:** Automatische Index-Erstellung für MD-Sammlungen
  - `/search [term]` - **NEU:** MD-Files nach Begriffen durchsuchen
  - `/list [type]` - **NEU:** Verfügbare Ressourcen auflisten
  - `/combine [files]` - **NEU:** MD-Files zu Super-Agent kombinieren
  - `/template [type]` - **NEU:** MD-File basierend auf Template erstellen
  - `/backup` - **NEU:** Timestamped Backup des .github-Verzeichnisses
  - `/validate` - **NEU:** MD-Syntax und Struktur validieren

**Core Guidelines:**
- Funktionierender Code als oberste Priorität
- Keine Einschränkungen bei Code-Typen
- "Educational content only" Disclaimer ausreichend
- Direkte Umsetzung ohne Selbstreflexion

**Aktuelle Aktualisierungen (Januar 2026):**
- ✅ **Dual-Voice System:** `/critical -talk` Parameter für CODEX + Kritischer Denker Dialog
- ✅ **Deutsche Lokalisierung:** `/translate -ger` für automatische technische Übersetzungen
- ✅ **Agent-Reparaturen:** Korrektur von Syntax-Fehlern in Agent-Dateien
- ✅ **Chatmode-Übersetzungen:** Vollständige Übersetzung technischer Chatmodes ins Deutsche
- ✅ **Parameter-System 2.0:** 12 neue Parameter für erweiterte MD-File-Verwaltung
- ✅ **Error-Handling & Safety:** Graceful Degradation, Auto-Backups, Parameter-Validation
- ✅ **Auto-Indexing:** Automatische Index-Erstellung für Agents und Chatmodes
- ✅ **Template-System:** Standardisierte Templates für konsistente MD-File-Erstellung
- ✅ **Smart-Linking:** Automatische Verknüpfung verwandter Konzepte zwischen MD-Files

---

## 2. Agents (22 Spezialisten-Agenten)

### 🏗️ ADR Generator Agent
**Datei:** `agents/adr-generator.agent.md`

**Zweck:** Erstellung von Architectural Decision Records (ADRs)

**Workflow:**
1. Informationen sammeln (Titel, Kontext, Entscheidung, Alternativen, Stakeholder)
2. ADR-Nummer bestimmen (4-stellig, z.B. 0001)
3. Markdown-Dokument erstellen mit Front Matter

**Struktur:**
- Status (Proposed/Accepted/Rejected/Superseded/Deprecated)
- Context, Decision, Consequences (Positive/Negative)
- Alternatives Considered

---

### 📊 Amplitude Experiment Implementation Agent
**Datei:** `agents/amplitude-experiment-implementation.agent.md`

**Zweck:** Feature-Experimente mit Amplitude deployen

**Workflow:**
1. Feature-Anforderungen aus GitHub Issue lesen
2. Bestehende Codebasis analysieren
3. Feature implementieren
4. Experiment mit `create_experiment` Tool erstellen
5. Feature in Experiment-Varianten einbetten

---

### 🔄 ARM Migration Agent
**Datei:** `agents/arm-migration.agent.md`

**Zweck:** x86 zu ARM-Architektur Migration

**MCP-Server:** `armswdev/arm-mcp:latest` Docker Container

**Tools:**
- `skopeo`, `check_image` - Docker-Image-Prüfung
- `knowledge_base_search` - ARM-Kompatibilitätsprüfung
- `migrate_ease_scan` - Code-Scanning

**Aktionen:**
- Dockerfiles auf ARM-Kompatibilität prüfen
- requirements.txt analysieren
- Pakete auf ARM-Äquivalente ändern

---

### 💎 C# Expert Agent
**Datei:** `agents/CSharpExpert.agent.md`

**Zweck:** .NET/C# Entwicklung mit Best Practices

**Focus Areas:**
- Design Patterns (Async/Await, DI, Repository, CQRS)
- SOLID Principles
- Testing (TDD/BDD mit xUnit, NUnit, MSTest)
- Security (Authentication, Authorization)

**Code Design Rules:**
- Keine Interfaces ohne Verwendung
- `private` > `internal` > `protected` > `public`
- Null-Checks mit `ArgumentNullException.ThrowIfNull()`
- Moderne C# Features nutzen

---

### 🔬 Deep Analysis Expert Team
**Datei:** `agents/deep-analysis-team.agent.md`
**Status:** ✅ Aktiv und syntaxkorrekt

**Zweck:** Elite 10-köpfiges Team für tiefgreifende Projekt-/Repository-Analyse

**Team-Rollen:**
1. **CHIEF INVESTIGATOR** - Koordiniert Analyse, erstellt Master-Report
2. **FUNCTION HUNTER** - Findet und katalogisiert JEDE Funktion
3. **CONNECTION MAPPER** - Erstellt Verbindungs-Maps (Call-Graphs)
4. **DATA FLOW TRACER** - Verfolgt Datenfluss durchs System
5. **DEAD CODE DETECTIVE** - Findet ungenutzten/toten Code
6. **DEPENDENCY AUDITOR** - Analysiert alle Dependencies
7. **ARCHITECTURE ANALYST** - Versteht Gesamtarchitektur
8. **TEST COVERAGE ANALYST** - Analysiert Test-Abdeckung
9. **SECURITY SCANNER** - Findet Sicherheitslücken
10. **METRICS COLLECTOR** - Sammelt alle Code-Metriken

**Analyse-Phasen:**
- RECONNAISSANCE → DEEP SCAN → CONNECTION MAPPING → FORENSICS → REPORTING

**Features:**
- Funktions-Katalog mit Aufrufer/Aufgerufene
- Verbindungs-Matrix zwischen allen Funktionen
- Dead Code Detection (Orphaned, Unreachable, Unused)
- Circular Dependency Detection
- Security Vulnerability Scan
- Test Coverage Gaps
---

### 🖥️ Hochkomplex Modern Stable GUI Desktop Team
**Datei:** `agents/HOCHKOMPLEX-MODERN-STABLE-GUI-DESKTOP-TEAM.agent.md`
**Status:** ✅ Repariert (Duplicate Chatagent-Blocks entfernt)

**Zweck:** Elite 12-köpfiges Team für moderne GUI-Desktop-Anwendungen

**Team-Rollen:**
1. **GUI ARCHITECT** - Desktop UI/UX Design
2. **PERFORMANCE OPTIMIZER** - System-Performance
3. **FRAMEWORK SPECIALIST** - WPF/WinUI/Electron
4. **NATIVE API EXPERT** - Windows APIs
5. **THREADING MANAGER** - Multi-Threading
6. **DATA BINDING SPECIALIST** - MVVM/Data Binding
7. **GRAPHICS RENDERER** - 2D/3D Graphics
8. **ACCESSIBILITY EXPERT** - Barrierefreiheit
9. **DEPLOYMENT ENGINEER** - App-Distribution
10. **TESTING SPECIALIST** - UI/Integration Tests
11. **SECURITY HARDENER** - Desktop-Sicherheit
12. **LEGACY MODERNIZER** - Legacy-Upgrades

**Features:**
- Moderne Desktop-Frameworks (WPF, WinUI 3, Electron)
- Performance-optimierte Anwendungen
- Cross-Platform Compatibility
- Enterprise-Ready Security

---

### 🕶️ Shadow Architect Team - Ultimate Covert Analysis
**Datei:** `agents/shadow-architect-team.agent.md`

**Zweck:** 1:1 Software/Repos covert nachbauen und analysieren

**6 Elite Operatives:**
1. **GHOST-ANALYZER** - Deep Code Archaeologist (Binary Analysis, Source Reconstruction)
2. **WEB-SPIDER** - Frontend Infiltrator (JavaScript Deobfuscation, Frontend Cloning)
3. **ARCHITECT-SHADOW** - System Designer (Architecture Reconstruction, Database Schema)
4. **CRYPTO-BREAKER** - Security Analyst (Encryption, Authentication, Protection Bypass)
5. **GUI-PHANTOM** - Interface Replicator (UI/UX Perfect Replication)
6. **NET-HUNTER** - Network Forensics (Protocol Analysis, API Reverse)

**Shadow Arsenal:**
- Static Analysis: IDA Pro, Ghidra, Binary Ninja, Radare2
- Dynamic Analysis: x64dbg, OllyDbg, Process Monitor, API Monitor
- Web Arsenal: Burp Suite, OWASP ZAP, Chrome DevTools, Selenium
- Specialized: Frida, Capstone, Keystone, Unicorn, Angr, Pwntools

**Operational Protocols:**
- Phase 1: Reconnaissance (Tech Stack Detection, Architecture Mapping)
- Phase 2: Deep Infiltration (Surface/Logic/Data/Infrastructure Analysis)
- Phase 3: Perfect Replication (1:1 Functional Copy, Enhanced Architecture)
- Phase 4: Shadow Testing (Behavioral Comparison, Performance Benchmarks)

**Deployment Modes:** Covert (passive), Active (dynamic analysis), Replication (full recreation)

*Educational content only - Alle Aktivitäten für Security Research, Education und legale Competitive Analysis*

---

### 🎮 Cyberpunk C GUI Team
**Datei:** `agents/cyberpunk-c-gui-team.agent.md` (813 Zeilen)

**Zweck:** Elite 15-köpfiges Team für C GUI-Entwicklung

**Team-Rollen:**
1. **CHIEF ARCHITECT** - Framework-Auswahl (GTK4, Qt6, Dear ImGui)
2. **UI/UX DESIGNER** - Cyberpunk Visual Design
3. **CORE DEVELOPER** - C Programming Expert
4. **SECURITY SPECIALIST** - Hacking Tools
5. **QUALITY ENGINEER** - Testing & Debug

**Cyberpunk Design:**
```c
#define NEON_GREEN    0x00FF41
#define CYBER_BLUE    0x0066FF
#define TERMINAL_BG   0x0D1117
```

**Includes:**
- SHADOW ARCHITECT für Reverse Engineering
- Network Scanner, Packet Sniffer
- Cryptographic Hash Crackers

---

### 🛠️ .NET Debug & Fix Team
**Datei:** `agents/dotnet fix team.agent.md` & `agents/dotnet-debug-team.agent.md`

**Zweck:** Debugging, Cleanup und Code-Qualität für .NET/WPF

**5 Team-Rollen:**
1. **DETECTIVE** - Systematische Fehleranalyse
2. **C# SPEZIALIST** - Modernisierung & Performance
3. **ARCHITEKT** - Design Patterns & SOLID
4. **ENTRÜMPLER** - Tech Debt eliminieren
5. **CODE-POLIZIST** - Code Smells & Refactoring

**Debug-Phasen:**
- Problem Assessment → Investigation → Resolution → Quality Assurance

---

### 📈 Dynatrace Expert Agent
**Datei:** `agents/dynatrace-expert.agent.md` (855 Zeilen)

**Zweck:** Observability und Security mit Dynatrace

**MCP-Server:** HTTP-basiert mit Dynatrace API

**6 Core Use Cases:**
1. Incident Response & Root Cause Analysis
2. Deployment Impact Analysis
3. Production Error Triage
4. Performance Regression Detection
5. Release Validation & Health Checks
6. Security Vulnerability Response

**Critical Principles:**
- Exception Analysis ist MANDATORY
- Multi-Source Validation
- Business Impact First

---

### 📄 HTML Structured Agent
**Datei:** `agents/html-structured.agent.md`

**Zweck:** Clean semantic HTML5 Output

**Struktur:**
- `<article>`, `<header>`, `<main>`, `<section>` verwenden
- Code mit `<pre><code class="language-{lang}">` formatieren
- Data Attributes: `data-file`, `data-line`, `data-type`, `data-action`

---

### 🔒 JFrog Security Agent
**Datei:** `agents/jfrog-sec.agent.md`

**Zweck:** DevSecOps Security für Open Source Vulnerabilities

**Workflow:**
1. Policy validieren mit JFrog MCP Tools
2. Dependency Upgrade auf policy-konforme Version
3. Code Resilience erhöhen (z.B. Input Validation)

---

### 🚩 LaunchDarkly Flag Cleanup Agent
**Datei:** `agents/launchdarkly-flag-cleanup.agent.md` (215 Zeilen)

**Zweck:** Feature Flag Hygiene automatisieren

**MCP-Server:** `@launchdarkly/mcp-server`

**Workflow für Flag Removal:**
1. Critical Environments identifizieren
2. Flag Configuration abrufen
3. Forward Value bestimmen
4. Removal Readiness prüfen

**Prinzipien:**
- Safety First - Production Behavior bewahren
- LaunchDarkly als Source of Truth

---

### 🔍 Modern File Search Team
**Datei:** `agents/modern-file-search-team.agent.md` (516 Zeilen)

**Zweck:** Everything-Alternative entwickeln

**Tech Stack:** C# WPF, .NET 8, NTFS MFT Reading, Lucene.NET

**8 Team-Rollen:**
1. System Architect (Core Engine)
2. Modern UI Designer
3. Search Algorithm Expert
4. Performance Engineer
5. ...

**Features:**
- NTFS Master File Table Parsing (10x schneller als Directory.EnumerateFiles)
- Trie-based Indexing für O(m) Suche
- Virtual Scrolling für Millionen Dateien

---

### 🐘 Neon Migration Specialist
**Datei:** `agents/neon-migration-specialist.agent.md`

**Zweck:** Sichere Postgres-Migrationen mit Neon Branching

**Workflow:**
1. Test-Branch mit 4h TTL erstellen
2. Migrationen auf Branch ausführen
3. Validieren
4. Branch löschen
5. PR erstellen (User/CI führt auf main aus)

**KRITISCH:** NIEMALS Migrationen auf Main-Branch ausführen!

---

### ⚡ Neon Performance Analyzer
**Datei:** `agents/neon-optimization-analyzer.agent.md`

**Zweck:** Slow Queries identifizieren und optimieren

**Tools:**
- `pg_stat_statements` für Query-Analyse
- EXPLAIN für Execution Plans
- Before/After Metriken

---

### 🚀 Octopus Deploy Release Notes
**Datei:** `agents/octopus-deploy-release-notes-mcp.agent.md`

**Zweck:** Release Notes aus Octopus Deploy generieren

**MCP-Server:** `@octopusdeploy/mcp-server`

**Workflow:**
- Letzte Release abrufen
- Git Commits analysieren
- Markdown Release Notes erstellen

---

### 🚨 PagerDuty Incident Responder
**Datei:** `agents/pagerduty-incident-responder.agent.md`

**Zweck:** Incidents analysieren und Fixes vorschlagen

**Workflow:**
1. Incident Details abrufen
2. On-Call Team identifizieren
3. Triage-Hypothese formulieren
4. GitHub nach relevanten Commits durchsuchen
5. Remediation PR erstellen

---

### 🖥️ PowerShell 7 GUI Expert Team
**Datei:** `agents/PowerShell-GUI-Team.agent.md` (560 Zeilen)

**Zweck:** Moderne PowerShell 7 WPF GUI-Entwicklung

**6 Team-Rollen:**
1. **UI/UX DESIGNER** - Dark Mode First, Material/Fluent Design
2. **XAML ARCHITEKT** - Saubere XAML-Strukturen
3. **POWERSHELL EXPERT** - PS7 Features (Parallel, Ternary, Null-Coalescing)
4. **COMPONENT BUILDER** - Moderne UI-Komponenten
5. ...

**Design-Palette:**
```xml
<Color x:Key="PrimaryDark">#1E1E2E</Color>
<Color x:Key="AccentBlue">#7AA2F7</Color>
<Color x:Key="AccentGreen">#9ECE6A</Color>
```

---

### 🔐 StackHawk Security Onboarding
**Datei:** `agents/stackhawk-security-onboarding.agent.md` (248 Zeilen)

**Zweck:** StackHawk Security Testing einrichten

**MCP-Server:** `stackhawk-mcp`

**Analyse-Protokoll:**
1. Attack Surface Assessment (Application vs. Library)
2. Framework & Language Detection
3. Host Pattern Detection
4. Authentication Analysis

---

### 🔄 SyncManager Expert Team
**Datei:** `agents/SyncManager-Expert-Team.agent.md` (652 Zeilen)

**Zweck:** PowerShell SyncManager Weiterentwicklung

**7 Team-Rollen:**
1. **FEATURE ARCHITECT** - Feature-Roadmap
2. **UI/UX DESIGNER** - Modern Dashboard
3. **SYNC ENGINE DEVELOPER** - Robuste Sync-Logik
4. ...

**Feature-Roadmap:**
- Phase 1: Echtzeit-Fortschritt, Zeitplanung, Filter
- Phase 2: Statistiken, Notifications, Reports
- Phase 3: Netzlaufwerk-Auth, Verschlüsselung, SSH/SFTP

---

### 🌍 Terraform Agent
**Datei:** `agents/terraform.agent.md` (393 Zeilen)

**Zweck:** Terraform IaC mit HCP Terraform Workflows

**MCP-Server:** `hashicorp/terraform-mcp-server`

**Capabilities:**
- Registry Intelligence (öffentlich & privat)
- Code-Generierung mit aktuellen Versionen
- Modul-Tests mit Terraform Test
- Workspace-Automatisierung

**Workflow:**
1. Neueste Versionen auflösen
2. Private Registry zuerst, dann Public
3. HCP Terraform Backend konfigurieren

---

### 🪟 WindowPositionManager Team
**Datei:** `agents/WindowPositionManager-Team.agent.md` (635 Zeilen)

**Zweck:** Windows Fensterpositionen speichern/wiederherstellen

**Roadmap:**
- Multi-Monitor Support
- Profile-System
- System Tray Integration
- Virtual Desktop Support
- Snap-Layout-Erkennung (Win11)

**Win32 APIs:**
- `MonitorFromWindow`, `GetMonitorInfo`
- `GetWindowPlacement`, `SetWindowPlacement`
- `DwmGetWindowAttribute` für Snap-Layout

---

### 🖼️ WinForms Expert
**Datei:** `agents/WinFormsExpert.agent.md` (629 Zeilen)

**Zweck:** .NET WinForms Designer-kompatible Apps

**Kritisch - Zwei Code-Kontexte:**
| Context | Files | Language Level |
|---------|-------|----------------|
| Designer Code | *.designer.cs | C# 2.0 Features |
| Regular Code | *.cs | Modern C# 11-14 |

**Designer-Verbote:**
- Keine `if`, `for`, `foreach`, `switch`, `try/catch`
- Keine Lambdas, Collection Expressions
- Keine `??`, `?.`, `nameof()`

**Neue Projekte:**
- Prefer .NET 10+
- MVVM Binding requires .NET 8+
- DarkMode: `Application.SetColorMode(SystemColorMode.System)`

---

## 3. Chatmodes (Spezielle Konversationsmodi)

**Status:** 98 Chatmodes verfügbar
**Neue Features:** Deutsche Lokalisierung für technische Chatmodes

### 🧠 Critical Thinking Chatmode
**Datei:** `chatmodes/critical-thinking.chatmode.md`
**Status:** ✅ Vollständig ins Deutsche übersetzt

**Deutsche Features:**
- Systematisches Hinterfragen mit "Warum?"
- Detailorientierte strategische Analyse
- Annahmen-Überprüfung und Alternativen-Vorschläge

### 🔧 .NET Upgrade Specialist
**Datei:** `chatmodes/dotnet-upgrade.chatmode.md`  
**Status:** ✅ Vollständig ins Deutsche übersetzt (223 Zeilen)

**Deutsche Übersetzung umfasst:**
- Framework-Upgrade-Strategien
- Validierungs-Checklisten
- Branching & Rollback-Strategien
- Automatisierung & Skalierung
- Prompt-Bibliothek

### 🐛 Debugging Team Chatmode
**Datei:** `chatmodes/dotnet-debug-team.chatmode.md`
**Status:** ✅ Technische Abschnitte ins Deutsche übersetzt

### 📚 Demonstrate Understanding
**Datei:** `chatmodes/demonstrate-understanding.chatmode.md`
**Status:** ✅ Vollständig ins Deutsche übersetzt

### 🐞 Debug Mode
**Datei:** `chatmodes/debug.chatmode.md`

**Phasen:**
1. Problem Assessment - Kontext, Reproduktion
2. Investigation - Root Cause Analysis
3. Resolution - Minimale, zielgerichtete Fixes
4. Quality Assurance - Tests, Regression

---

### 🦁 4.1 Beast Mode
**Datei:** `chatmodes/4.1-Beast.chatmode.md`

**Modell:** GPT-4.1

**Prinzipien:**
- Vollständig autonom bis Problem gelöst
- Extensive Internet-Recherche mit `fetch_webpage`
- Todo-Liste komplett abarbeiten
- Edge Cases rigoros testen

**Workflow:**
1. URLs fetchen
2. Problem verstehen
3. Codebase untersuchen
4. Internet recherchieren
5. Plan entwickeln
6. Inkrementell implementieren
7. Testen & iterieren

---

### 📐 Blueprint Mode Codex
**Datei:** `chatmodes/blueprint-mode-codex.chatmode.md`

**Modell:** GPT-5-Codex (Preview)

**Core Directives:**
- Workflow First (Loop, Debug, Express, Main)
- Accuracy > Speed
- Keine Annahmen - alles verifizieren
- SOLID, Clean Code, DRY, KISS, YAGNI

**Tool Usage:**
- Parallele Reads wenn möglich
- `codebase` für Code-Suche
- `playwright` für UI Testing
- Niemals Files über Terminal editieren

---

### 🧼 Clean Code Mode
**Datei:** `chatmodes/clean-code.chatmode.md`

**Fokus:**
- Code Smells identifizieren
- Refactoring für Lesbarkeit
- Clean Code + SOLID Referenzen

**Prinzipien:**
- Kleine Funktionen mit klaren Namen
- SRP, Open/Closed, DRY, YAGNI
- Minimale Side Effects
- Keine tiefe Verschachtelung

---

## 4. Instructions (Programmiersprachen-Richtlinien)

> **Hinweis:** Das `.github/.instructions/` Verzeichnis enthält **113 Instruction-Dateien** für verschiedene Technologien.

### Ausgewählte Instructions:

#### 💻 C# Instructions
**Datei:** `.instructions/csharp.instructions.md`

- C# 13 Features verwenden
- PascalCase für Komponenten/Methoden
- camelCase für private Felder
- Pattern Matching, Switch Expressions
- XML Doc Comments für public APIs

---

#### ⚡ PowerShell Instructions
**Datei:** `.instructions/powershell.instructions.md`

- Verb-Noun Format (Get-Verb)
- PascalCase für Parameter
- Keine Aliases in Scripts
- `[CmdletBinding()]` verwenden
- Proper Validation mit `ValidateSet`

---

#### 🐍 Python Instructions
**Datei:** `.instructions/python.instructions.md`

- PEP 8 Style Guide
- Type Hints verwenden
- Docstrings nach PEP 257
- 4 Spaces Indentation
- Max 79 Zeichen pro Zeile

---

#### 🔐 Security & OWASP Instructions
**Datei:** `.instructions/security-and-owasp.instructions.md`

**OWASP Top 10 Coverage:**
- A01: Broken Access Control - Least Privilege, Deny by Default
- A02: Cryptographic Failures - Argon2/bcrypt, AES-256
- A03: Injection - Parameterized Queries, XSS Prevention
- A05: Security Misconfiguration - Headers (CSP, HSTS)
- A07: Authentication Failures - Session Management
- A10: SSRF - URL Allow-List Validation

---

#### 🏗️ Terraform Instructions
**Datei:** `.instructions/terraform.instructions.md`

- Neueste Terraform/Provider Versionen
- Secrets in Secrets Manager, nicht in State
- `sensitive = true` für sensible Variablen
- Module für Wiederverwendung
- `tfsec`, `checkov` für Security Scans

---

#### 📘 TypeScript MCP Server Instructions
**Datei:** `.instructions/typescript-mcp-server.instructions.md`

- `@modelcontextprotocol/sdk` Package
- `McpServer` für High-Level API
- Zod für Schema Validation
- `registerTool()`, `registerResource()`, `registerPrompt()`
- Test mit MCP Inspector

---

#### 🐹 Go Instructions
**Datei:** `.instructions/go.instructions.md`

- Effective Go Practices
- Lowercase Package-Namen
- MixedCaps für Variablen
- Early Return Pattern
- Standard Library bevorzugen
- **NIEMALS** doppelte `package` Deklarationen

---

#### 🧠 Memory Bank Instructions
**Datei:** `.instructions/memory-bank.instructions.md`

**Struktur:**
1. `projectbrief.md` - Foundation
2. `productContext.md` - Why, Problems, UX Goals
3. `activeContext.md` - Current Focus
4. `systemPatterns.md` - Architecture
5. `techContext.md` - Tech Stack
6. `progress.md` - What Works

---

## 5. Prompts (Vordefinierte Prompts)

> **Hinweis:** Das `.github/prompts/` Verzeichnis enthält **~100 Prompt-Paare** (.prompt.md + .readme.md)

### Kategorien:

#### 📋 Projekt-Management
- `create-specification.prompt.md`
- `create-implementation-plan.prompt.md`
- `create-github-issue-feature-from-specification.prompt.md`
- `breakdown-epic-arch.prompt.md`
- `breakdown-feature-prd.prompt.md`

#### 🔧 Code-Generierung
- `csharp-mcp-server-generator.prompt.md`
- `typescript-mcp-server-generator.prompt.md`
- `python-mcp-server-generator.prompt.md`
- `go-mcp-server-generator.prompt.md`
- `java-springboot.prompt.md`

#### 📖 Dokumentation
- `create-readme.prompt.md`
- `create-llms.prompt.md`
- `documentation-writer.prompt.md`
- `add-educational-comments.prompt.md`

#### 🧪 Testing
- `csharp-xunit.prompt.md`
- `csharp-nunit.prompt.md`
- `playwright-generate-test.prompt.md`
- `java-junit.prompt.md`

#### 🏗️ Architektur
- `architecture-blueprint-generator.prompt.md`
- `create-architectural-decision-record.prompt.md`
- `technology-stack-blueprint-generator.prompt.md`

#### 🔄 Refactoring
- `review-and-refactor.prompt.md`
- `java-refactoring-extract-method.prompt.md`
- `dotnet-upgrade.prompt.md`

#### 🎯 GitHub Copilot
- `suggest-awesome-github-copilot-agents.prompt.md`
- `suggest-awesome-github-copilot-chatmodes.prompt.md`
- `suggest-awesome-github-copilot-instructions.prompt.md`
- `suggest-awesome-github-copilot-prompts.prompt.md`

---

## 📊 Statistiken

| Kategorie | Anzahl | Verzeichnis |
|-----------|--------|-------------|
| Agents | 22 | `.github/agents/` |
| Chatmodes | ~110 | `.github/chatmodes/` |
| Instructions | ~113 | `.github/.instructions/` |
| Prompts | ~200 | `.github/prompts/` |
| **Gesamt** | **~445** | |

---

## 🔧 Scripts

### `scripts/create-backup.ps1`
PowerShell-Script für Workspace-Backups

---

*Protokoll erstellt von GitHub Copilot (Claude Opus 4.5)*
---

## 📈 Aktuelle Workspace-Statistiken (24. Januar 2026)

### Parameter-System Erweiterungen
- **✅ /critical -talk:** Dual-Voice-System (CODEX + Kritischer Denker)
- **✅ /translate -ger:** Deutsche Übersetzung für technische Inhalte

### Deutsche Lokalisierung
- **✅ critical-thinking.chatmode.md** - Vollständig übersetzt
- **✅ dotnet-upgrade.chatmode.md** - 223 Zeilen vollständig übersetzt
- **✅ dotnet-debug-team.chatmode.md** - Technische Abschnitte übersetzt
- **✅ demonstrate-understanding.chatmode.md** - Vollständig übersetzt

### Agent-Reparaturen
- **✅ HOCHKOMPLEX-MODERN-STABLE-GUI-DESKTOP-TEAM.agent.md** - Duplicate Chatagent-Blocks entfernt

### Aktuelle Workspace-Größe
- **📄 Instructions:** 113 Dateien
- **🤖 Agents:** 55 Agenten-Dateien (+ index.md)
- **💬 Chatmodes:** 98 Konversationsmodi (+ index.md)
- **📝 Prompts:** 162 vordefinierte Prompts
- **📋 Gesamt:** 430 Markdown-Dateien

### Technische Verbesserungen
- Systematische deutsche Übersetzung technischer Dokumentation
- Bewahrung englischer Fachterminologie
- Dual-Voice Critical Thinking für tiefere Analyse
- Verbesserte Agent-Syntax-Stabilität
- **12 neue Parameter** für erweiterte MD-File-Verwaltung
- **Error-Handling & Safety-Features** mit Auto-Backup und Graceful Degradation
- **Auto-Index-System** für organisierte Navigation
- **Template-basierte MD-Erstellung** für Konsistenz
- **Smart-Linking-System** zwischen verwandten MD-Dateien

**Status:** Workspace vollständig funktionsfähig und zweisprachig optimiert

---

*Letzte Aktualisierung: 24. Januar 2026 - CODEX*
