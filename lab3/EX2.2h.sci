clf();
n = -5:5;
xo = [0, -0.25, -0.25, -0.5, 0, 0, 0, 0.5, 0.25, 0.25, 0];
plot2d3(n, xo);
a = gca();
a.data_bounds = [-6, -0.7; 6, 0.8];
a.grid = [1, 1];
xtitle("Đồ thị của hàm xo(n)", "n", "xo(n)");
