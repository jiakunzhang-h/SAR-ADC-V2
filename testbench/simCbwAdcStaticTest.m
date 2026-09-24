%% simulation preparation

clear
close all
clc
format long g

%% set the seed

rng( 13 );

%% load simulation configuration and parameters

p = configDynamicTest();

%% allocate storage for simulation data

numTotalSamples = p.samplesPerStair * 2 .^ p.adcResolution;
conversionResult = nan( numTotalSamples, p.adcResolution );
idealDacOutput = nan( numTotalSamples, 1 );

%% generate samples

samples = genRampSamples( p );

%% generate CDAC array

capArray = genCbwCdac( p );

%% run simulation

for iSample = 1 : numTotalSamples
  sample = samples( iSample );
  conversionResult( iSample, : ) = cbwSarAdc( sample, p, capArray );
  idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
end

%% process simulation data

adcStaticPerformanceMetrics = processAdcHistogramData( p, idealDacOutput );

%% plot simulation results

[dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics );

%% export plots

drawingDnl = 'drawing/cbw-adc-dnl-histogram-method.png';
exportgraphics( dnlObj, drawingDnl );
drawingInl = 'drawing/cbw-adc-inl-histogram-method.png';
exportgraphics( inlObj, drawingInl );

