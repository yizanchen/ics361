/* 8_puzzle.pl */
/* Code taken from : https://www.cpp.edu/~jrfisher/www/prolog_tutorial/5_2.html and modified to fit the 15 puzzle problem */
/* Test functions: 
	Easy: solve(1/2/3/4/5/6/7/8/9/10/11/12/13/14/0/15, S).
	Difficult: solve(0/1/3/4/2/6/7/5/9/10/8/12/13/14/11/15, S).*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%     A* Algorithm
%%%
%%%
%%%     Nodes have form    S#D#F#A
%%%            where S describes the state or configuration
%%%                  D is the depth of the node
%%%                  F is the evaluation function value
%%%                  A is the ancestor list for the node

:- op(400,yfx,'#').    /* Node builder notation */

solve(State,Soln) :- f_function(State,0,F),
                     search([State#0#F#[]],S), reverse(S,Soln).

f_function(State,D,F) :- h_function(State,H),
                         F is D + H.

search([State#_#_#Soln|_], Soln) :- goal(State).
search([B|R],S) :- expand(B,Children),
                   insert_all(Children,R,Open),
                   search(Open,S).

insert_all([F|R],Open1,Open3) :- insert(F,Open1,Open2),
                                 insert_all(R,Open2,Open3).
insert_all([],Open,Open).

insert(B,Open,Open) :- repeat_node(B,Open), ! .
insert(B,[C|R],[B,C|R]) :- cheaper(B,C), ! .
insert(B,[B1|R],[B1|S]) :- insert(B,R,S), !.
insert(B,[],[B]).

repeat_node(P#_#_#_, [P#_#_#_|_]).

cheaper( _#_#F1#_ , _#_#F2#_ ) :- F1 < F2.

expand(State#D#_#S,All_My_Children) :-
     bagof(Child#D1#F#[Move|S],
           (D1 is D+1,
             move(State,Child,Move),
             f_function(Child,D1,F)),
           All_My_Children).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%     8-puzzle solver
%%%
%%%
%%%     State have form    A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P
%%%            where {A,...,P} = {0,...,15}
%%%               0 represents the empty tile
%%%             

goal(1/2/3/4/5/6/7/8/9/10/11/12/13/14/15/0).

   %%% The puzzle moves

left( A/0/C/D/E/F/G/H/I/J/K/L/M/N/O/P ,  0/A/C/D/E/F/G/H/I/J/K/L/M/N/O/P ).
left( A/B/0/D/E/F/G/H/I/J/K/L/M/N/O/P ,  A/0/B/D/E/F/G/H/I/J/K/L/M/N/O/P ).
left( A/B/C/0/E/F/G/H/I/J/K/L/M/N/O/P ,  A/B/0/C/E/F/G/H/I/J/K/L/M/N/O/P ).
left( A/B/C/D/E/0/G/H/I/J/K/L/M/N/O/P ,  A/B/C/D/0/E/G/H/I/J/K/L/M/N/O/P ).
left( A/B/C/D/E/F/0/H/I/J/K/L/M/N/O/P ,  A/B/C/D/E/0/F/H/I/J/K/L/M/N/O/P ).
left( A/B/C/D/E/F/G/0/I/J/K/L/M/N/O/P ,  A/B/C/D/E/F/0/G/I/J/K/L/M/N/O/P ).
left( A/B/C/D/E/F/G/H/I/0/K/L/M/N/O/P ,  A/B/C/D/E/F/G/H/0/I/K/L/M/N/O/P ).
left( A/B/C/D/E/F/G/H/I/J/0/L/M/N/O/P ,  A/B/C/D/E/F/G/H/I/0/J/L/M/N/O/P ).
left( A/B/C/D/E/F/G/H/I/J/K/0/M/N/O/P ,  A/B/C/D/E/F/G/H/I/J/0/K/M/N/O/P ).
left( A/B/C/D/E/F/G/H/I/J/K/L/M/0/O/P ,  A/B/C/D/E/F/G/H/I/J/K/L/0/M/O/P ).
left( A/B/C/D/E/F/G/H/I/J/K/L/M/N/0/P ,  A/B/C/D/E/F/G/H/I/J/K/L/M/0/N/P ).
left( A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/0 ,  A/B/C/D/E/F/G/H/I/J/K/L/M/N/0/O ).

up( A/B/C/D/0/F/G/H/I/J/K/L/M/N/O/P ,  0/B/C/D/A/F/G/H/I/J/K/L/M/N/O/P ).
up( A/B/C/D/E/0/G/H/I/J/K/L/M/N/O/P ,  A/0/C/D/E/B/G/H/I/J/K/L/M/N/O/P ).
up( A/B/C/D/E/F/0/H/I/J/K/L/M/N/O/P ,  A/B/0/D/E/F/C/H/I/J/K/L/M/N/O/P ).
up( A/B/C/D/E/F/G/0/I/J/K/L/M/N/O/P ,  A/B/C/0/E/F/G/D/I/J/K/L/M/N/O/P ).
up( A/B/C/D/E/F/G/H/0/J/K/L/M/N/O/P ,  A/B/C/D/0/F/G/H/E/J/K/L/M/N/O/P ).
up( A/B/C/D/E/F/G/H/I/0/K/L/M/N/O/P ,  A/B/C/D/E/0/G/H/I/F/K/L/M/N/O/P ).
up( A/B/C/D/E/F/G/H/I/J/0/L/M/N/O/P ,  A/B/C/D/E/F/0/H/I/J/G/L/M/N/O/P ).
up( A/B/C/D/E/F/G/H/I/J/K/0/M/N/O/P ,  A/B/C/D/E/F/G/0/I/J/K/L/H/N/O/P ).
up( A/B/C/D/E/F/G/H/I/J/K/L/0/N/O/P ,  A/B/C/D/E/F/G/H/0/J/K/L/I/N/O/P ).
up( A/B/C/D/E/F/G/H/I/J/K/L/M/0/O/P ,  A/B/C/D/E/F/G/H/I/0/K/L/M/J/O/P ).
up( A/B/C/D/E/F/G/H/I/J/K/L/M/N/0/P ,  A/B/C/D/E/F/G/H/I/J/0/L/M/N/K/P ).
up( A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/0 ,  A/B/C/D/E/F/G/H/I/J/K/0/M/N/O/L ).


right( 0/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P ,  B/0/C/D/E/F/G/H/I/J/K/L/M/N/O/P ).
right( A/0/C/D/E/F/G/H/I/J/K/L/M/N/O/P ,  A/C/0/D/E/F/G/H/I/J/K/L/M/N/O/P ).
right( A/B/0/D/E/F/G/H/I/J/K/L/M/N/O/P ,  A/B/D/0/E/F/G/H/I/J/K/L/M/N/O/P ).
right( A/B/C/D/0/F/G/H/I/J/K/L/M/N/O/P ,  A/B/C/D/F/0/G/H/I/J/K/L/M/N/O/P ).
right( A/B/C/D/E/0/G/H/I/J/K/L/M/N/O/P ,  A/B/C/D/E/G/0/H/I/J/K/L/M/N/O/P ).
right( A/B/C/D/E/F/0/H/I/J/K/L/M/N/O/P ,  A/B/C/D/E/F/H/0/I/J/K/L/M/N/O/P ).
right( A/B/C/D/E/F/G/H/0/J/K/L/M/N/O/P ,  A/B/C/D/E/F/G/H/J/0/K/L/M/N/O/P ).
right( A/B/C/D/E/F/G/H/I/0/K/L/M/N/O/P ,  A/B/C/D/E/F/G/H/I/K/0/L/M/N/O/P ).
right( A/B/C/D/E/F/G/H/I/J/0/L/M/N/O/P ,  A/B/C/D/E/F/G/H/I/J/L/0/M/N/O/P ).
right( A/B/C/D/E/F/G/H/I/J/K/L/0/N/O/P ,  A/B/C/D/E/F/G/H/I/J/K/L/N/0/O/P ).
right( A/B/C/D/E/F/G/H/I/J/K/L/M/0/O/P ,  A/B/C/D/E/F/G/H/I/J/K/L/M/O/0/P ).
right( A/B/C/D/E/F/G/H/I/J/K/L/M/N/0/P ,  A/B/C/D/E/F/G/H/I/J/K/L/M/N/P/0 ).


down( 0/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P ,  E/B/C/D/0/F/G/H/I/J/K/L/M/N/O/P ).
down( A/0/C/D/E/F/G/H/I/J/K/L/M/N/O/P ,  A/F/C/D/E/0/G/H/I/J/K/L/M/N/O/P ).
down( A/B/0/D/E/F/G/H/I/J/K/L/M/N/O/P ,  A/B/G/D/E/F/0/H/I/J/K/L/M/N/O/P ).
down( A/B/C/0/E/F/G/H/I/J/K/L/M/N/O/P ,  A/B/C/H/E/F/G/0/I/J/K/L/M/N/O/P ).
down( A/B/C/D/0/F/G/H/I/J/K/L/M/N/O/P ,  A/B/C/D/I/F/G/H/0/J/K/L/M/N/O/P ).
down( A/B/C/D/E/0/G/H/I/J/K/L/M/N/O/P ,  A/B/C/D/E/J/G/H/I/0/K/L/M/N/O/P ).
down( A/B/C/D/E/F/0/H/I/J/K/L/M/N/O/P ,  A/B/C/D/E/F/K/H/I/J/0/L/M/N/O/P ).
down( A/B/C/D/E/F/G/0/I/J/K/L/M/N/O/P ,  A/B/C/D/E/F/G/L/I/J/K/0/M/N/O/P ).
down( A/B/C/D/E/F/G/H/0/J/K/L/M/N/O/P ,  A/B/C/D/E/F/G/H/M/J/K/L/0/N/O/P ).
down( A/B/C/D/E/F/G/H/I/0/K/L/M/N/O/P ,  A/B/C/D/E/F/G/H/I/N/K/L/M/0/O/P ).
down( A/B/C/D/E/F/G/H/I/J/0/L/M/N/O/P ,  A/B/C/D/E/F/G/H/I/J/O/L/M/N/0/P ).
down( A/B/C/D/E/F/G/H/I/J/K/0/M/N/O/P ,  A/B/C/D/E/F/G/H/I/J/K/P/M/N/O/0 ).


   %%% the heuristic function
h_function(Puzz,H) :- p_fcn(Puzz,P),
                      H is P.

   
   %%% the move
move(P,C,left) :-  left(P,C).
move(P,C,up) :-  up(P,C).
move(P,C,right) :-  right(P,C).
move(P,C,down) :-  down(P,C).

   %%% the Manhattan distance function
p_fcn(A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P, Path) :-
     a(A,CosteA), b(B,CosteB), c(C,CosteC), d(D, CosteD),
     e(E,CosteE), f(F,CosteF), g(G,CosteG), h(H,CosteH),
     i(I,CosteI), j(J,CosteJ), k(K,CosteK), l(L,CosteL),
     m(M,CosteM), n(N,CosteN), o(O,CosteO), p(P,CosteP),
     Path is CosteA + CosteB + CosteC + CosteD + CosteE + CosteF + CosteG + CosteH + CosteI + CosteJ + CosteK + CosteL + CosteM + CosteN + CosteO + CosteP.

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


