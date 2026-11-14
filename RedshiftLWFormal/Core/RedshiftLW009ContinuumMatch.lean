import RedshiftLWFormal.Core.RedshiftLW008OperationalRedshift

namespace RedshiftLWFormal

noncomputable section

/-! Stage 14 formal boundary.  Stage 12 defines the operational potential from
the native clock lapse.  Squaring the weak-field GR redshift expression then
reduces to the stationary-signal relation proved in Stage 13.  The numerical
companion supplies the fixed-physical-scale refinement and h-dependent error.
-/

def redshiftLWWeakFieldGRRatioSquared
    (observation : RedshiftLWEndpointObservation) (referenceRate : ℝ) : ℝ :=
  (1 + 2 * redshiftLWOperationalPotential
      observation.clockRateEmitter referenceRate) /
    (1 + 2 * redshiftLWOperationalPotential
      observation.clockRateReceiver referenceRate)

def RedshiftLWStage09 : Prop :=
  ∀ (observation : RedshiftLWEndpointObservation),
    RedshiftLWStationarySignal observation →
    ∀ (referenceRate : ℝ), referenceRate ≠ 0 →
      redshiftLWOperationalReceiverEmitterRatio observation ^ 2 =
        redshiftLWWeakFieldGRRatioSquared observation referenceRate

theorem redshiftLW_continuum_weak_field_gr_squared
    (observation : RedshiftLWEndpointObservation)
    (hStationary : RedshiftLWStationarySignal observation)
    (referenceRate : ℝ) (hReference : referenceRate ≠ 0) :
    redshiftLWOperationalReceiverEmitterRatio observation ^ 2 =
      redshiftLWWeakFieldGRRatioSquared observation referenceRate := by
  have hEmitter : observation.signalRateEmitter ≠ 0 :=
    ne_of_gt observation.signalRateEmitterPositive
  have hReceiver : observation.signalRateReceiver ≠ 0 :=
    ne_of_gt observation.signalRateReceiverPositive
  have hClockEmitter : observation.clockRateEmitter ≠ 0 :=
    ne_of_gt observation.clockRateEmitterPositive
  have hClockReceiver : observation.clockRateReceiver ≠ 0 :=
    ne_of_gt observation.clockRateReceiverPositive
  unfold redshiftLWOperationalReceiverEmitterRatio
    redshiftLWMeasuredFrequency redshiftLWWeakFieldGRRatioSquared
    redshiftLWOperationalPotential redshiftLWClockLapse
  rw [hStationary]
  field_simp [hEmitter, hReceiver, hClockEmitter, hClockReceiver,
    hReference]
  ring

theorem redshiftLW_stage09_continuum_match : RedshiftLWStage09 := by
  intro observation hStationary referenceRate hReference
  exact redshiftLW_continuum_weak_field_gr_squared observation hStationary
    referenceRate hReference

end
end RedshiftLWFormal

