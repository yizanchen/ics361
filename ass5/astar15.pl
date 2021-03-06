%This is for BFS and A*, 15 tiles puzzle is represented in a state(1, 2, 3, 4,  
%								   5, 6, 7, 8,
%								   9, 10,11,12,
%								   13,14,15,0).
%arc( input state, output state), from the what will happen if you move the block to left,right,down or up with on the location of 0.

%the first argurment is the input state and the second agrugment is the result state of moving the block(0) left
arc( state(A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P) , state( 0,A,C,D,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P) , state( A,0,B,D,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,0,E,F,G,H,I,J,K,L,M,N,O,P) , state( A,B,0,C,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P) , state( A,B,C,D,0,E,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P) , state( A,B,C,D,E,0,F,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P) , state( A,B,C,D,E,F,0,G,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P) , state( A,B,C,D,E,F,G,H,0,I,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P) , state( A,B,C,D,E,F,G,H,I,0,J,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P) , state( A,B,C,D,E,F,G,H,I,J,0,K,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P) , state( A,B,C,D,E,F,G,H,I,J,K,L,0,M,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P) , state( A,B,C,D,E,F,G,H,I,J,K,L,M,0,N,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,0) , state( A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,O)).

%the first argument is the input state and the second agugment is the result state of moving the block(0) up
arc( state(A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P), state( 0,B,C,D,A,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P), state( A,0,C,D,E,B,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P), state( A,B,0,D,E,F,C,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P), state( A,B,C,0,E,F,G,D,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P), state( A,B,C,D,0,F,G,H,E,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P), state( A,B,C,D,E,0,G,H,I,F,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P), state( A,B,C,D,E,F,0,H,I,J,G,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P), state( A,B,C,D,E,F,G,0,I,J,K,L,H,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,0,N,O,P), state( A,B,C,D,E,F,G,H,0,J,K,L,I,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P), state( A,B,C,D,E,F,G,H,I,0,K,L,M,J,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P), state( A,B,C,D,E,F,G,H,I,J,0,L,M,N,K,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,0), state( A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,L)).

%the first argument is the input state and the second agugment is the result state of moving the block(0) right
arc( state(0,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P), state( B,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P), state( A,C,0,D,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P), state( A,B,D,0,E,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P), state( A,B,C,D,F,0,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P), state( A,B,C,D,E,G,0,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P), state( A,B,C,D,E,F,H,0,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P), state( A,B,C,D,E,F,G,H,J,0,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P), state( A,B,C,D,E,F,G,H,I,K,0,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P), state( A,B,C,D,E,F,G,H,I,J,L,0,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,0,N,O,P), state( A,B,C,D,E,F,G,H,I,J,K,L,N,0,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P), state( A,B,C,D,E,F,G,H,I,J,K,L,M,O,0,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P), state( A,B,C,D,E,F,G,H,I,J,K,L,M,N,P,0)).

%the first argument is the input state and the second argugment is the result state of moving the block(0) down
arc( state(0,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P), state( E,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P), state( A,F,C,D,E,0,G,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P), state( A,B,G,D,E,F,0,H,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,0,E,F,G,H,I,J,K,L,M,N,O,P), state( A,B,C,H,E,F,G,0,I,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P), state( A,B,C,D,I,F,G,H,0,J,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P), state( A,B,C,D,E,J,G,H,I,0,K,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P), state( A,B,C,D,E,F,K,H,I,J,0,L,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P), state( A,B,C,D,E,F,G,L,I,J,K,0,M,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P), state( A,B,C,D,E,F,G,H,M,J,K,L,0,N,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P), state( A,B,C,D,E,F,G,H,I,N,K,L,M,0,O,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P), state( A,B,C,D,E,F,G,H,I,J,O,L,M,N,0,P)).
arc( state(A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P), state( A,B,C,D,E,F,G,H,I,J,K,P,M,N,O,0)).

%this is the start function, take start state as first argument and second argument is the result.
astar(Start,Solution) :-
	run_astar([[Start]], state(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0) , Solution).
%this run_astar will start the A* search, check if the goal is in the queue.
run_astar([[Goal|Path]|_],Goal,[Goal|Path]).
%if goal is not the first in the queue, add result state of current state, and also call sort queue.
run_astar([Path|Queue],Goal,FinalPath) :-
	extend(Path,NewPaths),
	myappend(Queue,NewPaths,Queue1),
	sort_queue1(Queue1,NewQueue), 
	run_astar(NewQueue,Goal,FinalPath).

%This will add the result state to the list, if it is not already in the list.
extend([Node|Path],NewPaths) :-
	findall([NewNode,Node|Path],
	(arc(Node,NewNode),
	\+ member(NewNode,Path)), 
	NewPaths).

%This will sort the list and check the result of the list.
sort_queue1(L,L2) :-
	swap1(L,L1), !,
	sort_queue1(L1,L2).
	sort_queue1(L,L).
%compare the two state and swap them if one Manhattan Distance is higher
swap1([[A1|B1],[A2|B2]|T],[[A2|B2],[A1|B1]|T]) :-
	heur(A1,W1),
	heur(A2,W2),
	W1>W2.
%do nothing if not bigger    
swap1([X|T],[X|V]) :-
	swap1(T,V). 
%function call to calculate the Manhattan Distance 
heur(Puzz,H) :- 
   man(Puzz,P),
       H is P.

%calculate Manhattan Distance heuristic by comparing each number to their goal state location.                     
man(state(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P), Path) :-
     a(A,DA), b(B,DB), c(C,DC), d(D, DD),
     e(E,DE), f(F,DF), g(G,DG), h(H,DH),
     i(I,DI), j(J,DJ), k(K,DK), l(L,DL),
     m(M,DM), n(N,DN), o(O,DO), p(P,DP),
     Path is DA + DB + DC + DD + DE + DF + DG + DH + DI + DJ + DK + DL + DM + DN + DO + DP.

%this is the Manhattan Distance for each state, first element is the number, and second element is their Manhattan Distance.
a(0,6). a(1,0). a(2,1). a(3,2). a(4,3). a(5,1). a(6,2). a(7,3). a(8,4). a(9,2). a(10,3). a(11,4). a(12,5). a(13,3). a(14,4). a(15,5).
b(0,5). b(1,1). b(2,0). b(3,1). b(4,2). b(5,2). b(6,1). b(7,2). b(8,3). b(9,3). b(10,2). b(11,3). b(12,4). b(13,4). b(14,3). b(15,4).
c(0,4). c(1,2). c(2,1). c(3,0). c(4,1). c(5,3). c(6,2). c(7,1). c(8,2). c(9,4). c(10,3). c(11,2). c(12,3). c(13,5). c(14,4). c(15,3).
d(0,3). d(1,3). d(2,2). d(3,1). d(4,0). d(5,4). d(6,3). d(7,2). d(8,1). d(9,5). d(10,4). d(11,3). d(12,2). d(13,6). d(14,5). d(15,4).
e(0,5). e(1,1). e(2,2). e(3,3). e(4,4). e(5,0). e(6,1). e(7,2). e(8,3). e(9,1). e(10,2). e(11,3). e(12,4). e(13,2). e(14,3). e(15,4).
f(0,4). f(1,2). f(2,1). f(3,2). f(4,3). f(5,1). f(6,0). f(7,1). f(8,2). f(9,2). f(10,1). f(11,2). f(12,3). f(13,3). f(14,2). f(15,3).
g(0,3). g(1,3). g(2,2). g(3,1). g(4,2). g(5,2). g(6,1). g(7,0). g(8,1). g(9,3). g(10,2). g(11,1). g(12,2). g(13,4). g(14,3). g(15,2).
h(0,2). h(1,4). h(2,3). h(3,2). h(4,1). h(5,3). h(6,2). h(7,1). h(8,0). h(9,4). h(10,3). h(11,2). h(12,1). h(13,5). h(14,4). h(15,3).
i(0,4). i(1,2). i(2,3). i(3,4). i(4,5). i(5,1). i(6,2). i(7,3). i(8,4). i(9,0). i(10,1). i(11,2). i(12,3). i(13,1). i(14,2). i(15,3).
j(0,3). j(1,3). j(2,2). j(3,3). j(4,4). j(5,2). j(6,1). j(7,2). j(8,3). j(9,1). j(10,0). j(11,1). j(12,2). j(13,2). j(14,1). j(15,2).
k(0,2). k(1,4). k(2,3). k(3,2). k(4,3). k(5,3). k(6,2). k(7,1). k(8,2). k(9,2). k(10,1). k(11,0). k(12,1). k(13,3). k(14,2). k(15,1).
l(0,1). l(1,5). l(2,4). l(3,3). l(4,2). l(5,4). l(6,3). l(7,2). l(8,1). l(9,3). l(10,2). l(11,1). l(12,0). l(13,4). l(14,3). l(15,2).
m(0,3). m(1,3). m(2,4). m(3,5). m(4,6). m(5,2). m(6,3). m(7,4). m(8,5). m(9,1). m(10,2). m(11,3). m(12,4). m(13,0). m(14,1). m(15,2).
n(0,2). n(1,4). n(2,3). n(3,4). n(4,5). n(5,3). n(6,2). n(7,3). n(8,4). n(9,2). n(10,1). n(11,2). n(12,3). n(13,1). n(14,0). n(15,1).
o(0,1). o(1,5). o(2,4). o(3,3). o(4,4). o(5,4). o(6,3). o(7,2). o(8,3). o(9,3). o(10,2). o(11,1). o(12,2). o(13,2). o(14,1). o(15,0).
p(0,0). p(1,6). p(2,5). p(3,4). p(4,3). p(5,5). p(6,4). p(7,3). p(8,2). p(9,4). p(10,3). p(11,2). p(12,1). p(13,3). p(14,2). p(15,1).