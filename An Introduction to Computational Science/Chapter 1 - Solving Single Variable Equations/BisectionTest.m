classdef BisectionTest < matlab.unittest.TestCase

	properties(TestParameter)
		q1 = {0, 1, 5, 10, 50};
		q2 = {2, 3};

		xbest1 = {-0.000012}
	end
	
	methods(TestClassSetup)
		% Shared setup for the entire test class
	end
	
	methods(TestMethodSetup)
		% Setup for each test
	end
	
	methods(Test)
		% Test methods
		function HolderExample1(testCase)
			[xbest, fxbest, nitr, status] = Bisection(@(x) x^3 - x, -2, 1.5, 1e-4, 1e-4, 5, false);
			testCase.verifyEqual(xbest, -1.0156, "AbsTol", 1e-4);
			testCase.verifyEqual(fxbest, 0.032, "AbsTol", 1e-4);
			testCase.verifyEqual(nitr, 5);
			testCase.verifyEqual(status, 1);
		end
		function HolderExample2(testCase, q1)
			% q = [0; 1; 5; 10; 50];
			% print(q)
			fq = @(x) x ^ (1 / (2 * q + 1));
			[xbest, fxbest, nitr, status] = Bisection(fq, -0.5, 1.3, 1e-4, 1e-4, 15, false);

			% testCase.verifyEqual(xbest, -1.0156, "AbsTol", 1e-4);
			% testCase.verifyEqual(fxbest, 0.032, "AbsTol", 1e-4);
			% testCase.verifyEqual(nitr, 15);
			% testCase.verifyEqual(status, 1);
		end
		function HolderExample3(testCase, q2)
			% q = [2; 3];
			gq = @(x) x / (1 + (10^q2 * x)^2);
			[xbest, fxbest, nitr, status] = Bisection(fq, -0.9, 0.8, 1e-4, 1e-4, 1000, false);
			% testCase.verifyEqual(xbest, -1.0156, "AbsTol", 1e-4);
			% testCase.verifyEqual(fxbest, 0.032, "AbsTol", 1e-4);
			% testCase.verifyEqual(nitr, 15);
			% testCase.verifyEqual(status, 1);
		end
	end
	
end