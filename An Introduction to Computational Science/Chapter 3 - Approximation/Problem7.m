% Brandon M. Keltz
% An Introduction to Computational Science by Allen Holder and Joseph Eichholz
% Chapter 3 - Approximation
% Problem 7
% September 13, 2022

%% Description:

% Get the daily average temperatures from the National Oceanic and
% Atmospheric Administration (NOAA) for a location near yourself for the
% last 30 years. Use the method of least squares to find a best
% approximation of the form 
% f(d) = alpha0 + alpha1 * d + alpha2 * cos(2 * Pi * d / 365.25 - phi),
% where the days are indexed by d. Be sure to use a linear model based on
% (3.6). Does the alpha1 coefficient of the best approximation indicate
% that temperatures are increasing or decreasing? Plot the data from NOAA
% with your least squares approximation.

%% Code: