
% datumu1 WGS84gs84
% datum2 clarke1880

CLARKE = dlmread('clarkecontrols.csv',',');
WGS84 = dlmread('wgscontrols.csv',',');


% WGS84gs84 parameters to be used to compute clarke points
WGS84t = dlmread('wgstestpoints.csv',',');

% Clarke expected points
Ct = dlmread('clarketestpoints.csv',',');
% clark to WGS84gs84


% parameters CLARKErom WGS84gs84 to clarke
[oslparametersWGS84c, olssdWGS84c] = parametersols(WGS84,CLARKE);
% parameters CLARKEorm clarke to WGS84gs84
[oslparameterscWGS84, olssdcWGS84] = parametersols(CLARKE,WGS84);



printf("The values of parameters clarke to WGS84gs84 \n\n");
(oslparameterscWGS84)
(olssdcWGS84)


% clark84 points computed CLARKErom parameters.
[clarkepointscomputerfromclarkparams] = conversions(oslparametersWGS84c, WGS84t);
shiftsinClarke = clarkepointscomputerfromclarkparams - Ct;

originalclarketestpoints = Ct
(clarkepointscomputerfromclarkparams)

shiftinclarks= shiftsinClarke

printf("\n\n\n\n\n")

printf("WGS84 to clarke parameters and Standard deviation \n\n");
(oslparametersWGS84c)
(olssdWGS84c)

% WGS84gs84 points computed CLARKErom parameters.
[wgs84pointscomputedfwgs84params] = conversions(oslparameterscWGS84, Ct);
shiftsinWGS84 = wgs84pointscomputedfwgs84params - WGS84t;

wgsoriginaltestpoints = WGS84t
(wgs84pointscomputedfwgs84params)
shiftsinWGS84
% clark to WGS84gs84




% printing out the shifts from both parameters










        



