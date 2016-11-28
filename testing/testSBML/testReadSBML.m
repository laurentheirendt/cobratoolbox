% COBRA Toolbox: testReadSBML.m
%
% Note:
% the solver libraries must be included separately
% the solver must be changed using `changeCobraSolver`

% set the tolerance
tol = 1e-9;

% load the models
modelArr = {'Abiotrophia_defectiva_ATCC_49176.xml', 'STM_v1.0.xml', 'iIT341.xml', 'Ec_iAF1260_flux1.xml'};

% define the maximum objective values
modelFBAf_max = [0.149475406282249; 0.477833660760744; 0.692812693473487; 0.736700938865275];

% define the minimum objective values
modelFBAf_min = [0.0; 0.0; 0.0; 0.0];

% loop through the models
for i = 1:length(modelArr)
    % load the model
    model = readCbModel(modelArr{i});

    % solve the maximisation problem 
    FBA = optimizeCbModel(model,'max');

    % test the maximisation solution
    assert(FBA.stat == 1);
    assert(abs(FBA.f - modelFBAf_max(i)) < tol);
    assert(norm(model.S*FBA.x) < tol);

    % solve the minimisation problem
    FBA = optimizeCbModel(model,'min');

    % test the minimisation solution
    assert(FBA.stat == 1);
    assert(abs(FBA.f - modelFBAf_min(i)) < tol);
    assert(norm(model.S*FBA.x) < tol);
end
