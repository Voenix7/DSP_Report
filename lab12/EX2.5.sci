n = [-1 0 1];
x = [1 3 -2];
xe = 0.5*(x + [-2 3 1]);   // x(-n)
xo = 0.5*(x - [-2 3 1]);
subplot(3,1,1);
plot2d3(n, x);
title('x(n)');
xlabel('n');
ylabel('x');
subplot(3,1,2);
plot2d3(n, xe);
title('Even component x_e(n)');
xlabel('n');
ylabel('x_e');
subplot(3,1,3);
plot2d3(n, xo);
title('Odd component x_o(n)');
xlabel('n');
ylabel('x_o');
