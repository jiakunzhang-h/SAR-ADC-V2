function obj = plotAdcDynamicSimulationResult( p, adcDynamicPerformanceMetrics )

  %% plot FFT

  obj = figure;
  plot( adcDynamicPerformanceMetrics.frequency / 1e6, adcDynamicPerformanceMetrics.spectrumDb, 'b', 'LineWidth', 2.5 );
  xlabel( 'Frequency (MHz)' );
  ylabel( 'Magnitude (dBFS)' );
  text( max( adcDynamicPerformanceMetrics.frequency / 1e6 ) * 0.7, -20, sprintf( 'SNDR = %.2f dB\nENOB = %.2f bit', adcDynamicPerformanceMetrics.sndr, adcDynamicPerformanceMetrics.enob ), 'FontWeight', 'bold' );
  title( 'ADC frequency spectrum ' );
  grid on;

  %% limit the noise floor

  noiseFloor = - ( 6.02 * p.adcResolution + 1.76 ) - 10 * log10( p.fftLen / 2 );
  ylim( [ noiseFloor - 10, 5 ] );
  
end