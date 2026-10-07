subplot(3,1,1);
t = linspace(0, 0.1, 500);
plot2d3(t, 3*sin(100*%pi*t), style = color("red"));
xtitle("Continuous-time Signal xa(t)", "t (s)", "xa(t)");

subplot(3,1,2);
n = linspace(0, 30, 500);
xn = 3*sin(%pi/3*n);
plot2d3(n, xn, style = color("blue")); 
xtitle("Discrete-time Signal x(n)", "n (samples)", "x(n)");

subplot(3,1,3);
delta = 0.1;
xq = floor(xn/delta) * delta;
plot2d3(n, xq, style = color("green")); 
xtitle("Quantized Signal xq(n)", "n (samples)", "xq(n)");
