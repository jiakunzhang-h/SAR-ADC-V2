function obj = plotAdcDynamicSimulationResult( p, adcDynamicPerformanceMetrics )
  %% plot FFT
  obj = figure;
  plot( adcDynamicPerformanceMetrics.frequency / 1e6,adcDynamicPerformanceMetrics.spectrumDb , 'b' , 'LineWidth' , 2.5 );
  xlabel( 'Frequency (MHz)' );
  ylabel( 'Magnitude (dB)' );
  title( 'ADC 频谱图' );
  grid on;
end