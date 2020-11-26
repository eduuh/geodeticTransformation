
% datumu1 wgs84
% datum2 clarke1880
% type 7p

%wgs84 = dlmread('wgs.......',',')
%clarke1880 = dlmread('updatedclarke1880.csv',',')

% ask viola for scale
% test for nametosave as last parameter
%[tp,rc,ac,tr] = bursaworf(wgs84,clarke1880,'7P',1,[0 0 0]);


F = dlmread('clarkecontrols.csv',',')
W = dlmread('wgscontrols.csv',',')


[row, column] =  size(F);
parameters = zeros(row,7);

for r=1:row
  pointF = F(r,:);xF = pointF(1); yF = pointF(2);zF = pointF(3);
  pointW = W(r,:);xW = pointW(1); yW = pointW(2);zW = pointW(3);
% oLS

  im = eye(3)
  z = [0, -zF, yF, xF; zF,0,-xF,yF;-yF,xF,0,zF]
  A = [im,z]

  L = [(xW-xF);(yW-yF);(zW-zF);]

% ols
  aTrns = A'
  first = aTrns * A
  firstinv = pinv(first)
  second = aTrns  * L
  x = firstinv * second
  parameters(r,:)= x';
  translation = x(1:3)
  rotation = x(4:6)
  scale = x(7)

   SF = [1+scale, rotation(3),-rotation(2); -rotation(3), 1+scale, rotation(1);rotation(2), -rotation(1), 1+scale ]
   checkw = translation +( SF * pointF')
   
   pointW
end

parameters

[row, column] = size(translationx)

translationx = parameters(:,1)
meantranslationx = sum(translationx)/ row
sdtranslationx = std(translationx)

translationy = parameters(:,2)
meantranslationy = sum(translationy)/ row
sdtranslationy = std(translationy)

translationz = parameters(:,3)
meantranslationz = sum(translationz)/ row
sdtranslationz = std(translationz)

rotationx = parameters(:,4)
meanrotationx = sum(rotationx)/ row
sdtrotationx = std(translationx)

rotationy = parameters(:,5)
meanrotationy = sum(rotationy)/ row
sdtrotationy = std(rotationy)

rotationz = parameters(:,6)
meanrotationz = sum(rotationz)/ row
sdrotationz = std(rotationz)

scalefactor = parameters(:,7)
meanscalefactor = sum(scalefactor)/ row
sdscalefactor = std(scalefactor)

OLSparameters = [meanscalefactor; meanrotationx ; meanrotationy; meanrotationz; meantranslationx; meantranslationy; meantranslationz; ]
OLSD = [sdscalefactor; sdtranslationx ; sdtrotationy; sdrotationz; sdtranslationx; sdtranslationy; sdtranslationz]
