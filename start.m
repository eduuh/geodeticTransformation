
xyzM = dlmread('coordinate.csv',',')
% getting an entire row
% (xyzM(1,:))

% 1*2 matrix

% get the size of the elements
[row, column] =  size(xyzM);
geodeticMforSimplIteration = zeros(row,column);

% Simple iterate according to rows

% value of row will change on each iteration

for r=1:row
    point = xyzM(r,:);x = point(1); y = point(2);z = point(3);
    P = simpleiteration(x, y, z);
    % value of row will change on each iteration.
    geodeticMforSimplIteration(r,:) = P;
end

geodeticMforSimplIteration