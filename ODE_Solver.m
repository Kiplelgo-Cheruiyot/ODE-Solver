% Bernie Kiplelgo Cheruiyot
% ENM221-0054/2017
% BSc. Mechatronic Eng.
% EMT 2436
% Vibrations
% Lab 1
% Program to solve second order homogenous ODEs
% 7 June 2021
%%
% Input variables
a = input('Give the value of the coefficient of the y`` term: ');
b = input('Give the value of the coefficient of the y` term: ');
c = input('Give the value of the constant term: ');
% Matrix to store coefficients of the quadratic equation
coeffMatrix = [a b c];
%Input the initial Conditions
inCon1 = input('Give the value of y at x=0: ');
inCon2 = input('Give the value of y` at x=0: ');
%%
% The form of the Final Solution can be determined in the next step
% by checking the value of b^2-4ac 
% At the same time the final solution and coefficients can be determined
% taking into consideration the three cases
%%
% Case 1
if (b^2-4*a*c) > 0
    %Solution has real, distinct roots
    rootsCase1 = roots (coeffMatrix).';
    
    trivialSoln1 = ['Trivial Solution is: y = Ae^', num2str(rootsCase1(1,1)), 'x+Be^', num2str(rootsCase1(1, 2)),'x'];
    disp (trivialSoln1);
    
    % Constants to be determined from the Initial Conditions
    % At x=0 y = A + B and
    % and y` = r1A + r2B
    
    constMatrix1 = linsolve ([[1,1]; rootsCase1], [inCon1; inCon2]);
    
    finalSoln1 = ['Complete Solution is: y = ',num2str(constMatrix1(1,1)) ,'e^', num2str(rootsCase1(1,1)), 'x+',num2str(constMatrix1(2,1)) ,'e^', num2str(rootsCase1(1, 2)),'x'];
%%
% Case 2
elseif (b^2-4*a*c) == 0
    %Solution has real and repeated roots
    rootsCase2 = roots (coeffMatrix).';
    
    trivialSoln2 = ['Trivial Solution is: y = e^',num2str(rootsCase2(1,1)), 'x(A+Bx)'];
    disp (trivialSoln2)
    
    % Constants to be determined from the Initial Conditions
    % At x=0 y = A and
    % and y` = r1A + B
    
    constMatrix2 = linsolve ([[1, 0]; [rootsCase2(1,1), 1]], [inCon1;inCon2]);
    
    finalSoln2 = ['Complete Solution is: y = e^',num2str(rootsCase2(1,1)), 'x(',num2str(constMatrix2(1,1)) ,'+',num2str(constMatrix2(2,1)) ,'x)'];
    disp (finalSoln2)
%%
%Case 3
elseif (b^2-4*a*c) < 0
    %Solution has complex conjugate roots
    rootsCase3 = roots (coeffMatrix).';
    
    % Constants to be determined from the Initial Conditions
    % At x=0 y = A and
    % and y` = alphaA + betaB
    
    rootAlpha = real(rootsCase3(1,1));
    rootBeta = imag(rootsCase3(1,1));
    
    trivialSoln3 = ['Trivial Solution is: y = e^', num2str(rootAlpha) ,'x(Acos(', num2str(rootBeta) ,'x)+Bsin(',num2str(rootBeta),'x))'];
    disp (trivialSoln3)
    
    constMatrix3 = linsolve([[1, 0];rootAlpha, rootBeta], [inCon1;inCon2]);
    finalSoln3 = ['Complete Solution is: y = e^', num2str(rootAlpha) ,'x(', num2str(constMatrix3(1,1)),'cos(', num2str(rootBeta) ,'x)+', num2str(constMatrix3(2,1)) ,'sin(',num2str(rootBeta),'x))'];
    disp (finalSoln3);
    
end
