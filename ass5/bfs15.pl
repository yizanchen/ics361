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

%bfs/2 first argument is the start state and the second argument will be the solution path. 
%this is the top function to start the search.
bfs(Start,Path) :-
	run_bf([[Start]],state(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0),Path).

%run_bf/3 check if the first state in the search match the goal, return if match 
run_bf([[Goal|Path]|_],Goal,[Goal|Path]).
%or else it will continue to add more state into a newpath and run_bf again
run_bf([Path|Queue],Goal,FinalPath) :-
	extend(Path,NewPaths),
	myappend(Queue,NewPaths,NewQueue),
	run_bf(NewQueue,Goal,FinalPath).
%this will check the state rule and give what state the current state can go to, and check if it is in the list already
extend([Node|Path],NewPaths) :-
	findall([NewNode,Node|Path],
	(arc(Node,NewNode),
	\+ member(NewNode,Path)), % for avoiding loops
 	NewPaths). 
%this is my append, not using the build in one.
myappend([],R,[R]).
myappend([H|T],L2,[H|A2]):-
       myappend(T,L2,A2).
