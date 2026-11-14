import Mathlib.Data.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import RedshiftLWFormal.Core.Geometry

namespace RedshiftLWFormal

noncomputable section
open BigOperators

/-! Shared definitions for the ordered REDSHIFTLW-001 handoff modules. -/

abbrev RedshiftLWComplex3 := Fin 3 → ℂ
abbrev RedshiftLWSite (L : Nat) := Fin 3 → ZMod L
abbrev RedshiftLWPsi (L : Nat) := RedshiftLWSite L → RedshiftLWComplex3
abbrev RedshiftLWChi (L : Nat) := RedshiftLWSite L → RedshiftLWComplex3

def redshiftLWChi0 : ℝ := chi0FromC19
def redshiftLWKappa : ℝ := kappaFromGeometry
def redshiftLWB : ℝ := BFromGeometry

def redshiftLWC3Sub (a b : RedshiftLWComplex3) : RedshiftLWComplex3 :=
  fun j => a j - b j

def redshiftLWC3NormSq (a : RedshiftLWComplex3) : ℝ :=
  ∑ j, Complex.normSq (a j)

def redshiftLWRho (a : RedshiftLWComplex3) : ℝ :=
  redshiftLWC3NormSq a

def redshiftLWWedge (a b : RedshiftLWComplex3) : RedshiftLWComplex3 :=
  fun j => match j.1 with
    | 0 => a 0 * b 1 - a 1 * b 0
    | 1 => a 0 * b 2 - a 2 * b 0
    | _ => a 1 * b 2 - a 2 * b 1

def redshiftLWReverseBond (b : Bond) : Bond :=
  ⟨-b.x, -b.y, -b.z, b.weightSixths⟩

def redshiftLWDirectedC19 : List Bond :=
  positiveC19 ++ positiveC19.map redshiftLWReverseBond

def redshiftLWWeight (b : Bond) : ℝ := b.weightSixths

def redshiftLWShift (L : Nat) (x : RedshiftLWSite L) (b : Bond) :
    RedshiftLWSite L :=
  fun axis => x axis + ((coord axis b : Int) : ZMod L)

def redshiftLWComposite {L : Nat} (chi : RedshiftLWChi L)
    (psi : RedshiftLWPsi L) (x : RedshiftLWSite L) : RedshiftLWComplex3 :=
  redshiftLWWedge (chi x) (psi x)

def redshiftLWLocalPotential (chi psi : RedshiftLWComplex3) : ℝ :=
  (1 / 4 : ℝ) * (redshiftLWRho chi - redshiftLWChi0^2)^2 +
    (1 / 2 : ℝ) * redshiftLWRho chi * redshiftLWRho psi +
    (1 / 4 : ℝ) * redshiftLWRho psi^2

def redshiftLWAreaPotential {L : Nat} [NeZero L] (chi : RedshiftLWChi L)
    (psi : RedshiftLWPsi L) : ℝ :=
  ∑ x, (redshiftLWDirectedC19.map (fun b =>
    redshiftLWWeight b / (2 * redshiftLWChi0^2) *
      redshiftLWC3NormSq
        (redshiftLWC3Sub
          (redshiftLWComposite chi psi (redshiftLWShift L x b))
          (redshiftLWComposite chi psi x)))).sum

def redshiftLWRootPotential {L : Nat} [NeZero L] (chi : RedshiftLWChi L)
    (psi : RedshiftLWPsi L) : ℝ :=
  (∑ x, redshiftLWLocalPotential (chi x) (psi x)) +
    redshiftLWAreaPotential chi psi

def redshiftLWRootKinetic {L : Nat} [NeZero L]
    (psiDot : RedshiftLWPsi L) (chiDot : RedshiftLWChi L) : ℝ :=
  (1 / 2 : ℝ) * (∑ x, redshiftLWC3NormSq (psiDot x)) +
    (redshiftLWB / 2) * (∑ x, redshiftLWC3NormSq (chiDot x))

def redshiftLWRootLagrangian {L : Nat} [NeZero L]
    (psi chi : RedshiftLWPsi L)
    (psiDot chiDot : RedshiftLWPsi L) : ℝ :=
  redshiftLWRootKinetic psiDot chiDot - redshiftLWRootPotential chi psi

def redshiftLWRootHamiltonian {L : Nat} [NeZero L]
    (psi chi : RedshiftLWPsi L)
    (psiDot chiDot : RedshiftLWPsi L) : ℝ :=
  redshiftLWRootKinetic psiDot chiDot + redshiftLWRootPotential chi psi

def redshiftLWClockForce (r : ℝ) : ℝ :=
  -((r^2 - redshiftLWChi0^2) * r) / redshiftLWB

def redshiftLWClockLinearFrequencySquared : ℝ :=
  2 * redshiftLWChi0^2 / redshiftLWB

/-! This is an observer readout, not a dynamical law. -/
def redshiftLWMeasuredFrequency (omega clockRate : ℝ) : ℝ :=
  omega / clockRate

def redshiftLWRedshift (omegaEmitter omegaReceiver : ℝ) : ℝ :=
  omegaEmitter / omegaReceiver - 1

/-! At chi = 0, the local Psi potential gives a rotating solution whose
angular frequency is fixed by its local radius.  The numerical tests must
measure this relation from evolved phases; these definitions only state the
local action-derived quantities used by the symbolic handoff. -/
def redshiftLWLocalPsiForce (radius : ℝ) : ℝ :=
  -(radius^2) * radius

def redshiftLWLocalRotatingFrequencySquared (radius : ℝ) : ℝ :=
  -redshiftLWLocalPsiForce radius / radius

def redshiftLWLocalRotatingFrequency (radius : ℝ) : ℝ :=
  Real.sqrt (redshiftLWLocalRotatingFrequencySquared radius)

def redshiftLWDimensionlessFrequency (signalRate clockRate : ℝ) : ℝ :=
  signalRate / clockRate

structure RedshiftLWEndpointObservation where
  signalRateEmitter : ℝ
  signalRateReceiver : ℝ
  clockRateEmitter : ℝ
  clockRateReceiver : ℝ
  signalRateEmitterPositive : 0 < signalRateEmitter
  signalRateReceiverPositive : 0 < signalRateReceiver
  clockRateEmitterPositive : 0 < clockRateEmitter
  clockRateReceiverPositive : 0 < clockRateReceiver

def RedshiftLWStationarySignal (observation : RedshiftLWEndpointObservation) : Prop :=
  observation.signalRateEmitter = observation.signalRateReceiver

def redshiftLWStructureFactor (k0 k1 k2 : ℝ) : ℝ :=
  8 * ((1 - Real.cos k0) + (1 - Real.cos k1) + (1 - Real.cos k2)) +
    8 * ((1 - Real.cos k0 * Real.cos k1) +
      (1 - Real.cos k0 * Real.cos k2) +
      (1 - Real.cos k1 * Real.cos k2))

def redshiftLWLightOmegaSquared (k0 k1 k2 : ℝ) : ℝ :=
  redshiftLWStructureFactor k0 k1 k2 / redshiftLWB

def redshiftLWCenteredNext (dt omegaSquared qPrev q : ℝ) : ℝ :=
  2 * q - qPrev - dt^2 * omegaSquared * q

def redshiftLWCenteredResidual (dt omegaSquared qPrev q qNext : ℝ) : ℝ :=
  qNext - 2 * q + qPrev + dt^2 * omegaSquared * q

def redshiftLWRotor (u : ℂ) : RedshiftLWComplex3 :=
  fun j => if j = 0 then (redshiftLWChi0 : ℂ) * u else 0

def redshiftLWPlusPolarization : RedshiftLWComplex3 :=
  fun j => match j.1 with
    | 0 => 1
    | 1 => Complex.I
    | _ => 0

def redshiftLWOppositePolarizationReadout (a : RedshiftLWComplex3) : ℂ :=
  a 0 + Complex.I * a 1

structure RedshiftLWReleasedPacketEvidence where
  observation : RedshiftLWEndpointObservation
  coherentTransfer : Prop
  sourceOffDuringPacket : Prop

end
end RedshiftLWFormal

