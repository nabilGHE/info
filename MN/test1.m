A = input('Veuillez entrer la matrice A : ' ) ;
b = input('Veuillez entrer le vecteur b : ' ) ;
[m, n] = size(A);
if m ~= n
    error('La matrice A doit être carrée.' ) ;
end
Aug = [A b];
Aug_triangular = gauss_pivot(Aug);
x = resolution_systeme_triangular(Aug_triangular);
disp('La solution du système est : ');
disp(x);

function Aug_triangular = gauss_pivot(Aug)
    [n, m] = size(Aug);
    for k = 1:n-1
        [~, max_index] = max(abs(Aug(k:n, k))) ;
        max_index = max_index + k - 1;
        if max_index ~= k
            Aug([k, max_index], : ) = Aug([max_index, k], : );
        end
        for i = k+1:n
            if Aug(k,k) == 0
                error('Division par zéro détectée. Considérez de permuter les lignes.');
            end
            facteur = Aug(i,k) / Aug(k,k);
            Aug(i, : ) = Aug(i, : ) - facteur * Aug(k, : ) ;
        end
    end
    Aug_triangular = Aug;
end

function x = resolution_systeme_triangular(Aug_triangular)
    [n, m] = size(Aug_triangular) ;
    x = zeros(n, 1) ;
    U = Aug_triangular( :, 1 : n ) ;
    b = Aug_triangular( :, end);
    for i = n:-1:1
        x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i,i) ;
    end
end
