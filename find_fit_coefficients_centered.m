
function coeff = find_fit_coefficients_centered(x, y)

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
    A(i,:) = [log(0.133*x(i)+1) 1]; % y= a*log(0.133*x+1)+b*1
    %A(i,:) = [log(0.133*x(i)+1)]; % y= a*log(0.133*x+1)+x0
end

coeff = pinv(A)*y;
