dot([],[],X).

dot(L1,L2,X) :- length(L1,Len1), length(L2,Len2),
				Len1 =:= Len2,
				[H1|T1] = L1,
				[H2|T2] = L2,
				checkinit(X),
				X1 is X + (H1*H2),
				dot(T1,T2,X1).

checkinit(X) :- checknull(X) ; checknum(X).

checknull(X) :- var(X),
				X=0,
				checkinit(X).

checknum(X) :- number(X).
