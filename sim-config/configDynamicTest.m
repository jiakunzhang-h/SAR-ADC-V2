function p = configDynamicTest

  %% basic specification

  p.adcResolution = 12;
  p.fftLen = 16384;
  p.Vref = 1.2;
  p.fs = 10e6;
  p.fin = [];
  p.testInputBin = [ 1, 7, 11, 31, 51, 103, 205, 307, 409 ];
  p.lenInputSignal = length( p.testInputBin );
  p.VDD = 1.2;
  p.k = 1.380649e-23;   
  p.temperature = 300;  

  %% Monte Carlo specification

  p.numMonteCarlo = 1000;

  %% code density test specification

  p.numOfEachCode = 30;

  %% CDAC specification

  p.smallestCap = 50e-15;
  p.numOfSmallestCap = 1;
  p.unitCap = p.smallestCap * p.numOfSmallestCap;
  p.mismatchStd = 0;
  p.capPar = 0;
  p.capParMain = 0;
  p.capParSub = 0;
  
  %% Comparator specification

  p.compVos = 0;
  p.compNoise = 100e-6;
  
end