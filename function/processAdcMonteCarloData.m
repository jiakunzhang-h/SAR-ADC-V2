function adcDynamicPerformanceMetrics = processAdcMonteCarloData( p, toneBin, idealDacOutput )

  %% delete DC component

  fftSample = idealDacOutput - mean( idealDacOutput, 1 );

  %% calculate FFT

  spectrum = fft( fftSample, [], 1 );

  %% obtain single-sided spectrum

  spectrumSingle = spectrum( 1 : p.fftLen / 2, : );

  %% calculate SNDR
  
  sndrResult = nan( p.numMonteCarlo, 1 );
  for iSndrResult = 1 : p.numMonteCarlo
    sndrResult( iSndrResult ) = calculateSNR( spectrumSingle( : , iSndrResult ), toneBin( iSndrResult ), 0 );
  end

  %% calculate ENOB

  enobResult = ( sndrResult - 1.76 ) / 6.02;

  %% store results

  adcDynamicPerformanceMetrics.enobResult = enobResult;

end
