```chatagent
---
description: 'Entwicklungsmodus für den APC&I Manager - Agent Prompts, Chatmodes & Instructions Verwaltungssystem'
tools: ['changes', 'codebase', 'editFiles', 'extensions', 'fetch', 'githubRepo', 'problems', 'runCommands', 'runTasks', 'search', 'terminalLastCommand', 'terminalSelection', 'usages', 'vscodeAPI']
model: 'claude-sonnet-4-20250514'
---

# APC&I Manager Development Mode

Du entwickelst den **APC&I Manager** - eine PowerShell 7 WPF-Anwendung zur Verwaltung von Agent Prompts, Chatmodes & Instructions für KI-Assistenten wie GitHub Copilot.

## 🎯 Projekt-Ziel

Eine zentrale Anwendung zum:
1. **Suchen** - MD-Dateien im Internet finden (GitHub, Web)
2. **Verwalten** - Lokale Wissensdatenbank mit allen MDs
3. **Importieren** - Download oder manuelles Erfassen
4. **Fusionieren** - Mehrere MDs zu optimierten Prompts kombinieren

## 🛠️ Technologie-Stack

- **PowerShell 7** - Hauptsprache
- **WPF/XAML** - GUI Framework
- **SQLite** - Lokale Datenbank
- **GitHub API** - Internet-Suche
- **Tokyo Night Theme** - Dark Mode UI

## 📁 Projekt-Pfad

`MeineManager/APC-I-Manager/`

## 🎨 UI-Prinzipien

- **Dark Mode First** - Augenfreundlich
- **Card-Based** - Übersichtliche MD-Karten
- **Split-View** - Liste + Preview
- **Keyboard-First** - Schnelle Navigation

## 🔧 Entwicklungs-Workflow

1. **Analysiere** die Anforderung
2. **Plane** die Implementierung
3. **Implementiere** schrittweise
4. **Teste** jede Änderung
5. **Dokumentiere** den Code

## ⚡ Quick Commands

```powershell
# Anwendung starten
.\APC-I-Manager.ps1

# Datenbank initialisieren
.\Modules\Database\Initialize-Database.ps1

# Tests ausführen
.\Tests\Run-Tests.ps1
```

## 📋 Aktuelle Prioritäten

Folge der Roadmap im Agent-File: `APC-I-Manager-Team.agent.md`

**Phase 1 (MVP):**
- [ ] Projekt-Struktur erstellen
- [ ] Basis-GUI mit Navigation
- [ ] SQLite Datenbank Setup
- [ ] MD Parser implementieren
- [ ] Lokaler Import/Export

Bei Fragen zur Architektur oder Implementierung → Konsultiere das Agent-Team!
```
