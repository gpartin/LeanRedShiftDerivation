import Mathlib.Tactic.NormNum
import Mathlib.Data.Real.Basic

namespace RedshiftLWFormal

structure Bond where
  x : Int
  y : Int
  z : Int
  weightSixths : Int
  deriving DecidableEq, Repr

def positiveC19 : List Bond := [
  ⟨1, 0, 0, 2⟩, ⟨0, 1, 0, 2⟩, ⟨0, 0, 1, 2⟩,
  ⟨1, 1, 0, 1⟩, ⟨1, -1, 0, 1⟩,
  ⟨1, 0, 1, 1⟩, ⟨1, 0, -1, 1⟩,
  ⟨0, 1, 1, 1⟩, ⟨0, 1, -1, 1⟩
]

def positiveFaceC19 : List Bond :=
  positiveC19.filter (fun b => b.weightSixths = 2)

def positiveEdgeC19 : List Bond :=
  positiveC19.filter (fun b => b.weightSixths = 1)

def directedFaceModeCount : Nat := 2 * positiveFaceC19.length

def directedEdgeModeCount : Nat := 2 * positiveEdgeC19.length

noncomputable def chi0FromC19 : ℝ :=
  Nat.cast (1 + directedFaceModeCount + directedEdgeModeCount : Nat)

noncomputable def kappaDenominatorFromDimension : ℝ :=
  Nat.cast (4 ^ 3 - 1 : Nat)

noncomputable def kappaFromGeometry : ℝ := 1 / kappaDenominatorFromDimension

noncomputable def BFromGeometry : ℝ := chi0FromC19 / kappaFromGeometry

def coord (axis : Fin 3) (b : Bond) : Int :=
  match axis with
  | ⟨0, _⟩ => b.x
  | ⟨1, _⟩ => b.y
  | ⟨2, _⟩ => b.z

def momentSixths (a b : Fin 3) : Int :=
  positiveC19.foldl (fun total d =>
    total + d.weightSixths * coord a d * coord b d) 0

theorem positive_bond_count : positiveC19.length = 9 := by native_decide

theorem positive_face_bond_count : positiveFaceC19.length = 3 := by
  native_decide

theorem positive_edge_bond_count : positiveEdgeC19.length = 6 := by
  native_decide

theorem directed_face_mode_count : directedFaceModeCount = 6 := by
  native_decide

theorem directed_edge_mode_count : directedEdgeModeCount = 12 := by
  native_decide

theorem chi0_from_c19_value : chi0FromC19 = 19 := by
  unfold chi0FromC19
  rw [directed_face_mode_count, directed_edge_mode_count]
  norm_num

theorem kappa_denominator_value : kappaDenominatorFromDimension = 63 := by
  norm_num [kappaDenominatorFromDimension]

theorem kappa_from_geometry_value : kappaFromGeometry = 1 / 63 := by
  unfold kappaFromGeometry
  rw [kappa_denominator_value]

theorem B_from_geometry_value : BFromGeometry = 1197 := by
  unfold BFromGeometry
  rw [chi0_from_c19_value, kappa_from_geometry_value]
  norm_num

theorem moment00 : momentSixths 0 0 = 6 := by native_decide
theorem moment11 : momentSixths 1 1 = 6 := by native_decide
theorem moment22 : momentSixths 2 2 = 6 := by native_decide
theorem moment01 : momentSixths 0 1 = 0 := by native_decide
theorem moment02 : momentSixths 0 2 = 0 := by native_decide
theorem moment10 : momentSixths 1 0 = 0 := by native_decide
theorem moment12 : momentSixths 1 2 = 0 := by native_decide
theorem moment20 : momentSixths 2 0 = 0 := by native_decide
theorem moment21 : momentSixths 2 1 = 0 := by native_decide

end RedshiftLWFormal

