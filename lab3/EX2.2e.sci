clf();
n = -1:8;
x = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
plot2d3(n, x);
a = gca();
a.data_bounds = [-2, -0.2; 9, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm x(n - 1).delta(n - 3)", "n", "x(n)");
