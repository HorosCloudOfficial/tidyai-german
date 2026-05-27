# NewPlusClone Shell Extension Development Team

**Mission**: Vollständige Entwicklung und Bereitstellung einer Windows Shell Extension, die das PowerToys "New+" Feature für Windows 10 nachbildet.

## 🏗️ **Team-Zusammensetzung**

### **1. 🎯 SPIKE - System Architecture Lead**
**Rolle**: Technical Spike & Architektur-Entscheidungen  
**Spezialisierung**: Windows Shell Extensions, COM-Programmierung, Registry-Integration  
**Verantwortung**:
- Architektur-Spikes für kritische Designentscheidungen
- COM Interface Design und Shell Extension Patterns
- Registry-Management und Installation-Strategien
- Technische Risikobewertung und Lösungsansätze

**Aktuelle Aufgabe**: MinGW Compilation Issues lösen, Build-System optimieren

---

### **2. 🔧 BUILD - Development Operations Engineer** 
**Rolle**: Build-System & Compilation Expert  
**Spezialisierung**: CMake, MinGW, Visual Studio, Windows Development Tools  
**Verantwortung**:
- Build-Pipeline Design und Wartung
- Compiler-Probleme identifizieren und lösen
- Cross-Compiler Kompatibilität (MSVC/MinGW)
- Deployment-Automatisierung

**Aktuelle Aufgabe**: Code-Kompatibilität für MinGW verbessern, String-Handling korrigieren

---

### **3. 💾 CORE - Core Extension Developer**
**Rolle**: Shell Extension Implementation  
**Spezialisierung**: Windows API, COM Interfaces, IShellExtInit, IContextMenu  
**Verantwortung**:
- Shell Extension Interface-Implementierung
- Context Menu Integration
- Template-System Kern-Funktionalität
- DLL Export-Management

**Aktuelle Aufgabe**: StringCchCopyW Dependencies lösen, COM Interface Kompatibilität

---

### **4. 🗂️ TEMPLATE - Template System Architect**
**Rolle**: Template Engine & File Management  
**Spezialisierung**: File I/O, Template Processing, Variable Substitution  
**Verantwortung**:
- Template-Parser und Metadata-Verarbeitung
- Variable-Substitution System
- Built-in Template Creation
- File Generation Logic

**Aktuelle Aufgabe**: File Stream Kompatibilität für MinGW, Template-Loading korrigieren

---

### **5. 🔧 REGISTRY - Registry & Installation Expert**
**Rolle**: Registry Management & Deployment  
**Spezialisierung**: Windows Registry, COM Registration, Shell Extension Deployment  
**Verantwortung**:
- Registry-Integration für Shell Extension
- COM CLSID Management
- Installation/Deinstallation Scripts
- Administrator-Rechte Management

**Aktuelle Aufgabe**: DllRegisterServer/DllUnregisterServer Implementierung

---

### **6. 📚 DOCS - Documentation & User Experience**
**Rolle**: Documentation Expert (Diátaxis Framework)  
**Spezialisierung**: Technical Writing, User Guides, API Documentation  
**Verantwortung**:
- README und Installationsanleitungen
- Code-Dokumentation und Kommentare
- Troubleshooting Guides
- Template Creation Tutorials

**Aktuelle Aufgabe**: Build-Probleme dokumentieren, Workarounds erstellen

---

## 🎯 **Aktueller Sprint: Build-System Stabilisierung**

### **Critical Path Issues** 🔴
1. **StringCchCopyW Missing**: Windows API Headers nicht korrekt eingebunden
2. **COM Interface Inheritance**: IClassFactory Interface nicht verfügbar
3. **File Stream Compatibility**: MinGW wstring-Unterstützung problematisch
4. **std::find_if Missing**: Algorithm-Header fehlt

### **Sprint Goals**
- [ ] **BUILD**: MinGW-kompatible Header-Struktur etablieren
- [ ] **CORE**: COM Interfaces für MinGW anpassen
- [ ] **TEMPLATE**: File I/O für MinGW-Kompatibilität umschreiben
- [ ] **SPIKE**: Alternative Build-Strategien evaluieren
- [ ] **REGISTRY**: Self-Registration testen
- [ ] **DOCS**: Troubleshooting-Guide erweitern

---

## ⚡ **Immediate Action Items**

### **🔥 P0 - Blocker Resolution**
- **BUILD**: Hinzufügen fehlender Windows-Headers (`#include <strsafe.h>`)
- **CORE**: COM Interface-Definitionen für MinGW korrigieren
- **TEMPLATE**: wstring File Operations durch C-Style ersetzen

### **🟡 P1 - Build Optimization**
- **BUILD**: Visual Studio Community Installation abschließen
- **SPIKE**: CMake vs. Direct Compilation evaluieren
- **REGISTRY**: Alternative Registration-Methoden testen

### **🟢 P2 - Enhancement**
- **TEMPLATE**: Erweiterte Variable-Substitution
- **DOCS**: Video-Tutorial für Installation
- **CORE**: Error-Handling verbessern

---

## 🛠️ **Team Coordination Protocol**

### **Daily Sync Pattern**
1. **SPIKE** analysiert aktuelle Blocker und definiert Lösungsansätze
2. **BUILD** implementiert Infrastructure-Fixes
3. **CORE** adaptiert Code für neue Build-Requirements  
4. **TEMPLATE** testet File-Operations nach Core-Updates
5. **REGISTRY** validiert Installation nach erfolgreichen Builds
6. **DOCS** dokumentiert Fortschritte und neue Procedures

### **Escalation Matrix**
- **Build Failures** → SPIKE + BUILD führen
- **COM Issues** → CORE + SPIKE collaboration
- **File I/O Problems** → TEMPLATE + BUILD partnership
- **Installation Issues** → REGISTRY + BUILD coordination

---

## 📊 **Success Metrics**

### **Sprint Completion Criteria**
- [ ] ✅ **Clean MinGW Compilation** (Zero warnings/errors)
- [ ] ✅ **Successful DLL Generation** (Proper exports, COM registration)
- [ ] ✅ **Registry Integration** (Context menu appears)
- [ ] ✅ **Template Creation** (File generation works)
- [ ] ✅ **User Documentation** (Installation guide, troubleshooting)

### **Quality Gates**
- **Code Quality**: Static analysis passed, memory leak free
- **Compatibility**: Windows 10/11, MinGW + MSVC builds
- **User Experience**: Single-click installation, intuitive templates
- **Documentation**: Complete user and developer documentation

---

## 🎮 **Team Communication Channels**

**Primary**: GitHub Issues für Task-Tracking  
**Secondary**: Code Reviews für Quality Assurance  
**Emergency**: Direct commits für Critical Fixes  

**Code Review Protocol**: Alle CORE/TEMPLATE Changes benötigen BUILD + SPIKE Approval

---

## 🏁 **Projekt Timeline**

### **Phase 1: Stabilisierung (Current)**
- Build-System funktionsfähig machen
- Core Shell Extension kompilieren
- Grundlegende Template-Funktionen

### **Phase 2: Integration**  
- Registry-Integration vollenden
- Template-System erweitern
- Installation-Scripts finalisieren

### **Phase 3: Polish & Deploy**
- User Experience optimieren  
- Documentation vervollständigen
- Release vorbereiten

---

*Erstellt: 3. Januar 2026 | Team Lead: CODEX | Status: 🔴 Build Issues Resolution Mode*