function idealDacOutput = idealDAC( digitalWord, p )
  
  %% binary word transforms to decimal code

  digitalWeight = 2 .^ ( p.adcResolution - 1 : -1 : 0 );
  idealDacOutput = digitalWord * digitalWeight.' * p.Vref / ( 2 .^ p.adcResolution );

end