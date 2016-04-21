function [ListNodes] = GrowthFactor(Inputs, ListNodes, Agents)% This function finds the best chain of veins used by the agents and% increases the radius of these vains by a pre-specified factor%% Inputs:% * Inputs      : Structure containing the PhysarumSolver inputs% * ListNodes       : Structure containing the graph% * Agents      : Structure containing the Agents & their characteristics%% Outputs: % * ListNodes       : Structure containing the updated graph%% Author: Aram Vroom - 2016% Email:  aram.vroom@strath.ac.ukagentnames = fieldnames(Agents);for i = 1:length(agentnames)%Convert the agent input into a character arrayagent = char(agentnames(i));%Calculate the total cost of the path taken by the agenttotalcost(i) = sum(Agents.(agent).previouscosts);end%Find the minimum cost[~, mincostindex] = min(totalcost);%Determine which agent has the best chainbestagent = char(agentnames(mincostindex(1)));%Find this agent's chainvisistednodes = [Agents.(bestagent).previousListNodes {Agents.(bestagent).currentNode}];%Loop over the nodes in this chainfor i = 1:length(visistednodes)        %For ease of reading, define the node currently being evaluated & its parent    %as a separate variable    evaluatednode = char(visistednodes(i));    parent = ListNodes.(evaluatednode).parent;        %Check if the node has a parent - Ignores root    if ~isempty(parent)                %Dilate the respective link in the parent's node structure        ListNodes.(evaluatednode).radius = ListNodes.(evaluatednode).radius + Inputs.GrowthFactor*ListNodes.(evaluatednode).radius;               %Check if the link's radius is not too large or small. Correct if        %so, set to min/max radius        ListNodes.(evaluatednode).radius(ListNodes.(evaluatednode).radius./Inputs.StartingRadius > Inputs.MaximumRadiusRatio) = Inputs.MaximumRadiusRatio*Inputs.StartingRadius;        ListNodes.(evaluatednode).radius(ListNodes.(evaluatednode).radius./Inputs.StartingRadius < Inputs.MinimumRadiusRatio) = Inputs.MinimumRadiusRatio*Inputs.StartingRadius;    endend