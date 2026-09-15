function capArray = generateCDAC( p , unitCap , capMismatchSigma )
  
  %% generate weight CDAC 

  weightCDAC = 2 .^ ( p.adcResolution-1 : -1 : 0 );
  
  %% include dummy capacitor

  weightArray = [weightCDAC , 1];

  %% generate capacitor mismatch

  unitCapArray = unitCap * ( 1 + randn(size(weightArray)) * capMismatchSigma );

  %% actual capacitor array

  capArray = weightArray .* unitCapArray;
end