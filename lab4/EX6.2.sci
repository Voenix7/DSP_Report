clc;
clear;
clf;

x = [1 2 -3 2 1];
h = [1 0 -1];
Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;
H = zeros(Ny, Nx);

for i = 1:Ny
    for j = 1:Nx
        k = i - j;
        
        if k >= 0 & k < Nh then
            H(i,j) = h(k+1);
        end
    end
end

y = H * x';

nx = 0:Nx-1;
ny = 0:Ny-1;

Ex = x.^2;
Ey = y'.^2;

disp("Convolution matrix H:");
disp(H);

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
plot2d3(ny, y', 5);
xtitle("Bieu do cua y(n) - Matrix Method", "n", "y(n)");
xgrid();

subplot(4,1,3);
plot2d3(nx, Ex, 6);
xtitle("Bieu do cua Ex(n)", "n", "Ex(n)");
xgrid();

subplot(4,1,4);
plot2d3(ny, Ey, 4);
xtitle("Bieu do cua Ey(n)", "n", "Ey(n)");
xgrid();
