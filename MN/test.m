close all
clear
clc


A = input('Entrez la matrice A : ');
b = input('Entrez le vecteur b : ');

n = size(A, 1);
Aug = [A b];

for i = 1:n-1
    for j = i+1:n
        facteur = Aug(j, i) / Aug(i, i);
        Aug(j, :) = Aug(j, :) - facteur * Aug(i, :)
    end
end

x = zeros(n, 1);
for j = n:-1:1
    x(j) = (Aug(j, end) - Aug(j, j+1:n) * x(j+1:n)) / Aug(j, j)
end

disp('Solution : ')
disp(x)
