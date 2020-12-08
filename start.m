
xyzM = dlmread('updatedclarke1880.csv',',')
% getting an entire row
% (xyzM(1,:))

% 1*2 matrix

% get the size of the elements
[row, column] =  size(xyzM);

geodeticMforSimplIteration = zeros(row,column);
geodeticMforpaul= zeros(row,column); % to check on this
geodeticMfornewton = zeros(row,column);
geodeticMforBorkowski= zeros(row,column);

geodeticMforSuccession= zeros(row,column);

% not working as expected
geodeticMforlinwang = zeros(row,column);
geodeticMforBouringInverse= zeros(row,column);

% Simple iterate according to rows

% value of row will change on each iteration.

for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = simpleiteration(x, y, z);
    % value of row will change on each iteration.
    geodeticMforSimplIteration(r,:) = P;
end

fprintf("The values of simple iteration");
geodeticMforSimplIteration



% value of row will change on Paul.

for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = paul(x, y, z);
    % value of row will change on each iteration.
    geodeticMforpaul(r,:) = P;
end

fprintf("The values of Paul");
geodeticMforpaul
% value of row will change on Paul.

for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = succession(x, y, z);
    % value of row will change on each iteration.
    geodeticMforSuccession(r,:) = P;
end
fprintf("The lat, lon, height values of Succession");
geodeticMforSuccession


for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = newton(x, y, z);
    % value of row will change on each iteration.
    geodeticMfornewton(r,:) = P;
end
fprintf("The lat, lon, height values of Succession");
geodeticMfornewton

for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = borkowski(x, y, z);
    % value of row will change on each iteration.
   geodeticMforBorkowski(r,:) = P;
end
fprintf("The lat, lon, height values of Borkwoski");
geodeticMforBorkowski
