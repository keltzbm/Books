% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 2 - Solving Systems of Equations
% Problem 18
% August 18, 2022

%% Description:

% Use the tic and toc commands to compare the run time of your LinearSolver
% routine from Exercise 6 versus the backslash command \ in MATLAB. Use
% random n x n matrices A and random n x 1 vectors b where n = 10^k, with
% k = 1, 2, 3, 4 as the basis of your comparison. You should find that \ is
% extremely efficient.

%% Code:

close all;
clear;
clc;

N = 100;
n = power(10, (1:4)');

times = zeros(length(n), 2);

figure("Visible", "off");

for p = 1:N
	for k = 1:length(n)

		A = rand(n(k));
		x = rand(n(k), 1);
		b = A * x;

		tic;
		A \ b;
		times(k, 1) = times(k, 1) + toc;

		tic;
		LinearSolver(A, b);
		times(k, 2) = times(k, 2) + toc;

	end

	loglog(n, times(:, 1) / p, '-o', n, times(:, 2) / p, '-*');
	xlabel('\it n', 'Interpreter', 'latex');
	ylabel('Run Time (s)', 'Interpreter', 'latex');
	xlim([n(1), n(end)]);
	ylim([10^-5, 10^4]);

	titleString = ['Observations, $N = $ ', num2str(p), '.'];
	title(titleString, "Interpreter", "latex");

	leg = legend('Matlab', 'Linear Solver', "Location", "NorthWest");
	set(leg, "Interpreter", "latex");

	exportgraphics(gcf, "Problem18.gif", "Resolution", 600, "Append", p ~= 1);

end

exportgraphics(gcf, "Problem18.pdf", "Resolution", 600, "ContentType", "vector");