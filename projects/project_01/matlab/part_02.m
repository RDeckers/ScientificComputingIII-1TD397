figure(1)
n= 16;
iteration = 1;
steps = [];
N = [];
while n<=512
    A = create_matrices(n);
    real_max_eigenvalue = max(eig(full(A)));
    real_min_eigenvalue = min(eig(full(A)));
    eigenvalues_max = eig_power(A);
    B = A-eigenvalues_max(end)*eye(n);
    eigenvalues_min = eig_power(B)+eigenvalues_max(end);
    steps(iteration) = size(eigenvalues_max,2)
    N(iteration) = n;
    iteration = iteration + 1;
    errors_max = abs(eigenvalues_max-real_max_eigenvalue);
    errors_min = abs(eigenvalues_min-real_min_eigenvalue);
    loglog(errors_max(1:end));
    hold on;
    loglog(errors_min(1:end));
    n = n*2;
end 
figure(2)
plot(N,steps)