function clickedOn(src, ~)
    % Get the UserData from the image and assign the variables
    userData = get(src,'UserData');
    [endOfMatchesSection,matches,round,roundRow,globalBool] = userData{:};

    % Get where the cursor clicked on the image
    point = get(gca, 'CurrentPoint');
    % Take out x and y value from point
    x = point(1, 1);
    y = point(1, 2);

    % check if x is out of the matches section and into the row numbers and
    % end round section
    if x > endOfMatchesSection
        % check if x is in the row numbers section
        if x < endOfMatchesSection + 23
            % Find which row was clicked on by dividing the sections into
            % 23 units each
            % make it to make it an integer and +1 to make it go from 1-6
            row = floor(y/23)+1;

            % check if the row selected is valid or has already been
            % selected in this round
            if 0 < matches(row) && (roundRow(round) == 0 || roundRow(round) == row)
                % Create dialoge to input amount removed and turn into double
                 amountRemoved = str2double(inputdlg("How many to be removed?"));
                 
                 % check if the amountRemoved is valid
                 if amountRemoved > matches(row) || amountRemoved<= 0 || isnan(amountRemoved)
                     % Error dialoge
                     errordlg("Incorrect number of matches selected!")
                 else
                    % If valid, remove from matches
                    matches(row) = matches(row) - amountRemoved;
                    % make this roundRow = the selected row
                    roundRow(round)=row;
                 end
            else
                % Error dialoge
                errordlg("Not valid row.")
            end
        else
            % check if an input has been selected or if the round is 1,
            % which allows for the comp to go first
            if roundRow(round)~=0||round == 1
                % Unpause the main function
                globalBool = 0;
            end
        end
    end
    % display the updated matches
    displayGame(matches,round,roundRow,globalBool);
end