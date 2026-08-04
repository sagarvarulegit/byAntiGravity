[CmdletBinding()]
param(
    [ValidateSet("ollama", "openai", "deepseek", "gemini", "kimi", "claude")]
    [string]$Backend = "ollama",

    [string]$Model = "gemma4:e4b",

    [ValidateRange(1000, 60000)]
    [int]$TokenBudget = 3000,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")).Path
$sourcePath = Join-Path $repoRoot "syllabus"
$outputPath = Join-Path $repoRoot "graphify-content"
$graphifyExe = (Get-Command graphify -ErrorAction Stop).Source

if (-not (Test-Path -LiteralPath $sourcePath -PathType Container)) {
    throw "Curriculum source directory was not found: $sourcePath"
}

$arguments = @(
    "extract",
    $sourcePath,
    "--out", $outputPath,
    "--backend", $Backend,
    "--model", $Model,
    "--token-budget", $TokenBudget,
    "--max-concurrency", "1",
    "--max-workers", "4",
    "--no-gitignore"
)

if ($Force) {
    $arguments += "--force"
}

Write-Host "Building the isolated curriculum graph from $sourcePath"
Write-Host "Output: $outputPath\graphify-out"
Write-Host "Backend/model: $Backend / $Model"
Write-Host "This corpus contains many large PDFs and can take substantially longer than the architecture graph."

& $graphifyExe @arguments
if ($LASTEXITCODE -ne 0) {
    throw "Graphify content extraction failed with exit code $LASTEXITCODE."
}

Write-Host "Curriculum graph ready. Enable mcp_servers.graphify_content in .codex/config.toml only when needed."
