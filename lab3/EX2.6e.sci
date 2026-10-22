clear;
clf();
n = -3:3;
y2 = [0, 1, 0, 0, 0, 1, 0];
plot2d3(n, y2);
a = gca();
a.data_bounds = [-3.5, -0.1; 3.5, 1.5];
a.grid = [1, 1];
xtitle("Đồ thị của hàm y2(n) = T[x2(n)]", "n", "x(n)");
