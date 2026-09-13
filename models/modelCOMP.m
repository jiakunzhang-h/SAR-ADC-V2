function Vout=modelCOMP(Vp,Vn,com_vos,com_noise)
%% comparator，Vp=Vcdac
V_noise = randn * com_noise;
if Vp > Vn + com_vos + V_noise
  Vout = 1;
else
  Vout = 0;
end
end
