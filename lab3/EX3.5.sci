// Exercise 5: Multiplication operation y(n) = x1(n) * x2(n)
// Bai 5: Phep nhan tin hieu
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // Inputs:
    //   x1n - first signal vector / tin hieu thu nhat
    //   x1origin - position of origin in x1n / vi tri goc x1
    //   x2n - second signal vector / tin hieu thu hai
    //   x2origin - position of origin in x2n / vi tri goc x2
    // Outputs:
    //   yn - product signal vector / tin hieu tich
    //   yorigin - position of origin in yn / vi tri goc ket qua
    
    // Lay do dai cua cac tin hieu dau vao
    N1 = length(x1n);
    N2 = length(x2n);
    
    // Tao truc thoi gian chung dua tren goc cua x1(n) va x2(n)
    n1_start = -(x1origin - 1);
    n1_end = N1 - x1origin;
    n2_start = -(x2origin - 1);
    n2_end = N2 - x2origin;
    n_start = min(n1_start, n2_start);
    n_end = max(n1_end, n2_end);
    n = n_start:n_end;
    
    // Dieu chinh tin hieu de can chinh goc
    x1n_extended = zeros(1, length(n));
    x2n_extended = zeros(1, length(n));
    x1_idx = find(n >= n1_start & n <= n1_end);
    x2_idx = find(n >= n2_start & n <= n2_end);
    x1n_extended(x1_idx) = x1n(1:length(x1_idx));
    x2n_extended(x2_idx) = x2n(1:length(x2_idx));
    
    // Thuc hien phep nhan
    yn = x1n_extended .* x2n_extended;
    
    // Tinh vi tri goc cua y(n)
    yorigin = find(n == 0);
    
    // Tim gia tri lon nhat va nho nhat de dieu chinh truc y
    max_val = max([max(x1n), max(x2n), max(yn)]) + 1;
    min_val = min([min(x1n), min(x2n), min(yn)]) - 1;
    
    // Ve do thi
    clf;
    
    // Ve tin hieu x1(n)
    subplot(3,1,1);
    plot2d3(n, x1n_extended, style=2);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n), min_val; max(n), max_val];
    title("Tin hieu dau vao x1(n)");
    xlabel("n");
    ylabel("x1(n)");
    
    // Ve tin hieu x2(n)
    subplot(3,1,2);
    plot2d3(n, x2n_extended, style=5);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n), min_val; max(n), max_val];
    title("Tin hieu dau vao x2(n)");
    xlabel("n");
    ylabel("x2(n)");
    
    // Ve tin hieu y(n)
    subplot(3,1,3);
    plot2d3(n, yn, style=3);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n), min_val; max(n), max_val];
    title("Tin hieu dau ra y(n) = x1(n)x2(n)");
    xlabel("n");
    ylabel("y(n)");
    
endfunction

