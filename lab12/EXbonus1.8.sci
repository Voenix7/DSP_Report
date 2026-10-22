clf();
clear;
scf(2);

t = 0 : 0.001 : 2;
x = cos(10 * %pi * t);
plot(t, x, 'r');
gca().data_bounds = [0, -1; 2, 1];
