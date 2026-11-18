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

r  = 0.8;
w0 = %pi/3;

scf(1); clf;
ve_roc(r, %inf, 0, [r*exp(%i*w0), r*exp(-%i*w0)], 1.3, "Bai 3.20(a): r=0.8, w0=pi/3");
plot([0, r*cos(w0)], [0, r*sin(w0)], "k:");
xstring(0.15, 0.55, "r");
xstring(0.55, 0.08, "w0");

n  = 0:40;
b  = [0, r*sin(w0)];
a  = [1, -2*r*cos(w0), r^2];
x1 = filter(b, a, [1, zeros(1, length(n)-1)]);

scf(2); clf;
plot(n, x1, "bo");
plot(n, r.^n .* sin(w0*n), "r-");
xlabel("n"); ylabel("x1(n)"); title("Bai 3.20: x1(n) = r^n sin(w0 n)u(n)"); xgrid();
