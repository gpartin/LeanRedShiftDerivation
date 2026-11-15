import RedshiftLWFormal.Core.RedshiftLW007PotentialMap

namespace RedshiftLWFormal

noncomputable section

/-! Stage 8 formal boundary.  A stationary carrier has one common rate in
coordinate evolution.  Dividing that rate by each endpoint's native clock
rate gives the locally measured frequency, so the receiver/emitter ratio is
the emitter/receiver clock-rate ratio.  A numerical companion would need to supply the
packet, reverse, and no-source controls; they are not included here. -/

def redshiftLWOperationalReceiverEmitterRatio
    (observation : RedshiftLWEndpointObservation) : ℝ :=
  redshiftLWMeasuredFrequency observation.signalRateReceiver
      observation.clockRateReceiver /
    redshiftLWMeasuredFrequency observation.signalRateEmitter
      observation.clockRateEmitter

def RedshiftLWStage08 : Prop :=
  ∀ (observation : RedshiftLWEndpointObservation),
    RedshiftLWStationarySignal observation →
      redshiftLWOperationalReceiverEmitterRatio observation =
        observation.clockRateEmitter / observation.clockRateReceiver

theorem redshiftLW_operational_receiver_emitter_ratio
    (observation : RedshiftLWEndpointObservation)
    (hStationary : RedshiftLWStationarySignal observation) :
    redshiftLWOperationalReceiverEmitterRatio observation =
      observation.clockRateEmitter / observation.clockRateReceiver := by
  unfold redshiftLWOperationalReceiverEmitterRatio
    redshiftLWMeasuredFrequency
  rw [hStationary]
  field_simp [ne_of_gt observation.signalRateEmitterPositive,
    ne_of_gt observation.signalRateReceiverPositive,
    ne_of_gt observation.clockRateEmitterPositive,
    ne_of_gt observation.clockRateReceiverPositive]

theorem redshiftLW_stage08_operational_redshift : RedshiftLWStage08 := by
  intro observation hStationary
  exact redshiftLW_operational_receiver_emitter_ratio observation hStationary

end
end RedshiftLWFormal

