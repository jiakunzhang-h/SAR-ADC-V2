function Vdac = modelCDAC( Vin,Vref,capArray,capPar,digitalWord )

%% calculate Vdac

capTotal = sum(capArray);
H = capArray(1:end-1) * digitalWord.' / (capTotal + capPar );
Vdac = -Vin + Vref * H;
end