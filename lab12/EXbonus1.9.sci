clear;
clf();

F1 = 240;                
F2 = 360;                
Fs = 600;                
Ts = 1 / Fs;             
Ffolding = Fs / 2;       
t = 0 : 0.00002 : 0.02;  
xa = sin(2 * %pi * F1 * t) + 3 * sin(2 * %pi * F2 * t);

scf(1);
clf(1);
plot(t, xa, 'color', color('blue'));
xtitle("Tin hieu analog ban dau", "t (s)", "xa(t)");
xgrid(1);

n = 0 : 30;             
t_n = n * Ts;           
xn = sin(2 * %pi * F1 * t_n) + 3 * sin(2 * %pi * F2 * t_n);

scf(2);
clf(2);
plot2d3(n, xn, style=color("blue"));
xtitle("Tin hieu roi rac x(n)", "n", "x(n)");
xgrid(1);

ya = -2 * sin(480 * %pi * t);

scf(3);
clf(3);
plot(t, ya, 'color', color('blue'));
xtitle("Tin hieu sau D/A", "t (s)", "ya(t)");
xgrid(1);
