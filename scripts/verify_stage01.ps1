$ErrorActionPreference = 'Stop'

Push-Location (Join-Path $PSScriptRoot '..')
try {
    lake build RedshiftLWFormal.Core.Geometry
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.Geometry failed' }
    lake build RedshiftLWFormal.Core.RedshiftLWDefinitions
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLWDefinitions failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW001RootAction
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW001RootAction failed' }
    lake build RedshiftLWFormal
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal aggregate failed' }
    Write-Output '[PASS] REDSHIFTLW-001 Stage 1 root action compiled'
}
finally {
    Pop-Location
}

