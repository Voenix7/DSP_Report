n = -5:5;
msignal = bool2s(n >= 0);
plot2d3(n, msignal);
title('Unit step signal u(n)');
xlabel('n');
ylabel('u(n)');
