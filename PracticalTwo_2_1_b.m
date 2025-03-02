

x = randi([1 10], 100); % generates a 100 x 100 matrix, with values between 1 and 10

count_per_worker = zeros(1, numel(x)); % preallocates memory of 100x100 zero elements to prevent preallocation in the loop, which is memory costly 

% Now loop through all elements in a matrix
tic
parfor i=1: numel(x);
    if x(i) == 1;
        count_per_worker(i) = 1; % puts existing 1s in their respective indices
    end 
end 

total_1s  = sum(count_per_worker);
 
disp(['Number of 1s: ', num2str(total_1s)]);
toc

% Serial Execution
tic
serial_count = sum(x(:) == 1);
disp(['Number of 1s (serial): ', num2str(serial_count)]);
toc