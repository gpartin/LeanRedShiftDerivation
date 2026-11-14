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
    lake build RedshiftLWFormal.Core.RedshiftLW004PsiBranchAudit
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW004PsiBranchAudit failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW005CoupledPhaseBranch
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW005CoupledPhaseBranch failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW006SourceProfile
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW006SourceProfile failed' }
    lake build RedshiftLWFormal.Core.RedshiftLW007PotentialMap
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal.Core.RedshiftLW007PotentialMap failed' }
    lake build RedshiftLWFormal
    if ($LASTEXITCODE -ne 0) { throw 'RedshiftLWFormal aggregate failed' }
    Write-Output '[PASS] REDSHIFTLW-001 Stages 1-7 compiled'
}
finally {
    Pop-Location
}

