function conversionResult = cbwSarADC( sample, p, capArray )

  %% SAR logic initialization

  digitalWord = zeros( 1, p.adcResolution );

  %% binary search

  for iCycle = 1 : p.adcResolution

    %% Trial current bit
    digitalWord( iCycle ) = 1;

    %% CDAC
    vCompIn = cdac( sample, p, capArray, digitalWord );

    %% Comparator
    compVout = comparator( vCompIn, 0, p );

    %% SAR Logic
    digitalWord = sarLogic( digitalWord, iCycle, compVout );

  end

  %% output
  conversionResult = digitalWord;

end