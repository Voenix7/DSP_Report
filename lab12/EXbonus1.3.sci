clf();
clear;

// 1. Đồ thị Bài 1.3a: xa(t) = 3*cos(5t + %pi/6) [Tuần hoàn]
subplot(3, 1, 1);
t = 0 : 0.01 : 2 * %pi;
xa = 3 * cos(5 * t + %pi / 6);
plot(t, xa, 'r');
xtitle('Bài 1.3a: xa(t) = 3*cos(5t + %pi/6) [Tuần hoàn]', 't (s)', 'xa(t)');

// 2. Đồ thị Bài 1.3b: x(n) = 3*cos(5n + %pi/6) [Không tuần hoàn]
subplot(3, 1, 2);
n1 = 0 : 50;
x1 = 3 * cos(5 * n1 + %pi / 6);
plot2d3(n1, x1, style=2);
xtitle('Bài 1.3b: x(n) = 3*cos(5n + %pi/6) [Không tuần hoàn]', 'n (mẫu)', 'x(n)');

// 3. Đồ thị Bài 1.3e: x(n) [Tuần hoàn]
subplot(3, 1, 3);
n2 = 0 : 50;
x2 = 3 * cos(2 * %pi * n2 / 10 + %pi / 6); 
plot2d3(n2, x2, style=3); 
xtitle('Bài 1.3e: x(n) [Tuần hoàn]', 'n (mẫu)', 'x(n)');
