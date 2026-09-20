function samples = genRampSamples( p )

  %% calculate LSB

  voltageLSB = p.Vref / 2 .^ p.adcResolution;

  %% calculate voltage step

  voltStep = voltageLSB / p.numOfEachCode;

  %% calculate total numbers of samples

  numSamples = p.numOfEachCode * 2 .^ p.adcResolution;

  %% generate input voltage

  sampleIndex = 0 : numSamples - 1;
  samples.data = voltStep * sampleIndex;

end