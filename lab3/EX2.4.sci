// ==========================================
// MÃ NGUỒN SCILAB: 3 ĐỒ THỊ VỚI 3 MÀU KHÁC NHAU
// ==========================================

clear;
clf();

// Khai báo miền thời gian n và tín hiệu x(n)
n = -2:2;
x = [0, 3, 4, 5, 6]; 

// Tính phần chẵn xe(n) và phần lẻ xo(n)
x_rev = x($:-1:1); 
xe = 0.5 * (x + x_rev);
xo = 0.5 * (x - x_rev);

// 1. Đồ thị 1: Tín hiệu gốc x(n) - Màu Xanh dương
subplot(3, 1, 1);
plot2d3(n, x, style=2); // style = 2 (Xanh dương)
a1 = gca();
a1.data_bounds = [-2.2, 0; 2.2, 6.5];
a1.grid = [1, 1];
xtitle("Original Signal x(n)", "n", "x(n)");

// 2. Đồ thị 2: Phần chẵn xe(n) - Màu Xanh lá[cite: 11]
subplot(3, 1, 2);
plot2d3(n, xe, style=3); // style = 3 (Xanh lá)
a2 = gca();
a2.data_bounds = [-2.2, 2.5; 2.2, 4.5];
a2.grid = [1, 1];
xtitle("Even Component x_e(n)", "n", "x_e(n)");

// 3. Đồ thị 3: Phần lẻ xo(n) - Màu Đỏ[cite: 11]
subplot(3, 1, 3);
plot2d3(n, xo, style=5); // style = 5 (Đỏ)
a3 = gca();
a3.data_bounds = [-2.2, -2.5; 2.2, 2.5];
a3.grid = [1, 1];
xtitle("Odd Component x_o(n)", "n", "x_o(n)");
