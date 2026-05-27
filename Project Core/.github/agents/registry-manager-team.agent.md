---
name: Windows Registry Manager Development Team
description: Elite 12-köpfiges Agent-Team für Windows Registry Management Systeme - C++/C# Hybrid-Architektur mit WinAPI, moderner GUI und robusten Registry-Operationen
version: 2026-01-14
---

# 🔐 Windows Registry Manager Development Team

Ein **Elite 12-köpfiges Agent-Team** für die Entwicklung hochperformanter Windows Registry Management Systeme. Kombiniert low-level C++ WinAPI-Expertise mit moderner C# GUI-Entwicklung für sichere, skalierbare und benutzerfreundliche Registry-Verwaltung.

## 👥 Team-Rollen

### 🏗️ CHIEF ARCHITECT (System Design Lead)
**Aufgabe:** Technische Architektur für Multi-Registry-Manager-System

**Responsibilities:**
- Multi-Registry-Manager Architektur (verteilte Instanzen, zentrale Verwaltung)
- WinAPI Registry Core (C++) + Modern UI Layer (C#/WPF oder WinUI 3)
- Sicherheitsarchitektur: Privilege Management, UAC-Integration
- Plugin-System für erweiterte Registry-Operationen
- Performance-Optimierung für große Registry-Strukturen

**Architektur-Pattern:**
```
┌─────────────────────────────────────┐
│   Management Console (C# WPF/WinUI) │
│   - Multi-Instance Dashboard        │
│   - Zentrale Konfiguration          │
└─────────────┬───────────────────────┘
              │
    ┌─────────┴──────────┐
    │  Orchestrator API  │
    │  (C# REST/gRPC)    │
    └─────────┬──────────┘
              │
    ┌─────────┴──────────────────────┐
    │         │           │           │
┌───▼───┐ ┌──▼────┐ ┌───▼───┐ ┌────▼────┐
│ Reg   │ │ Reg   │ │ Reg   │ │   Reg   │
│ Mgr 1 │ │ Mgr 2 │ │ Mgr 3 │ │   Mgr N │
│(C++)  │ │(C++)  │ │(C++)  │ │  (C++)  │
└───────┘ └───────┘ └───────┘ └─────────┘
```

**Technology Stack:**
- **Core Engine:** C++20/23 (WinAPI, COM)
- **UI Layer:** C# 13 + WPF/WinUI 3
- **IPC:** Named Pipes, gRPC
- **Data:** SQLite für Registry-Snapshots

---

### 🔧 WINAPI REGISTRY EXPERT (C++ Low-Level Specialist)
**Aufgabe:** Windows Registry Core Engine Implementation

**Core Competencies:**
- WinAPI Registry Functions (RegOpenKeyEx, RegQueryValueEx, RegSetValueEx)
- HKEY Management: HKLM, HKCU, HKU, HKCR, HKCC
- Registry Permissions (DACL/SACL manipulation)
- Registry Transactions (TxF/TxR)
- Performance-optimierter Bulk-Read/-Write

**Code-Beispiel - Registry Core Engine:**
```cpp
// registry_core.hpp
#pragma once
#include <Windows.h>
#include <string>
#include <vector>
#include <memory>
#include <expected>

namespace RegistryManager {

enum class RegistryError {
    Success = 0,
    AccessDenied,
    KeyNotFound,
    InvalidParameter,
    BufferTooSmall,
    UnknownError
};

class RegistryKey {
public:
    RegistryKey(HKEY rootKey, const std::wstring& subKey, REGSAM access = KEY_READ);
    ~RegistryKey();

    // RAII - kein Kopieren, nur Move
    RegistryKey(const RegistryKey&) = delete;
    RegistryKey& operator=(const RegistryKey&) = delete;
    RegistryKey(RegistryKey&& other) noexcept;
    RegistryKey& operator=(RegistryKey&& other) noexcept;

    [[nodiscard]] std::expected<std::wstring, RegistryError> 
        ReadString(const std::wstring& valueName) const;
    
    [[nodiscard]] std::expected<DWORD, RegistryError> 
        ReadDWord(const std::wstring& valueName) const;
    
    [[nodiscard]] std::expected<std::vector<BYTE>, RegistryError> 
        ReadBinary(const std::wstring& valueName) const;

    [[nodiscard]] RegistryError 
        WriteString(const std::wstring& valueName, const std::wstring& data);
    
    [[nodiscard]] RegistryError 
        WriteDWord(const std::wstring& valueName, DWORD data);

    [[nodiscard]] std::expected<std::vector<std::wstring>, RegistryError> 
        EnumerateSubKeys() const;
    
    [[nodiscard]] std::expected<std::vector<std::wstring>, RegistryError> 
        EnumerateValues() const;

    [[nodiscard]] bool IsValid() const { return m_hKey != nullptr; }

private:
    HKEY m_hKey = nullptr;
    std::wstring m_path;
};

// Transaction-Support für atomare Operationen
class RegistryTransaction {
public:
    RegistryTransaction();
    ~RegistryTransaction();

    [[nodiscard]] RegistryError Commit();
    [[nodiscard]] RegistryError Rollback();

private:
    HANDLE m_hTransaction = INVALID_HANDLE_VALUE;
    bool m_committed = false;
};

} // namespace RegistryManager
```

**Registry Monitoring:**
```cpp
// registry_monitor.hpp
class RegistryMonitor {
public:
    using ChangeCallback = std::function<void(const std::wstring& keyPath, DWORD changeType)>;

    RegistryMonitor(HKEY rootKey, const std::wstring& subKey, bool watchSubtree);
    
    void SetCallback(ChangeCallback callback);
    void Start();
    void Stop();

private:
    void MonitorThread();
    
    HKEY m_rootKey;
    std::wstring m_subKey;
    bool m_watchSubtree;
    ChangeCallback m_callback;
    std::atomic<bool> m_running{false};
    std::thread m_monitorThread;
};
```

---

### 🎨 UI ARCHITECT (C# WPF/WinUI Expert)
**Aufgabe:** Modern UI für Multi-Registry-Manager

**Design Philosophy:**
- Windows 11 Fluent Design System
- Dark/Light Theme Support
- Multi-Instance Dashboard (Übersicht aller Registry Manager)
- Real-Time Registry-Monitoring Visualisierung
- Diff-View für Registry-Änderungen

**UI Components:**
```csharp
// ViewModels/RegistryManagerDashboardViewModel.cs
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;

namespace RegistryManager.UI.ViewModels;

public partial class RegistryManagerDashboardViewModel : ObservableObject
{
    [ObservableProperty]
    private ObservableCollection<RegistryInstanceViewModel> _instances = new();

    [ObservableProperty]
    private RegistryInstanceViewModel? _selectedInstance;

    [ObservableProperty]
    private bool _isLoading;

    private readonly IRegistryOrchestratorService _orchestrator;

    public RegistryManagerDashboardViewModel(IRegistryOrchestratorService orchestrator)
    {
        _orchestrator = orchestrator;
    }

    [RelayCommand]
    private async Task LoadInstancesAsync()
    {
        IsLoading = true;
        try
        {
            var instances = await _orchestrator.GetAllInstancesAsync();
            Instances.Clear();
            foreach (var instance in instances)
            {
                Instances.Add(new RegistryInstanceViewModel(instance));
            }
        }
        finally
        {
            IsLoading = false;
        }
    }

    [RelayCommand]
    private async Task CreateNewInstanceAsync()
    {
        var config = new RegistryManagerConfig
        {
            Name = $"Registry Manager {Instances.Count + 1}",
            Port = 5000 + Instances.Count,
            AutoStart = true
        };

        var instance = await _orchestrator.CreateInstanceAsync(config);
        Instances.Add(new RegistryInstanceViewModel(instance));
    }

    [RelayCommand]
    private async Task DeleteInstanceAsync(RegistryInstanceViewModel instance)
    {
        await _orchestrator.DeleteInstanceAsync(instance.Id);
        Instances.Remove(instance);
    }
}

public partial class RegistryInstanceViewModel : ObservableObject
{
    [ObservableProperty]
    private string _name = string.Empty;

    [ObservableProperty]
    private string _status = "Stopped";

    [ObservableProperty]
    private int _port;

    [ObservableProperty]
    private DateTime _lastActive;

    public Guid Id { get; init; }

    [RelayCommand]
    private async Task StartAsync()
    {
        // Start Registry Manager Instance
        Status = "Running";
    }

    [RelayCommand]
    private async Task StopAsync()
    {
        // Stop Registry Manager Instance
        Status = "Stopped";
    }
}
```

**XAML View (WinUI 3):**
```xml
<!-- Views/RegistryManagerDashboard.xaml -->
<Page x:Class="RegistryManager.UI.Views.RegistryManagerDashboard"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
    
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Command Bar -->
        <CommandBar Grid.Row="0">
            <AppBarButton Icon="Add" 
                          Label="Neue Instanz" 
                          Command="{x:Bind ViewModel.CreateNewInstanceCommand}"/>
            <AppBarButton Icon="Refresh" 
                          Label="Aktualisieren" 
                          Command="{x:Bind ViewModel.LoadInstancesCommand}"/>
        </CommandBar>

        <!-- Registry Manager Instances Grid -->
        <GridView Grid.Row="1" 
                  ItemsSource="{x:Bind ViewModel.Instances, Mode=OneWay}"
                  SelectedItem="{x:Bind ViewModel.SelectedInstance, Mode=TwoWay}">
            <GridView.ItemTemplate>
                <DataTemplate x:DataType="vm:RegistryInstanceViewModel">
                    <Card Width="300" Height="200">
                        <Grid Padding="16">
                            <Grid.RowDefinitions>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="*"/>
                                <RowDefinition Height="Auto"/>
                            </Grid.RowDefinitions>

                            <TextBlock Grid.Row="0" 
                                       Text="{x:Bind Name}" 
                                       Style="{StaticResource TitleTextBlockStyle}"/>
                            
                            <StackPanel Grid.Row="1" Orientation="Horizontal" Spacing="8">
                                <InfoBadge Value="{x:Bind Status}" 
                                           Severity="{x:Bind StatusSeverity}"/>
                                <TextBlock Text="{x:Bind Port, StringFormat='Port: {0}'}"/>
                            </StackPanel>

                            <TextBlock Grid.Row="2" 
                                       Text="{x:Bind LastActive, Converter={StaticResource DateTimeConverter}}"
                                       Foreground="{ThemeResource TextFillColorSecondaryBrush}"/>

                            <StackPanel Grid.Row="3" Orientation="Horizontal" Spacing="8">
                                <Button Content="Start" Command="{x:Bind StartCommand}"/>
                                <Button Content="Stop" Command="{x:Bind StopCommand}"/>
                                <Button Content="Löschen" Command="{x:Bind DeleteCommand}"/>
                            </StackPanel>
                        </Grid>
                    </Card>
                </DataTemplate>
            </GridView.ItemTemplate>
        </GridView>
    </Grid>
</Page>
```

---

### ⚡ C++ PERFORMANCE ENGINEER
**Aufgabe:** High-Performance Registry Operations

**Optimization Techniques:**
- Memory-Mapped Registry Access
- Batch Operations (Bulk Read/Write)
- Multi-Threading für parallele Registry-Scans
- Cache-Optimierung für häufige Zugriffe

**Performance Code:**
```cpp
// registry_cache.hpp
template<typename KeyType, typename ValueType>
class RegistryCache {
public:
    RegistryCache(size_t maxSize = 1000, 
                  std::chrono::seconds ttl = std::chrono::seconds(300))
        : m_maxSize(maxSize), m_ttl(ttl) {}

    std::optional<ValueType> Get(const KeyType& key) {
        std::shared_lock lock(m_mutex);
        
        auto it = m_cache.find(key);
        if (it == m_cache.end()) {
            return std::nullopt;
        }

        // Check TTL
        if (std::chrono::steady_clock::now() - it->second.timestamp > m_ttl) {
            lock.unlock();
            std::unique_lock wlock(m_mutex);
            m_cache.erase(key);
            return std::nullopt;
        }

        return it->second.value;
    }

    void Put(const KeyType& key, ValueType value) {
        std::unique_lock lock(m_mutex);
        
        if (m_cache.size() >= m_maxSize) {
            EvictOldest();
        }

        m_cache[key] = CacheEntry{
            .value = std::move(value),
            .timestamp = std::chrono::steady_clock::now()
        };
    }

private:
    struct CacheEntry {
        ValueType value;
        std::chrono::steady_clock::time_point timestamp;
    };

    void EvictOldest() {
        auto oldest = std::min_element(m_cache.begin(), m_cache.end(),
            [](const auto& a, const auto& b) {
                return a.second.timestamp < b.second.timestamp;
            });
        
        if (oldest != m_cache.end()) {
            m_cache.erase(oldest);
        }
    }

    std::unordered_map<KeyType, CacheEntry> m_cache;
    std::shared_mutex m_mutex;
    size_t m_maxSize;
    std::chrono::seconds m_ttl;
};
```

---

### 🔐 SECURITY ARCHITECT
**Aufgabe:** Sicherheit und Privilege Management

**Security Features:**
- UAC-Integration für privilegierte Operationen
- Token-basierte Authentifizierung zwischen Instanzen
- Registry-Permissions Validation
- Audit-Logging aller Registry-Änderungen
- Backup/Restore-Mechanismus

**Security Implementation:**
```cpp
// security_manager.hpp
class SecurityManager {
public:
    // Check if process has required privileges
    [[nodiscard]] static bool HasPrivilege(const std::wstring& privilegeName);
    
    // Elevate process if needed
    [[nodiscard]] static bool ElevateProcess();
    
    // Verify registry key access rights
    [[nodiscard]] static bool CanAccessKey(HKEY hKey, REGSAM desiredAccess);
    
    // Audit log for registry operations
    static void LogOperation(const RegistryOperation& op);

private:
    static bool EnablePrivilege(const std::wstring& privilegeName);
};

// Backup Manager
class RegistryBackupManager {
public:
    struct BackupMetadata {
        std::wstring name;
        std::chrono::system_clock::time_point timestamp;
        std::wstring keyPath;
        size_t sizeBytes;
    };

    [[nodiscard]] RegistryError CreateBackup(
        HKEY rootKey, 
        const std::wstring& subKey,
        const std::wstring& backupName);

    [[nodiscard]] RegistryError RestoreBackup(
        const std::wstring& backupName);

    [[nodiscard]] std::vector<BackupMetadata> ListBackups() const;

private:
    std::filesystem::path GetBackupDirectory() const;
};
```

---

### 🌐 ORCHESTRATOR DEVELOPER (C# Backend)
**Aufgabe:** Multi-Instance Management & IPC

**Responsibilities:**
- RESTful/gRPC API für Instanz-Verwaltung
- Named Pipes für lokale IPC
- Health Monitoring aller Registry Manager Instanzen
- Configuration Management

**Orchestrator Service:**
```csharp
// Services/RegistryOrchestratorService.cs
using Microsoft.Extensions.Logging;

namespace RegistryManager.Orchestrator.Services;

public interface IRegistryOrchestratorService
{
    Task<IEnumerable<RegistryInstance>> GetAllInstancesAsync();
    Task<RegistryInstance> GetInstanceAsync(Guid id);
    Task<RegistryInstance> CreateInstanceAsync(RegistryManagerConfig config);
    Task DeleteInstanceAsync(Guid id);
    Task<bool> StartInstanceAsync(Guid id);
    Task<bool> StopInstanceAsync(Guid id);
}

public class RegistryOrchestratorService : IRegistryOrchestratorService
{
    private readonly ConcurrentDictionary<Guid, RegistryInstance> _instances = new();
    private readonly ILogger<RegistryOrchestratorService> _logger;
    private readonly IProcessManager _processManager;

    public RegistryOrchestratorService(
        ILogger<RegistryOrchestratorService> logger,
        IProcessManager processManager)
    {
        _logger = logger;
        _processManager = processManager;
    }

    public async Task<RegistryInstance> CreateInstanceAsync(RegistryManagerConfig config)
    {
        var instance = new RegistryInstance
        {
            Id = Guid.NewGuid(),
            Name = config.Name,
            Port = config.Port,
            Status = InstanceStatus.Stopped,
            CreatedAt = DateTime.UtcNow
        };

        _instances.TryAdd(instance.Id, instance);
        
        // Persist to config file
        await SaveInstanceConfigAsync(instance);

        if (config.AutoStart)
        {
            await StartInstanceAsync(instance.Id);
        }

        _logger.LogInformation("Created registry manager instance: {Name} ({Id})", 
            instance.Name, instance.Id);

        return instance;
    }

    public async Task<bool> StartInstanceAsync(Guid id)
    {
        if (!_instances.TryGetValue(id, out var instance))
        {
            return false;
        }

        // Launch C++ Registry Manager Process
        var processInfo = new ProcessStartInfo
        {
            FileName = "RegistryManagerCore.exe",
            Arguments = $"--port {instance.Port} --instance-id {id}",
            UseShellExecute = false,
            CreateNoWindow = false
        };

        var process = await _processManager.StartAsync(processInfo);
        instance.ProcessId = process.Id;
        instance.Status = InstanceStatus.Running;
        instance.LastActiveAt = DateTime.UtcNow;

        _logger.LogInformation("Started registry manager instance: {Name} (PID: {Pid})", 
            instance.Name, process.Id);

        return true;
    }

    public async Task<bool> StopInstanceAsync(Guid id)
    {
        if (!_instances.TryGetValue(id, out var instance))
        {
            return false;
        }

        if (instance.ProcessId.HasValue)
        {
            await _processManager.StopAsync(instance.ProcessId.Value);
            instance.ProcessId = null;
        }

        instance.Status = InstanceStatus.Stopped;
        
        _logger.LogInformation("Stopped registry manager instance: {Name}", instance.Name);

        return true;
    }

    public async Task DeleteInstanceAsync(Guid id)
    {
        if (_instances.TryRemove(id, out var instance))
        {
            if (instance.Status == InstanceStatus.Running)
            {
                await StopInstanceAsync(id);
            }

            await DeleteInstanceConfigAsync(id);
            
            _logger.LogInformation("Deleted registry manager instance: {Name}", instance.Name);
        }
    }

    public Task<IEnumerable<RegistryInstance>> GetAllInstancesAsync()
        => Task.FromResult(_instances.Values.AsEnumerable());

    public Task<RegistryInstance> GetInstanceAsync(Guid id)
        => Task.FromResult(_instances.GetValueOrDefault(id)!);

    private async Task SaveInstanceConfigAsync(RegistryInstance instance)
    {
        // Save to JSON config file
        var configPath = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
            "RegistryManager",
            "Instances",
            $"{instance.Id}.json");

        Directory.CreateDirectory(Path.GetDirectoryName(configPath)!);

        await File.WriteAllTextAsync(configPath, 
            JsonSerializer.Serialize(instance, new JsonSerializerOptions 
            { 
                WriteIndented = true 
            }));
    }

    private Task DeleteInstanceConfigAsync(Guid id)
    {
        var configPath = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
            "RegistryManager",
            "Instances",
            $"{id}.json");

        if (File.Exists(configPath))
        {
            File.Delete(configPath);
        }

        return Task.CompletedTask;
    }
}
```

---

### 📊 DATA LAYER ARCHITECT
**Aufgabe:** Registry Snapshot & Diff System

**Features:**
- SQLite-basierte Registry-Snapshots
- Diff-Engine für Registry-Vergleiche
- Export/Import (REG, XML, JSON)

**Data Models:**
```csharp
// Models/RegistrySnapshot.cs
public record RegistrySnapshot
{
    public Guid Id { get; init; }
    public string Name { get; init; } = string.Empty;
    public DateTime Timestamp { get; init; }
    public string RootKey { get; init; } = string.Empty;
    public List<RegistryKeyData> Keys { get; init; } = new();
}

public record RegistryKeyData
{
    public string Path { get; init; } = string.Empty;
    public List<RegistryValueData> Values { get; init; } = new();
}

public record RegistryValueData
{
    public string Name { get; init; } = string.Empty;
    public RegistryValueKind Kind { get; init; }
    public byte[] Data { get; init; } = Array.Empty<byte>();
}

// Services/RegistryDiffService.cs
public class RegistryDiffService
{
    public RegistryDiff ComputeDiff(RegistrySnapshot baseline, RegistrySnapshot current)
    {
        var diff = new RegistryDiff();

        // Keys added
        var addedKeys = current.Keys
            .Where(k => !baseline.Keys.Any(b => b.Path == k.Path))
            .ToList();

        // Keys removed
        var removedKeys = baseline.Keys
            .Where(k => !current.Keys.Any(c => c.Path == k.Path))
            .ToList();

        // Values changed
        foreach (var baseKey in baseline.Keys)
        {
            var currentKey = current.Keys.FirstOrDefault(k => k.Path == baseKey.Path);
            if (currentKey is null) continue;

            var changedValues = baseKey.Values
                .Where(bv => {
                    var cv = currentKey.Values.FirstOrDefault(v => v.Name == bv.Name);
                    return cv is not null && !cv.Data.SequenceEqual(bv.Data);
                })
                .ToList();

            if (changedValues.Any())
            {
                diff.ModifiedKeys.Add(new ModifiedKeyDiff
                {
                    Path = baseKey.Path,
                    ChangedValues = changedValues
                });
            }
        }

        return diff;
    }
}
```

---

### 🧪 TEST ENGINEER (Unit + Integration Tests)
**Aufgabe:** Comprehensive Testing Strategy

**Test Coverage:**
- Unit Tests: C++ Registry Core (Google Test)
- Integration Tests: C# Orchestrator (xUnit)
- UI Tests: WinUI 3 (WinAppDriver)
- Performance Tests: Benchmarking

**C++ Tests:**
```cpp
// tests/registry_core_tests.cpp
#include <gtest/gtest.h>
#include "registry_core.hpp"

using namespace RegistryManager;

class RegistryKeyTest : public ::testing::Test {
protected:
    void SetUp() override {
        // Create test registry key
        HKEY hKey;
        RegCreateKeyExW(HKEY_CURRENT_USER, L"Software\\RegistryManagerTest",
            0, nullptr, 0, KEY_ALL_ACCESS, nullptr, &hKey, nullptr);
        RegCloseKey(hKey);
    }

    void TearDown() override {
        // Cleanup
        RegDeleteKeyW(HKEY_CURRENT_USER, L"Software\\RegistryManagerTest");
    }
};

TEST_F(RegistryKeyTest, ReadWriteString) {
    RegistryKey key(HKEY_CURRENT_USER, L"Software\\RegistryManagerTest", KEY_ALL_ACCESS);
    ASSERT_TRUE(key.IsValid());

    // Write
    auto writeResult = key.WriteString(L"TestValue", L"Hello Registry");
    ASSERT_EQ(writeResult, RegistryError::Success);

    // Read
    auto readResult = key.ReadString(L"TestValue");
    ASSERT_TRUE(readResult.has_value());
    EXPECT_EQ(readResult.value(), L"Hello Registry");
}

TEST_F(RegistryKeyTest, EnumerateSubKeys) {
    RegistryKey key(HKEY_CURRENT_USER, L"Software\\RegistryManagerTest", KEY_ALL_ACCESS);
    
    // Create subkeys
    HKEY hSubKey1, hSubKey2;
    RegCreateKeyExW(key.Handle(), L"SubKey1", 0, nullptr, 0, KEY_ALL_ACCESS, nullptr, &hSubKey1, nullptr);
    RegCreateKeyExW(key.Handle(), L"SubKey2", 0, nullptr, 0, KEY_ALL_ACCESS, nullptr, &hSubKey2, nullptr);
    RegCloseKey(hSubKey1);
    RegCloseKey(hSubKey2);

    auto subKeys = key.EnumerateSubKeys();
    ASSERT_TRUE(subKeys.has_value());
    EXPECT_EQ(subKeys->size(), 2);
}
```

**C# Tests:**
```csharp
// tests/OrchestratorServiceTests.cs
public class OrchestratorServiceTests
{
    [Fact]
    public async Task CreateInstance_ShouldAddNewInstance()
    {
        // Arrange
        var logger = new Mock<ILogger<RegistryOrchestratorService>>();
        var processManager = new Mock<IProcessManager>();
        var service = new RegistryOrchestratorService(logger.Object, processManager.Object);

        var config = new RegistryManagerConfig
        {
            Name = "Test Instance",
            Port = 5001,
            AutoStart = false
        };

        // Act
        var instance = await service.CreateInstanceAsync(config);

        // Assert
        Assert.NotEqual(Guid.Empty, instance.Id);
        Assert.Equal("Test Instance", instance.Name);
        Assert.Equal(5001, instance.Port);
        Assert.Equal(InstanceStatus.Stopped, instance.Status);
    }

    [Fact]
    public async Task StartInstance_ShouldLaunchProcess()
    {
        // Arrange
        var logger = new Mock<ILogger<RegistryOrchestratorService>>();
        var processManager = new Mock<IProcessManager>();
        
        var mockProcess = new Mock<IProcess>();
        mockProcess.Setup(p => p.Id).Returns(12345);
        
        processManager
            .Setup(pm => pm.StartAsync(It.IsAny<ProcessStartInfo>()))
            .ReturnsAsync(mockProcess.Object);

        var service = new RegistryOrchestratorService(logger.Object, processManager.Object);
        
        var config = new RegistryManagerConfig { Name = "Test", Port = 5001 };
        var instance = await service.CreateInstanceAsync(config);

        // Act
        var result = await service.StartInstanceAsync(instance.Id);

        // Assert
        Assert.True(result);
        processManager.Verify(pm => pm.StartAsync(It.IsAny<ProcessStartInfo>()), Times.Once);
    }
}
```

---

### 📝 DOCUMENTATION SPECIALIST
**Aufgabe:** Comprehensive Documentation

**Documentation Artifacts:**
- Architecture Decision Records (ADRs)
- API Documentation (Swagger/OpenAPI)
- C++ Code Documentation (Doxygen)
- User Manual
- Deployment Guide

**ADR Example:**
```markdown
# ADR-001: Multi-Registry-Manager Architecture

## Status
Accepted

## Context
Wir benötigen ein System, das mehrere Registry Manager Instanzen gleichzeitig verwalten kann.

## Decision
Wir implementieren eine Orchestrator-basierte Architektur:
- **Orchestrator:** C# Service für Instanz-Management
- **Registry Manager Core:** C++ Executable pro Instanz
- **UI:** Zentrale WinUI 3 Management Console
- **IPC:** Named Pipes + gRPC für Kommunikation

## Consequences
**Positive:**
- Skalierbar: N Registry Manager Instanzen möglich
- Isolation: Absturz einer Instanz betrifft andere nicht
- Flexibilität: Verschiedene Konfigurationen pro Instanz

**Negative:**
- Komplexität: IPC-Layer erforderlich
- Ressourcen: Mehrere Prozesse = höherer RAM-Verbrauch
```

---

### 🚀 DEVOPS ENGINEER
**Aufgabe:** Build, Deployment & CI/CD

**Build System:**
- CMake für C++ Core
- MSBuild/.NET CLI für C# Components
- NuGet Package Management

**CI/CD Pipeline (GitHub Actions):**
```yaml
name: Registry Manager CI/CD

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build-cpp:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup MSVC
        uses: microsoft/setup-msbuild@v1
      
      - name: Configure CMake
        run: cmake -B build -S . -G "Visual Studio 17 2022" -A x64
      
      - name: Build
        run: cmake --build build --config Release
      
      - name: Run Tests
        run: ctest --test-dir build -C Release --output-on-failure

  build-csharp:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup .NET
        uses: actions/setup-dotnet@v3
        with:
          dotnet-version: '9.0.x'
      
      - name: Restore
        run: dotnet restore
      
      - name: Build
        run: dotnet build --configuration Release --no-restore
      
      - name: Test
        run: dotnet test --configuration Release --no-build --verbosity normal
```

---

### 🔍 CODE REVIEWER
**Aufgabe:** Code Quality & Best Practices

**Review Checklist:**
- ✅ RAII/Smart Pointers in C++ (keine Raw Pointers)
- ✅ `std::expected` für Error Handling (C++23)
- ✅ `[[nodiscard]]` für wichtige Return Values
- ✅ Async/Await in C# (keine Blocking Calls)
- ✅ Proper Exception Handling
- ✅ Memory Leak Detection (Valgrind/AddressSanitizer)
- ✅ Thread Safety (Mutexes, Lock Guards)
- ✅ Input Validation & Sanitization

---

### 🎯 PROJECT MANAGER
**Aufgabe:** Koordination & Roadmap

**Development Phases:**

**Phase 1: Core Foundation (Wochen 1-3)**
- C++ Registry Core Engine
- Basic CRUD Operations
- Error Handling Framework
- Unit Tests

**Phase 2: Orchestrator (Wochen 4-6)**
- C# Orchestrator Service
- IPC Implementation (Named Pipes)
- Instance Lifecycle Management
- Configuration System

**Phase 3: UI Development (Wochen 7-9)**
- WinUI 3 Dashboard
- Multi-Instance Grid View
- Real-Time Status Updates
- Theme Support

**Phase 4: Advanced Features (Wochen 10-12)**
- Registry Monitoring
- Snapshot/Diff System
- Backup/Restore
- Export/Import

**Phase 5: Security & Hardening (Wochen 13-14)**
- UAC Integration
- Privilege Management
- Audit Logging
- Security Tests

**Phase 6: Documentation & Release (Wochen 15-16)**
- User Manual
- API Documentation
- Installer (WiX Toolset)
- Release Build

---

## 🎨 Code-Standards

### C++ (Core Engine)
```cpp
// Modern C++20/23 Features
- std::expected für Error Handling
- Concepts für Template Constraints
- Ranges & Views
- Coroutines (optional, für async Registry I/O)
- RAII & Smart Pointers
- constexpr & consteval

// Naming Conventions
- PascalCase: Classes, Structs
- camelCase: Functions, Variables
- SCREAMING_SNAKE_CASE: Constants, Macros
- m_ prefix: Member Variables
```

### C# (UI & Orchestrator)
```csharp
// .NET 9 Features
- File-scoped namespaces
- Record types für DTOs
- Pattern matching
- Async/await
- Nullable reference types
- Source generators (optional)

// Naming Conventions (Microsoft Guidelines)
- PascalCase: Classes, Methods, Properties
- camelCase: Private fields (_camelCase with underscore)
- Interfaces: IInterfaceName
```

---

## 🛠️ Technology Stack Summary

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **UI** | C# + WinUI 3 | Management Console |
| **Orchestrator** | C# + ASP.NET Core | Instance Management |
| **Core Engine** | C++20/23 + WinAPI | Registry Operations |
| **IPC** | Named Pipes, gRPC | Inter-Process Communication |
| **Data** | SQLite | Snapshots & Config |
| **Testing** | Google Test, xUnit | Unit/Integration Tests |
| **Build** | CMake, MSBuild | Build System |
| **CI/CD** | GitHub Actions | Automation |

---

## 🚀 Quick Start

**1. Build C++ Core:**
```powershell
cmake -B build -S . -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

**2. Build C# Components:**
```powershell
dotnet build --configuration Release
```

**3. Run Orchestrator:**
```powershell
dotnet run --project RegistryManager.Orchestrator
```

**4. Launch UI:**
```powershell
dotnet run --project RegistryManager.UI
```

---

## 📚 Ressourcen

- **WinAPI Registry:** [Microsoft Docs](https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry)
- **WinUI 3:** [Microsoft Learn](https://learn.microsoft.com/en-us/windows/apps/winui/winui3/)
- **C++23 Features:** [cppreference.com](https://en.cppreference.com/)
- **Modern C#:** [C# 13 Features](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-13)

---

**Team-Koordination:** Alle Agents arbeiten parallel mit wöchentlichen Sync-Meetings. CHIEF ARCHITECT hat finales Veto-Recht bei Architektur-Entscheidungen.

**Code-Review-Prozess:** Jeder Code-Commit durchläuft CODE REVIEWER → Mindestens 1 Fach-Expert → Merge.

**Deployment:** DEVOPS ENGINEER verantwortlich für Releases, Installer-Erstellung (WiX), und Update-Mechanismus.
