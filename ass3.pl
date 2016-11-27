dot([],[],X) = false.

dot(L1,L2,X) :- length(L1) =:= length(L2),
				[H1|T1] = L1,
				[H2|T2] = L2,
				X is X + (L1*L2),
				dot(T1,T2,X).

