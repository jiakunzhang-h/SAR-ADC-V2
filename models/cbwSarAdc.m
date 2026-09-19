function conversionResult = cbwSarAdc( sample, p, capArray )

  %% SAR logic initialization

  digitalWord = zeros( 1, p.adcResolution );

  %% calculate thermal noise

  capTotal = sum(capArray);
  thermalNoiseStd = sqrt( 4.141947e-21 / capTotal );
  thermalNoise = normrnd( 0, thermalNoiseStd );

  %% inject thermal noise

  sample = sample + thermalNoise;
  
  %% binary search

  for iCycle = 1 : p.adcResolution

    %% Trial current bit

    digitalWord( iCycle ) = 1;

    %% CDAC

    vCompIn = cbwCdac( sample, p, capArray, digitalWord );

    %% Comparator

    compVout = comparator( vCompIn, 0, p );

    %% SAR Logic

    digitalWord = sarLogic( digitalWord, iCycle, compVout );

  end

  %% output
  
  conversionResult = digitalWord;

end