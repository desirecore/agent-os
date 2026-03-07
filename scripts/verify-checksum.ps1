<#
.SYNOPSIS
    校验 DesireCore 下载文件的 SHA-512 完整性

.DESCRIPTION
    从 electron-builder 生成的 yml 元数据文件中读取预期的 SHA-512，
    与本地下载文件的实际哈希值进行比对。

.PARAMETER File
    待校验的下载文件路径

.PARAMETER MetadataFile
    yml 元数据文件路径（latest.yml / latest-mac.yml / latest-linux.yml）

.EXAMPLE
    .\verify-checksum.ps1 -File "DesireCore_10.0.1_x64.exe" -MetadataFile "latest.yml"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$File,

    [Parameter(Mandatory=$true)]
    [string]$MetadataFile
)

$ErrorActionPreference = 'Stop'

# 检查文件是否存在
if (-not (Test-Path $File)) {
    Write-Host "错误：文件不存在: $File" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $MetadataFile)) {
    Write-Host "错误：元数据文件不存在: $MetadataFile" -ForegroundColor Red
    exit 1
}

$fileName = [System.IO.Path]::GetFileName($File)
Write-Host "正在校验: $fileName" -ForegroundColor Yellow

# 从 yml 中提取目标文件对应的 sha512
# electron-builder yml 格式：
#   - url: DesireCore_10.0.1_x64.exe
#     sha512: xxxx
#     size: 12345
$lines = Get-Content $MetadataFile
$expectedHash = $null
$found = $false

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "url:\s*$([regex]::Escape($fileName))") {
        $found = $true
        continue
    }
    if ($found -and $lines[$i] -match 'sha512:\s*(\S+)') {
        $expectedHash = $Matches[1]
        break
    }
}

if (-not $expectedHash) {
    Write-Host "错误：在 $MetadataFile 中未找到 $fileName 的 SHA-512 记录" -ForegroundColor Red
    Write-Host "请确认文件名与元数据文件匹配"
    exit 1
}

# 计算本地文件 SHA-512
Write-Host "计算 SHA-512 中..."
$hash = Get-FileHash -Path $File -Algorithm SHA512

# 将 hex hash 转为 base64（electron-builder 使用 base64 编码的 sha512）
$hexHash = $hash.Hash
$bytes = [byte[]]::new($hexHash.Length / 2)
for ($i = 0; $i -lt $bytes.Length; $i++) {
    $bytes[$i] = [Convert]::ToByte($hexHash.Substring($i * 2, 2), 16)
}
$actualBase64 = [Convert]::ToBase64String($bytes)

# 比较
if ($actualBase64 -eq $expectedHash) {
    Write-Host "✓ 校验通过！文件完整性已确认。" -ForegroundColor Green
    Write-Host "  SHA-512: $($expectedHash.Substring(0, [Math]::Min(32, $expectedHash.Length)))..."
    exit 0
} else {
    Write-Host "✗ 校验失败！文件可能已损坏或被篡改。" -ForegroundColor Red
    Write-Host "  期望: $($expectedHash.Substring(0, [Math]::Min(32, $expectedHash.Length)))..."
    Write-Host "  实际: $($actualBase64.Substring(0, [Math]::Min(32, $actualBase64.Length)))..."
    Write-Host "建议重新下载文件。" -ForegroundColor Yellow
    exit 1
}
