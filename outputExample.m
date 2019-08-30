function [  ] = outputExample( ex,As,V,invV,D )

fprintf(['----------\nExample ' int2str(ex) '\n----------\n']);
fprintf('Number of matrices: %d\n',size(As,3));
fprintf('The matrices have dimension: %d x %d\n',size(As,1),size(As,2));
fprintf('The input matrices are:\n');

for j=1:size(As,3)
    fprintf([' A' int2str(j) ' = \n']);
    disp(As(:,:,j));
end

if isnan(V)
    fprintf('It was not possible to diagonalize the set of matrices\n');
    return;
end

fprintf('Common eigenbasis V = \n');
disp(V)
fprintf('with inverse V^-1 = \n');
disp(invV);

fprintf('The eigenvalue matrices are: \n');

for j=1:size(As,3)
    fprintf([' D' int2str(j) ' = \n']);
    disp(D(:,:,j));
end


end

