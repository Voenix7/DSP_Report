clf();
n = -2:5;
x = [0.5, 1, 1, 1, 0.5, 0, 0, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-3, -0.2; 6, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(n^2)", "n", "x(n)");
