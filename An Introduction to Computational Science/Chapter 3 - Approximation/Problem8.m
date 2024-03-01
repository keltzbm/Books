% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 3 - Approximation
% Problem 8
% September 13, 2022

%% Description:

% The graph on the left of Fig. 3.16 depicts data from a simulated tornado.
% The horizontal axis is the radial distance from the center of the
% tornado's rotation. The vertical axis is the tangential velocity v of the
% rotation in meters per second. The data is in the text file Tornado.txt
% available at http://www.springer.com. The i-th velocity entry in
% Tornado.txt gives a velocity measurement at position r(i) = 2i / 2500m
% from the center of the tornado. Velocity measurements of 0 m/s should be
% ignored. The graph on the right depicts a least squares approximation of
% the data. The functional form of the approximation is 
% f(r) = alpha2 / (a - r + 1), b <= r < a,
% f(r) = alpha1 * (r - a) + alpha2, a <= r <= d.

% The value of a is unknown and is to be searched for over the interval
% satisfying rmax - 0.75 <= a <= rmax + 0.75, where v(rmax) is the largest
% velocity in the data. For each value of a, the parameter d is to be
% searched for over the interval satisfying 2/3 <= d - a <= 5/4 and the
% parameter b is to be search for over the interval satisfying 
% 3/2 <= a - b <= 3.

% Use the method of least squares for each parameter triple (a, b, d) to
% calculate f as follows:
% Step 1: Find a best fit approximation to f over a <= r <= d,
% Step 2: Use the value of alpha2 from Step 1 to define f over b <= r < a.
% Find the parameter triple (a, b, d) that (approximately) minimizes the
% average squared error over your search. That is, if there are k(a, d)
% data points between a and d, then the error is 
% e = sum((f(r(i)) - v(i))^2 / k(a, d)) for a <= r(i) <= d. Y
% Your code should create a plot like that on the right showing how your
% best approximation fits the data. The values of a, b, d should all be
% searched for with a step size of 0.05 units. The value 1.1455 f^2(a), for
% the best a, estimates the drop in pressure at the center of the vortex,
% and this value should be reported.

%% Code: