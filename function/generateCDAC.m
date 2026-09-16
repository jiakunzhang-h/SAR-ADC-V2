function capArray = generateCDAC( p )
  
  %% generate weight CDAC 

  weightCDAC = 2 .^ ( p.adcResolution - 1 : -1 : 0 );

  %% include dummy capacitor

  weightArray = [weightCDAC , 1];

  %% generate capacitor mismatch

  unitCapArray = p.unitCap * ( 1 + randn( size( weightArray ) ) * p.mismatchStd );

  %% actual capacitor array

  capArray = weightArray .* unitCapArray;
end