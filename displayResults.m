function displayResults(flowData, smoothedFlowData, troughs, cycle_times, cycle_flows, areas)
    time = flowData(:,1);
    flow = flowData(:,2);
    sflow = smoothedFlowData(:,2);
    tiledlayout(2,2) % Tiles a 2 x 2 Graphs
    nexttile
    % First graph with original flow
    plot(time,flow,"b"); ylim([-100,600]); xlim([0,12000]);
    xlabel("Time (ms)"); ylabel("Flow");
    title("Original Flow")
    nexttile
    % Second graph with smoothed Flow
    plot(time,sflow,"b",time(troughs),sflow(troughs),"rx")
    ylim([-100,600]); xlim([0,12000]);
    xlabel("Time (ms)"); ylabel("Flow");
    title("Smoothed Flow")
    nexttile
    % Third Graph loops through each cell to display the seperated curves
    hold on
    for i = 1:length(cycle_times)
        plot(cycle_times{i},cycle_flows{i})
    end
    title("Flow Cycles")
    ylim([-100,600]); xlim([0,600]);
    xlabel("Time (ms)"); ylabel("Flow");
    hold off
    nexttile
    histogram(areas/10^4,8);
    ylim([0,6]); xlim([8.5,11]);
    xlabel('Area under curves (x$10^4$)','Interpreter','Latex'); ylabel("Count");
    title("Histogram of Areas")
end