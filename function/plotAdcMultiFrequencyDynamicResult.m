function multiFreqAnalysisObj = plotAdcMultiFrequencyDynamicResult( p, sndrResult )

  %% plot FFT

  multiFreqAnalysisObj = figure;
  plot( p.testInputBin(:) * p.fs / p.fftLen / 1e6, sndrResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Frequency (MHz)' );
  ylabel( 'SNDR (dB)' );
  title( 'ADC SNDR versus input frequency ' );
  grid on;

end