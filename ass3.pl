# Problem [1]

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

#Problem[2]

enum (OriginalList, SizeOfSmallerLists, ListOfSmallerLists) :-
		
		length(OriginalList, listlen),
		SizeOfSmallerLists =< listlen,
		findSmallerLists(OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail).

findSmallerLists(OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail) :-
			
			[H|T] = OriginalList,
			



addNumToSmallList(IncompleteList, OriginalList, TempNewList, NewList) :-



