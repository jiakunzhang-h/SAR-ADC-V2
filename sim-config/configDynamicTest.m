function p = configDynamicTest

  %% basic specification

  p.adcResolution = 8;
  p.fftLen = 1024;
  p.Vref = 1.2;
  p.fs = 10e6;
  p.fin = [];
  p.testInputBin = [ 1, 7, 11, 31, 51, 103, 205, 307, 409 ];
  p.lenInputSignal = length(p.testInputBin);
  p.VDD = 1.2;
  p.numMonteCarlo = 1000;

  %% CDAC specification

  p.smallestCap = 50e-15;
  p.numOfSmallestCap = 1;
  p.unitCap = p.smallestCap * p.numOfSmallestCap;
  p.mismatchStd = 0.05;
  p.capPar = 0;
  
  %% Comparator specification

  p.compVos = 0;
  p.compNoise = 0;
  
end