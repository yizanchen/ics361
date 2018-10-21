/* NOTE: This file is just a starting point! It is very much incomplete. You will have to modify the given clauses, and add new ones. 

Try these: 

?- top([is, it, true, that, mark, hamill, acts, in, star, wars, iv]).

?- top([who, acts, in, star, wars, iv]).

*/

/* TOP/1

ARG1 is a sentence represented as a list of atoms (e.g. [is, it, true, that, mark, hamill, acts, in, star, wars, iv]).

TOP/1 will succeed or fail. Either way, it should write out a sensible answer.

*/

top(Sentence) :-
  yesno(Query, Sentence, []), % This is a call to the DCG.
  showresults(Query).

top(Sentence) :-
  who(Who, Sentence, []), % This is a call to the DCG.
  write("The person you're looking for is "),
  write(Who). % Can you make this better? It really should write out the text of the answer, not just the symbol. 


/* SHOWRESULTS/1 writes out positive text if ARG1 is a list of true predicates, negative text otherwise. */
showresults(Query) :-
  test(Query),
  write("Yes, that's true.").

showresults(_) :-
  write("Sorry, that's false.").

/* TEST/1 takes a list of predicates, and succeeds if all the predicates are true, otherwise fails.*/

test([Query]) :-
  Query.

test([Query|Rest]):-
  Query,
  test(Rest).

/* DCG: Here's the grammar. Right now it's very simple. */


who(X) --> [who], verb_phrase(X^_^[Query]), {Query}.

yesno(Sem) --> [is, it, true, that], statement(_^_^Sem). 

statement(S) --> singlestatement(S).

statement(_^_^Sem) --> singlestatement(_^_^S1), [and], statement(_^_^S2), {append(S1,S2,Sem)}.

singlestatement(Subj^Obj^Sem) --> 
 noun_phrase(Subj),
 verb_phrase(Subj^Obj^Sem).

noun_phrase(Sem) --> proper_noun(Sem).

verb_phrase(Subj^Obj^Sem) -->
    verb(Subj^Obj^Sem),
    noun_phrase(Obj).

proper_noun(mark_hamill) --> [mark, hamill].
proper_noun(harrison_ford) --> [harrison, ford].
proper_noun(star_wars4) --> [star, wars, iv].
proper_noun(star_wars3) --> [star, wars, iii].
verb(X^Y^[acts_in(X,Y)]) --> [acts, in].

/* DATABASE. Obviously, you're going to have to fill this out a lot. */

actor(mark_hamill).
actor(harrison_ford).
acts_in(mark_hamill, star_wars4).
acts_in(harrison_ford, star_wars4).
