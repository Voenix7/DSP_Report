clf();
n = 0:7;
x = [0, 1, 1, 1, 1, 0.5, 0.5, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-1, -0.2; 8, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(n - 2)", "n", "x(n)");
