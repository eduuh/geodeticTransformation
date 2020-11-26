
% datumu1 wgs84
% datum2 clarke1880
% type 7p

%wgs84 = dlmread('wgs.......',',')
%clarke1880 = dlmread('updatedclarke1880.csv',',')

% ask viola for scale
% test for nametosave as last parameter
%[tp,rc,ac,tr] = bursaworf(wgs84,clarke1880,'7P',1,[0 0 0]);


F = dlmread('clarkecontrols.csv',',');
W = dlmread('wgscontrols.csv',',');


% Wgs84 parameters to be used to compute clarke points
Wt = dlmread('wgstestpoints.csv',',');

% Clarke expected points
C = dlmread('clarketestpoints.csv',',');
% clark to wgs84

[oslparameters, olssd] = parametersols(F,W);
[oslparameterswc, olssdwc] = parametersols(W,F);

% clark to wgs84
(oslparameters)
(olssd)

% wgs84 to clark 
(oslparameterswc)
(olssdwc)

translation = oslparameters(1:3)
rotation = oslparameters(4:6)
scale = oslparameters(7)
SF = [1+scale, rotation(3),-rotation(2); -rotation(3), 1+scale, rotation(1);rotation(2), -rotation(1), 1+scale ];




[row , column] = size(Wt);
wgs84points = zeros(row,column);
for r=1:row
  pointF = C(r,:);xF = pointF(1); yF = pointF(2);zF = pointF(3);
  wgs84point = translation +( SF * pointF');
  wgs84points(r,:)= wgs84point';
% compute for clarke 1880
end

wgs84points - Wt

wgs84points

Wt







        



