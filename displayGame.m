function[] = displayGame(matches,round,roundRow,globalBool)
    % Take in the matches vector and shows an
    % image of the matches in rows with row number next to it
    % Additionally takes in round, roundRow, globalBool and passes them
    % through to the UserData property of the image in order for it to get
    % to the clickedOn function.

    % read the image of a matchstick
    matchImg = imread("MatchStick.png");
    % Get the dimensions of the match image
    [rows, cols, ~] = size(matchImg);
    % read the image of the row numbers
    num = imread("num.png");

    % Calculate the total number of rows needed in finalDisp based on the 
    % number of rows of matches
    totalRowsNeeded = length(matches) * rows;
    % Calculate the total number of cols needed in finalDisp based on the
    % maximum value of the matches
    totalColsNeeded = max(matches) * cols + 2;
    % Crop the row number image to fit the height of finalDisp to not show
    % the unused rows
    num = num(1:totalRowsNeeded,:,:);
    % find the dimensions of the cropped num image
    [numRows,numCols,~]=size(num);
    % Generate the finalDisp blank
    finalDisp = ones(totalRowsNeeded, totalColsNeeded, 3, 'uint8');
    % Make a background colour for the finalDisp
    finalDisp(:,:,1) = finalDisp(:,:,1)*0;
    finalDisp(:,:,2) = finalDisp(:,:,2)*153;
    finalDisp(:,:,3) = finalDisp(:,:,3)*51;
    % Initialise a variable to keep track of the starting row for each heap
    startRows = 1;
    % Initialise a variable to keep track of the ending row for each heap
    endRows = rows;

    % Loop through each row
    for i = 1:length(matches)
        % find the centre of the image and find where to start the matches
        % based on how many matches there are in this row
        % (Center the matches)
        colIndex = (totalColsNeeded - matches(i)*cols) / 2;
        % Loop through each match in the row
        for j = 1:matches(i)
            % Copy the match image to the correct position in finalDisp
            finalDisp(startRows:endRows, colIndex:colIndex+cols-1, :) = matchImg;
            % Update the colIndex for the next match
            colIndex = colIndex + cols;
        end
        % Update the starting row for the next row of matches
        startRows = endRows + 1;
        % Update the end row for the next row of matches
        endRows = startRows + rows - 1;
    end
    % Resize finalDisp to accommodate the num image on the side of the
    % Final Disp
    finalDisp = cat(2, finalDisp, uint8(zeros(totalRowsNeeded, numCols, 3)));

    % Copy the num image to the rightmost part of finalDisp
    finalDisp(1:numRows, end-numCols+1:end, :) = num;
    % Display Image
    h = imshow(finalDisp, 'InitialMagnification', 800);
    
    % make a cell array which contains the variables for userData
    userData = {totalColsNeeded,matches,round,roundRow,globalBool};
    % Set the UserData property as the cell array and also set so when the 
    % image is clicked on, the clickedOn function will be called.
    set(h, 'ButtonDownFcn', @clickedOn,'UserData',userData,'tag','Game');
end