%Task 1

%N = input('Enter an integer value: ');
def output = x_axis_generator(N)
    output = zeros(1,N);

    for i = [0:N-1]
        output(i+1) = i/(N-1);
    end

print(x_axis_generator(150))

output_normal_dist = zeros(1,N);

output2 = linspace(0,1,N);

disp(output)
disp(output2)


%Task 2
sigma = 0.136;
mu = -0.530;

for i = [2:N]
    output_normal_dist(i) = (1/(output(i)*sigma*sqrt(2*pi)))*(exp(-0.5*((log(output(i))-mu)^2/(sigma)^2)));
end 
disp(output_normal_dist)


%Task 3
figure(1)
plot(output, output_normal_dist)
title("Plot of Normal Distribution")
xlabel("x")
ylabel("y")

%Task 3a
figure(2)
Minghao.name = 1;
Minghao.color = [0.7213    0.8732    0.6298];
Minghao.outerPosition = [170, 170, 1280, 960];
title("Plot of Normal Distribution")
xlabel("x")
ylabel("y")
set(gcf, 'Color', 'w', 'OuterPosition', Minghao.outerPosition);
plot(output, output_normal_dist,'Color',Minghao.color)

%Task 3b

figure(3)

Shilan.fontname = "Calibri";
Shilan.fontsize = 18;
Shilan.fontweight = "bold";
plot(output, output_normal_dist)
title("Plot of Normal Distribution")
title("Plot of Normal Distribution", 'FontName', Shilan.fontname,'FontSize', Shilan.fontsize, 'FontWeight', Shilan.fontweight);
xlabel("x", 'FontName', Shilan.fontname, 'FontSize', Shilan.fontsize,'FontWeight', Shilan.fontweight);
ylabel("y", 'FontName', Shilan.fontname, 'FontSize', Shilan.fontsize,'FontWeight', Shilan.fontweight);

%Task 3c
function plot_lognormal(ax, lognorm_array, fig_props, font_props)
    % Function to plot the log-normal distribution with specified properties
    
    % 1. Set properties of the figure using the set function
    set(gcf, 'Color', fig_props.color, 'OuterPosition', fig_props.outerPosition);

    % 2. Plot the log-normal distribution with custom properties
    plot(ax, linspace(0, 1, length(lognorm_array)), lognorm_array, ...
        'Color', 'r', 'LineWidth', 2, 'Marker', 'o', ...
        'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'none', ...
        'DisplayName', 'f(x)');

    % 3. Set x-axis limits, add a border (box), and enable gridlines
    xlim([0 1]);
    box on;
    grid on;

    % 4. Set font sizes for axes labels and title using the set function
    title('Log-Normal Distribution', 'FontName', font_props.fontname, ...
        'FontSize', font_props.fontsize, 'FontWeight', font_props.fontweight);
    xlabel('x', 'FontName', font_props.fontname, ...
        'FontSize', font_props.fontsize, 'FontWeight', font_props.fontweight);
    ylabel('y', 'FontName', font_props.fontname, ...
        'FontSize', font_props.fontsize, 'FontWeight', font_props.fontweight);

    % 5. Add a legend and set the font of the legend using the set function
    legend('show');  % Display legend for the plot
    set(legend, 'FontName', font_props.fontname, 'FontSize', font_props.fontsize);

    % 6. Save the plot as an image file
    saveas(gcf, 'lognormal_distribution.png');
end

%In order to obtain a smooth plot, one must have a value of N > ~ 50.

%Task 4
%a)

[value, position] = (max_finder(output_normal_dist))
disp(value, position)

function [position, max_value] = max_finder(y_data)
    % Initialize max_value to negative infinity
    max_value = -Inf;
    position = 0;
    
    % Iterate over the length of y_data
    for i = 1:length(y_data)
        if y_data(i) > max_value
            max_value = y_data(i);  % Update max value
            position = i;            % Update position
        end
    end
end

%Function 4a
function index, x_value,y_value = max_finder(x_axis, y_axis)







   








