function [bestchainindex, bestcost] = MyBestChain(numberofnodes,nodecosts)
% This function find the best chain to be used in the growth factor
% functionality

% Inputs:
% * numberofnodes : Vector with the amount of nodes for each solution so
%                   far
% * nodecosts     : Vector with the costs for each solution
%
% Outputs: 
% * bestchainindex  : The index of the best chain within the numberofnodes
%                      nodecosts vectors
% * bestcost        : The cost of the best solution
%
% Author: Aram Vroom - 2016
% Email:  aram.vroom@strath.ac.uk

%Find the index of the solution(s) with the most asteroids
maxasteroidnumindex = find(numberofnodes==max(numberofnodes));

%Find the corresponding cost(s)
maxasteroidcosts = nodecosts(maxasteroidnumindex);

%Obtain the index of the minimum cost
minimumcostindex = find(maxasteroidcosts==min(maxasteroidcosts));

%Find the index of the solution with the most asteroids and the minimum
%cost
bestchainindex = maxasteroidnumindex(minimumcostindex);

%Retreive the best cost
bestcost = maxasteroidcosts(minimumcostindex);

end

