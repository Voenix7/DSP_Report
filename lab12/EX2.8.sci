n = [-2 -1 0 1];
x = [1 -2 3 6];

y1 = x($:-1:1);     // x(-n), đảo ngược thời gian
n1 = [1 0 -1 -2];   // chỉ số thời gian tương ứng

y2 = [1 -2 3 6];    // x(n+3):cùng một chuỗi được dịch chuyển theo thời gian
n2 = [-5 -4 -3 -2];

y3 = 2*[6 3 -2 1]; // 2x(-n-2)
n3 = [-4 -3 -2 -1];

subplot(2,2,1);
plot2d3(n, x);
title('x(n)');
xlabel('n');
ylabel('x');

subplot(2,2,2);
plot2d3(n1, y1);
title('y1(n) = x(-n)');
xlabel('n');
ylabel('y1');

subplot(2,2,3);
plot2d3(n2, y2);
title('y2(n) = x(n+3)');
xlabel('n');
ylabel('y2');

subplot(2,2,4);
plot2d3(n3, y3);
title('y3(n) = 2x(-n-2)');
xlabel('n');
ylabel('y3');
