% Diana El Assal 27/10/2017
% Laurent Heirendt to debug FVA please, so that the coupling constraints
% (C*v>=d). Thank you! :)
%% *Setting the *optimization* solver*

changeCobraSolver('gurobi');
%%
% Unless the model is already loaded into the workspace, ReconX needs to
% be loaded. Here, we use Recon2.0 model for illustration, although any model
% can be used.

clear model
if ~exist('modelOrig','var')
    load('Recon2.0model.mat');
    model = Recon2model;
    model.csense(1:size(model.S,1),1)='E';
else
    model=modelOrig;
    model.csense(1:size(model.S,1),1)='E';
end

%% Testing FBA and coupling of reactions
% Without an objective function
modelConstrained = model;
multipleRxnList={'PCHOLP_hs', 'PLA2_2', 'SMS'};
modelConstrained.lb(findRxnIDs(modelConstrained, multipleRxnList));
modelConstrained.ub(findRxnIDs(modelConstrained, multipleRxnList));
c=[1,1,1];
d=2.674;
ineqSense='G';
modelConstrainedAb=constrainRxnListAboveBound(modelConstrained,multipleRxnList,c,d,ineqSense);
rxnInd = findRxnIDs(modelConstrainedAb, multipleRxnList);
[nMet,nRxn]=size(modelConstrainedAb.S);
modelConstrainedAb
FBAsolution = optimizeCbModel(modelConstrainedAb,'max',1e-6);
FBAsolution.x(rxnInd)
sum(c*FBAsolution.x(rxnInd))
%return;

% With an objective function
modelConstrainedAb = changeObjective(modelConstrainedAb, 'DM_atp_c_');
FBAsolution = optimizeCbModel(modelConstrainedAb,'max',1e-6);
FBAsolution.x(rxnInd)
sum(c*FBAsolution.x(rxnInd))
%return;

%% Testing FVA and coupling of reactions
% Without an objective function
modelConstrainedAb.c = zeros(size(modelConstrainedAb.rxns));
find(modelConstrainedAb.c)
% *************FVA fails **************
% Performs flux variablity analysis
[minFlux, maxFlux, Vmin, Vmax] = fluxVariability(modelConstrainedAb, [], [], model.rxns(rxnInd));
assert(sum(c*minFlux) == 0)
%return; % should be zero

changeCobraSolver('ibm_cplex');
% fastFVA
[minFlux, maxFlux, optsol, ret, fbasol, fvamin, fvamax, statussolmin, statussolmax] = fastFVA(modelConstrainedAb);
assert(sum(c*minFlux(rxnInd)) == zeros(3,1))
%return;
%NB: if all coupled reactions (multipleRxnList) have minFlux 0, then it is
%fine. The problem is when running FVA, normally, only one of the 3
%reactions takes all the d value as minFlux.

% With an objective function
modelConstrainedAb = changeObjective(modelConstrainedAb, 'DM_atp_c_');
[minFlux, maxFlux, optsol, ret, fbasol, fvamin, fvamax, statussolmin, statussolmax] = fastFVA(modelConstrainedAb);
sum(c*minFlux(rxnInd))
%return;
