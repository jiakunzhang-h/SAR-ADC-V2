function Vdac = bwaCdac( Vin, p, capArray, digitalWord )

  %% load parameter

  capTotalMain = sum( capArray.main );
  capTotalSub = sum( capArray.sub );

  %% calculate attenuation factor 

  AR = capArray.att / ( capTotalMain + capArray.att + p.capParMain );
  hSub = capArray.sub *  digitalWord( p.adcResolution / 2 + 1 : p.adcResolution ).' / ( capTotalSub + p.capParSub + capArray.att );
  hMain = capArray.main * digitalWord( 1 : p.adcResolution / 2 ) .' / ( capTotalMain + p.capParMain + capArray.att );

  %% calculate vdac

  H = hMain + AR * hSub;
  Vdac = - Vin + p.Vref * H;
  
end