# Problem [1]

dot([],[],X) :- false.

dot(L1,L2,X) :- length(L1,Len1), 
				length(L2,Len2),
				Len1 =:= Len2,
				\+ (Len1 =:= 0),
				calcDot(L1,L2,0,X).

calcDot(L1,L2,X1,X) :-  [H1|T1] = L1,
						[H2|T2] = L2,
						X2 is X1 + (H1*H2),
						calcDot(T1,T2,X2,X).

calcDot([],[],X1,X1).

#Problem[2]

