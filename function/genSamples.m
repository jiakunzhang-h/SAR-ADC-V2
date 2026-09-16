function samples = genSamples( p )

  %% generate input voltage

  time = ( 0 : p.fftLen - 1 ) / p.fs;
  samples.data = p.VDD / 2 + p.VDD / 2 * sin( 2 * pi * p.fin * time ) ;
  
end