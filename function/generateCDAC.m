function capArray = generateCDAC(weightCDAC,unitCap,capMismatchSigma)

%% include dummy capacitor

  weightArray = [weightCDAC, 1];

  %% generate capacitor mismatch

  unitCapArray = unitCap * (1 + randn(size(weightArray)) * capMismatchSigma);

  %% actual capacitor array

  capArray = weightArray .* unitCapArray;
end