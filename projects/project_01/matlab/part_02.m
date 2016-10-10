figure(1)
n= 16;
iteration = 1;
steps = [];
N = [];

fileID = fopen('../data/inverse_iterations.dat','w');
fprintf(fileID, '#N iterations error\n');
n= 16;
iteration = 1;
steps = [];
N = [];
while n<=512
    A = create_matrices(n);
    real_ev = max(eig(full(A)));
    eigenvalues = eig_power(A);
    fprintf(fileID, '%u %u %f %f\n', [n size(eigenvalues,2) abs(real_ev-eigenvalues(end)) real_ev]);
    iteration = iteration + 1;
    n = n*2;
end