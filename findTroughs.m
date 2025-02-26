function [troughs] = findTroughs(flowData)
% Find troughs in the smoothed flow data
% Input
% flowData : Array of time and flow data values.
% Output
% troughs : Array of indices of troughs, each index 
% corresponds to a row in the flow data array

flow = flowData(:,2); %Seperates Flow Data
peaks = []; % Initilizes an empty peak array
% Finds peaks by searching for points greater than 300 and greater than the
% two surrounding points on both sides
for i = 3:length(flowData)-2  
    if flow(i) > 300 &&...
        flow(i-2) < flow(i-1) && flow(i-1) < flow(i) ...
        && flow(i) > flow(i+1) && flow(i+1) > flow(i+2)
        peaks = [peaks,i]; % adds index to end of peaks
    end
end

% Finds troughs by searching for the point before each peak where the value
% stops decreasing
troughs = zeros(1,length(peaks));
for i = 1:length(peaks)
    n = peaks(i);
    j = 1;
    while true
        if flow(n - j) > flow(n - j + 1)
            break %breaks when values start to increase at the trough
        end
        j = j + 1;
    end
    troughs(i) = n-j+1; % adds the value one before the break
end
end