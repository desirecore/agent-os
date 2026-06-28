# DesireCore

> 开放的委派式 **AgentOS**（Agent 操作系统）—— 一个可培养、文件化的 AI 同伴桌面应用。

[![GitHub release](https://img.shields.io/github/v/release/desirecore/agent-os)](https://github.com/desirecore/agent-os/releases/latest)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Web-blue)
![Electron](https://img.shields.io/badge/Electron-latest-47848F?logo=electron&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-6-3178C6?logo=typescript&logoColor=white)

[English](README.md) | 简体中文

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://www.desirecore.cn/images/screenshots/agent-swarm-dark.png">
    <img alt="DesireCore —— 多个专精智能体协作的工作台" src="https://www.desirecore.cn/images/screenshots/agent-swarm-light.png" width="880">
  </picture>
</p>

---

## 什么是 DesireCore？

**DesireCore** 是委派式交互的 Agent 操作系统（Delegation OS）—— 一个可以培养的 AI 同伴桌面应用。

与传统的 AI 助手不同，DesireCore 通过日常对话学习你的工作方式。它会记住你的偏好、学习你的习惯，逐渐成为一个真正懂你的数字同伴。

**委派式交互** 意味着你不需要一步步操作 AI，而是表达意图，DesireCore 的智能体会自主规划、执行并汇报结果——就像把工作委派给一位能干的同事。整个体验遵循一个简单的闭环：**教学 → 协作 → 执行**。

### 核心理念

- **Agent OS**：每种能力都是一个「智能体」——基于文件的、可组合的、可分享的单元，能够学习和进化
- **一切皆文件（AgentFS）**：智能体、记忆、技能和规则都以普通文件形式存在，可检查、可版本化、可分享
- **人类在回路治理**：每个自主操作都可审计、可回滚，在你设定的边界内运行

---

## 核心能力

DesireCore 不只是一个聊天机器人，而是一个面向智能体的操作系统。

### 🗣️ 对话式教学

像带新同事一样训练智能体——用大白话设定规则、给出示例、纠正错误。无需代码，无需流程图。你教过的内容会沉淀为一条永久且可编辑的规则。

### 🧠 记忆与持续进化

智能体跨会话保留长期记忆。**Auto Dream** 自动将日常经验整合为长期知识，让技能与智能体能够自我成长。

### 👥 多 Agent 协作

只需描述你的需求，就能组建一支专家团队——无需画组织架构、无需手工接线。DesireCore 提供多种可自由组合的协作模式：

- **SubAgent（子智能体）** —— 主智能体把聚焦的子任务委派给子智能体，再把结果汇回，让每个上下文都保持精简、专注。
- **异步任务** —— 把耗时工作丢到后台继续推进，智能体完成后再回来汇报，不阻塞当前对话。
- **Swarm（蜂群）** —— 多个智能体并行攻克同一问题，各自从不同角度切入，最后收敛出结果。
- **Team（团队）** —— 一支角色分工固定的长期团队（如规划者、撰写者、审阅者），围绕持续目标协作。

由于工作被拆分给多个并行的专注智能体，复杂任务比驱动单个庞大智能体完成得更快，且消耗**更少的 Token**。

### ⚙️ 可靠工作流与自动化

把可重复的工作变成稳定、放手即可运行、能真正用于生产的自动化：

- **可视化编排** —— 在画布上设计多步骤工作流，配合决策树引擎处理分支逻辑与条件判断。
- **灵活触发** —— 按定时、按事件，或在满足条件时自动启动。
- **回放与调试** —— 逐步重放任意一次执行，清晰看到「发生了什么、为什么」，让失败可复现、可修复。
- **桌面 GUI 自动化** —— 智能体可打开应用、点击按钮、识别屏幕，对没有 API 的工具也能实现真正端到端的自动化。
- **生而可控** —— 每一步都可见、按工具授权、全程审计、并支持一键回退——即使在企业级规模下，自动化也始终可信赖。

### 📁 AgentFS——一切皆文件

智能体、记忆、技能和规则都以普通文件形式存在：Git 友好、可检查、可导出、可版本控制。BYOK（自带密钥）让数据直连你的服务商，绝不经过中间方。

### 🛡️ 三层安全可控

每一步操作实时可见，权限按工具粒度设置，任何操作都可回退。低风险操作自动审批、高风险操作等待你确认、危险操作直接拦截——并附带完整的审计链。

### 🎨 多模态

支持文本、图片、语音、视频与代码。

### 🔌 不绑定模型供应商

无供应商锁定。可接入 OpenAI、Anthropic（Claude）、Google（Gemini）、DeepSeek、通义千问，以及通过 Ollama 接入的本地模型等——使用你自己的 API 密钥。

### 🛒 Agent Market

发布与获取由社区构建的智能体、技能和工作流模板。

---

## 应用场景

DesireCore 适配真实的日常工作：

- **文书与合同** — 智能起草与基于差异（diff）的审查
- **邮件** — 统一管理 Gmail、Outlook、IMAP 收件箱
- **软件开发** — 拥有完整文件系统访问能力的编码协助
- **数据巡检** — 定时数据检查与汇报
- **研究** — 文献综述与论文处理
- **专业写作** — 招标标书、公文与报告
- **行业决策** — 例如电力交易决策支持

<table>
  <tr>
    <td width="50%"><img alt="智能文书与差异审查" src="https://www.desirecore.cn/images/use-cases/intelligent-doc.png"><br><sub><b>文书与合同</b> —— 智能起草与基于差异的审查</sub></td>
    <td width="50%"><img alt="统一邮件管理" src="https://www.desirecore.cn/images/use-cases/email-center.png"><br><sub><b>邮件</b> —— 统一管理 Gmail、Outlook、IMAP</sub></td>
  </tr>
  <tr>
    <td width="50%"><img alt="拥有文件系统访问能力的编码协助" src="https://www.desirecore.cn/images/use-cases/code-development.png"><br><sub><b>软件开发</b> —— 拥有文件系统访问能力的编码协助</sub></td>
    <td width="50%"><img alt="桌面 GUI 自动化" src="https://www.desirecore.cn/images/use-cases/desktop-automation.png"><br><sub><b>桌面自动化</b> —— 智能体端到端操作 GUI</sub></td>
  </tr>
</table>

---

## HostAgent

**HostAgent** 是一个可选的配套服务（当前支持 macOS），让智能体远程操作计算机的 GUI——控制鼠标键盘、同时管理多台设备，并运行带心跳巡检的定时任务。

---

## 系统要求

| 平台 | 最低配置 | 推荐配置 |
|------|---------|----------|
| **Windows** | Windows 10 (x64) | Windows 11 (x64 / ARM64) |
| **macOS** | macOS 13 Ventura | macOS 14+（Intel / Apple Silicon） |
| **Linux** | Ubuntu 20.04+ / Fedora 36+ (x64) | Ubuntu 22.04+（x64 / ARM64） |
| **磁盘** | 500 MB | 1 GB+ |
| **内存** | 4 GB | 8 GB+ |
| **网络** | AI 模型 API 调用需联网 | 建议宽带连接 |

> **Linux** 构建同样可运行于主流国产发行版，包括统信 UOS、深度 Deepin 与银河麒麟（Kylin）。
>
> **Web 版本** 正在开发中，发布后可在现代浏览器中直接使用（Chrome、Firefox、Safari、Edge）。
>
> **移动端版本**（Android、HarmonyOS、iOS 手机和 iPad）也正在开发中。

---

## 下载

下载适合你平台的最新版本：

| 平台 | 架构 | 文件 | 下载 |
|------|------|------|------|
| Windows | x64 | `.exe`（NSIS 安装程序） | [下载](https://github.com/desirecore/agent-os/releases/latest) |
| Windows | ARM64 | `.exe`（NSIS 安装程序） | [下载](https://github.com/desirecore/agent-os/releases/latest) |
| macOS | Intel (x64) | `.dmg` | [下载](https://github.com/desirecore/agent-os/releases/latest) |
| macOS | Apple Silicon (ARM64) | `.dmg` | [下载](https://github.com/desirecore/agent-os/releases/latest) |
| Linux | x64 | `.AppImage` | [下载](https://github.com/desirecore/agent-os/releases/latest) |
| Linux | ARM64 | `.AppImage` | [下载](https://github.com/desirecore/agent-os/releases/latest) |

或浏览 **[所有版本](https://github.com/desirecore/agent-os/releases)** 获取历史版本。

也可从[官网](https://www.desirecore.cn)下载。

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
   curl -fsSL https://raw.githubusercontent.com/desirecore/agent-os/main/scripts/install-linux.sh | bash
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
curl -fsSL https://raw.githubusercontent.com/desirecore/agent-os/main/scripts/verify-checksum.sh -o verify.sh
chmod +x verify.sh

# 校验下载的文件
./verify.sh DesireCore_10.0.1_arm64.dmg latest-mac.yml
```

**Windows（PowerShell）：**
```powershell
# 下载并运行校验脚本
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/desirecore/agent-os/main/scripts/verify-checksum.ps1" -OutFile verify.ps1
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

## 定价与授权

DesireCore 的核心 OS 对个人与小团队**免费**——自备 AI 模型 API 密钥即可开始使用。面向更大规模的组织，提供可选的官方算力套餐与企业授权（SSO、集中审计、私有化部署、专属支持）。

完整细节见[官网定价页](https://www.desirecore.cn/pricing)。

---

## 常见问题

### DesireCore 免费吗？

是的，DesireCore 免费下载和使用。你需要自备 AI 模型 API 密钥（如 OpenAI、Anthropic、DeepSeek）来驱动 AI 功能。同时提供可选的官方算力与企业授权——详见[定价与授权](#定价与授权)。

### 支持哪些 AI 模型？

DesireCore 开箱即用支持 14+ AI 服务商，包括 OpenAI、Anthropic（Claude）、Google（Gemini）、DeepSeek、通义千问，以及通过 Ollama 接入的本地模型。你可以在设置中配置首选的服务商和模型。

### 我的数据安全吗？

安全。所有数据默认存储在本地。本地功能无需任何网络连接。云同步是可选的，使用端到端加密。

### 什么是 HostAgent？

HostAgent 是一个可选的配套服务（当前支持 macOS），让智能体远程操作计算机的 GUI——控制鼠标、键盘、管理多台设备，并运行带心跳巡检的定时任务。仅在你需要远程桌面自动化时才需要它。

### 有 Web 版本吗？

Web 版本正在开发中。发布后你可以直接在浏览器中使用 DesireCore，无需安装桌面应用。

### 有移动端 App 吗？

Android、HarmonyOS 和 iOS（iPhone 和 iPad）版本正在开发中。请关注[官方网站](https://www.desirecore.cn)获取最新动态。

### 如何分享我训练好的智能体？

智能体基于文件系统（AgentFS），你可以通过以下方式分享：
- 导出为文件直接分享
- 发布到 DesireCore 市场
- 推送到 Git 仓库

---

## 链接

- [官方网站](https://www.desirecore.cn)
- [功能介绍](https://www.desirecore.cn/features)
- [定价](https://www.desirecore.cn/pricing)
- [所有版本](https://github.com/desirecore/agent-os/releases)

---

## 许可证

发布二进制文件遵循 [DesireCore 许可证](https://github.com/desirecore/desirecore/blob/main/LICENSE) 分发。DesireCore 从 v10 起采用分层开源许可模式，旨在商业投入与开源贡献之间寻求平衡。关于授权如何适用于个人、团队与企业，详见[官网定价页](https://www.desirecore.cn/pricing)。

Copyright © 2026 云南日冕科技有限公司
