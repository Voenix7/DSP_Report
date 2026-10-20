// Exercise 1: Delay operation y(n) = x(n-k)
// Bai 1: Phep dich tre
function [yn, yorigin] = delay(xn, xorigin, k)
    // Inputs:
    //   xn - input signal vector / tin hieu dau vao
    //   xorigin - position of origin in xn (1-based index) / vi tri goc
    //   k - delay amount (k > 0) / do tre
    // Outputs:
    //   yn - delayed signal vector / tin hieu dau ra
    //   yorigin - position of origin in yn / vi tri goc moi
    
    // Kiem tra k > 0
    if k < 0 then
        error("Do tre k phai lon hon 0");
    end
    
    // Khoi tao vector dau ra yn voi gia tri ban dau
    yn = xn;
    yorigin = xorigin;
    
    // Thuc hien phep dich tre
    i = k;
    while i > 0
        if yorigin > 1
            yorigin = yorigin - 1;
        else
            yn = [0, yn];
        end
        i = i - 1;
    end
    
    // Tao truc thoi gian
    nx = -(xorigin-1):(length(xn)-xorigin);
    ny = -(yorigin-1):(length(yn)-yorigin);
    
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
    title("Tin hieu dau ra y(n) = x(n-" + string(k) + ")");
    xlabel("n");
    ylabel("y(n)");
    
endfunction

