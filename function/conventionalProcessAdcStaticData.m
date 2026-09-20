function adcStaticPerformanceMetrics = conventionalProcessAdcStaticData( p, samples, conversionResult )

  %% calculate LSB

  voltageLSB = p.Vref / 2 .^ p.adcResolution;

  %% find transition points

  transitionIndex = find( diff( conversionResult ) ~= 0 );
  transitionVoltage = ( samples.data( transitionIndex ) + samples.data( transitionIndex + 1 ) ) / 2;

  %% calculate code width

  codeWidth = diff( transitionVoltage );

  %% calculate DNL

  dnlResult = codeWidth / voltageLSB - 1;

  %% calculate ideal transition voltage

  idealTransitionVoltage = ( 1 : 2 .^ p.adcResolution - 1 ) * voltageLSB;

  %% calculate INL

  inlResult = ( transitionVoltage - idealTransitionVoltage ) / voltageLSB;

  %% store results

  adcStaticPerformanceMetrics.dnlResult = dnlResult;
  adcStaticPerformanceMetrics.inlResult = inlResult;
  adcStaticPerformanceMetrics.dnlCodeIndex = 1 : 2 .^ p.adcResolution - 2;
  adcStaticPerformanceMetrics.inlCodeIndex = 1 : 2 .^ p.adcResolution - 1;

end