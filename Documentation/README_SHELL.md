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
<img src="media/screenshot_linux.png" alt="TidyAI Screenshot" width="600">
</div>

# KI-gestützte Dateiorganisation für macOS & Linux

## Funktionen
- 🤖 **KI-gestützt** - Nutzt mehrere KI-Anbieter zur intelligenten Dateiorganisation
- 🌐 **Multi-Provider-Unterstützung** - OpenAI, OpenRouter, Groq, Azure und mehr
- 🐧 **Plattformübergreifend** - Funktioniert auf macOS, Linux und jedem Unix-ähnlichen System
- 🛡️ **Sicher** - Benennt/löscht niemals Dateien, verschiebt sie nur in Ordner
- 🔄 **Rückgängig-System** - Einfaches Rückgängigmachen mit einem Befehl
- 📦 **Stapelverarbeitung** - Verarbeitet große Ordner in Stapeln
- 💰 **Kostengünstig** - Verwendet effiziente Modelle wie GPT-4o Mini und Gemini 2.5 Flash
- ⚡ **Reines Shell** - Benötigt nur bash, curl und jq - keine komplexen Abhängigkeiten

## 🎬 TidyAI in Aktion

<!-- <div align="center">
<img src="https://raw.githubusercontent.com/geetbatth/tidyai/main/media/demo.gif" alt="TidyAI Demo" width="600">
</div> -->
[TODO]

## Voraussetzungen

Stelle vor der Verwendung des TidyAI-Shell-Skripts sicher, dass du die erforderlichen Abhängigkeiten hast:

### macOS
```bash
# Install via Homebrew
brew install jq curl

# curl is usually pre-installed on macOS
```

### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install -y jq curl
```

### Arch Linux
```bash
sudo pacman -S jq curl
```

### CentOS/RHEL/Fedora
```bash
# CentOS/RHEL
sudo yum install -y jq curl

# Fedora
sudo dnf install -y jq curl
```

## Installation

1. **Lade das Skript herunter:**
   ```bash
   wget https://raw.githubusercontent.com/geetbatth/tidyai/main/tidyai.sh
   chmod +x tidyai.sh
   ```

2. **Richte deinen API-Schlüssel ein:**
   ```bash
   # Bevorzugte Methode (neue Variable)
   export TIDYAI_API_KEY="dein-api-schlüssel-hier"
   
   # Legacy-Methode (wird noch unterstützt)
   export TidyAIOpenAIAPIKey="dein-api-schlüssel-hier"
   
   # Dauerhaft machen durch Hinzufügen zum Shell-Profil
   echo 'export TIDYAI_API_KEY="dein-api-schlüssel-hier"' >> ~/.bashrc
   # oder ~/.zshrc für zsh-Nutzer
   ```

3. **Hole einen API-Schlüssel:**
   - **OpenAI**: [platform.openai.com/api-keys](https://platform.openai.com/api-keys)
   - **OpenRouter**: [openrouter.ai](https://openrouter.ai)
   - **Groq**: [console.groq.com](https://console.groq.com)
   - **Andere Anbieter**: Siehe deren jeweilige Dokumentation

## Verwendung

### Grundlegende Verwendung
```bash
# Ordner mit Standardeinstellungen organisieren (OpenAI)
./tidyai.sh ~/Downloads

# Mit einem bestimmten Anbieter organisieren
./tidyai.sh --provider openrouter ~/Documents
./tidyai.sh --provider groq ~/Desktop
```

### Anbieter-Beispiele

#### OpenAI (Default)
```bash
export TIDYAI_API_KEY="sk-..."
./tidyai.sh --provider openai ~/Downloads
```

#### OpenRouter
```bash
export TIDYAI_API_KEY="sk-or-..."
./tidyai.sh --provider openrouter --model openrouter/gpt-4o-mini ~/Downloads
```

#### Groq
```bash
export TIDYAI_API_KEY="gsk_..."
./tidyai.sh --provider groq --model llama-3.1-70b-versatile ~/Downloads
```

#### Azure OpenAI
```bash
export TIDYAI_API_KEY="your-azure-key"
./tidyai.sh --provider azure \
  --api-base "https://your-resource.openai.azure.com" \
  --model "your-deployment-name" \
  ~/Downloads
```

#### Local AI (LM Studio)
```bash
# No API key needed for local models
./tidyai.sh --provider lmstudio \
  --api-base "http://localhost:1234" \
  --model "qwen2.5:7b" \
  ~/Downloads
```

### Erweiterte Konfiguration

#### Umgebungsvariablen
```bash
export TIDYAI_PROVIDER="openrouter"
export TIDYAI_API_BASE="https://openrouter.ai/api"
export TIDYAI_MODEL="openrouter/gpt-4o-mini"
export TIDYAI_API_KEY="dein-schlüssel"

# Dann einfach ausführen:
./tidyai.sh ~/Downloads
```

#### Kommandozeilenoptionen
```bash
./tidyai.sh --help  # Zeige alle verfügbaren Optionen

# Benutzerdefinierte API-Konfiguration
./tidyai.sh \
  --provider custom \
  --api-base "https://api.example.com" \
  --api-path "/v1/chat/completions" \
  --model "custom-model" \
  --api-key "dein-schlüssel" \
  ~/zu-organisierender-ordner
```

## 🔄 Rückgängig-System
TidyAI enthält ein leistungsstarkes Rückgängig-System, das die Organisation vollständig sicher und umkehrbar macht:

### **Wie es funktioniert**
- **Automatisches Backup**: Vor der Organisation speichert TidyAI deine aktuelle Ordnerstruktur in einer versteckten `.tidyai`-Datei
- **Rückgängig**: Nach der Organisation bietet TidyAI an, die Änderungen rückgängig zu machen, falls dir das Ergebnis nicht gefällt
- **Intelligente Erkennung**: Wenn du TidyAI auf einem bereits organisierten Ordner ausführst, erkennt es das Backup und bietet an, es rückgängig zu machen

## Unterstützte KI-Anbieter

| Anbieter | API-Basis | Hinweise |
|----------|----------|----------|
| **OpenAI** | `https://api.openai.com` | Standard-Anbieter, zuverlässigster |
| **OpenRouter** | `https://openrouter.ai/api` | Zugriff auf mehrere Modelle |
| **Groq** | `https://api.groq.com/openai` | Schnelle Inferenz, kostenlose Stufe |
| **Fireworks** | `https://api.fireworks.ai/openai` | Hochleistungsmodelle |
| **Together** | `https://api.together.xyz` | Open-Source-Modelle |
| **Perplexity** | `https://api.perplexity.ai` | Sucherweiterte Modelle |
| **DeepSeek** | `https://api.deepseek.com` | Kostengünstiger chinesischer Anbieter |
| **Azure OpenAI** | `https://<resource>.openai.azure.com` | Enterprise-Qualität |
| **LM Studio** | `http://localhost:1234` | Lokale Modelle |
| **LocalAI/vLLM** | `http://localhost:8000` | Selbst gehostete Lösungen |

## Problemlösung

### Häufige Probleme

**"command not found: jq"**  
Installiere jq für dein System (siehe Abschnitt Voraussetzungen)

**"Error: API key not configured!"**
```bash
# Set your API key
export TIDYAI_API_KEY="your-key-here"
```

**"permission denied: ./tidyai.sh"**
```bash
# Make script executable
chmod +x tidyai.sh
```

**"Empty response received from provider"**  
Check your API key and provider settings.  
Verify the provider is accessible from your network.

## Differences from Windows Version

The shell script version includes several enhancements over the original PowerShell version:

- ✅ **Multi-provider support** - Not limited to OpenAI
- ✅ **Local AI support** - Works with self-hosted models
- ✅ **Cross-platform compatibility** - Works on any Unix-like system
- ✅ **Flexible authentication** - Supports various auth schemes

## Contribute
Pull requests welcome!

---

**Shell Script Port by Polyzium**  
**Original Created by Geet**
