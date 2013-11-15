% run Merrimack PSO algorithm

function [pFit, chi2, resnorm, exitflag, output, lambda, jac] = ...
    arFitPSO(LB, UB, ar_opts)

PSOopts = mnb_PSOOptions();

% Objective function options
PSOopts.ObjFuncData = [];
PSOopts.ObjFuncDir  = '';

PSOopts.MaxIter = ar_opts.MaxIter;
PSOopts.Verbose = false; %~strcmp(ar_opts.Display, 'off');

[pFit, chi2, ExitReason] = mnb_PSOFit('arFitPSOFkt',LB,UB,PSOopts);

if(strcmp(ExitReason, 'MaxIter Reached'))
    exitflag = 50;
elseif(strcmp(ExitReason, 'FitCount Reache'))
    exitflag = 51;
else
    exitflag = 0;
end

resnorm = [];
output = struct([]);
output(1).iterations = nan;
lambda = [];
jac = [];