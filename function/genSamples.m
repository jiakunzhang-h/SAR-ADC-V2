function samples = genSamples( p )

  %% use genInputFrequency function

  [toneBin, inputFrequency] = genInputFrequency( p );

  %% generate input voltage

  time = ( 0 : p.fftLen - 1 ) / p.fs;
  samples.data = p.VDD / 2 + p.VDD / 2 * sin( 2 * pi * inputFrequency * time ) ;
  samples.toneBin = toneBin;
  samples.inputFrequency = inputFrequency;

end