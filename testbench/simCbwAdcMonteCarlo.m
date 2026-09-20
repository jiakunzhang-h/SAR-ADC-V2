%% simulation preparation

clear
close all
clc
format long g

%% load simulation configuration and parameters

p = configDynamicTest();

%% allocate storage for simulation data

enobMCResult = nan( p.numMonteCarlo, 1 );

%% generate samples

samples = genSamples( p );

%% Monte Carlo simulation
parfor iMonteCarlo = 1 : p.numMonteCarlo

  %% load single simulation configuration and parameters
  conversionResult = nan( p.fftLen, p.adcResolution );
  idealDacOutput = nan( p.fftLen, 1 );

  %% generate CDAC array

  capArray = genCbwCdac( p );

  %% run simulation

  for iSample = 1 : p.fftLen
    sample = samples.data( iSample );
    conversionResult( iSample, : ) = cbwSarAdc( sample, p, capArray );
    idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
  end

  %% process simulation data

  adcDynamicPerformanceMetrics = processAdcData( p, samples, idealDacOutput );
  enobMCResult( iMonteCarlo ) = adcDynamicPerformanceMetrics.enob;
end

%% plot simulation results

mcObj = plotMonteCarlo( enobMCResult );

%% export plots

drawing = 'drawing/cbw-monte-carlo-enob-distribution.png';
exportgraphics( mcObj, drawing );

