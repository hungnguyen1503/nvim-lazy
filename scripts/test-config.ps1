param(
    [switch] $ProfileStartup
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

nvim --headless '+qall'
nvim --headless 'init.lua' '+qall'
nvim --headless '+checkhealth vim.deprecated' '+qall'

if ($ProfileStartup) {
    $startupLog = Join-Path $env:TEMP 'nvim-startuptime.log'
    nvim --headless --startuptime $startupLog '+qall'
    Write-Host "Startup profile: $startupLog"
}
