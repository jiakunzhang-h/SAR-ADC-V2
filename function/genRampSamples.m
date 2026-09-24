function samples = genRampSamples( p )

  %% calculate LSB

  voltageLSB = p.vRef / 2 .^ p.adcResolution;

  %% calculate voltage step

  voltStep = voltageLSB / p.samplesPerStair;

  %% generate ramp signal

  samples = p.rampOffset : voltStep : p.vRef;

end