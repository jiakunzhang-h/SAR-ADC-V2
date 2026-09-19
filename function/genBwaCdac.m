function capArray = genBwaCdac( p )

  %% generate weight CDAC

  weightCDAC = 2 .^ ( p.adcResolution / 2 - 1 : -1 : 0 );

  %% include attenuation capacitor

  weightArray = [weightCDAC, 1, weightCDAC];

  %% initialize capacitor array

  capValueArray = nan( size( weightArray ) );

  %% actual capacitor array

  for iCap = 1 : length( weightArray )
    numUnitCap = weightArray( iCap );
    capValueArray( iCap ) = normrnd( numUnitCap * p.unitCap, sqrt( numUnitCap ) * p.mismatchStd * p.unitCap / p.numOfSmallestCap );
  end

  %% store results

  capArray.main = capValueArray( 1 : p.adcResolution / 2 );
  capArray.sub = capValueArray( p.adcResolution / 2 + 2 : end );
  capArray.att = capValueArray( p.adcResolution / 2 + 1 );

end