# DesireCore

[![GitHub release](https://img.shields.io/github/v/release/desirecore/distribution)](https://github.com/desirecore/distribution/releases/latest)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Web-blue)
![Electron](https://img.shields.io/badge/Electron-latest-47848F?logo=electron&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?logo=typescript&logoColor=white)

[English](README.md) | 简体中文

---

## 什么是 DesireCore？

**DesireCore** 是委派式交互的 Agent 操作系统（Delegation OS）—— 一个可以培养的 AI 同伴桌面应用。

与传统的 AI 助手不同，DesireCore 通过日常对话学习你的工作方式。它会记住你的偏好、学习你的习惯，逐渐成为一个真正懂你的数字同伴。

**委派式交互** 意味着你不需要一步步操作 AI，而是表达意图，DesireCore 的智能体会自主规划、执行并汇报结果——就像把工作委派给一位能干的同事。

### 核心理念

- **Agent OS**：每种能力都是一个「智能体」——基于文件的、可组合的、可分享的单元，能够学习和进化
- **一切皆文件（AgentFS）**：智能体、记忆、技能和规则都以普通文件形式存在，可检查、可版本化、可分享
- **人类在回路治理**：每个自主操作都可审计、可回滚，在你设定的边界内运行

---

## 特性

- **会学习** — 通过对话教它做事，它会记住你的偏好并逐渐形成工作习惯
- **会行动** — 不只是聊天，智能体能够实际执行任务、调用工具，并向你汇报结果
- **可追溯** — 每次操作都有记录：做了什么、为什么这么做、使用了什么数据
- **可回滚** — 任何操作都可以随时撤回，放心实验，不用担心后果
- **可组合** — 像搭积木一样组合智能体、技能和工具，构建复杂的工作流
- **可分享** — 通过市场或 Git 仓库导出和分享你训练好的智能体

---

## 系统要求

| 平台 | 最低配置 | 推荐配置 |
|------|---------|----------|
| **Windows** | Windows 10 (x64) | Windows 11 (x64 / ARM64) |
| **macOS** | macOS 12 Monterey | macOS 14+（Intel / Apple Silicon） |
| **Linux** | Ubuntu 20.04+ / Fedora 36+ (x64) | Ubuntu 22.04+（x64 / ARM64） |
| **磁盘** | 500 MB | 1 GB+ |
| **内存** | 4 GB | 8 GB+ |
| **网络** | AI 模型 API 调用需联网 | 建议宽带连接 |

> **Web 版本** 正在开发中，发布后可在现代浏览器中直接使用（Chrome、Firefox、Safari、Edge）。
>
> **移动端版本**（Android、HarmonyOS、iOS 手机和 iPad）也正在开发中。

---

## 下载

下载适合你平台的最新版本：

| 平台 | 架构 | 文件 | 下载 |
|------|------|------|------|
| Windows | x64 | `.exe`（NSIS 安装程序） | [下载](https://github.com/desirecore/distribution/releases/latest) |
| Windows | ARM64 | `.exe`（NSIS 安装程序） | [下载](https://github.com/desirecore/distribution/releases/latest) |
| macOS | Intel (x64) | `.dmg` | [下载](https://github.com/desirecore/distribution/releases/latest) |
| macOS | Apple Silicon (ARM64) | `.dmg` | [下载](https://github.com/desirecore/distribution/releases/latest) |
| Linux | x64 | `.AppImage` | [下载](https://github.com/desirecore/distribution/releases/latest) |
| Linux | ARM64 | `.AppImage` | [下载](https://github.com/desirecore/distribution/releases/latest) |

或浏览 **[所有版本](https://github.com/desirecore/distribution/releases)** 获取历史版本。

也可从[官网](https://www.desirecore.com)下载。

---

## 安装

### Windows

1. 下载 `.exe` 安装程序
2. 运行安装程序，按照提示操作
3. 安装完成后 DesireCore 会自动启动
4. （可选）安装程序会注册 `dc://` 协议用于深度链接

### macOS

1. 下载 `.dmg` 文件
2. 打开 DMG，将 **DesireCore** 拖到 **应用程序** 文件夹
3. 首次启动时，如果 macOS 提示「来自身份不明的开发者」，前往 **系统设置 > 隐私与安全性**，点击 **仍要打开**
4. 应用已通过 Apple Developer ID 签名并公证

### Linux

1. 下载 `.AppImage` 文件
2. 添加执行权限：`chmod +x DesireCore-*.AppImage`
3. 运行：`./DesireCore-*.AppImage`
4. （可选）使用安装脚本集成到桌面环境：
   ```bash
   curl -fsSL https://raw.githubusercontent.com/desirecore/distribution/main/scripts/install-linux.sh | bash
   ```

---

## 文件命名规则

```
DesireCore_{版本号}_{架构}.{扩展名}
```

| 扩展名 | 平台 | 说明 |
|--------|------|------|
| `.exe` | Windows | NSIS 安装程序（含自动更新） |
| `.dmg` | macOS | 磁盘映像 |
| `.zip` | macOS | ZIP 压缩包（自动更新使用） |
| `.AppImage` | Linux | 便携式应用 |
| `.blockmap` | 全平台 | 增量更新元数据 |
| `latest.yml` | Windows | 自动更新元数据（版本号、SHA-512、文件信息） |
| `latest-mac.yml` | macOS | 自动更新元数据 |
| `latest-linux.yml` | Linux | 自动更新元数据 |

---

## 下载校验

每个 Release 的 `latest.yml` / `latest-mac.yml` / `latest-linux.yml` 元数据文件中包含 SHA-512 校验和。

### 快速校验

**macOS / Linux：**
```bash
# 下载校验脚本
curl -fsSL https://raw.githubusercontent.com/desirecore/distribution/main/scripts/verify-checksum.sh -o verify.sh
chmod +x verify.sh

# 校验下载的文件
./verify.sh DesireCore_10.0.1_arm64.dmg latest-mac.yml
```

**Windows（PowerShell）：**
```powershell
# 下载并运行校验脚本
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/desirecore/distribution/main/scripts/verify-checksum.ps1" -OutFile verify.ps1
.\verify.ps1 -File "DesireCore_10.0.1_x64.exe" -MetadataFile "latest.yml"
```

---

## 自动更新

DesireCore 内置自动更新功能：

- 应用每 5 分钟自动检查一次更新
- 发现新版本时，后台自动下载
- 下载完成后，提示你重启并安装
- 你也可以在 **设置 > 关于** 中手动检查更新

自动更新通过 CDN 分发，确保全球用户都能快速可靠地获取更新。

---

## 隐私与安全

- **本地优先**：你的所有数据（智能体、记忆、技能）都存储在本地设备上
- **无需登录**：应用完全支持离线使用，不需要任何账号
- **加密云同步**（可选）：启用云协作后，数据端到端加密，服务端无法读取你的内容
- **代码签名**：macOS 构建经过 Apple 公证；Windows 构建使用 Authenticode 签名
- **开放治理**：每个智能体操作都有日志记录，可随时回滚

---

## 常见问题

### DesireCore 免费吗？

是的，DesireCore 免费下载和使用。你需要自备 AI 模型 API 密钥（如 OpenAI、Anthropic、DeepSeek）来驱动 AI 功能。

### 支持哪些 AI 模型？

DesireCore 开箱即用支持 14+ AI 服务商，包括 OpenAI、Anthropic（Claude）、Google（Gemini）、DeepSeek、通义千问等。你可以在设置中配置首选的服务商和模型。

### 我的数据安全吗？

安全。所有数据默认存储在本地。本地功能无需任何网络连接。云同步是可选的，使用端到端加密。

### 有 Web 版本吗？

Web 版本正在开发中。发布后你可以直接在浏览器中使用 DesireCore，无需安装桌面应用。

### 有移动端 App 吗？

Android、HarmonyOS 和 iOS（iPhone 和 iPad）版本正在开发中。请关注[官方网站](https://www.desirecore.com)获取最新动态。

### 如何分享我训练好的智能体？

智能体基于文件系统（AgentFS），你可以通过以下方式分享：
- 导出为文件直接分享
- 发布到 DesireCore 市场
- 推送到 Git 仓库

---

## 链接

- [官方网站](https://www.desirecore.com)
- [所有版本](https://github.com/desirecore/distribution/releases)

---

## 许可证

发布二进制文件遵循 [DesireCore 许可证](https://github.com/desirecore/desirecore/blob/main/LICENSE) 分发。DesireCore 从 v10 起采用分层开源许可模式，旨在商业投入与开源贡献之间寻求平衡。

Copyright © 2026 云南日冕科技有限公司
