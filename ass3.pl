% Problem [1]

dot([],[],_X) :- false.

dot(L1,L2,X) :- 

		length(L1,Len1), 
		length(L2,Len2),
		Len1 =:= Len2,
		\+ (Len1 =:= 0),
		calcDot(L1,L2,0,X).

calcDot(L1,L2,TempX1,X) :-  
			[H1|T1] = L1,
			[H2|T2] = L2,
			TempX2 is TempX1 + (H1*H2),
			calcDot(T1,T2,TempX2,X).

calcDot([],[],TempX1,TempX1).

% Problem [2]

enum(OriginalList, SizeOfSmallerLists, ListOfSmallerLists) :-
		
		length(OriginalList, Listlen),
		SizeOfSmallerLists =< Listlen,
		findSmallerLists(OriginalList, SizeOfSmallerLists, [], ListOfSmallerLists, Listlen),
		!.

enum([],_,[]) :-
			!.

enum(_,0,[]) :-
			!.

enum(OriginalList, SizeOfSmallerLists, ListOfSmallerLists) :-

		length(OriginalList, Listlen),
		SizeOfSmallerLists > Listlen,
		ListOfSmallerLists = [].

% One Recursive Loop that shifts head of new smaller list by one


findSmallerLists(_OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail) :-

			LengthOfPrevTail =:= SizeOfSmallerLists-1,
			append([], TempList, ListOfSmallerLists).


findSmallerLists(OriginalList, SizeOfSmallerLists, TempList, ListOfSmallerLists, LengthOfPrevTail) :-
			
			LengthOfPrevTail>SizeOfSmallerLists-1,
			[_H1|T1] = OriginalList,
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

% For Problems [3] - [5]

/* The database of adj facts */ 
adj([a, [b,c,d]]).
adj([b, [d,e]]).
adj([c, []]).
adj([e, [a]]). 
adj([d, [b]]).

% Problem 3

vlist(List, NumOfV) :-

		calculateVertices(List, [], NumOfV, 0).

calculateVertices(List, TempList, NumOfV, Index) :-

		Index < NumOfV,
		adj([V1|_]),
		length(TempList, TempListlen),
		checkPresence(TempList, V1, TempListlen, Flag),
		Flag =:= 1,
		append(TempList, [V1], TempList2),
		!,
		Index2 is Index + 1,
		calculateVertices(List, TempList2, NumOfV, Index2).

calculateVertices(List, List, NumOfV, NumOfV).

checkPresence(TempList, VTest, TempListlen, Flag) :-

		TempListlen >= 1,
		[_H|T] = TempList,
		\+ member(VTest, TempList),
		length(T, TempListlen2),
		checkPresence(T, VTest, TempListlen2, Flag).

checkPresence([H|_T], H, _TempListlen, 0).

checkPresence(_TempList, _VTest, 0, Flag) :-

			Flag is 1.

% Problem 4

degree(V, D) :-
		
		var(V),
		var(D),
		adj([V, AdjListOfV]),
		length(AdjListOfV, D).

degree(V, D) :-
		
		adj([V, AdjListOfV]),
		length(AdjListOfV, D),
		!.

% Problem 5

edge(V1,V2) :-
		
		var(V1),
		var(V2),
		adj([V1, AdjListofV1]),
		member(V2, AdjListofV1).

edge(V1,V2) :-

		adj([V1, AdjListofV1]),
		member(V2, AdjListofV1),
		!.
