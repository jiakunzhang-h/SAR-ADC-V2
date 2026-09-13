function vOut = modelCOMP( vP,vN,compVos,compNoise )
%% Comparator，Vp = Vcdac
vNoise = randn * compNoise;
if vP > vN + compVos + vNoise
  vOut = 1;
else
  vOut = 0;
end
end
