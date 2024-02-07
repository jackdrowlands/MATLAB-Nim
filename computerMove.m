function [row, numTaken] = computerMove(matches)
	% takes the array of matches and returns the row and number of matches
	% which is the best move
	% it finds the best move by finding which move will make the nim sum zero
	% This strategy was found on the wikipedia page for Nim, and was converted
	% from mathmatical terminology to MATLAB

	% calculate the nim sum of the initial matches
	x = nimSum(matches);

	% A for loop which iterates through each row of matches and returns when it
	% finds the optimal move
	for i =1:length(matches)
		% check if taking some matches from the current row makes the nim sum 
		% zero
		if nimSum([x, matches(i)])<matches(i)
			% calculate how many matches to take from the current row to make
			% the nim sum zero
			numTaken = matches(i) - nimSum([x, matches(i)]);
			% set the row to the current row
			row = i;
			return
		end
	end
	% if there is no move which will make the nim sum = 0, then take a match 
	% from the biggest heap
	[~, row] = max(matches);
	numTaken =  1;
end