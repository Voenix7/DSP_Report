clc;
clear;
clf;

x = [1 2 -3 2 1];
h = [1 0 -1];
Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;
y = zeros(1, Ny);

for n = 0:Ny-1
    for k = 0:Nh-1
        j = n - k;

        if j >= 0 & j < Nx then
            y(n+1) = y(n+1) + h(k+1)*x(j+1);
        end
    end
end

nx = 0:Nx-1;
ny = 0:Ny-1;

Ex = x.^2;
Ey = y.^2;

disp("Output signal y(n):");
disp(y);

disp("Energy of x(n):");
disp(sum(Ex));

disp("Energy of y(n):");
disp(sum(Ey));

scf(0);

subplot(4,1,1);
plot2d3(nx, x, 2);
xtitle("Bieu do cua x(n)", "n", "x(n)");
xgrid();

subplot(4,1,2);
plot2d3(ny, y, 5);
xtitle("Bieu do cua y(n) - Folding and Shifting", "n", "y(n)");
xgrid();

subplot(4,1,3);
plot2d3(nx, Ex, 6);
xtitle("Bieu do cua Ex(n)", "n", "Ex(n)");
xgrid();

subplot(4,1,4);
plot2d3(ny, Ey, 4);
xtitle("Bieu do cua Ey(n)", "n", "Ey(n)");
xgrid();
