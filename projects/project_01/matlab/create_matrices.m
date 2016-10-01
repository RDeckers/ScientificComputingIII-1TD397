function [ A, K, M ] = create_matrices( N )
%CREATE_MATRICES Summary of this function goes here
%   Detailed explanation goes here
h = 1.0/N;

K = sparse(-diag(ones(N-1,1),-1)-diag(ones(N-1,1),+1)+diag(2*ones(N,1),0));
K(N,N) = 1;
K = K*N;

M = sparse(diag(ones(N-1,1),-1)+diag(ones(N-1,1),+1)+diag(4*ones(N,1),0));
M(N,N) = 2;
M = h/6*M;

A = M\K;

end

