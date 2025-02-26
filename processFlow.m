function [troughs, cycle_times, cycle_flows, areas] = processFlow(flowData)
% Processes the smoothed flow data
% Usage: Finds the troughs, cycles, and areas of inputed flow data
% Input:
% flowData : Array of time and flow data values.
% Output:
% troughs : Array of indices and times of troughs
% cycle_times : Cell array of measurement times per cycle
% cycle_flows : Cell array of flow measurements per cycle
% areas : Array of areas under flow curves
% Search for troughs before high peaks
[troughs] = findTroughs(flowData);
% Split up into cycles based on trough positions & compute areas
[cycle_times, cycle_flows, areas] = findCycles(flowData, troughs);
end
