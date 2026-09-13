function p = configDynamicTest
  p.adcResolution = 8;
  p.ncap = 8;
  p.fftLen = 1024;
  p.mismatchStd = 0;
  p.Vref = 1.2;
  p.fs = 10e6;
  p.fin = p.fs * 7 / p.fftLen;
  p.inputbin = 7;
  t = ( 0:p.fftLen-1 ) / p.fs;
  VDD = 1.2;
  p.Vin = VDD / 2 + VDD / 2 * sin( 2 *pi * p.fin * t ) ;
end