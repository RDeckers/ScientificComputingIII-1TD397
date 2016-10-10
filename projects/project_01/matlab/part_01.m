fileID = fopen('../data/eigenvector.dat','w');
n=100
A = create_matrices(n);
[eigenvalues, eigenvector] = eig_power(A);
%shift so that the power method find sthe smallest
B = A-eigenvalues(end)*speye(n);
eigenvalues_min = eig_power(B, 1e-8)+eigenvalues(end);
%use inverse iteration to find the corresponding eigenvector.
[value_min, vector_min] = eig_power(inv(B), 1e-8);
fprintf(fileID, '#N= %u, lambda=%f\n', n, eigenvalues(end));
for i=1:n
    fprintf(fileID, '%f %f\n', eigenvector(i),vector_min(i));
end

fileID = fopen('../data/power_iterations.dat','w');
fprintf(fileID, '#N iterations error\n');
n= 20;
iteration = 1;
steps = [];
N = [];
while n <= 100
    A = create_matrices(n);
    cond_A = cond(A);
    real_ev = max(eig(full(A)));
    real_ev_min = min(eig(full(A)));
    eigenvalues = eig_power(A);
    B = A-eigenvalues(end)*speye(n);
    cond_B = cond(B);
    %be more accurate here
    eigenvalues_min = eig_power(B, 1e-8)+eigenvalues(end);
    %use inverse iteration to find the corresponding eigenvector.
    [iters, vector_min] = inverse_iteration(B, 1e-4);
    fprintf(fileID, '%u ', n);
    fprintf(fileID, '%u %f %f %f ', [size(eigenvalues,2) eigenvalues(end) real_ev cond_A]);
    fprintf(fileID, '%u %f %f %f\n', [size(iters,2) eigenvalues_min(end) real_ev_min cond_B]);
    iteration = iteration + 1;
    n = n + 20;
end
fileID = fopen('../data/convergence.dat','w');
errors = (eigenvalues-real_ev)/real_ev;
errors_min = (eigenvalues_min-real_ev_min)/real_ev_min;
for x=1:100
    fprintf(fileID, '%f %f\n', [errors(x) errors_min(x)]);
end
