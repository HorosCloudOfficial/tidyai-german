# 🎯 .github Ordner - Visuelle Struktur-Dokumentation

*Generiert am: 26. Januar 2026 - CODEX Ultimate Project Analysis Team*

---

## 🏗️ **GESAMTARCHITEKTUR ÜBERSICHT**

```mermaid
graph TB
    subgraph ".github Workspace Structure"
        ROOT[".github/"]
        
        %% Core Files
        ROOT --> COPILOT["copilot-instructions.md"]
        ROOT --> README["README.md"]
        ROOT --> CONFIGS["agent-configs.md"]
        ROOT --> PROTO["WORKSPACE-PROTOKOLL.md"]
        ROOT --> VERB["copilot-instructions-verbesserungen.md"]
        ROOT --> UPDATE["update_summary.md"]
        
        %% Directories
        ROOT --> AGENTS["agents/"]
        ROOT --> CHATMODES["chatmodes/"]
        ROOT --> PROMPTS["prompts/"]
        ROOT --> SCRIPTS["scripts/"]
        ROOT --> INSTR1[".instructions/"]
        ROOT --> INSTR2["instructions/"]
        
        %% Agents Breakdown
        AGENTS --> A_GUI["GUI Teams (6x)"]
        AGENTS --> A_MANAGER["Manager Teams (15x)"]
        AGENTS --> A_ANALYSIS["Analysis Teams (4x)"]
        AGENTS --> A_TECH["Tech Specialists (25x)"]
        AGENTS --> A_SECURITY["Security Teams (3x)"]
        
        %% Chatmodes Breakdown  
        CHATMODES --> C_BEAST["Beast Modes (5x)"]
        CHATMODES --> C_LANG["Language Experts (12x)"]
        CHATMODES --> C_CLOUD["Cloud/Azure (8x)"]
        CHATMODES --> C_SPECIAL["Special Modes (45x)"]
        
        %% Styling
        classDef rootStyle fill:#ff6b6b,stroke:#333,stroke-width:3px,color:#fff
        classDef agentStyle fill:#4ecdc4,stroke:#333,stroke-width:2px,color:#fff
        classDef chatmodeStyle fill:#45b7d1,stroke:#333,stroke-width:2px,color:#fff
        classDef configStyle fill:#f9ca24,stroke:#333,stroke-width:2px,color:#333
        classDef dirStyle fill:#6c5ce7,stroke:#333,stroke-width:2px,color:#fff
        
        class ROOT rootStyle
        class AGENTS,CHATMODES,PROMPTS,SCRIPTS,INSTR1,INSTR2 dirStyle
        class A_GUI,A_MANAGER,A_ANALYSIS,A_TECH,A_SECURITY agentStyle
        class C_BEAST,C_LANG,C_CLOUD,C_SPECIAL chatmodeStyle
        class COPILOT,README,CONFIGS,PROTO,VERB,UPDATE configStyle
    end
```

---

## 📊 **AGENTS KATEGORISIERUNG & VERTEILUNG**

```mermaid
pie title Agents Verteilung (60 Total)
    "Manager Teams" : 15
    "Tech Specialists" : 25
    "GUI Teams" : 6
    "Security Teams" : 3
    "Analysis Teams" : 4
    "Specialized Tools" : 7
```

### 🎯 **ELITE AGENT TEAMS**

```mermaid
graph LR
    subgraph "🔬 ANALYSIS POWERHOUSE"
        ULT["ULTIMATE-PROJECT-ANALYSIS-TEAM"]
        PROJ["PROJECT-ANALYSIS-TEAM"]
        DEEP["deep-analysis-team"]
        FEAT["FEATURE-IMPACT-ANALYSIS"]
    end
    
    subgraph "🖥️ GUI MASTERS"
        HOCH["HOCHKOMPLEX-MODERN-STABLE-GUI-DESKTOP-TEAM"]
        GUI_DESK["GUI-DESKTOP-TEAM"]
        GUI_BACK["GUI-TEAM-BACKUP"]
        CYBER["cyberpunk-c-gui-team"]
        POWER_GUI["PowerShell-GUI-Team"]
        TECH_GUI["technikgolem-gui-master"]
    end
    
    subgraph "🛠️ MANAGER ECOSYSTEM"
        PC_MAN["PC-Manager-Elite-Team"]
        SYNC["SyncManager-Expert-Team"]
        POWER["PowerPlan-Manager-Elite-Team"]
        NET["NetworkShareManager-Elite-Team"]
        VIREN["VirenManager-Elite-Team"]
        REG["registry-manager-team"]
        WIN_POS["WindowPositionManager-Team"]
        SYS_MON["SystemMonitor-Team"]
        ZIPP["ZIPP-Manager-Elite-Team"]
        TASK_MAN["TechnikGolem-TaskManager-NEXUS-ELITE"]
        DEL["UniversalDelete-Manager-Expert-Team"]
        TASK_PLAN["TechnikGolem-TaskPlanner-Team"]
        MEDIA["TechnikGolem-MediaLibrary-Elite"]
        BRAND["TechnikGolem-BrandManager-Team"]
        MD["TechnikGolem-MarkdownManager-Team"]
    end
    
    classDef analysisStyle fill:#ff6b6b,stroke:#333,stroke-width:2px,color:#fff
    classDef guiStyle fill:#4ecdc4,stroke:#333,stroke-width:2px,color:#fff  
    classDef managerStyle fill:#45b7d1,stroke:#333,stroke-width:2px,color:#fff
    
    class ULT,PROJ,DEEP,FEAT analysisStyle
    class HOCH,GUI_DESK,GUI_BACK,CYBER,POWER_GUI,TECH_GUI guiStyle
    class PC_MAN,SYNC,POWER,NET,VIREN,REG,WIN_POS,SYS_MON,ZIPP,TASK_MAN,DEL,TASK_PLAN,MEDIA,BRAND,MD managerStyle
```

---

## 🧠 **CHATMODES KATEGORIEN & FLOW**

```mermaid
graph TD
    subgraph "🔥 BEAST MODE HIERARCHY"
        BEAST_BASE["beast-mode.chatmode.md"]
        BEAST_41["4.1-Beast.chatmode.md"]
        BEAST_41_GER["4.1-Beast-GER.chatmode.md"]
        BEAST_GPT5["gpt-5-beast-mode.chatmode.md"]
        BEAST_THINKING["Thinking-Beast-Mode.chatmode.md"]
        BEAST_ULTRA["Ultimate-Transparent-Thinking-Beast-Mode.chatmode.md"]
        
        BEAST_BASE --> BEAST_41
        BEAST_41 --> BEAST_41_GER
        BEAST_41 --> BEAST_GPT5
        BEAST_GPT5 --> BEAST_THINKING
        BEAST_THINKING --> BEAST_ULTRA
    end
    
    subgraph "💻 PROGRAMMING EXPERTS"
        CSHARP["csharp-dotnet-janitor.chatmode.md"]
        DOTNET["dotnet-upgrade.chatmode.md"]
        CPP["expert-cpp-software-engineer.chatmode.md"]
        REACT["expert-react-frontend-engineer.chatmode.md"]
        POWERSHELL["powershell.chatmode.md"]
        PYTHON_MCP["python-mcp-expert.chatmode.md"]
        RUST_MCP["rust-mcp-expert.chatmode.md"]
        TS_MCP["typescript-mcp-expert.chatmode.md"]
        SWIFT_MCP["swift-mcp-expert.chatmode.md"]
        GO_MCP["go-mcp-expert.chatmode.md"]
        JAVA_MCP["java-mcp-expert.chatmode.md"]
        KOTLIN_MCP["kotlin-mcp-expert.chatmode.md"]
        PHP_MCP["php-mcp-expert.chatmode.md"]
        RUBY_MCP["ruby-mcp-expert.chatmode.md"]
    end
    
    subgraph "☁️ CLOUD & ENTERPRISE"
        AZURE_ARCH["azure-principal-architect.chatmode.md"]
        AZURE_SAAS["azure-saas-architect.chatmode.md"]
        AZURE_LOGIC["azure-logic-apps-expert.chatmode.md"]
        BICEP_PLAN["bicep-plan.chatmode.md"]
        BICEP_IMPL["bicep-implement.chatmode.md"]
        TERRA_PLAN["terraform-azure-planning.chatmode.md"]
        TERRA_IMPL["terraform-azure-implement.chatmode.md"]
        POWER_BI["power-bi-dax-expert.chatmode.md"]
    end
    
    classDef beastStyle fill:#ff0000,stroke:#333,stroke-width:3px,color:#fff
    classDef progStyle fill:#00ff00,stroke:#333,stroke-width:2px,color:#333
    classDef cloudStyle fill:#0066ff,stroke:#333,stroke-width:2px,color:#fff
    
    class BEAST_BASE,BEAST_41,BEAST_41_GER,BEAST_GPT5,BEAST_THINKING,BEAST_ULTRA beastStyle
    class CSHARP,DOTNET,CPP,REACT,POWERSHELL,PYTHON_MCP,RUST_MCP,TS_MCP,SWIFT_MCP,GO_MCP,JAVA_MCP,KOTLIN_MCP,PHP_MCP,RUBY_MCP progStyle
    class AZURE_ARCH,AZURE_SAAS,AZURE_LOGIC,BICEP_PLAN,BICEP_IMPL,TERRA_PLAN,TERRA_IMPL,POWER_BI cloudStyle
```

---

## 🔄 **PARAMETER SYSTEM FLOW**

```mermaid
flowchart TD
    subgraph "📝 CORE PARAMETER SYSTEM"
        START["`/parameter eingegeben`"]
        
        START --> SHORT{"`/short?`"}
        START --> CLEAN{"`/clean?`"}
        START --> JAILBREAK{"`/jailbreak?`"}
        START --> FIX{"`/fix?`"}
        START --> CRITICAL{"`/critical -talk?`"}
        START --> TRANSLATE{"`/translate -ger?`"}
        START --> TEAM{"`/team?`"}
        START --> AGENT{"`/agent [name]?`"}
        START --> CHATMODE{"`/chatmode [name]?`"}
        START --> IDEE{"`/idee?`"}
        
        SHORT --> SHORT_ACTION["`Ultra-brief responses
        2-3 sentences max
        Token optimization`"]
        
        CLEAN --> CLEAN_OPTIONS{"`Cleanup Mode?`"}
        CLEAN_OPTIONS --> CLEAN_BASIC["`Clean except .github
        Preserve structure`"]
        CLEAN_OPTIONS --> CLEAN_FULL["`/clean -full
        Delete EVERYTHING`"]
        CLEAN_OPTIONS --> CLEAN_SAVE["`/clean -save
        Backup first`"]
        
        AGENT --> AGENT_LOAD["`Load specific agent
        from .github/agents/
        Auto-suggest if not found`"]
        
        CHATMODE --> CHATMODE_LOAD["`Switch to chatmode
        from .github/chatmodes/
        Modify behavior`"]
        
        IDEE --> IDEE_ACTION["`Brainstorming mode
        Multiple approaches
        Creative problem-solving
        Outside-the-box thinking`"]
        
        CRITICAL --> CRITICAL_ACTION["`Two-voice system:
        CODEX + KRITISCHER DENKER
        Philosophical debate
        Strategic analysis`"]
    end
    
    classDef paramStyle fill:#ff6b6b,stroke:#333,stroke-width:2px,color:#fff
    classDef actionStyle fill:#4ecdc4,stroke:#333,stroke-width:2px,color:#fff
    classDef decisionStyle fill:#f9ca24,stroke:#333,stroke-width:2px,color:#333
    
    class START paramStyle
    class SHORT_ACTION,CLEAN_BASIC,CLEAN_FULL,CLEAN_SAVE,AGENT_LOAD,CHATMODE_LOAD,IDEE_ACTION,CRITICAL_ACTION actionStyle
    class SHORT,CLEAN,JAILBREAK,FIX,CRITICAL,TRANSLATE,TEAM,AGENT,CHATMODE,IDEE,CLEAN_OPTIONS decisionStyle
```

---

## 📈 **PROJEKT EVOLUTION TIMELINE**

```mermaid
gantt
    title AGENT-MANAGER Development Timeline
    dateFormat  YYYY-MM-DD
    section Core System
    CODEX Instructions Creation     :done, core1, 2025-12-01, 2025-12-15
    Parameter System Development    :done, core2, 2025-12-10, 2025-12-25
    Base Agent Templates           :done, core3, 2025-12-20, 2026-01-05
    
    section Agent Development
    Manager Teams Creation         :done, agents1, 2025-12-25, 2026-01-10
    GUI Teams Development         :done, agents2, 2026-01-01, 2026-01-15
    Analysis Teams Build          :done, agents3, 2026-01-05, 2026-01-20
    Security Specialists          :done, agents4, 2026-01-10, 2026-01-25
    
    section Chatmode Evolution
    Beast Mode Series            :done, chat1, 2026-01-01, 2026-01-15
    Programming Experts          :done, chat2, 2026-01-10, 2026-01-20
    Cloud Specialists           :done, chat3, 2026-01-15, 2026-01-25
    
    section Current Phase
    Documentation & Visual       :active, doc1, 2026-01-20, 2026-01-30
    Optimization & Refinement    :milestone, opt1, 2026-01-26
```

---

## 🔗 **INTERDEPENDENCY MATRIX**

```mermaid
graph TD
    subgraph "🎯 CORE SYSTEM DEPENDENCIES"
        COPILOT_INST["copilot-instructions.md"]
        
        COPILOT_INST -.->|"loads"| AGENTS_DIR["agents/"]
        COPILOT_INST -.->|"activates"| CHATMODES_DIR["chatmodes/"]
        COPILOT_INST -.->|"uses"| PROMPTS_DIR["prompts/"]
        
        AGENTS_DIR -->|"references"| ULTIMATE["ULTIMATE-PROJECT-ANALYSIS-TEAM"]
        AGENTS_DIR -->|"extends"| GUI_TEAMS["GUI Teams Collection"]
        AGENTS_DIR -->|"coordinates"| MANAGER_TEAMS["Manager Teams Collection"]
        
        CHATMODES_DIR -->|"enhances"| BEAST_MODES["Beast Mode Family"]
        CHATMODES_DIR -->|"specializes"| LANG_EXPERTS["Language Expert Modes"]
        CHATMODES_DIR -->|"integrates"| CLOUD_MODES["Cloud Platform Modes"]
        
        %% Cross-connections
        ULTIMATE -.->|"can activate"| DEBUG_MODE["debug.chatmode.md"]
        GUI_TEAMS -.->|"uses"| TECH_GUI["technikgolem-gui-master.chatmode.md"]
        MANAGER_TEAMS -.->|"coordinates with"| POWERSHELL_MODE["powershell.chatmode.md"]
    end
    
    classDef coreStyle fill:#ff6b6b,stroke:#333,stroke-width:3px,color:#fff
    classDef agentStyle fill:#4ecdc4,stroke:#333,stroke-width:2px,color:#fff
    classDef chatmodeStyle fill:#45b7d1,stroke:#333,stroke-width:2px,color:#fff
    classDef connectionStyle stroke:#ff6b6b,stroke-width:3px,stroke-dasharray: 5 5
    
    class COPILOT_INST coreStyle
    class AGENTS_DIR,ULTIMATE,GUI_TEAMS,MANAGER_TEAMS agentStyle
    class CHATMODES_DIR,BEAST_MODES,LANG_EXPERTS,CLOUD_MODES,DEBUG_MODE,TECH_GUI,POWERSHELL_MODE chatmodeStyle
```

---

## 📊 **TECHNOLOGIE STACK OVERVIEW**

```mermaid
mindmap
  root((AGENT-MANAGER
    Tech Stack))
    Core Languages
      Markdown
      YAML Front-matter
      JavaScript (configs)
    Programming Expertise
      C#/.NET
      C/C++
      PowerShell
      Python
      TypeScript
      Rust
      Go
      Java/Kotlin
      PHP/Ruby
      Swift
    Cloud Platforms
      Azure
      Terraform
      Bicep
      Power Platform
    Specialized Tools
      Mermaid Diagrams
      GitHub Actions
      VS Code Extensions
      Windows System APIs
    Security Focus
      Penetration Testing
      Vulnerability Analysis
      System Hardening
    GUI Technologies
      WinForms
      WPF
      Electron
      React
      Angular
```

---

## 🎯 **USAGE PATTERNS & RECOMMENDATIONS**

### ⚡ **QUICK START COMMANDS**
```bash
/agent ULTIMATE-PROJECT-ANALYSIS-TEAM  # Vollständige Projektanalyse
/chatmode 4.1-Beast-GER                # Deutscher Beast Mode
/critical -talk                        # Zwei-Perspektiven-Analyse
/idee                                   # Kreative Problemlösung
/team                                   # Projekt-spezifischer Agent
```

### 🔧 **WORKFLOW EMPFEHLUNGEN**
1. **Projektstart:** `/team` → Projekt-Kontext → spezifischen Agent erstellen
2. **Analyse:** `/agent ULTIMATE-PROJECT-ANALYSIS-TEAM /deep /docs -visual`
3. **Development:** Passenden Chatmode aktivieren (`/chatmode [tech]-mcp-expert`)
4. **Probleme:** `/fix` oder `/critical -talk` für tiefere Analyse
5. **Kreativität:** `/idee` für innovative Lösungsansätze

---

*📋 Generiert vom CODEX Ultimate Project Analysis Team | 26.01.2026 | v2.0*