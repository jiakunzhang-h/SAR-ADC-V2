function p = configDynamicTest

  %% basic specification

  p.adcResolution = 8;
  p.fftLen = 1024;
  p.Vref = 1.2;
  p.fs = 10e6;
  p.fin = [];
  p.testInputBin = [ 10, 51, 103, 205, 409 ];
  p.VDD = 1.2;

  %% CDAC specification

  p.unitCap = 50e-15;
  p.mismatchStd = 0;
  p.capPar = 0;

  %% Comparator specification

  p.compVos = 0;
  p.compNoise = 0;

end