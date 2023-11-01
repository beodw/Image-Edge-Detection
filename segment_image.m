function seg = segment_image(I) 


input_image = imread(I); % Replace with the path to your image

% Convert the image to grayscale
gray_image = rgb2gray(input_image);

% Apply Gaussian smoothing to reduce noise
smoothed_image = imgaussfilt(gray_image, 8); % Adjust the standard deviation as needed

% Use the Canny edge detector
seg = edge(smoothed_image, 'canny_old');
end