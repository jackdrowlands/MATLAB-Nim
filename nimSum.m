function [out] = nimSum(array)
	% takes an array of integers and returns the nim sum of them
	% Uses Wikipedia's definition to discover what this entails

	% make the output the result of the bitwise exclusive OR of the first two values
	out = bitxor(array(1),array(2));
	% loop through the rest of the values, performing a bitwise exclusive or
	% with each element and the previous result
	for i=3:length(array)
		out = bitxor(out,array(i));
	end
end
