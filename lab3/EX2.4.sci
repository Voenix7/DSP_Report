clear;
clf();

n = -2:2;
x = [0, 3, 4, 5, 6]; 
x_rev = x($:-1:1); 
xe = 0.5 * (x + x_rev);
xo = 0.5 * (x - x_rev);

// 1. Đồ thị x(n) 
subplot(3, 1, 1);
plot2d3(n, x, style=2); 
a1 = gca();
a1.data_bounds = [-2.2, 0; 2.2, 6.5];
a1.grid = [1, 1];
xtitle("Original Signal x(n)", "n", "x(n)");

// 2. Đồ thị xe(n)
subplot(3, 1, 2);
plot2d3(n, xe, style=3); 
a2 = gca();
a2.data_bounds = [-2.2, 2.5; 2.2, 4.5];
a2.grid = [1, 1];
xtitle("Even Component x_e(n)", "n", "x_e(n)");

// 3. Đồ thị xo(n)
subplot(3, 1, 3);
plot2d3(n, xo, style=5); 
a3 = gca();
a3.data_bounds = [-2.2, -2.5; 2.2, 2.5];
a3.grid = [1, 1];
xtitle("Odd Component x_o(n)", "n", "x_o(n)");
