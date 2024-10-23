[x,w,A,B] = FiniteDifferenceGrid(10000);

f_i = normaliser(x);

integral = integrator(w.*f_i);

integral_i = w.*f_i;
derivative_i = A*transpose(f_i);
second_derivative_i = B*transpose(f_i);

disp(integral)

%Plotting
figure;
plot(x,integral_i)
hold on
plot(x,f_i)
hold on
plot(x,derivative_i)
hold on
plot(x,second_derivative_i)
hold off
legend('Integral','Function','Derivative', 'Second derivative')
title('Normal distribution')
xlabel('x')
ylabel('f(x)')






%Functions
function [x,w,A,B] = FiniteDifferenceGrid(N)
    x = zeros(1,N);
    for i = 1:N-1
        x(i+1)=i*(1/(N-1));
    end
    w = ones(1,N)/N;
    A = zeros(N,N);
    for i = 1:N-1
        for j = 1:N
            if i == j
                A(i,j) = -1/(w(i));
            elseif i == j-1
                A(i,j) = 1/w(i);
            end
        end
    end
    for j = 1:N
        if j == N-1
            A(N,j)= -1/w(j);
        elseif j == N
            A(N,j)= 1/(w(j));
        end
    end
    B = zeros(N,N);
    for j = 1:N
        if j == 1
            B(1,j)=1/(w(j)^2);
        elseif j == 2
            B(1,j)=-2/(w(j)^2);
        elseif j == 3
            B(1,j)=1/(w(j)^2);
        end
    end
    for i = 2:N-1
        for j = 1:N
            if i == j-1
                B(i,j)=1/(w(j)^2);
            elseif i == j
                B(i,j)=-2/(w(j)^2);
            elseif i == j+1
                B(i,j)=1/(w(j)^2);
            end
        end
    end
    for j = 1:N
        if j == N-2
            B(N,j)=1/(w(j)^2);
        elseif j == N-1
            B(N,j)=-2/(w(j)^2);
        elseif j == N
            B(N,j)=1/(w(j)^2);
        end
    end  
end
function output_normal_dist = normaliser(x_axis)
    sigma = 0.136;
    mu = -0.530;
    output_normal_dist = zeros(1,length(x_axis));
    for i = 2:length(x_axis)
    output_normal_dist(i) = (1/(x_axis(i)*sigma*sqrt(2*pi)))*(exp(-0.5*((log(x_axis(i))-mu)^2/(sigma)^2)));
    end
end

function integral = integrator(integral_i)
    integral = 0;
    for i = 1:length(integral_i)
        integral = integral + integral_i(i);
    end
end



