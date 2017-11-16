%Definitions for isElementInList(El, List)
% we can actually call our base case the same as the function name.
isElementInList(X, [X|_]).
isElementInList(El, List) :-
	[_|T] = List,
	isElementInList(El, T).
% base case: empty list combined with another list = merged list
mergeLists([], X, X).	
% get tails of both lists, and merge them together
mergeLists(List1, List2, Merged) :-
	[H|T1] = List1, 
	[H|T2] = Merged,
	mergeLists(T1, List2, T2).
% base case: both empty lists
% essentially: keep reversing the list until we have empty lists
% then append the head of the last list to the reversed list, and
% go back up the chain, until we return the reversed list
reverseList([], []).
reverseList(List, ReversedList):-
	[H|T] = List,
	reverseList(T, RevT), 
	mergeLists(RevT, [H], ReversedList).	
% Very simple - just merge the element onto the end of the second list
insertElementIntoListEnd(El, List, NewList) :-
	mergeLists(List, [El], NewList).
	
