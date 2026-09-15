function conversionResult = cbwSarADC( sample , p , capArray )

  %% SAR logic initialization

  digitalWord = zeros( 1 , p.adcResolution );

  %% binary search

  for iCycle = 1 : p.adcResolution

    %% Trial current bit
    digitalWord( iCycle ) = 1;

    %% CDAC
    vCompIn = modelCDAC( sample , p.Vref , capArray , 0 , digitalWord );

    %% Comparator
    compVout = modelCOMP( vCompIn , 0 , 0 , 0 );

    %% SAR Logic
    digitalWord = modelSarLogic( digitalWord , iCycle , compVout ); 

  end

  %% binary word transforms to decimal code

  digitalWeight = 2.^( p.adcResolution-1 : -1 : 0 );
  conversionResult = digitalWord * digitalWeight.';

end