Fs = 1000;               
Ffolding = Fs / 2;       
L = 1024;                
Vmax = 5;                
Vmin = -5;               
Vpp = Vmax - Vmin;       
delta = Vpp / L;         

F1 = 300;                
F2 = 900;                
w1 = 2 * %pi * F1 / Fs;  
w2_alias = 2 * %pi * 100 / Fs; 
n = 0:30; 
x_n = 5 * cos(w1 * n) + 0 * cos(w2_alias * n);

scf(4);
clf();

plot2d3(n, x_n, style=color("blue"));
xtitle("Tín hiệu rời rạc x[n]", "Chỉ số mẫu (n)", "Biên độ (V)");
xgrid(1);
