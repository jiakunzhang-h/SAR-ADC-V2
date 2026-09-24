function [dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics )

  %% plot DNL

  dnlObj = figure;
  plot( adcStaticPerformanceMetrics.dnlCodeIndex, adcStaticPerformanceMetrics.dnlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'DNL (LSB)' );
  text( max( adcStaticPerformanceMetrics.dnlCodeIndex ) * 0.3, 1.2 * max( abs( adcStaticPerformanceMetrics.dnlResult ) ), sprintf( 'mismatch = %.2f %% \n comparator input refered noise = %.0f uV \n DNLmax = %.2f LSB', p.mismatchStd * 100, p.compNoise * 1e6, max( abs( adcStaticPerformanceMetrics.dnlResult ) ) ), 'FontWeight', 'bold' );
  title( 'ADC DNL' );
  xlim( [0, 2 .^   p.adcResolution] );
  ylim( [-1.5 * max( abs( adcStaticPerformanceMetrics.dnlResult ) ), 1.5 * max( abs( adcStaticPerformanceMetrics.dnlResult ) )] );
  grid on;

  %% plot INL

  inlObj = figure;
  plot( adcStaticPerformanceMetrics.inlCodeIndex, adcStaticPerformanceMetrics.inlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'INL (LSB)' );
  text( max( adcStaticPerformanceMetrics.inlCodeIndex ) * 0.3, 1.2 * max( abs( adcStaticPerformanceMetrics.inlResult ) ), sprintf( 'mismatch = %.2f %% \n comparator input refered noise = %.0f uV \n INLmax = %.2f LSB', p.mismatchStd * 100, p.compNoise * 1e6, max( abs( adcStaticPerformanceMetrics.inlResult ) ) ), 'FontWeight', 'bold' );
  title( 'ADC INL' );
  xlim( [0, 2 .^   p.adcResolution] );
  ylim( [-1.5 * max( abs( adcStaticPerformanceMetrics.inlResult ) ), 1.5 * max( abs( adcStaticPerformanceMetrics.inlResult ) )] );
  grid on;

end