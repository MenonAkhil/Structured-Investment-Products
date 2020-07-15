% Flat Market Scenario % 

n = 1000;
dt = 252;
e = randn(dt*5, n);
S0 = 1447.54; 
sigmabull = 0.0679; 
mubull = 0.1; 
sbull = zeros(dt*5+1,n);
sbull(1,:)=S0;
for i=2:dt*5+1;
    for j=1:n;
        sbull(i,j)=sbull(i-1,j)*exp((mubull-0.5*sigmabull^2)*(1/dt)+sigmabull*e(i-1,j)*sqrt(1/dt));
    end
end

BullFinal = sbull(1260,1:end);

% Plot the histogram.
edges = linspace(0,5500,61); % Create 20 bins.
histogram(BullFinal, 'BinEdges',edges);
% Fancy up the graph.
grid on;
xlim([0, 5500]);
xlabel('SPX Index Prices', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
title('Bull Market Price Simulation Histogram', 'FontSize', 14);