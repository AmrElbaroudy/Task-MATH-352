
% name:fady riad shokrallah riad        code:2027276


clc
clear all;
close all;
n = input('\n enter the size of square: ');
itr = input('\n enter no. of iterations : ');


for i = 1:n
    for j = 1:n
        u(i ,j) = 0;
    end
end

fprintf ('\n upper side values from left to right >>>');

for i = 1:n
    u(1 , i) = input ('\n enter u = ');
end

fprintf ('\n lower side values from left to right >>>');

for i = 1:n
    u(n , i) = input ('\n enter u = ');
end

fprintf ('\n left side values from top to bottom >>>');

for i = 2:n-1
    u(i , 1) = input ('\n enter u = ');
end


fprintf ('\n right side values from top to bottom >>>');

for i = 2:n-1
    u(i , n) = input ('\n enter u = ');
end


for k = 1:itr
    for i = 2:n-1
        for j = 2:n-1
            u(i , j) = (u(i-1 , j) + u(i+1 , j) + u(i , j+1) + u(i , j-1))/4;
        end
    end

    fprintf('\n iteration no. %d \n ' , k);
    
    for i = 1:n
        for j = 1:n
            fprintf('\t %0.2f' , u(i , j));
        end
        fprintf('\n');
    end
end





