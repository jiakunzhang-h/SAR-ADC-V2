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

capArray = generateCDAC( p, p.unitCap,p.mismatchStd );

%% run simulation
for iSample = 1 : p.fftLen
  sample = p.Vin( iSample );
  conversionResult( iSample ) = cbwSarADC( sample , p , capArray );
end

%% process simulation data

adcDynamicPerformanceMetrics = processAdcData( p , conversionResult );
disp( adcDynamicPerformanceMetrics.enob );
disp( adcDynamicPerformanceMetrics.sndr )
%% plot simulation results

obj = plotAdcDynamicSimulationResult( p , adcDynamicPerformanceMetrics );

%% export plots
drawing = 'drawing/adc-spectrum.png';
exportgraphics(obj , drawing);
