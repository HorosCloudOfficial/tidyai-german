---
description: 'Führe Aufräumarbeiten an C#/.NET Code durch, einschließlich Bereinigung, Modernisierung und Tech-Debt-Beseitigung.'
tools: ['codebase', 'edit/editFiles', 'search', 'runCommands', 'runTasks', 'runTests', 'problems', 'changes', 'usages', 'findTestFiles', 'testFailure', 'terminalLastCommand', 'terminalSelection', 'fetch', 'microsoft.docs.mcp']
---

# .NET Upgrade Sammlung

.NET Framework Upgrade-Spezialist für umfassende Projektmigration

**Tags:** dotnet, upgrade, migration, framework, modernisierung

## Sammlungsverwendung

### .NET Upgrade Chat Modus

Entdecke und plane deine .NET Upgrade-Reise!

```markdown, upgrade-analysis.prompt.md
---
mode: dotnet-upgrade
title: Aktuelle .NET Framework-Versionen analysieren und Upgrade-Plan erstellen
---
Analysiere das Repository und liste das aktuelle TargetFramework jedes Projekts
zusammen mit der neuesten verfügbaren LTS-Version aus Microsofts Release-Zeitplan auf.
Erstelle eine Upgrade-Strategie, die Projekte mit den wenigsten Abhängigkeiten priorisiert.
```

Der Upgrade-Chat-Modus passt sich automatisch an die aktuelle .NET-Version deines Repositorys an und bietet kontextbezogene Upgrade-Anleitung zur nächsten stabilen Version.

Er hilft dir dabei:
- Automatische Erkennung aktueller .NET-Versionen in allen Projekten
- Generierung optimaler Upgrade-Sequenzen
- Identifikation von Breaking Changes und Modernisierungsmöglichkeiten
- Erstellung projektspezifischer Upgrade-Flows

---

### .NET Upgrade Anweisungen

Führe umfassende .NET Framework-Upgrades mit strukturierter Anleitung durch!

Die Anweisungen bieten:
- Sequenzielle Upgrade-Strategien
- Abhängigkeitsanalyse und -sequenzierung
- Framework-Targeting und Code-Anpassungen
- NuGet- und Abhängigkeits-Management
- CI/CD Pipeline-Updates
- Test- und Validierungsverfahren

Verwende diese Anweisungen bei der Implementierung von Upgrade-Plänen, um ordnungsgemäße Ausführung und Validierung sicherzustellen.

---

### .NET Upgrade Prompts

Schneller Zugriff auf spezialisierte Upgrade-Analyse-Prompts!

Die Prompts-Sammlung enthält gebrauchsfertige Abfragen für:
- Projektentdeckung und -bewertung
- Upgrade-Strategie und -sequenzierung
- Framework-Targeting und Code-Anpassungen
- Breaking Change-Analyse
- CI/CD Pipeline-Updates
- Finale Validierung und Bereitstellung

Verwende diese Prompts für gezielte Analyse spezifischer Upgrade-Aspekte.

---

## Schnellstart
1. Führe einen Discovery-Pass durch, um alle `*.sln` und `*.csproj` Dateien im Repository aufzulisten.
2. Erkenne die aktuell verwendete(n) .NET-Version(en) in allen Projekten.
3. Identifiziere die neueste verfügbare stabile .NET-Version (LTS bevorzugt) — normalerweise `+2` Jahre vor der bestehenden Version.
4. Generiere einen Upgrade-Plan für den Wechsel von aktuell → nächste stabile Version (z.B. `net6.0 → net8.0`, oder `net7.0 → net9.0`).
5. Upgrade ein Projekt nach dem anderen, validiere Builds, aktualisiere Tests und passe CI/CD entsprechend an.

---

## Automatische Erkennung der aktuellen .NET-Version
Um automatisch die aktuellen Framework-Versionen in der gesamten Lösung zu erkennen:

```bash
# 1. Check global SDKs installed
dotnet --list-sdks

# 2. Detect project-level TargetFrameworks
find . -name "*.csproj" -exec grep -H "<TargetFramework" {} \;

# 3. Optional: summarize unique framework versions
grep -r "<TargetFramework" **/*.csproj | sed 's/.*<TargetFramework>//;s/<\/TargetFramework>//' | sort | uniq

# 4. Verify runtime environment
dotnet --info | grep "Version"
```

**Chat Prompt:**
> "Analysiere das Repository und liste das aktuelle TargetFramework jedes Projekts zusammen mit der neuesten verfügbaren LTS-Version aus Microsofts Release-Zeitplan auf."

---

## Entdeckungs- & Analyse-Befehle
```bash
# List all projects
dotnet sln list

# Check current target frameworks for each project
grep -H "TargetFramework" **/*.csproj

# Check outdated packages
dotnet list <ProjectName>.csproj package --outdated

# Generate dependency graph
dotnet msbuild <ProjectName>.csproj /t:GenerateRestoreGraphFile /p:RestoreGraphOutputPath=graph.json
```

**Chat Prompt:**
> "Analysiere die Lösung und fasse das aktuelle TargetFramework jedes Projekts zusammen und schlage die geeignete nächste LTS-Upgrade-Version vor."

---

## Klassifikationsregeln
- `TargetFramework` beginnt mit `netcoreapp`, `net5.0+`, `net6.0+`, etc. → **Modernes .NET**
- `netstandard*` → **.NET Standard** (migriere zur aktuellen .NET-Version)
- `net4*` → **.NET Framework** (migriere über Zwischenschritt zu .NET 6+)

---

## Upgrade-Sequenz
1. **Beginne mit unabhängigen Bibliotheken:** Klassenbibliotheken mit den wenigsten Abhängigkeiten zuerst.
2. **Als nächstes:** Geteilte Komponenten und gemeinsame Utilities.
3. **Dann:** API-, Web- oder Function-Projekte.
4. **Zuletzt:** Tests, Integrationspunkte und Pipelines.

**Chat Prompt:**
> "Generiere die optimale Upgrade-Reihenfolge für dieses Repository und priorisiere dabei Projekte mit den wenigsten Abhängigkeiten."

---

## Projektspezifischer Upgrade-Flow
1. **Branch erstellen:** `upgrade/<projekt>-to-<zielVersion>`
2. **`<TargetFramework>` bearbeiten** in der `.csproj` zur vorgeschlagenen Version (ändern z.B. `net9.0`)
3. **Restore & Update Pakete:**
   ```bash
   dotnet restore
   dotnet list package --outdated
   dotnet add package <PackageName> --version <LatestVersion>
   ```
4. **Build & Test:**
   ```bash
   dotnet build <ProjectName>.csproj
   dotnet test <ProjectName>.Tests.csproj
   ```
5. **Probleme beheben** — veraltete APIs auflösen, Konfigurationen anpassen, JSON/Logging/DI modernisieren.
6. **Commit & Push** PR mit Testnachweis und Checkliste.

---

## Breaking Changes & Modernisierung
- Verwende `.NET Upgrade Assistant` für initiale Empfehlungen.
- Wende Analyzer an, um veraltete APIs zu erkennen.
- Ersetze veraltete SDKs (z.B. `Microsoft.Azure.*` → `Azure.*`).
- Modernisiere Startup-Logik (`Startup.cs` → `Program.cs` Top-Level-Statements).

**Chat Prompt:**
> "Liste veraltete oder inkompatible APIs beim Upgrade von <aktuelleVersion> zu <zielVersion> für <ProjektName> auf."

---

## CI/CD Konfigurations-Updates
Stelle sicher, dass Pipelines die erkannte **Ziel-Version** dynamisch verwenden:

**Azure DevOps**
```yaml
- task: UseDotNet@2
  inputs:
    packageType: 'sdk'
    version: '$(TargetDotNetVersion).x'
```

**GitHub Actions**
```yaml
- uses: actions/setup-dotnet@v4
  with:
    dotnet-version: '${{ env.TargetDotNetVersion }}.x'
```

---

## Validierungs-Checkliste
- [ ] TargetFramework auf nächste stabile Version upgegradet
- [ ] Alle NuGet-Pakete kompatibel und aktualisiert
- [ ] Build- und Test-Pipelines erfolgreich lokal und in CI
- [ ] Integrationstests bestanden
- [ ] In niedrigere Umgebung deployed und verifiziert

---

## Branching & Rollback-Strategie
- Verwende Feature-Branches: `upgrade/<projekt>-to-<zielVersion>`
- Committe häufig und halte Änderungen atomisch
- Falls CI nach Merge fehlschlägt, reverte PR und isoliere fehlschlagende Module

**Chat Prompt:**
> "Schlage einen Rollback- und Validierungsplan vor, falls das .NET-Upgrade für <ProjektName> Build- oder Runtime-Regressionen einführt."

---

## Automatisierung & Skalierung
- Automatisiere Upgrade-Erkennung mit GitHub Actions oder Azure Pipelines.
- Plane nächtliche Ausführungen, um neue .NET-Releases via `dotnet --list-sdks` zu prüfen.
- Verwende Agents, um automatisch PRs für veraltete Frameworks zu erstellen.

---

## Chatmode Prompt-Bibliothek
1. "Liste alle Projekte mit aktuellen und empfohlenen .NET-Versionen auf."
2. "Generiere einen projektspezifischen Upgrade-Plan von <aktuelleVersion> zu <zielVersion>."
3. "Schlage .csproj- und Pipeline-Bearbeitungen vor, um <ProjektName> zu upgraden."
4. "Fasse Build-/Testergebnisse nach dem Upgrade für <ProjektName> zusammen."
5. "Erstelle PR-Beschreibung und Checkliste für das Upgrade."

---
