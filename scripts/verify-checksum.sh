#!/usr/bin/env bash
#
# verify-checksum.sh — 校验 DesireCore 下载文件的 SHA-512 完整性
#
# 用法：
#   ./verify-checksum.sh <下载的文件> <yml 元数据文件>
#   ./verify-checksum.sh DesireCore_10.0.1_arm64.dmg latest-mac.yml
#
# yml 元数据文件可从 GitHub Release 页面下载（latest.yml / latest-mac.yml / latest-linux.yml）
#

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

usage() {
  echo "用法: $0 <下载的文件> <yml 元数据文件>"
  echo ""
  echo "示例:"
  echo "  $0 DesireCore_10.0.1_arm64.dmg latest-mac.yml"
  echo "  $0 DesireCore_10.0.1_x64.exe latest.yml"
  echo "  $0 DesireCore_10.0.1_x64.AppImage latest-linux.yml"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

FILE="$1"
METADATA="$2"

# 检查文件是否存在
if [ ! -f "$FILE" ]; then
  echo -e "${RED}错误：文件不存在: $FILE${NC}"
  exit 1
fi

if [ ! -f "$METADATA" ]; then
  echo -e "${RED}错误：元数据文件不存在: $METADATA${NC}"
  exit 1
fi

# 从 yml 中提取目标文件对应的 sha512
FILENAME=$(basename "$FILE")
echo -e "${YELLOW}正在校验: ${FILENAME}${NC}"

# electron-builder yml 格式：
#   - url: DesireCore_10.0.1_arm64.dmg
#     sha512: xxxx
#     size: 12345
EXPECTED_HASH=$(awk -v file="$FILENAME" '
  $0 ~ "url: " file { found=1; next }
  found && /sha512:/ { print $2; exit }
' "$METADATA")

if [ -z "$EXPECTED_HASH" ]; then
  echo -e "${RED}错误：在 $METADATA 中未找到 $FILENAME 的 SHA-512 记录${NC}"
  echo "请确认文件名与元数据文件匹配"
  exit 1
fi

# 计算本地文件 SHA-512
echo "计算 SHA-512 中..."
if command -v shasum &>/dev/null; then
  # macOS / 部分 Linux
  ACTUAL_HASH=$(shasum -a 512 "$FILE" | awk '{print $1}')
elif command -v sha512sum &>/dev/null; then
  # 大多数 Linux
  ACTUAL_HASH=$(sha512sum "$FILE" | awk '{print $1}')
else
  echo -e "${RED}错误：未找到 shasum 或 sha512sum 命令${NC}"
  exit 1
fi

# electron-builder 的 sha512 是 base64 编码的，需要解码后比较
# 先将本地计算的 hex hash 转为 base64
ACTUAL_BASE64=$(echo -n "$ACTUAL_HASH" | xxd -r -p | base64 | tr -d '\n')

# 比较
if [ "$ACTUAL_BASE64" = "$EXPECTED_HASH" ]; then
  echo -e "${GREEN}✓ 校验通过！文件完整性已确认。${NC}"
  echo "  SHA-512: ${EXPECTED_HASH:0:32}..."
  exit 0
else
  echo -e "${RED}✗ 校验失败！文件可能已损坏或被篡改。${NC}"
  echo "  期望: ${EXPECTED_HASH:0:32}..."
  echo "  实际: ${ACTUAL_BASE64:0:32}..."
  echo -e "${YELLOW}建议重新下载文件。${NC}"
  exit 1
fi
