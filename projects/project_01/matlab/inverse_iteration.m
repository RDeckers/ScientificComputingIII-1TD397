function [ eigenvalue ] = inverse_iteration( A, mu )
%INVERSE_ITERATION Summary of this function goes here
%   Detailed explanation goes here
    B = A-sparse(mu*diag(ones(size(A,1),1),0));
    eigenvalue = power_iteration(B)+mu;
end

