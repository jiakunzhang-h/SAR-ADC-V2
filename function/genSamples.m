function samples = genSamples(p)
  time = ( 0 : p.fftLen - 1 ) / p.fs;
  samples.data = p.VDD / 2 + p.VDD/ 2 * sin( 2 * pi * p.fin * time ) ;
end