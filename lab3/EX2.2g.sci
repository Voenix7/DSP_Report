clf();
n = -5:5;
xe = [0, 0.25, 0.25, 0.5, 1, 1, 1, 0.5, 0.25, 0.25, 0];
plot2d3(n, xe);
a = gca();
a.data_bounds = [-6, -0.2; 6, 1.6];
a.grid = [1, 1];
xtitle("Đồ thị của hàm xe(n)", "n", "xe(n)");
