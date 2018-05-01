if 0
    rxnForms = {' -> A','A -> B','B -> C', 'B -> D','D -> C','C ->'};
    rxnNames = {'Ain','AB','BC','BD','DC', 'Cout'};
    model = createModel(rxnNames, rxnNames,rxnForms);
    model.lb(3) = 2; %BD
    model.lb(4) = 2; 
    model.ub(6) = 2;
else
    rxnForms = {' -> A','A -> B','A -> D','B -> C', 'B -> D','D -> C','C ->'};
    rxnNames = {'Ain','AB','AD','BC','BD','DC', 'Cout'};
    model = createModel(rxnNames, rxnNames,rxnForms);
    model.lb(1) = 5;
    %model.ub(6) = 2;
    model.ub(6) = 2.1;
    model.ub(4) = 1;
end


solverPkgs = prepareTest('needsLP',true);

%Define Test Model 1
rxnForms = {' -> A[c]','A[c] -> B[c]','B[c] -> C[c]', 'B[c] -> D[c]','D[c] -> C[c]','C[c] ->'};
rxnNames = {'Ain','AB','BC','BD','DC', 'Cout'};
model = createModel(rxnNames, rxnNames,rxnForms);
model.lb(3) = 1;
model.lb(4) = 2; %BD
model.ub(6) = 2;
modelWorking = changeRxnBounds(model,'Cout',1000,'u');
modelWithBlockedExport = changeRxnBounds(model,'Cout',0,'b');
modelWithPartiallyClosedExchangers = addReaction(modelWithBlockedExport,'Dout','reactionFormula','D[c] ->','lowerBound',0,'upperBound',2);
modelWithPartiallyClosedExchangers = changeRxnBounds(modelWithPartiallyClosedExchangers,'DC',-1000,'l');
modelWithOneFiniteBound = changeRxnBounds(model,model.rxns{3},30,'u');
modelWithFiniteBounds = changeRxnBounds(modelWithOneFiniteBound,model.rxns{4},30,'u');

%Save warnings settings.
warn = warning();
%Turn off warnings for the test.
warning('off')

for k = 1:numel(solverPkgs.LP)
    changeCobraSolver(solverPkgs.LP(k),'all');
    [relaxation,relaxmodel] = relaxedFBA(model);
    %only one modification is necessary.
    assert(nnz(relaxation.r)+nnz(relaxation.p)+nnz(relaxation.q)==1);
    sol = optimizeCbModel(relaxmodel);
    % This model is now feasible.
    assert(sol.stat == 1);
    [relaxation,relaxmodel] = relaxedFBA(modelWorking);
    sol = optimizeCbModel(modelWorking);
    assert(sol.stat == 1);
    %No relaxation necessary!
    assert(nnz(relaxation.r) == 0 && nnz(relaxation.p) == 0 && nnz(relaxation.q) == 0);

    %Use some parameters.

	%weighting on relaxation of steady state constraints S*v = b
    %Allow free relaxation on steady state constraints.
    param = struct();
    param.lambda0   = 0;
    param.lambda1   = 0;
    [relaxation,relaxmodel] = relaxedFBA(model,param);
    sol = optimizeCbModel(relaxmodel);
    assert(sol.stat == 1);
    %Nothing, but the steady state constraints should change...
    assert(nnz(relaxation.p) == 0 && nnz(relaxation.q) ==0);

    %Test, what happens, if we do not allow any relaxation
    param = struct();
    param.internalRelax = 0;
    param.exchangeRelax = 0;
    param.steadyStateRelax = 0;
    %This will indicate, that the problem is still infeasible.
    assert(verifyCobraFunctionError('relaxedFBA', 'inputs', {model, param}, 'testMessage', 'Problem infeasible !'));

%stopping criterion
param.epsilon = 1e-6;
%capped l0 parameter
param.theta0   = 0.5;

    %Test that the model with blocked exchangers cannot be relaxed.
    param.exchangeRelax = 1;
    assert(verifyCobraFunctionError('relaxedFBA', 'inputs', {modelWithBlockedExport, param}, 'testMessage', 'Problem infeasible !'));

plotRelaxedFBA(sol, model)
