
% datumu1 wgs84
% datum2 clarke1880
% type 7p

wgs84 = dlmread('wgs.......',',')
clarke1880 = dlmread('updatedclarke1880.csv',',')

% ask viola for scale
% test for nametosave as last parameter
[tp,rc,ac,tr] = bursaworf(wgs84,clarke1880,"7p",1,[0 0 0]);



