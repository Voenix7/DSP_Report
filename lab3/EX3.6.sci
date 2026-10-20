// Exercise 6: Convolution operation y(n) = x(n) * h(n)
// Bai 6: Phep tich chap
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Inputs:
    //   xn - input signal vector / tin hieu dau vao
    //   xorigin - position of origin in xn / vi tri goc x
    //   hn - system impulse response / dac tinh he thong
    //   horigin - position of origin in hn / vi tri goc h
    // Outputs:
    //   yn - convolution result vector / ket qua tich chap
    //   yorigin - position of origin in yn / vi tri goc ket qua
    
    // Lay do dai cua cac tin hieu dau vao
    Nx = length(xn);
    Nh = length(hn);
    Ny = Nx + Nh - 1;
    
    // Khoi tao vector dau ra yn voi gia tri 0
    yn = zeros(1, Ny);
    
    // Tinh vi tri goc cua y(n)
    yorigin = xorigin + horigin - 1;
    
    // Tao truc thoi gian cho x(n), h(n) va y(n)
    n_x = -(xorigin-1):(Nx-xorigin);
    n_h = -(horigin-1):(Nh-horigin);
    n_y = -(yorigin-1):(Ny-yorigin);
    
    // Thuc hien phep tich chap
    for n = 1:Ny
        sum_val = 0;
        for k = 1:Nx
            h_idx = n - k + 1;
            if h_idx >= 1 & h_idx <= Nh then
                sum_val = sum_val + xn(k) * hn(h_idx);
            end
        end
        yn(n) = sum_val;
    end
    
    // Tim gia tri lon nhat va nho nhat de dieu chinh truc y
    max_val = max([max(xn), max(hn), max(yn)]) + 1;
    min_val = min([min(xn), min(hn), min(yn)]) - 1;
    
    // Ve do thi
    clf;
    
    // Ve tin hieu x(n)
    subplot(3,1,1);
    plot2d3(n_x, xn, style=2);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n_y), min_val; max(n_y), max_val];
    title("Tin hieu dau vao x(n)");
    xlabel("n");
    ylabel("x(n)");
    
    // Ve tin hieu h(n)
    subplot(3,1,2);
    plot2d3(n_h, hn, style=5);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n_y), min_val; max(n_y), max_val];
    title("Dac tinh he thong h(n)");
    xlabel("n");
    ylabel("h(n)");
    
    // Ve tin hieu y(n)
    subplot(3,1,3);
    plot2d3(n_y, yn, style=3);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(n_y), min_val; max(n_y), max_val];
    title("Tin hieu dau ra y(n) = x(n) * h(n)");
    xlabel("n");
    ylabel("y(n)");
    
endfunction

