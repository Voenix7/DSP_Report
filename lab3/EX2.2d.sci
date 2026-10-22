clf();
n = -3:5;
x = [0, 0, 1, 1, 1, 1, 0, 0, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-4, -0.2; 6, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(n).u(2 - n)", "n", "x(n)");
