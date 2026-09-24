function mcObj = plotMonteCarlo( p, enobMCResult )

  %% plot Monte Carlo result

  mcObj = figure;
  meanEnob = mean( enobMCResult );
  stdEnob = std( enobMCResult );
  h = histfit( enobMCResult, [], 'kernel' );
  h( 2 ).Color = 'b';
  h( 2 ).LineWidth = 2.5;
  xlabel( 'ENOB (bit)' );
  ylabel( 'Count' );
  title( "Monte Carlo ENOB Distribution" );
  text( min( enobMCResult ) , 50, sprintf( "N = %d Mean = %.2f bit Std = %.2f bit", p.numMonteCarlo, meanEnob, stdEnob ), 'FontWeight', 'bold' );
  grid on;

end
