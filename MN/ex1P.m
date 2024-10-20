close all
clear
clc

n =input('Enter the size of matrix A: ');

choice = input('Generate matrix randomly (Y) or manually (N)? ', 's');

if upper(choice) == 'Y'
     A = rand(n, n);
    b = rand(n, 1);
else
    A = zeros(n,n);
    b = zeros(n,1);

    fprintf('Matrix A :\n');

for i =1:n
    for j=1:n
        A(i,j)= input(sprintf('A(%d, %d):',i,j));
    end
end

 fprintf('Vector b :\n');
 for i = 1:n
        b(i) = input(sprintf(' b(%d): ', i));
 end

end

disp('Matrix A:');
disp(A);
disp('vector b:');
disp(b);


if det(A)== 0
    disp('Not sol');
    return
end


Ab =[A,b];

for k = 1:n-1
    for i = k+1:n
        if Ab(k, k) == 0
           error('Élément nul .');
        end
        f = Ab(i, k) / Ab(k, k);
        Ab(i, :) = Ab(i, :) - f * Ab(k, :)
    end
end

disp('Upper triangular matrix [A | b]:');
disp(Ab);


x = zeros(n, 1);
x(n) = Ab(n, end) / Ab(n, n);
for i = n-1:-1:1
    x(i) = (Ab(i, end) - sum(Ab(i, i+1:n) .* x(i+1:n)')) / Ab(i, i)
end

disp('Solution vector x:');
disp(x);



