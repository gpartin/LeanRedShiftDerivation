$ErrorActionPreference = 'Stop'

Push-Location (Join-Path $PSScriptRoot '..')
try {
    lake build RedshiftLWFormal.Core.Geometry
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.Geometry failed' }
    lake build RedshiftLWFormal.Core.RedshiftLWDefinitions
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLWDefinitions failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW001RootAction
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW001RootAction failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW002NativeClock
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW002NativeClock failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW003Equation
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW003Equation failed' }
    lake build RedshiftLWFormal
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal aggregate failed' }
    Write-Output '[PASS] REDSHIFTLW-001 Stages 1-3 compiled'
}
finally {
    Pop-Location
}

