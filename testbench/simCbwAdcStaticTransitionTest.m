%% simulation preparation

clear
close all
clc
format long g

%% set the seed



%% load simulation configuration and parameters

p = configDynamicTest();

%% generate sine wave

sineWave = genSineSamples( p );

%% allocate storage for simulation data

numTotalSamples = sineWave.numOfSamples;
conversionResult = nan( numTotalSamples, p.adcResolution );
idealDacOutput = nan( numTotalSamples, 1 );

%% generate CDAC array

capArray = genCbwCdac( p );

%% run simulation

for iSample = 1 : numTotalSamples
  sample = sineWave.data( iSample );
  conversionResult( iSample, : ) = cbwSarAdc( sample, p, capArray );
  idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
end

%% process simulation data

adcStaticPerformanceMetrics = processAdcTransitionData( p, sineWave, idealDacOutput );

%% plot simulation results

[dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics );

%% export plots

drawingDnl = 'drawing/cbw-adc-dnl-transition-method.png';
exportgraphics( dnlObj, drawingDnl );
drawingInl = 'drawing/cbw-adc-inl-transition-method.png';
exportgraphics( inlObj, drawingInl );

