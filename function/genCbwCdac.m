function capArray = genCbwCdac( p )

  %% generate weight CDAC

  weightCDAC = 2 .^ ( p.adcResolution - 1 : -1 : 0 );

  %% include dummy capacitor

  weightArray = [weightCDAC, 1];

  %% initialize capacitor array

  capArray = nan( size( weightArray ) );

  %% actual capacitor array

  for iCap = 1 : length( weightArray )
    numUnitCap = weightArray( iCap );
    capArray(iCap) = normrnd( numUnitCap * p.unitCap, sqrt( numUnitCap ) * p.mismatchStd * p.unitCap / p.numOfSmallestCap );
  end

end