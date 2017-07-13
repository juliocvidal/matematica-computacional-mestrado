function [y] = fcn_rk4(f,x0,y0,h,n)
    if(n==0)
       disp('Divisгo por zero')
    else
        if(n<0)
            disp('Intervalo invбlido')
        else
            x=x0;
            y=y0;
            for i=1:n
            k1=f(x,y);
            k2=f(x+(1/2)*h,y+(1/2)*h*k1);
            k3=f(x+(1/2)*h,y+(1/2)*h*k2);
            k4=f(x+h,y+h*k3);
            y=y+(h/6)*(k1+2*k2+2*k3+k4);
            x=x+h;
            end
            disp('Valor da funзгo f no ponto k й:')
        end
    end
end