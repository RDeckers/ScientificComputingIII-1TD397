function [ eigenvalues, eigenvector ] = eig_power( matrix, tolerance  )
%POWER_ITERATION Computed the largest eigenvalue by power iteration

assert(ismatrix(matrix));
assert(size(matrix,1) == size(matrix,2));

 if ~exist('tolerance','var')
      tolerance = 1e-8;
 end
 eigen_delta = 2*tolerance;
 z = ones(size(matrix,1),1);
 y = z/norm(z);
 z = matrix*y; 
 eigenvalues(1) = dot(y, z);
 i = 2;
 while eigen_delta > tolerance   
    y = z/norm(z);
    z = matrix*y; 
    eigenvalues(i) = dot(y, z);
    eigen_delta = abs(eigenvalues(i-1)-eigenvalues(i));
    i = i +1;
 end
 eigenvector = z/norm(z);

end

