%% simulation preparation

clear
close all
clc
format long g

%% load simulation configuration and parameters

p = configDynamicTest();

%% allocate storage for simulation data

numTotalSamples = p.numOfEachCode * 2 .^ p.adcResolution;
conversionResult = nan( numTotalSamples, p.adcResolution );
idealDacOutput = nan( numTotalSamples, 1 );

%% generate samples

samples = genRampSamples( p );

%% generate CDAC array

capArray = genCbwCdac( p );

%% run simulation

for iSample = 1 : numTotalSamples
  sample = samples.data( iSample );
  conversionResult( iSample, : ) = cbwSarAdc( sample, p, capArray );
  idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
end

%% process simulation data

adcStaticPerformanceMetrics = processAdcHistogramData( p, idealDacOutput );
disp( max( adcStaticPerformanceMetrics.dnlResult ) );
disp( max( adcStaticPerformanceMetrics.inlResult ) );

%% plot simulation results

[dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics );

%% export plots

drawingDnl = 'drawing/cbw-adc-dnl.png';
exportgraphics(dnlObj, drawingDnl);
drawingInl = 'drawing/cbw-adc-inl.png';
exportgraphics(inlObj, drawingInl);


