% Bear Market Scenario % 

n = 1000;
dt = 252;
e = randn(dt*5, n);
S0 = 1447.54; 
sigmabear = 0.2221; 
mubear = -0.1; 
sbear = zeros(dt*5+1,n);
sbear(1,:)=S0;
for i=2:dt*5+1;
    for j=1:n;
        sbear(i,j)=sbear(i-1,j)*exp((mubear-0.5*sigmabear^2)*(1/dt)+sigmabear*e(i-1,j)*sqrt(1/dt));
    end
end

BearFinal = sbear(1260,1:end);

% Plot the histogram.
edges = linspace(0,5500,61); % Create 20 bins.
histogram(BearFinal, 'BinEdges',edges);
% Fancy up the graph.
grid on;
xlim([0, 5500]);
xlabel('SPX Index Prices', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
title('Bear Market Price Simulation Histogram', 'FontSize', 14);