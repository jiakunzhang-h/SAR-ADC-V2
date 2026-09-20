function idealDacOutput = idealDAC( digitalWord )

  %% binary word transforms to decimal code

  binaryString = join( string( digitalWord ), "" );
  idealDacOutput = bin2dec( binaryString );

end