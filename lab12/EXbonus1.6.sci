clf();
clear;

t = 0 : 0.0001 : 0.05;
x = cos(200 * %pi * t);
plot(t, x, 'b');
gca().data_bounds = [0, -1; 0.05, 1];
