clf();
n = -1:6;
x = [0, 0.5, 0.5, 1, 1, 1, 1, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-2, -0.2; 7, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(4 - n)", "n", "x(n)");
