import coursework.segment_image.*;

% Define the directory where your images are located
imageDir = 'training_images';

% Get a list of all image files ending with ".jpg" in the directory
imageFiles = dir(fullfile(imageDir, '*.jpg'));

% Create a new figure for displaying the images
figure;

% Set the number of rows and columns for the subplot grid
numRows = 6; % You can adjust the number of rows and columns as needed
numCols = 6;

% Loop through the image files and display them in subplots
for i = 1:numel(imageFiles)
    % Read the image (e.g., im12.jpg)
    img = imread([imageDir, '/', imageFiles(i).name]);
    
    % Create a subplot for the current image
    subplot(numRows, numCols, i);
    
    % Display the image in the subplot
    imshow(img);
    
    % Add a title to the subplot (optional)
    title(imageFiles(i).name, 'Interpreter', 'none'); % 'Interpreter' is used to display file names with underscores
    
    % Load and display the corresponding segmented image (e.g., im12seg1.png)
    imageName = strtok(imageFiles(i).name, '.'); % Remove the file extension
    segImgName = [imageName, 'seg1.png'];
    
    % Read and display the segmented image in the next subplot
    subplot(numRows, numCols, i + numel(imageFiles));
    segImg = imread(fullfile(imageDir, segImgName));
    imshow(segImg);

    % Segmented image
    segmented_image = segment_image([imageDir, '/', imageFiles(i).name]);
    subplot(numRows, numCols, i + numel(imageFiles) + 12);
    imshow(segmented_image);
    
    % Add a title to the subplot (optional)
    title(segImgName, 'Interpreter', 'none');
end