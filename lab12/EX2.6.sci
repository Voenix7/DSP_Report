n = [0 1 2 3];
x1 = [0 1 3 -2];
x2 = [0 1 2 3];
y  = x1 + x2;

subplot(3,1,1);
plot2d3(n, x1);
title('x1(n)');
xlabel('n');
ylabel('x1');

subplot(3,1,2);
plot2d3(n, x2);
title('x2(n)');
xlabel('n');
ylabel('x2');

subplot(3,1,3);
plot2d3(n, y);
title('y(n) = x1(n) + x2(n)');
xlabel('n');
ylabel('y');
