clear;
clf();
n = -3:3;
y = [0, 0, 1, 1, 1, 0, 0];
plot2d3(n, y);
a = gca();
a.data_bounds = [-3.5, -0.1; 3.5, 1.5];
a.grid = [1, 1];
xtitle("Đồ thị của hàm y(n) = x(n^2)", "n", "x(n)");
