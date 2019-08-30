%%% SIMULATNEOUS DIAGONALIZATION OF A SET OF N MATRICES
% Author: Fabian Schrodi
% License: MIT
%
% for information about the mathematical background, see the pdf-notes
%%%%%%%
% Input:  - As: must have dimension MxMxN, contains N matrices, which
%           are to be simultaneously diagonalized
%         - prec (optional): precision with which the eigenvalues are
%           stored in the return variable
%
% Output: - V: MxM matrix that represents the common eigenbasis
%         - invV: matrix inverse of V
%         - D: MxMxN tensor that holds N diagonal matrices, which contain
%           eigenvalues associated to each of the N input matrices
%%%
function [ V,invV,D ] = simDiag( As,prec )

%%%In case of errors there is currently no associated message indicating
%%%the cause(s). For receiving an error message set the flag below to 1;
errmsg = 0;

% return values in case of wrong input
V = NaN;
invV = NaN;
D = NaN;

% if no precision is specified, choose a default value
if nargin == 1
    prec = 1e-8;
end

% input must have three dimensions
if ndims(As) ~= 3
    if errmsg
        fprintf('Input error, variable must have 3 dimensions\n');
    end
    return;
end

% input must be of the form (MxMxN)
if size(As,1) ~= size(As,2)
    if errmsg
        fprintf('Input error, only quadratic matrices allowed\n');
    end
    return;
end

% get dimensions
[M,~,N] = size(As);

% numerical zero
numzero = 1e-14;

% matrices must pairwise commute
for j = 1:N-1
    Aj = squeeze(As(:,:,j));
    
    for k = j+1:N
        Ak = squeeze(As(:,:,k));
        commutator = Aj * Ak - Ak * Aj;
        
        if max(abs(commutator(:))) > numzero
            if errmsg
                fprintf('The input is not a set of pairwise commuting matrices\n');
                fprintf('Example of non-commuting indices: %d and %d\n',j,k);
            end
            return;
        end
    end
end

% store input for later reference
Astore = As;

V = eye(M);
invV = eye(M);

for j = 1:N
    Aj = squeeze(As(:,:,j));
         
    % check if current Aj is already diagonal
    if max(max(abs(Aj - diag(diag(Aj))))) < numzero
        continue;
    end
    
    % diagonalize current matrix
    [uj,~] = eig(Aj);
    invuj = inv(uj);
    
    V = V * uj;
    invV = invuj * invV;
        
    % use current eigenvectors to renormalize the remaining A's
    for k = j+1:N
        As(:,:,k) = invuj * squeeze(As(:,:,k)) * uj;
    end
end

% get the eigenvalues up to the precision specified
D = zeros(M,M,N);
for j=1:N
    Dj = invV * squeeze(Astore(:,:,j)) * V;
    D(:,:,j) = round(Dj / prec) * prec;
end

end

