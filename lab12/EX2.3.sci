n = -5:5;
msignal = bool2s(n == 0);
plot2d3(n, msignal);
title('Unit impulse signal delta(n)');
xlabel('n');
ylabel('delta(n)');
