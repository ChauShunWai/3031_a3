% Problem [1]

dot([],[],X) :- false.

dot(L1,L2,X) :- length(L1,Len1), 
				length(L2,Len2),
				Len1 =:= Len2,
				\+ (Len1 =:= 0),
				calcDot(L1,L2,0,X).

calcDot(L1,L2,TempX1,X) :-  [H1|T1] = L1,
						[H2|T2] = L2,
						TempX2 is TempX1 + (H1*H2),
						calcDot(T1,T2,TempX2,X).

calcDot([],[],TempX1,TempX1).

% Problem [2]

enum(OriginalList, SizeOfSmallerLists, ListOfSmallerLists) :-
		
		length(OriginalList, Listlen),
		SizeOfSmallerLists =< Listlen,
		findSmallerLists(OriginalList, SizeOfSmallerLists, [], ListOfSmallerLists, Listlen).

enum([],_,[]).

enum(_,0,[]).

enum(OriginalList, SizeOfSmallerLists, ListOfSmallerLists) :-

		length(OriginalList, Listlen),
		SizeOfSmallerLists > Listlen,
		ListOfSmallerLists = [].

% One Recursive Loop that shifts head of new smaller list by one


findSmallerLists(OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail) :-

			LengthOfPrevTail =:= SizeOfSmallerLists-1,
			append([], TempList, ListOfSmallerLists).


findSmallerLists(OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail) :-
			
			LengthOfPrevTail>SizeOfSmallerLists-1,
			[H1|T1] = OriginalList,
			addNumToSmallList([], OriginalList, NewList, SizeOfSmallerLists, 0),
			append(TempList, [NewList], TempList2),
			length(T1,LengthOfTail),
			findSmallerLists(T1, SizeOfSmallerLists, TempList2, ListOfSmallerLists, LengthOfTail).

% Second Recursive Loop that adds {size} elements to the new smaller list

addNumToSmallList(IncompleteList, _ , IncompleteList, SizeOfSmallerLists, SizeOfSmallerLists).


addNumToSmallList(IncompleteList, [H3|T3], NewList, SizeOfSmallerLists, IterationNum) :-

			IterationNum < SizeOfSmallerLists,
			append(IncompleteList, [H3], TempNewList),
			NewIterationNum is IterationNum + 1,
			addNumToSmallList(TempNewList, T3, NewList, SizeOfSmallerLists, NewIterationNum).
