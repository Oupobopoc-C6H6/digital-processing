function [cycle_times,cycle_flows,areas] = findCycles(flowData,troughs)
% Get cycles, times and areas for the smoothed flow data
% Input
% flowData : Array of flow and time data values.
% Output
% troughs : Array of indices troughs
% cycle_times : Cell array of measurement times per cycle
% cycle_flows : Cell array of flow measurements per cycle
% areas : Array of areas under flow curves 
    sflow = flowData(:,2);
    time = flowData(:,1);
    cycle_flows = {1:length(troughs)-1}; %1 less area if we ignore partials
    cycle_times = {1:length(troughs)-1};
    start_point = troughs(1);  % Starts at first trough to ignore partial
    for i = 2:length(troughs)  % Starts at 2 to ignore the first partial
        end_point = troughs(i);
        cycle_flows{i-1} = sflow(start_point:end_point);
        cycle_times{i-1} = time(start_point:end_point) - time(start_point);
        % Subtracts the initial time value to bring it back to 0
        start_point = end_point + 1;
    end
    
    areas = zeros(1,length(troughs)-1); % Pre allocating for efficiency
    for i = 1:length(cycle_times)
        areas(i) = trapz(cycle_times{i},cycle_flows{i});
    end
end