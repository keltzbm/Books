% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 2 - Solving Systems of Equations
% Problem 19
% August 11, 2022

%% Description:

% The file RandSspd.m, available at http://www.springer.com, runs as
% [sA, dA] = RandSspd(n). The returns are a sparse positive definite matrix
% sA and a dense perturbation of the same matrix dA. Use tic and toc to
% compare the time required to solve (sA)x = b with your own conjugate
% gradient code versus solving (dA)x = b with \. Use dimensions n = 2^k,
% with k = 5...10.

%% Code:

close all;
clear;
clc;

N = 100;
n = power(2, (5:10)');

times = zeros(length(n), 2);

figure("Visible", "off");

for p = 1:N
	for k = 1:length(n)

		[sA, dA] = RandSspd(n(k));
		b = rand(n(k), 1);

		tic;
		x = dA \ b;
		times(k, 1) = times(k, 1) + toc;

		epsilon = norm(dA * x - b);

		tic;
		x = ConjugateGradient(sA, b, zeros(n(k), 1), n(k)^2, epsilon);
		times(k, 2) = times(k, 2) + toc;

	end
	
	semilogy(log2(n), times(:, 1) / p, '-o', log2(n), times(:, 2) / p, '-*');
	xlabel('\it n', 'Interpreter', 'latex');
	ylabel('Average Run Time (s)', 'Interpreter', 'latex');
	xlim([log2(n(1)), log2(n(end))]);
	ylim([10^-5, 10^-2]);

	set(gca, 'xtick', log2(n), 'XTickLabel', strcat('$2^{', num2str(log2(n)), '}$'), "TickLabelInterpreter", "latex");

	titleString = ['Observations, $N = $ ', num2str(p), '.'];
	title(titleString, "Interpreter", "latex");

	leg = legend('Matlab', 'Conjugate Gradient', "Location", "NorthWest");
	set(leg, "Interpreter", "latex");

	exportgraphics(gcf, "Problem19.gif", "Resolution", 600, "Append", p ~= 1);

end

exportgraphics(gcf, "Problem19.pdf", "Resolution", 600, "ContentType", "vector");