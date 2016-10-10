function [ eigenvalues, eigenvector ] = eig_power( matrix, tolerance  )
%POWER_ITERATION Computed the largest eigenvalue by power iteration
%returns an array of the computed eigenvalues

%first some basic checks on the input
assert(ismatrix(matrix));
assert(size(matrix,1) == size(matrix,2));

%if the tolerance isn't specified, set it to 1e-4
 if ~exist('tolerance','var')
      tolerance = 1e-4;
 end

 %preset the delta to always get 1 loop.
 eigen_delta = 2*tolerance;

 %first guess
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
