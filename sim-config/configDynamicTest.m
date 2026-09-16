function p = configDynamicTest

  %% basic specification

  p.adcResolution = 8;
  p.fftLen = 1024;
  p.Vref = 1.2;
  p.fs = 10e6;
  p.fin = [];
  p.testMultipleFrequency = [ 0.1e6, 0.5e6, 1e6, 2e6, 5e6 ];
  p.VDD = 1.2;

  %% CDAC specification

  p.unitCap = 50e-15;
  p.mismatchStd = 0;
  p.capPar = 0;

  %% Comparator specification

  p.compVos = 0;
  p.compNoise = 0;

end