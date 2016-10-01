function [ ] = matrix_study()
%MATRIX_STUDY Summary of this function goes here
%   Detailed explanation goes here
    max_n = 9;
    min_n = 2;
    num_n = max_n - min_n;
    x = zeros(1, num_n);
    t = zeros(1, num_n);
    l = zeros(1, num_n);
    u = zeros(1, num_n);
    for n = 1:num_n
        tic;
        [Am,bv,xv,yv,uv] = soapfilm(3^(min_n+n),2^(min_n+n));
        t_e = toc
        [l_e,u_e] = bandwidth(Am)
        t(n) =  t_e;
        l(n) = l_e;
        u(n) = u_e;
        x(n) = 2^n;
    end
    close all;
    hold on;
    figure(1)
    loglog(x,t);
    
    figure(2)
    loglog(u,t);
    loglog(l,t);
    
    figure(3);
    plot(u, t);
    plot(l, t);
   
    figure(4);
    plot(x, u);
    plot(x, l);
end
