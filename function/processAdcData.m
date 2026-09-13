function adcDynamicPerformanceMetrics = processAdcData(p,conversionResult)
 %% delete DC component
  x = conversionResult - mean(conversionResult);

 %% calculate FFT

  spectrum = fft(x);

  %% obtain single-sided spectrum

  spectrumSingle = spectrum(1:p.fftLen/2);

  %% calculate SNDR

  sndr = calculateSNR(spectrumSingle,p.inputbin,0);

  %% calculate ENOB

  enob = ( sndr - 1.76 ) / 6.02;

  %% generate frequency axis

  frequency = ( 0:p.fftLen/2-1 ).' * p.fs / p.fftLen;

  %% convert spectrum to dB

  spectrumDb = dbv( spectrumSingle );

  %% normalize spectrum for display

  spectrumDb = spectrumDb - max( spectrumDb );

  %% store results

  adcDynamicPerformanceMetrics.sndr = sndr;
  adcDynamicPerformanceMetrics.enob = enob;
  adcDynamicPerformanceMetrics.frequency = frequency;
  adcDynamicPerformanceMetrics.spectrum = spectrumSingle;
  adcDynamicPerformanceMetrics.spectrumDb = spectrumDb;
  adcDynamicPerformanceMetrics.conversionResult = conversionResult;

end
