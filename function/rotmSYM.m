%% Theta in degrees, axis is 'x', 'y' or 'z'
function A = rotmSYM(theta, axis)
A = sym(eye(4));
axis = lower(axis);
if (axis == 'x')
    A(2,2) = cos(theta);
    A(2,3) = -sin(theta);
    A(3,2) = sin(theta);
    A(3,3) = cos(theta);
elseif (axis == 'y')
    A(3,3) = cos(theta);
    A(3,1) = -sin(theta);
    A(1,3) = sin(theta);
    A(1,1) = cos(theta);
elseif (axis == 'z')
    A(1,1) = cos(theta);
    A(1,2) = -sin(theta);
    A(2,1) = sin(theta);
    A(2,2) = cos(theta);
else
    error("Wrong axis")
end
end
    