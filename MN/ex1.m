choice = input('Generate matrix randomly (Y) or manually (N)? ', 's');

if upper(choice) == 'Y'
    n = input('Enter the size of matrix A: ');
    A = rand(n, n);
    B = rand(n, 1);
    disp('Matrix A:');
    disp(A);
    disp('Vector B:');
    disp(B);
else
    n = input('Enter the size of matrix A: ');
    A = input('Enter matrix A: ');
    B = input('Enter vector B: ');
end

Ab = [A , B];

for i = 1:n-1
    if Ab(i, i) == 0
        fprintf('vector null');
    end
    for j = i+1:n
        factor = Ab(j, i) / Ab(i, i);
        Ab(j, :) = Ab(j, :) - factor * Ab(i, :);
    end
end

disp('Upper triangular matrix [A|B]:');
disp(Ab);
