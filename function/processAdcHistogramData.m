function adcStaticPerformanceMetrics = processAdcHistogramData( p, conversionResult )

  %% find actual hits of each code

  edges = -0.5 : 1 : 2 .^ p.adcResolution - 0.5;
  codeCount = histcounts( conversionResult, edges );

  %% calculate DNL and INL

  dnlResult = codeCount( : ) / p.samplesPerStair - 1;
  inlResult = cumsum( dnlResult );

  %% save the result

  adcStaticPerformanceMetrics.dnlResult = dnlResult;
  adcStaticPerformanceMetrics.inlResult = inlResult;
  adcStaticPerformanceMetrics.dnlCodeIndex = 0 : 2 .^ p.adcResolution - 1;
  adcStaticPerformanceMetrics.inlCodeIndex = 0 : 2 .^ p.adcResolution - 1;

end
