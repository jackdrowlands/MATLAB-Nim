function main()
	% To reset all windows, variables, and the command window.
	clc
	clearvars
	close all
	% Set the round to 1
	round=1;
	% Create the initial matches vector, with a varying amount of rows (between
	% 2 and 6).
	matches=randi(6,1,randi(4,1)+2);
	% Create a vector which is the length of the upper bound number of rounds
	% possible and fill with zeros
	roundRow = zeros(1,ceil(sum(matches)/2));
	% Create a boolean to tell if a valid move has been played
	globalBool = 1;
	% Create a text box with instructions on how to play
	instructions.Interpreter = 'tex';
	instructions.WindowStyle = 'modal';
	msgbox("\fontsize{20}The aim of this game is to take the last match. You" + ...
		" may take however many matches from a single row as you would like" + ...
		" however, you can only take matches from one row. You take matches by" + ...
		" clicking the row number of the desired row and inputting the desired" + ...
		" amount. At the end of your turn, click the next turn button. You may" + ...
		" let the computer go first by not taking any matches on the first turn." + ...
		" Good luck!","How to Play","help",instructions)
	% Create a while loop which checks the condition of the sum of matches not
	% equal to zero (End of game)
	while sum(matches)~=0
		% Displays the initial board, also passes through the variables to the
		% clickedOn function
		displayGame(matches,round,roundRow,globalBool);
		% Pauses until globalBool is equal to zero
		% globalBool = 0 when the next turn button is pressed
		while globalBool
			% pause allows for the clickedOn function to operate
			waitforbuttonpress
			% constantly update the userData to find when globalBool changes
			userData = get(findobj('tag','Game','type','image'), 'UserData');
			[~,matches,round,roundRow,globalBool] = userData{:};
		end

		% increment the round
		round = round + 1;
		% reset globalBool to 1
		globalBool = 1;

		% check if the game is over
		if sum(matches)==0
			% result if the player wins
			msgbox("Humans wins!")
			return
		end
		
		% Calculate the optimal move
		[compRow, compN] = computerMove(matches);
		% Perform optimal move on the matches
		matches(compRow) = matches(compRow) - compN;
	end

	% result if the computer wins
	msgbox("Computer wins!")
end
