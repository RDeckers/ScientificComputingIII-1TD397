function [] = create_ev( N )
fileID = fopen('../data/eigenvector.dat','w');
A = create_matrices(N);
[eigenvalues, eigenvector] = eig_power(A);
fprintf(fileID, '#N= %u, lambda=%f\n', N, eigenvalues(end));
for x=eigenvector(:)
    fprintf(fileID, '%f\n', x);
end
end

