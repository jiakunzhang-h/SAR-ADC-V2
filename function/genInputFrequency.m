function [toneBin, inputFrequency] = genInputFrequency( p )

  %% generate random input frequency

  toneBin = datasample( primes( p.fftLen / 2 ), 1 );
  inputFrequency = p.fs * toneBin / p.fftLen;

end
