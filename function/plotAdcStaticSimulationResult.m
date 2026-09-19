function [dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics )

  %% plot DNL

  dnlObj = figure;
  plot( adcStaticPerformanceMetrics.dnlCodeIndex, adcStaticPerformanceMetrics.dnlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'DNL (LSB)' );
  text( max( adcStaticPerformanceMetrics.dnlCodeIndex ) * 0.5, 0.8, sprintf( 'DNLmax = %.2f LSB', max(adcStaticPerformanceMetrics.dnlResult) ), 'FontWeight', 'bold' );
  title( 'ADC DNL' );
  ylim( [-4, 4] );
  grid on;

  %% plot INL

  inlObj = figure;
  plot( adcStaticPerformanceMetrics.inlCodeIndex, adcStaticPerformanceMetrics.inlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'INL (LSB)' );
  text( max( adcStaticPerformanceMetrics.inlCodeIndex ) * 0.5, 0.8, sprintf( 'INLmax = %.2f LSB', max(adcStaticPerformanceMetrics.inlResult) ), 'FontWeight', 'bold' );
  title( 'ADC INL' );
  ylim( [-4, 4] );
  grid on;

end