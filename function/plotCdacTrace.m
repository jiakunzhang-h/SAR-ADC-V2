function traceObj = plotCdacTrace( p, randomTrace, randomSample )

  %% calculate LSB

  voltageLSB = p.vRef / 2 .^ p.adcResolution;
  randomTraceLSB = randomTrace / voltageLSB;
  sampleLSB = randomSample / voltageLSB;

  %% plot cdac trace result

  traceObj = figure;
  stairs( 1 : p.adcResolution, randomTraceLSB, 'b', 'LineWidth', 2.5 );
  hold on;
  yline( sampleLSB, '--r', 'Vin', 'LineWidth', 2.5 );
  xlabel( 'Bit Cycle' );
  ylabel( 'Vdac (LSB)' );
  title( 'CDAC Conversion Waveform' );
  xlim( [ 1, p.adcResolution ] );
  ylim( [ 0, 2 .^ p.adcResolution ]);
  grid on;

end
