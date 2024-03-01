% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 2 - Solving Systems of Equations
% Problem 6
% February 4, 2021

classdef LinearSolverTest < matlab.unittest.TestCase
	properties
		epsilon = 1e-5;
	end
	methods(Test)
		function HolderExample1(testCase)
			L = [1, 0, 0;
				1, 1, 0;
				2, 2, 1];
			b = [-2; 2; 3];
			x = [-2; 4; -1];
			[xstar, status] = LinearSolver(L, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x);
		end
		function HolderExample2(testCase)
			U = [1, -2, 1;
				0, 3, -1;
				0, 0, 1];
			b = [-2; 4; -1];
			x = [1; 1; -1];
			[xstar, status] = LinearSolver(U, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x);
		end
		function HolderExample3(testCase)
			A = [1, -2, 1;
				1, 1, 0;
				2, 2, 1];
			b = [-2; 2; 3];
			x = [1; 1; -1];
			[xstar, status] = LinearSolver(A, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x);
		end
		function HolderExample4(testCase)
			A = [60, 40, -85, 13;
				20, 15, 55, -4;
				80, 40, 20, 4];
			b = [-72; 51; 24];
			x = [0.075; 0; 0.9; 0];
			[xstar, status] = LinearSolver(A, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x, "AbsTol", testCase.epsilon);
		end
		function HolderExample5(testCase)
			A = [1, 2;
				3, 4];
			b = [5; 4];
			x = [-6; 5.5];
			[xstar, status] = LinearSolver(A, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x);
		end
		function HolderExample6(testCase)
			A = [84, 76, 116;
				76, 109, 113;
				116, 113, 165];
			b = [1; 2; 3];
			x = A \ b;
			[xstar, status] = LinearSolver(A, b);
			testCase.verifyEqual(status, 0);
			testCase.verifyEqual(xstar, x, "AbsTol", testCase.epsilon);
		end
	end
end