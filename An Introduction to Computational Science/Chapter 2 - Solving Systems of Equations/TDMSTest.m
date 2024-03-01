% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 2 - Solving Systems of Equations
% Problem 17
% August 11, 2022

%% Description:

% Solves the system of equations Ax = b if A is tridiagonal. Extend the
% idea of fast forward substitution to implement a fast backward
% substitution, and combine these substitution routines with the
% tridiagonal LU factorization to complete the task of solving Ax = b in
% about 5n calculations. Note that this algorithm may not always complete
% successfully even if A is invertible, as it does not implement any
% pivoting.

%% Input arguments:

% A - The coefficient matrix A of the linear system.

%% Output arguments:

% x - A solution to Ax = b if one exits.
% status - A status variable encoded as follows:
%	status 0: Ax = b is consistent with a unique solution.
% 	status 1: Ax = b is consistent with an infinite number of solutions. In
% 	this case a solution to the linear system should be returned in x.
%	status 2: Ax = b is inconsistent.

%% Code

function status = TDMSTest()

status = NaN;



end