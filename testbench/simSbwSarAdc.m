%% simulation preparation

clear
close all
clc
format long g

%% load simulation configuration and parameters

p = configDynamicTest();

%% allocate storage for simulation data

conversionResult = nan( p.fftLen, p.adcResolution );
idealDacOutput = nan( p.fftLen, 1 );
sndrResult = nan( p.lenInputSignal, 1 );

%% generate samples

samples = genSamples( p );

%% generate CDAC array

capArray = genSbwCdac( p );

%% run simulation

for iSample = 1 : p.fftLen
  sample = samples.data( iSample );
  conversionResult( iSample, : ) = sbwSarAdc( sample, p, capArray );
  idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
end

%% process simulation data

adcDynamicPerformanceMetrics = processAdcData( p, samples, idealDacOutput );
disp( adcDynamicPerformanceMetrics.enob );
disp( adcDynamicPerformanceMetrics.sndr );

%% plot simulation results

obj = plotAdcDynamicSimulationResult( p, adcDynamicPerformanceMetrics );

%% export plots

drawing = 'drawing/sbw-adc-spectrum.png';
exportgraphics(obj, drawing);

