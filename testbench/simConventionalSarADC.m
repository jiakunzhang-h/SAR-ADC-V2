%% simulation preparation
clear
close all
clc
format long g

%% load simulation configuration and parameters
p = configDynamicTest();

%% allocate storage for simulation data

conversionResult = nan( p.fftLen, 1 ); 

%% generate CDAC array

  weightCDAC = 2.^(p.adcResolution-1:-1:0);
  capArray = generateCDAC(weightCDAC, 50e-15,p.mismatchStd);

%% run simulation
for iSample = 1 : p.fftLen
  sample = p.Vin( iSample );
  conversionResult( iSample ) = cbwSarADC(sample, p, capArray);
end

%% process simulation data

adcDynamicPerformanceMetrics = processAdcData(p,conversionResult);
disp(adcDynamicPerformanceMetrics.enob);

%% plot simulation results

obj = plotAdcDynamicSimulationResult(p, adcDynamicPerformanceMetrics);

%% export plots
drawing = 'drawing/adc-dynamic-spectrum.png';
exportgraphics(obj, drawing);
