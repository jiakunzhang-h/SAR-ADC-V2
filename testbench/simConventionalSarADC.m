%% simulation preparation

clear
close all
clc
format long g

%% load simulation configuration and parameters

p = configDynamicTest();

%% allocate storage for simulation data

conversionResult = nan( p.fftLen, p.adcResolution );
decimalResult = nan( p.fftLen, 1 );
sndrResult = nan( length(p.testInputBin), 1 );

%% generate input frequency

[p.fin, p.inputbin] = genInputFrequency( p );

%% generate samples

samples = genSamples( p );

%% generate CDAC array

capArray = generateCDAC( p );

%% run simulation

for iSample = 1 : p.fftLen
  sample = samples.data( iSample );
  conversionResult( iSample, : ) = cbwSarADC( sample, p, capArray );
  decimalResult( iSample ) = idealDAC( conversionResult( iSample, : ), p );
end

%% process simulation data

adcDynamicPerformanceMetrics = processAdcData( p, decimalResult );
disp( adcDynamicPerformanceMetrics.enob );
disp( adcDynamicPerformanceMetrics.sndr );

%% plot simulation results

obj = plotAdcDynamicSimulationResult( p, adcDynamicPerformanceMetrics );

%% export plots

drawing = 'drawing/adc-spectrum.png';
exportgraphics(obj, drawing);

%% multiple frequency test

for iInputbin = 1 : length( p.testInputBin )

  p.inputbin = p.testInputBin( iInputbin );

  %% generate input frequency

  p.fin = p.inputbin * p.fs / p.fftLen;

  %% generate samples

  samples = genSamples( p );

  %% generate CDAC array

  capArray = generateCDAC( p );

  %% run simulation

  for iSample = 1 : p.fftLen
    sample = samples.data( iSample );
    conversionResult( iSample, : ) = cbwSarADC( sample, p, capArray );
    decimalResult( iSample ) = idealDAC( conversionResult( iSample, : ), p );
  end

  %% process simulation data

  adcDynamicPerformanceMetrics = processAdcData( p, decimalResult );
  sndrResult( iInputbin ) = adcDynamicPerformanceMetrics.sndr;

end

%% plot simulation results

multiFreqAnalysisObj = plotAdcMultiFrequencyDynamicResult( p, sndrResult );

%% export plots

drawing = 'drawing/ADC SNDR versus input frequency.png';
exportgraphics(multiFreqAnalysisObj, drawing);