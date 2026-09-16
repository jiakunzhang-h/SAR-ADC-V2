function [inputFrequency, inputBin] = genInputFrequency( p )

  %% use specified input frequency
  
  if ~isempty( p.fin )
    inputFrequency = p.fin;
    inputBinExact = inputFrequency / p.fs * p.fftLen;
    if abs( inputBinExact - round( inputBinExact ) ) > 1e-12
      error( "the input frequency is not satisfied with coherent sampling!" );
    end
    inputBin = round( inputBinExact );
    return
  end

  %% generate random input frequency

  randomBinLen = 1 : floor( p.fftLen / 2 ) ;
  coherentBin = randomBinLen( gcd( p.fftLen, randomBinLen ) == 1 );
  randomIndex = randi( numel( coherentBin ) );
  inputBin = coherentBin( randomIndex );
  inputFrequency = p.fs * inputBin / p.fftLen;

end