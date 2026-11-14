import RedshiftLWFormal.Core.RedshiftLWDefinitions

namespace RedshiftLWFormal

noncomputable section

def RedshiftLWStage01 : Prop :=
  redshiftLWChi0 = chi0FromC19 ∧ redshiftLWB = BFromGeometry ∧
    redshiftLWDirectedC19.length = 18

theorem redshiftLW_directed_c19_length :
    redshiftLWDirectedC19.length = 18 := by
  native_decide

theorem redshiftLW_stage01_root_action : RedshiftLWStage01 := by
  exact ⟨rfl, rfl, redshiftLW_directed_c19_length⟩

theorem redshiftLW_root_action_split {L : Nat} [NeZero L]
    (psi chi : RedshiftLWPsi L)
    (psiDot chiDot : RedshiftLWPsi L) :
    redshiftLWRootLagrangian psi chi psiDot chiDot =
      redshiftLWRootKinetic psiDot chiDot - redshiftLWRootPotential chi psi := by
  simp [redshiftLWRootLagrangian]

theorem redshiftLW_root_hamiltonian_split {L : Nat} [NeZero L]
    (psi chi : RedshiftLWPsi L)
    (psiDot chiDot : RedshiftLWPsi L) :
    redshiftLWRootHamiltonian psi chi psiDot chiDot =
      redshiftLWRootKinetic psiDot chiDot + redshiftLWRootPotential chi psi := by
  simp [redshiftLWRootHamiltonian]

end
end RedshiftLWFormal

