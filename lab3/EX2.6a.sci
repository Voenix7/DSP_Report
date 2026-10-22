clear;
clf();
n = -1:4;
x = [0, 1, 1, 1, 1, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-1.5, -0.1; 4.5, 1.5];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(n)", "n", "x(n)");
