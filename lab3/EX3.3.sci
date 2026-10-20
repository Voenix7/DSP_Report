// Exercise 3: Folding operation y(n) = x(-n)
// Bai 3: Phep lat nguoc tin hieu
function [yn, yorigin] = fold(xn, xorigin)
    // Inputs:
    //   xn - input signal vector / tin hieu dau vao
    //   xorigin - position of origin in xn (1-based index) / vi tri goc
    // Outputs:
    //   yn - folded signal vector / tin hieu dau ra
    //   yorigin - position of origin in yn / vi tri goc moi
    
    // Lay do dai cua tin hieu dau vao
    N = length(xn);
    
    // Tach thanh phan duong va am
    x_pos = xn(N:-1:(xorigin+1));
    x_neg = xn((xorigin-1):-1:1);
    
    // Tao vector dau ra yn
    yn = [x_pos, xn(xorigin), x_neg];
    
    // Tinh vi tri goc moi cua y(n)
    yorigin = xorigin - length(x_neg) + length(x_pos);
    
    // Tao truc thoi gian cho x(n) va y(n)
    nx = -(xorigin-1):(N-xorigin);
    ny = -(yorigin-1):(N-yorigin);
    
    // Tim gia tri lon nhat va nho nhat de dieu chinh truc y
    max_val = max(max(xn), max(yn)) + 1;
    min_val = min(min(xn), min(yn)) - 1;
    
    // Ve do thi
    clf;
    
    // Ve tin hieu x(n)
    subplot(2,1,1);
    plot2d3(nx, xn, style=2);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(nx), min_val; max(nx), max_val];
    title("Tin hieu dau vao x(n)");
    xlabel("n");
    ylabel("x(n)");
    
    // Ve tin hieu y(n)
    subplot(2,1,2);
    plot2d3(ny, yn, style=5);
    e = gce();
    e.children.thickness = 3;
    xgrid();
    a = gca();
    a.data_bounds = [min(ny), min_val; max(ny), max_val];
    title("Tin hieu dau ra y(n) = x(-n)");
    xlabel("n");
    ylabel("y(n)");
    
endfunction

