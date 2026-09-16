function vOut = comparator( vP, vN, p )

  %% Comparator，Vp = Vcdac

  vNoise = randn * p.compNoise;
  if vP > vN + p.compVos + vNoise
    vOut = 1;
  else
    vOut = 0;
  end

end
