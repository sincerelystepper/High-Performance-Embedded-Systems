
% Part 2.3 c)

x = randi([0 1], 100);
[rows, cols] = size(x);

tic
parfor c = 1:cols

% Work on a separate copy of the column to avoid conflicts

col = x(:, c);
for i=1: rows-1
    for j=1:rows-i
        if col(j)>col(j+1)
            temp = col(j)
            col(j) = col(j+1)
            col(j+1) = temp
        end
    end 
end
x(:,c) = col; % Assign sorted column back
end

%disp(x); 
toc

delete(gcp);