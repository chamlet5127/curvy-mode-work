function [L,U,LU] = lu_fact_nopivot(A)

[n, m] = size(A);

% Check if the matrix is square
if n ~= m
    error('Matrix A must be square.');
end

% Initialize U and L
U = A;            % Copy A in to U, then perform elimination to get upper triangle
L = eye(n);       % Initialize L as the identity matrix, add multipliers

% Begin Factorization
for k = 1:n-1

    % Perform elimination keeping track of multipliers in L and
    % elimination in U
    for i = k+1:n
        % Store the multiplier
        L(i, k) = U(i, k) / U(k, k);

        % Elimination step
        for j = k:n
            U(i, j) = U(i, j) - L(i, k) * U(k, j);
        end
    end
end

% Return the information on a single matrix
% Copy U over to LU, then populate the lower triangle with L
LU = U;
for i = 2:n
    for j = 1:i-1
        LU(i, j) = L(i, j);  % Insert entries of L
    end
end
end