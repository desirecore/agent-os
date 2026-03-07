# DesireCore

[![GitHub release](https://img.shields.io/github/v/release/desirecore/distribution)](https://github.com/desirecore/distribution/releases/latest)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Web-blue)
![Electron](https://img.shields.io/badge/Electron-latest-47848F?logo=electron&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?logo=typescript&logoColor=white)

English | [简体中文](README.zh-CN.md)

---

## What is DesireCore?

**DesireCore** is a delegation-based interactive Agent OS — an AI companion desktop app you can grow.

Unlike traditional assistants that only respond to commands, DesireCore learns your way of working through everyday conversations. It remembers your preferences, forms habits, and gradually becomes a digital companion that truly understands you.

**Delegation-based interaction** means you don't need to operate the AI step by step. Instead, you express your intent, and DesireCore's agents autonomously plan, execute, and report back — like delegating work to a capable colleague.

### Core Philosophy

- **Agent OS**: Every capability is an "agent" — a file-based, composable, and shareable unit that learns and evolves
- **Everything is a File (AgentFS)**: Agents, memories, skills, and rules all live as plain files you can inspect, version, and share
- **Human-in-the-Loop Governance**: Every autonomous action is auditable, reversible, and within the boundaries you set

---

## Features

- **Learns** — Teach it via conversation; it remembers your preferences and forms working habits over time
- **Acts** — Not just chat; agents can actually execute tasks, call tools, and report results back to you
- **Auditable** — Every action is recorded: what happened, why it happened, and what data was used
- **Reversible** — Roll back any action anytime; experiment fearlessly without permanent consequences
- **Composable** — Combine agents, skills, and tools like building blocks to create complex workflows
- **Shareable** — Export and share your trained agents with others via the marketplace or Git repositories

---

## System Requirements

| Platform | Minimum | Recommended |
|----------|---------|-------------|
| **Windows** | Windows 10 (x64) | Windows 11 (x64 / ARM64) |
| **macOS** | macOS 12 Monterey | macOS 14+ (Intel / Apple Silicon) |
| **Linux** | Ubuntu 20.04+ / Fedora 36+ (x64) | Ubuntu 22.04+ (x64 / ARM64) |
| **Disk** | 500 MB | 1 GB+ |
| **RAM** | 4 GB | 8 GB+ |
| **Network** | Required for AI model API calls | Broadband recommended |

> **Web version** is currently in development and will run in modern browsers (Chrome, Firefox, Safari, Edge).
>
> **Mobile versions** for Android, HarmonyOS, and iOS (iPhone & iPad) are also in development.

---

## Download

Download the latest version for your platform:

| Platform | Architecture | File | Download |
|----------|-------------|------|----------|
| Windows | x64 | `.exe` (NSIS installer) | [Download](https://github.com/desirecore/distribution/releases/latest) |
| Windows | ARM64 | `.exe` (NSIS installer) | [Download](https://github.com/desirecore/distribution/releases/latest) |
| macOS | Intel (x64) | `.dmg` | [Download](https://github.com/desirecore/distribution/releases/latest) |
| macOS | Apple Silicon (ARM64) | `.dmg` | [Download](https://github.com/desirecore/distribution/releases/latest) |
| Linux | x64 | `.AppImage` | [Download](https://github.com/desirecore/distribution/releases/latest) |
| Linux | ARM64 | `.AppImage` | [Download](https://github.com/desirecore/distribution/releases/latest) |

Or browse **[all releases](https://github.com/desirecore/distribution/releases)** for older versions.

You can also download from the [official website](https://www.desirecore.com).

---

## Installation

### Windows

1. Download the `.exe` installer
2. Run the installer and follow the on-screen instructions
3. DesireCore will launch automatically after installation
4. (Optional) The installer registers the `dc://` protocol for deep linking

### macOS

1. Download the `.dmg` file
2. Open the DMG and drag **DesireCore** to the **Applications** folder
3. On first launch, if macOS shows "app is from an unidentified developer", go to **System Settings > Privacy & Security** and click **Open Anyway**
4. The app is notarized and signed with Apple Developer ID

### Linux

1. Download the `.AppImage` file
2. Make it executable: `chmod +x DesireCore-*.AppImage`
3. Run it: `./DesireCore-*.AppImage`
4. (Optional) Use the included install script for desktop integration:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/desirecore/distribution/main/scripts/install-linux.sh | bash
   ```

---

## File Naming Convention

```
DesireCore_{version}_{arch}.{ext}
```

| Extension | Platform | Description |
|-----------|----------|-------------|
| `.exe` | Windows | NSIS installer (includes auto-updater) |
| `.dmg` | macOS | Disk image |
| `.zip` | macOS | ZIP archive (used by auto-updater) |
| `.AppImage` | Linux | Portable application |
| `.blockmap` | All | Delta update metadata |
| `latest.yml` | Windows | Auto-update metadata (version, SHA-512, file info) |
| `latest-mac.yml` | macOS | Auto-update metadata |
| `latest-linux.yml` | Linux | Auto-update metadata |

---

## Verify Downloads

Each release includes SHA-512 checksums in the `latest.yml` / `latest-mac.yml` / `latest-linux.yml` metadata files.

### Quick verification

**macOS / Linux:**
```bash
# Download the verification script
curl -fsSL https://raw.githubusercontent.com/desirecore/distribution/main/scripts/verify-checksum.sh -o verify.sh
chmod +x verify.sh

# Verify a downloaded file
./verify.sh DesireCore_10.0.1_arm64.dmg latest-mac.yml
```

**Windows (PowerShell):**
```powershell
# Download and run the verification script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/desirecore/distribution/main/scripts/verify-checksum.ps1" -OutFile verify.ps1
.\verify.ps1 -File "DesireCore_10.0.1_x64.exe" -MetadataFile "latest.yml"
```

---

## Auto Update

DesireCore includes built-in auto-update functionality:

- The app checks for updates automatically every 5 minutes
- When an update is available, it downloads in the background
- After download completes, you'll be prompted to restart and install
- You can also manually check for updates in **Settings > About**

Auto-updates are delivered through our CDN for fast and reliable downloads worldwide.

---

## Privacy & Security

- **Local-first**: All your data (agents, memories, skills) is stored locally on your device
- **No login required**: The app works fully offline without any account
- **Encrypted cloud sync** (optional): If you enable cloud collaboration, data is encrypted end-to-end; the server cannot read your content
- **Code-signed binaries**: macOS builds are notarized by Apple; Windows builds are Authenticode-signed
- **Open governance**: Every agent action is logged and reversible

---

## FAQ

### Is DesireCore free?

Yes, DesireCore is free to download and use. You need to bring your own AI model API key (e.g., OpenAI, Anthropic, DeepSeek) to power the AI capabilities.

### What AI models are supported?

DesireCore supports 14+ AI providers out of the box, including OpenAI, Anthropic (Claude), Google (Gemini), DeepSeek, Qwen, and more. You can configure your preferred provider and model in Settings.

### Is my data safe?

Yes. All data is stored locally by default. The app works without any network connection for local features. Cloud sync is optional and uses end-to-end encryption.

### Can I use DesireCore without Electron (Web only)?

The Web version is currently in development. Once released, you will be able to use DesireCore directly in your browser without installing any desktop app.

### Are there mobile apps?

Mobile versions for Android, HarmonyOS, and iOS (iPhone & iPad) are in development. Stay tuned for updates on the [official website](https://www.desirecore.com).

### How do I share my trained agents?

Agents are file-based (AgentFS). You can share them by:
- Exporting to files and sharing directly
- Publishing to the DesireCore marketplace
- Pushing to a Git repository

---

## Links

- [Official Website](https://www.desirecore.com)
- [All Releases](https://github.com/desirecore/distribution/releases)

---

## License

The release binaries are distributed under the [DesireCore License](https://github.com/desirecore/desirecore/blob/main/LICENSE). Starting from v10, DesireCore uses a tiered licensing model designed to balance commercial investment and open-source contribution.

Copyright © 2026 Yunnan Solar Corona Technology Co., Ltd.
