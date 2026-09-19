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

capArray = genBwaCdac( p );

%% run simulation

for iSample = 1 : numTotalSamples
  sample = samples.data( iSample );
  conversionResult( iSample, : ) = bwaSarAdc( sample, p, capArray );
  idealDacOutput( iSample ) = idealDAC( conversionResult( iSample, : ) );
end

%% process simulation data

adcStaticPerformanceMetrics = processAdcHistogramData( p, idealDacOutput );

%% plot simulation results

[dnlObj, inlObj] = plotAdcStaticSimulationResult( p, adcStaticPerformanceMetrics );

%% export plots

drawingDnl = 'drawing/bwa-adc-dnl-histogram-method.png';
exportgraphics( dnlObj, drawingDnl );
drawingInl = 'drawing/bwa-adc-inl-histogram-method.png';
exportgraphics( inlObj, drawingInl );

%% process simulation data with definition

conversionalAdcStaticPerformanceMetrics = ConventionalProcessAdcStaticData( p, samples, idealDacOutput );

%% plot simulation results

[dnlObjConversional, inlObjConversional] = plotAdcStaticSimulationResult( p, conversionalAdcStaticPerformanceMetrics );

%% export plots

drawingDnlConversional = 'drawing/bwa-adc-dnl-definition-method.png';
exportgraphics( dnlObjConversional, drawingDnlConversional );
drawingInlConversional = 'drawing/bwa-adc-inl-definiton-method.png';
exportgraphics( inlObjConversional, drawingInlConversional );


