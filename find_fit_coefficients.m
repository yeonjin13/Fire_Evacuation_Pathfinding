
function coeff = find_fit_coefficients(x, y)

A = [];

[mx nx] = size(x);
[my ny] = size(y);

if (mx == 1)
    x = x';
end

if (my == 1)
    y = y';
end

A = [];
for i=1:length(x)
    A(i,:) = [1 (1-0.325*exp(-0.167*x(i))-0.675*exp(-2.5*x(i)))];
    %A(i,:) = [x(i)^2 x(i)^1.5 log(x(i)) 1];
end

coeff = pinv(A)*y;
