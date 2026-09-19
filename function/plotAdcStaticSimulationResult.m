function [dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics )

  %% plot DNL

  dnlObj = figure;
  plot( adcStaticPerformanceMetrics.codeIndex, adcStaticPerformanceMetrics.dnlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'DNL (LSB)' );
  text( max( adcStaticPerformanceMetrics.codeIndex ) * 0.5, 0.8, sprintf( 'DNLmax = %.2f LSB', max(adcStaticPerformanceMetrics.dnlResult) ), 'FontWeight', 'bold' );
  title( 'ADC DNL  ' );
  ylim([-1, 1]);
  grid on;
  
  %% plot INL

  inlObj = figure;
  plot( adcStaticPerformanceMetrics.codeIndex, adcStaticPerformanceMetrics.inlResult, 'b', 'LineWidth', 2.5 );
  xlabel( 'Code' );
  ylabel( 'INL (LSB)' );
  text( max( adcStaticPerformanceMetrics.codeIndex ) * 0.5, 0.8, sprintf( 'INLmax = %.2f LSB', max(adcStaticPerformanceMetrics.inlResult) ), 'FontWeight', 'bold' );
  title( 'ADC INL ' );
   ylim([-1, 1]);
  grid on;

end