function adcStaticPerformanceMetrics = processAdcHistogramData( p, conversionResult )

  %% allocate storage for static result

  dnlResult = nan( 2 .^ p.adcResolution, 1 );
  inlResult = nan( 2 .^ p.adcResolution, 1 );

  %% find actual hits of each code
  
  edges = -0.5 : 1 : 2 .^ p.adcResolution - 0.5;
  codeCount = histcounts(conversionResult, edges);
  
  %% calculate DNL and INL

  dnlResult = codeCount(:) / p.numOfEachCode - 1;
  inlResult = cumsum( dnlResult );

  %% save the result
  
  adcStaticPerformanceMetrics.dnlResult = dnlResult;
  adcStaticPerformanceMetrics.inlResult = inlResult;
  adcStaticPerformanceMetrics.codeIndex = 1 : 2 .^ p.adcResolution;

end
