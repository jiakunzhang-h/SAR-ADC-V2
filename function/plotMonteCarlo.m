function mcObj = plotMonteCarlo(enobMCResult)

  %% plot Monte Carlo result
  
  mcObj = figure;
  histogram( enobMCResult );
  meanEnob = mean( enobMCResult );
  stdEnob = std( enobMCResult );
  xlabel( 'ENOB (bit)' );
  ylabel( 'Count' );
  title( sprintf("Monte Carlo ENOB Distribution Mean = %.2f bit Std = %.2f bit", meanEnob, stdEnob) );
  grid on;

end