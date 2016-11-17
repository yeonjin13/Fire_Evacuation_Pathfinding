function [b] = ab2v(v1, v2)
% Magnitude of vector is its norm
m(1) = norm(v1);
m(2) = norm(v2);

% Min. angles from vector 1 to axes
a(1 : 2) = acosd(v1 / m(1));
% Min. angles from vector 2 to axes
a(3 : 4) = acosd(v2 / m(2)); 

% Dot product dot(v1, v2) equals sum(v1 .* v2)
a(5) = acosd(dot(v1, v2) / m(1) / m(2));
b=a(5);
