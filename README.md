```
    ############ #### ########   ####  ####     ##########    ####
    ############ #### ########   ####  ####     ##########    ####
        ####     #### ####  #### ####  ####     ####  ####    ####
        ####     #### ####  #### ####  ####     ####  ####    ####
        ####     #### ####  ####  ########      ##########    ####
        ####     #### ####  ####   ######       ##########    ####
        ####     #### ####  ####    ####        ####  ####    ####
        ####     #### ########      ####        ####  ####    ####
        ####     #### ########      ####        ####  #### ## ####
```

<div align="center">
<img src="https://raw.githubusercontent.com/geetbatth/tidyai/main/media/screenshot.jpg" alt="TidyAI Screenshot" width="600">
</div>

## Es gibt eine Version in Bash für Unix-basierte Systeme. Schau sie dir [hier](/README_SHELL.md) an.

# KI-gestützte Dateiorganisation für Windows

## Funktionen
- 🤖 **KI-gestützt** - Nutzt ChatGPT zur intelligenten Dateiorganisation
- 📁 **Rechtsklick-Integration** - Funktioniert direkt aus dem Windows Explorer  
- 🛡️ **Sicher** - Benennt/löscht niemals Dateien, verschiebt sie nur in Ordner
- 🔄 **Rückgängig-System** - Einfaches Rückgängigmachen mit einem Klick
- 📦 **Stapelverarbeitung** - Verarbeitet große Ordner in Stapeln
- 💰 **Kostengünstig** - Verwendet GPT-4 Mini Modell, sehr günstig im Betrieb
- ⚡ **Reines PowerShell** - Keine externen Abhängigkeiten, läuft auf jedem Windows-Rechner

## 🎬 TidyAI in Aktion

<div align="center">
<img src="https://raw.githubusercontent.com/geetbatth/tidyai/main/media/demo.gif" alt="TidyAI Demo" width="600">
</div>



## Installation
1. Rechtsklick auf `setup.bat` → "Als Administrator ausführen"
2. OpenAI API-Schlüssel von [platform.openai.com](https://platform.openai.com/api-keys) holen
3. Schlüssel während der Installation eingeben oder `setx TidyAIOpenAIAPIKey "dein-schlüssel-hier"`

## Verwendung
Rechtsklick auf beliebigen Ordner → "🧹 Mit TidyAI aufräumen"

## 🔄 Rückgängig-System
TidyAI enthält ein leistungsstarkes Rückgängig-System, das die Organisation vollständig sicher und umkehrbar macht:

### **Wie es funktioniert**
- **Automatisches Backup**: Vor der Organisation speichert TidyAI deine aktuelle Ordnerstruktur in einer versteckten `.tidyai`-Datei
- **Rückgängig**: Nach der Organisation bietet TidyAI an, die Änderungen rückgängig zu machen, falls dir das Ergebnis nicht gefällt
- **Intelligente Erkennung**: Wenn du TidyAI auf einem bereits organisierten Ordner ausführst, erkennt es das Backup und bietet an, es rückgängig zu machen


## Deinstallation
`appwiz.cpl` → "TidyAI" entfernen oder `Uninstall-TidyAI.ps1` ausführen

## Mitwirken
Pull Requests sind willkommen!

---
**Erstellt von Geet**
