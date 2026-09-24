function [toneBin, inputFrequency] = genInputFrequency( p )

  %% generate input frequency

  if p.randomInputFrequency
    toneBin = datasample( primes( p.fftLen / 2 ), 1 );
  else
    toneBin = p.toneBin;
  end

  inputFrequency = p.fs * toneBin / p.fftLen;

end