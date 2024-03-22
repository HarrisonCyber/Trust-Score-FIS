warning('off','fuzzy:general:warnDeprecation_Newfis') 
warning('off','fuzzy:general:warnDeprecation_Addvar')
warning('off','fuzzy:general:warnDeprecation_Addmf')
warning('off','fuzzy:general:warnDeprecation_Evalfis')

% A declaration of new FIS
a = newfis('Trust Score', 'DefuzzificationMethod', 'som');

% Declaring new variables - these are INPUTS
a=addvar(a,'input','AuthenticationSuccessRatio',[0 100]);
a=addvar(a,'input','PolicyComplianceScore',[0 100]);
a=addvar(a,'input','RegularityofContributions',[0 30]);

% Intervals the Authentication Success variable with membership functions
a=addmf(a,'input',1,'Low','trapmf',[0 0 40 60]);
a=addmf(a,'input',1,'Medium','trapmf',[40 55 65 80]);
a=addmf(a,'input',1,'High','trapmf',[60 80 100 100]);

% Intervals for the Policy Compliance input variable with membership functions
a=addmf(a,'input',2,'Poor','trapmf',[0 0 40 60]);
a=addmf(a,'input',2,'Average','trapmf',[40 55 65 80]);
a=addmf(a,'input',2,'Excellent','trapmf',[60 80 100 100]);

% Intervals the Regualrity of Contributions input variable with membership functions
a=addmf(a,'input',3,'Infrequent','trapmf',[0 0 10 15]);
a=addmf(a,'input',3,'Occasional','trapmf',[10 15 20 25]);
a=addmf(a,'input',3,'Frequent','trapmf',[20 26 30 30]);

% Declaring a new variable - this is the OUTPUT
a=addvar(a,'output','Trust Score',[0 1]);

% Populating the output variable with membership functions
a=addmf(a,'output',1,'Untrustworthy','trapmf',[0 0 0.2 0.4]);
a=addmf(a,'output',1,'Somewhat Trustworthy','trapmf',[0.3 0.4 0.5 0.6]);
a=addmf(a,'output',1,'Average Trust','trapmf',[0.5 0.6 0.7 0.8]);
a=addmf(a,'output',1,'Highly Trustworthy','trapmf',[0.7 0.8 0.9 0.95]);
a=addmf(a,'output',1,'Very Trustworthy','trapmf',[0.9 0.95 1 1]);

% Rule Base
rule1 = [2 2 2 1 1 1];
rule2 = [2 2 3 2 1 1];
rule3 = [2 3 2 2 1 1];
rule4 = [3 2 2 3 1 1];
rule5 = [3 3 2 4 1 1];
rule6 = [3 2 3 4 1 1];
rule7 = [3 3 3 5 1 1];
rule8 = [1 1 1 1 1 1];
rule9 = [1 1 2 1 1 1];
rule10 = [1 1 3 2 1 1];
rule11 = [1 2 1 2 1 1];
rule12 = [1 2 2 2 1 1];
rule13 = [1 2 3 3 1 1];
rule14 = [1 3 1 2 1 1];
rule15 = [1 3 2 3 1 1];
rule16 = [1 3 3 4 1 1];
rule17 = [2 1 1 2 1 1];
rule18 = [2 1 2 2 1 1];
rule19 = [2 1 3 3 1 1];
rule20 = [2 2 1 3 1 1];
rule21 = [2 3 1 3 1 1];
rule22 = [2 3 2 4 1 1];
rule23 = [2 3 3 4 1 1];
rule24 = [3 1 1 3 1 1];
rule25 = [3 1 2 3 1 1];
rule26 = [3 1 3 4 1 1];
rule27 = [3 2 1 4 1 1];
rule28 = [3 3 2 5 1 1]; 
rule29 = [3 2 3 5 1 1]; 
rule30 = [3 3 1 4 1 1]; 
rule31 = [2 3 3 4 1 1]; 
rule32 = [3 3 3 5 1 1]; 
rule33 = [2 2 3 4 1 1]; 
rule34 = [3 2 2 4 1 1];
rule35 = [1 1 2 2 1 1]; 
rule36 = [1 2 2 1 1 1]; 
rule37 = [2 2 1 2 1 1]; 
rule38 = [2 3 2 3 1 1]; 
rule39 = [3 2 2 3 1 1];
rule40 = [3 3 1 4 1 1]; 
rule41 = [3 3 1 5 1 1]; 


% The ruleList of all defined rules.
ruleList = [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8;
    rule9; rule10; rule11; rule12; rule13; rule14; rule15; rule16;
    rule17; rule18; rule19; rule20; rule21; rule22; rule23; rule24;
    rule25; rule26; rule27; rule28; rule29; rule30; rule31; rule32;
    rule33; rule34; rule35; rule36; rule37; rule38; rule39; rule40; 
    rule41; 
];

a = addrule(a, ruleList);

AuthenticationSuccessRatioInput = 45;
PolicyComplianceScoreInput = 30;
RegularityofContributionsInput = 30;
format long;
evalA = evalfis([AuthenticationSuccessRatioInput, PolicyComplianceScoreInput, RegularityofContributionsInput], a);
disp(['Trust Score', num2str(evalA)]);

% Visualization (you would typically run this in MATLAB to see the plots)
subplot(4,1,1),plotmf(a, 'input', 1);
subplot(4,1,2),plotmf(a, 'input', 2);
subplot(4,1,3),plotmf(a, 'input', 3);
subplot(4,1,4),plotmf(a, 'output', 1);
