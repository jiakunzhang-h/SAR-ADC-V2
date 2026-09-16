function Vdac = cdac( Vin, p, capArray, digitalWord )

  %% calculate Vdac

  capTotal = sum( capArray );
  H = capArray( 1 : end - 1 ) * digitalWord .' / ( capTotal + p.capPar );
  Vdac = -Vin + p.Vref * H;
  
end