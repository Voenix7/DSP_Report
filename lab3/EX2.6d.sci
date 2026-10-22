clear;
clf();
n = 0:6;
x2 = [0, 0, 1, 1, 1, 1, 0];
plot2d3(n, x2);
a = gca();
a.data_bounds = [-0.5, -0.1; 6.5, 1.5];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x2(n) = x(n - 2)", "n", "x(n)");
