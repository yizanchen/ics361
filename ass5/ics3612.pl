selectE(Element, [Element|Tail], Tail). 
selectE(Element, [Head|Tail1], [Head|Tail2]) :-
        selectE(Element, Tail1, Tail2).
permutationQ([],[]).
permutationQ(List, [Head|Tail]) :- 
	selectE(Head, List, Rest),
        permutationQ(Rest, Tail).

sit1 :-
	bagof(t,permutationQ([black,black,red,red,blue,blue],[A,B,C,D,E,F]),_),
    	not(A==B), not(B==C), not(C==D), not(D==E),not(E==F),    
    	printout([A,B,C,D,E,F]).

printout([A,B,C,D,E,F]) :-
    nl,
    write('The order of colors: '), nl,
    format('~w,~w,~w,~w,~w,~w',[A,B,C,D,E,F]).



sit2 :-
	bagof(t,permutationQ([red,red,red,red,black,blue],[A,B,C,D,E,F]),_),  
    ((A==black -> D==blue);
	(B==black -> E==blue);
	(B==blue -> E==black);
	(C==black -> F==blue);
	(C==blue -> F==black);
	(D==blue -> C==black);
	(D==black -> C==blue)),
    printout2([A,B,C,D,E,F]).

printout2([A,B,C,D,E,F]) :-
    nl,
    write('The order of colors: '), nl,
    format('~w,~w,~w,~w,~w,~w',[A,B,C,D,E,F]).

sit3 :- 
	bagof(t,permutationQ([yellow,black,black,blue,blue,purple,purple,purple],[A,B,C,D,E,F,G,H]),_),
	not(B==purple), not(C==purple),
	(D==H),
	not(A==G),
	not(A==blue),not(B==blue),not(C==blue),
	not(A==black),not(H==black),
	not(F==blue),not(G==blue),
	printout3([A,B,C,D,E,F,G,H]).


printout3([A,B,C,D,E,F,G,H]) :-
	nl,
	write('The order of colors: '), nl,
    	format('~w,~w,~w,~w,~w,~w,~w,~w',[A,B,C,D,E,F,G,H]).