function digitalWord = modelSarLogic( digitalWord , bitIndex , compOutput )

  %% generate a digital bit from the output of Comparator
  if compOutput == 1
    digitalWord( bitIndex ) = 0;
  else
    digitalWord( bitIndex ) = 1;
  end

end