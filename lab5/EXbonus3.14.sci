clc; clear; clf;

function ve_roc(r1, r2, zer, pol, lim, tieude)
    t = linspace(0, 2*%pi, 400);
    mauROC = color(158, 202, 225);

    a = gca();
    a.data_bounds = [-lim, -lim; lim, lim];
    a.isoview = "on";
    a.box = "on";

    if r2 == %inf then
        xfpoly([-lim lim lim -lim], [-lim -lim lim lim]);
    else
        xfpoly(r2*cos(t), r2*sin(t));
    end
    e = gce(); e.background = mauROC; e.line_mode = "off";

    if r1 > 0 then
        xfpoly(r1*cos(t), r1*sin(t));
        e = gce(); e.background = color("white"); e.line_mode = "off";
    end

    plot([-lim lim], [0 0], "k-");
    plot([0 0], [-lim lim], "k-");
    plot(cos(t), sin(t), "k--");

    if r1 > 0 then plot(r1*cos(t), r1*sin(t), "b-"); end
    if r2 <> %inf then plot(r2*cos(t), r2*sin(t), "b-"); end

    if zer <> [] then
        plot(real(zer), imag(zer), "ko");
        h = gce(); h.children.mark_size = 8; h.children.mark_background = color("white");
    end
    if pol <> [] then
        plot(real(pol), imag(pol), "rx");
        h = gce(); h.children.mark_size = 9; h.children.thickness = 2;
    end

    xlabel("Re(z)"); ylabel("Im(z)");
    title(tieude);
endfunction

scf(1); clf;
zer = [-1/2, -1/4];
pol = [1/2, (1/sqrt(2))*exp(%i*%pi/4), (1/sqrt(2))*exp(-%i*%pi/4)];
ve_roc(1/sqrt(2), %inf, zer, pol, 1.2, "Bai 3.14(h): ROC |z|>1/sqrt(2)");

z = poly(0, "z");
num = 0.25*(z+1/2)*(z+1/4);
den = (z-1/2)*(z^2-z+1/2);
H   = syslin("d", num, den);
n   = 0:20;
x   = flts([1, zeros(1,length(n)-1)], H);

scf(2); clf;
plot2d3(n, x, style=2); plot(n, x, "bo");
xlabel("n"); ylabel("x(n)"); title("Bai 3.14(h): x(n)"); xgrid();
