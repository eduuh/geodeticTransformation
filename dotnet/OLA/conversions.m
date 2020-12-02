function [ccvwithparameters]=conversions(oslparameters, system1)
  % ccvwithparameters => The newly conversted coordinates with parameters.
  % system1 => origina coordinates

    translation = oslparameters(1:3);
    rotation = oslparameters(4:6);
    scale = oslparameters(7);
    SF = [1+scale, rotation(3),-rotation(2); -rotation(3), 1+scale, rotation(1);rotation(2), -rotation(1), 1+scale ];




    [row , column] = size(system1);
    ccvwithparameters = zeros(row,column);
    for r=1:row
      pointF = system1(r,:);xF = pointF(1); yF = pointF(2);zF = pointF(3);
      wgs84point = translation +( SF * pointF');
      ccvwithparameters(r,:)= wgs84point';
    % compute for clarke 1880
    end
end