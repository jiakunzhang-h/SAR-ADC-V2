function decimalResult = idealDAC( digitalWord, p )
  
  %% binary word transforms to decimal code

  digitalWeight = 2 .^ ( p.adcResolution - 1 : -1 : 0 );
  decimalResult = digitalWord * digitalWeight.';

end