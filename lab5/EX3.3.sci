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
subplot(2,2,1);
ve_roc(1/3, 2, 0, [1/3, 2], 3, "(a) X1(z): 1/3<|z|<2");

subplot(2,2,2);
ve_roc(2, %inf, 0, [1/3, 2], 3, "(b) X2(z): |z|>2");

subplot(2,2,3);
ve_roc(1/3, 2, 0, [1/3, 2], 3, "(c) X3(z): 1/3<|z|<2");

subplot(2,2,4);
ve_roc(1/2, 3, 0, [1/2, 3], 4, "(d) X4(z): 1/2<|z|<3");
