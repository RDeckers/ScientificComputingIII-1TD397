function [ A ] = create_test_matrix( N )
 lambda = rand(1,N);
 C = rand(N);
 A=C\diag(lambda)*C;
end

