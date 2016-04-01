function [Cost] = CostFunction(fromNode,toNode)
% This function calculates the cost of a certain connection.
% It can be altered such that it is applicable to the problem at hand.
%
% Inputs:
% * Nodes  : Structure containing the graph
% * Inputs : Structure containing the PhysarumSolver inputs
%
% Outputs: 
% * 
%
% Author: Aram Vroom - 2016
% Email:  aram.vroom@strath.ac.uk

% if ~strcmp(fromNode,'Root') && ~strcmp(toNode,'Root')
%     toNodeAttr= Nodes.ListNodes.(toNode);
%     fromNodeAttr = Nodes.ListNodes.(fromNode);
% elseif strcmp(fromNode,'Root') && ~strcmp(toNode,'Root');
%     toNodeAttr = Nodes.ListNodes.(toNode);
%     fromNodeAttr = Nodes.Root;
% elseif ~strcmp(fromNode,'Root') && strcmp(toNode,'Root');
%     toNodeAttr = Nodes.Root;
%     fromNodeAttr = Nodes.ListNodes.(toNode);
% end

    
%Calculate cost to change orbital elements with orbit characterstics such
%as ToF set. Currently simple formula to test functionality.
Cost = (toNode.characteristics(1)-fromNode.characteristics(1))^2;

%Add cost to respective structure in the Nodes.ListNodes structure if link
%was already made

% %Check if link exists
% if ~isempty(strcmp(NodesList.(toNode).node_ID,NodesList.(fromNode).children))
%     
%     %Find the index of the node to be connected to in the children list of
%     %the node from which the connection originates
%     i = strmatch(NodesList.(toNode).node_ID,NodesList.(fromNode).children);
%     
%     %Set the cost of that link
%     NodesList.(fromNode).lengths{i} = Cost;
% 
% end

