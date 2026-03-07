#!/usr/bin/env bash
#
# install-linux.sh — DesireCore Linux 安装辅助脚本
#
# 功能：
#   - 下载最新版本的 AppImage
#   - 设置可执行权限
#   - 创建桌面快捷方式
#   - 注册 dc:// 协议
#
# 用法：
#   curl -fsSL https://raw.githubusercontent.com/desirecore/distribution/main/scripts/install-linux.sh | bash
#
# 或手动运行：
#   ./install-linux.sh [--no-shortcut] [--no-protocol]
#

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"
CREATE_SHORTCUT=true
REGISTER_PROTOCOL=true

# 解析参数
while [[ $# -gt 0 ]]; do
  case $1 in
    --no-shortcut) CREATE_SHORTCUT=false; shift ;;
    --no-protocol) REGISTER_PROTOCOL=false; shift ;;
    *) echo -e "${RED}未知参数: $1${NC}"; exit 1 ;;
  esac
done

echo -e "${GREEN}DesireCore Linux 安装脚本${NC}"
echo "================================"

# 检查依赖
for cmd in curl jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo -e "${RED}错误：需要 $cmd，请先安装：sudo apt install $cmd${NC}"
    exit 1
  fi
done

# 获取最新版本信息
echo -e "${YELLOW}正在获取最新版本信息...${NC}"
RELEASE_INFO=$(curl -fsSL "https://api.github.com/repos/desirecore/distribution/releases/latest")
VERSION=$(echo "$RELEASE_INFO" | jq -r '.tag_name')

if [ -z "$VERSION" ] || [ "$VERSION" = "null" ]; then
  echo -e "${RED}错误：无法获取最新版本信息${NC}"
  exit 1
fi

echo "最新版本: $VERSION"

# 检测架构
ARCH=$(uname -m)
case $ARCH in
  x86_64) ARCH_LABEL="x64" ;;
  aarch64) ARCH_LABEL="arm64" ;;
  *) echo -e "${RED}错误：不支持的架构: $ARCH${NC}"; exit 1 ;;
esac

echo "系统架构: $ARCH ($ARCH_LABEL)"

# 查找 AppImage 下载 URL
DOWNLOAD_URL=$(echo "$RELEASE_INFO" | jq -r ".assets[] | select(.name | test(\"AppImage\") and test(\"${ARCH_LABEL}\")) | .browser_download_url" | head -1)

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" = "null" ]; then
  # 回退：尝试不带架构标记的 AppImage
  DOWNLOAD_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | test("AppImage")) | .browser_download_url' | head -1)
fi

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" = "null" ]; then
  echo -e "${RED}错误：未找到适合 $ARCH_LABEL 的 AppImage 文件${NC}"
  exit 1
fi

FILENAME=$(basename "$DOWNLOAD_URL")
echo "下载文件: $FILENAME"

# 创建安装目录
mkdir -p "$INSTALL_DIR"

# 下载 AppImage
echo -e "${YELLOW}正在下载 DesireCore...${NC}"
curl -fSL --progress-bar "$DOWNLOAD_URL" -o "$INSTALL_DIR/$FILENAME"
chmod +x "$INSTALL_DIR/$FILENAME"

# 创建符号链接
ln -sf "$INSTALL_DIR/$FILENAME" "$INSTALL_DIR/desirecore"

echo -e "${GREEN}✓ DesireCore 已安装到: $INSTALL_DIR/$FILENAME${NC}"

# 创建桌面快捷方式
if [ "$CREATE_SHORTCUT" = true ]; then
  echo -e "${YELLOW}创建桌面快捷方式...${NC}"
  mkdir -p "$DESKTOP_DIR"
  mkdir -p "$ICON_DIR"

  cat > "$DESKTOP_DIR/desirecore.desktop" << EOF
[Desktop Entry]
Name=DesireCore
Comment=Delegation-based interactive Agent OS
Comment[zh_CN]=委派式交互的 Agent 操作系统
Exec=$INSTALL_DIR/$FILENAME %u
Icon=desirecore
Type=Application
Categories=Utility;Office;
StartupWMClass=DesireCore
MimeType=x-scheme-handler/dc;
EOF

  # 更新桌面数据库
  if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
  fi

  echo -e "${GREEN}✓ 桌面快捷方式已创建${NC}"
fi

# 注册 dc:// 协议
if [ "$REGISTER_PROTOCOL" = true ]; then
  echo -e "${YELLOW}注册 dc:// 协议...${NC}"
  if command -v xdg-mime &>/dev/null; then
    xdg-mime default desirecore.desktop x-scheme-handler/dc 2>/dev/null || true
    echo -e "${GREEN}✓ dc:// 协议已注册${NC}"
  else
    echo -e "${YELLOW}⚠ xdg-mime 不可用，跳过协议注册${NC}"
  fi
fi

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}✓ DesireCore 安装完成！${NC}"
echo ""
echo "运行方式："
echo "  1. 在应用菜单中找到 DesireCore"
echo "  2. 或在终端运行: desirecore"
echo "  3. 或直接运行: $INSTALL_DIR/$FILENAME"
echo ""
echo "确保 $INSTALL_DIR 在你的 PATH 中："
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
