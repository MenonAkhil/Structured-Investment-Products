% Flat Market Scenario % 

n = 1000;
dt = 252;
e = randn(dt*5, n);
S0 = 1447.54; 
sigmaflat = 0.1520; 
muflat = 0; 
sflat = zeros(dt*5+1,n);
sflat(1,:)=S0;
for i=2:dt*5+1;
    for j=1:n;
        sflat(i,j)=sflat(i-1,j)*exp((muflat-0.5*sigmaflat^2)*(1/dt)+sigmaflat*e(i-1,j)*sqrt(1/dt));
    end
end

FlatFinal = sflat(1260,1:end);

% Plot the histogram.
edges = linspace(0,5500,61); % Create 20 bins.
histogram(FlatFinal, 'BinEdges',edges);
% Fancy up the graph.
grid on;
xlim([0, 5500]);
xlabel('SPX Index Prices', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
title('Flat Market Price Simulation Histogram', 'FontSize', 14);