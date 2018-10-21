/* TOP/1

ARG1 is a sentence represented as a list of atoms (e.g. [is, it, true, that, mark, hamill, acts, in, star, wars, iv]).

TOP/1 will succeed or fail. Either way, it should write out a sensible answer.
*/

/*for the "did" kind of questions */
top(Sentence) :-
    did(Query, Sentence, []),
    showresults(Query).

/*for the "right?" kind of questions */
top(Sentence) :-
    right(Query, Sentence, []),
    showresults(Query).

/*for the "what" kind of questions */
top(Sentence) :-
  what(What, Sentence, []), % This is a call to the DCG.
  write("The title you're looking for is "),
  takename(What). 

/* for the "yes or no" kind of questions */
top(Sentence) :-
  yesno(Query, Sentence, []), % This is a call to the DCG.
  showresults(Query).

/*for the "who" kind of question */
top(Sentence) :-
  who(Who, Sentence, []), % This is a call to the DCG.
  write("The person you're looking for is "),
  takename(Who). 

/* for all other incorrect input */
top(Sentence) :-
  write("Sorry, I don't understand.").

/*print name like a person, check and match the name and print out a more good looking name.*/
takename(Na) :-
	Na = leonard_nimoy,
	write("Leonard Nimoy.").
takename(Na) :-
	Na = george_lucas,
	write("George Lucas.").
takename(Na) :-
	Na = captain_james_kirk,
	write("Captain James Kirk.").
takename(Na) :-
	Na = attack_of_the_clones,
	write("Attack Of The Clones.").

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

/* DCG: Here's the grammar. Each kinds of question have their top grammar*/

what(X) --> [what], verb_phrase(X^_^[Query]), {Query}.

who(X) --> [who], verb_phrase(X^_^[Query]), {Query}.

yesno(Sem) --> [is, it, true, that], statement(_^_^Sem). 

did(Sem) --> [did], statement(_^_^Sem).

right(Sem) --> statement(_^_^Sem),[right].

statement(S) --> singlestatement(S).

/*take care of the case of "and" and "," to take it as two queries */
statement(_^_^Sem) --> singlestatement(_^_^S1), [and], statement(_^_^S2), {append(S1,S2,Sem)}.
statement(_^_^Sem) --> singlestatement(_^_^S1), [,] , statement(_^_^S2), {append(S1,S2,Sem)}.

singlestatement(Subj^Obj^Sem) --> 
 noun_phrase(Subj),
 verb_phrase(Subj^Obj^Sem).

noun_phrase(Sem) --> proper_noun(Sem).

verb_phrase(Subj^Obj^Sem) -->
    verb(Subj^Obj^Sem),
    noun_phrase(Obj).
/*a lot of nouns are used, mostly names */
proper_noun(mark_hamill) --> [mark, hamill].
proper_noun(mark_hamill) --> [hamill].
proper_noun(harrison_ford) --> [harrison, ford].
proper_noun(harrison_ford) --> [harrison].
proper_noun(star_wars4) --> [star, wars, iv].
proper_noun(star_wars3) --> [star, wars, iii].
proper_noun(luke_skywalker) --> [luke, skywalker].
proper_noun(captain_james_kirk) --> [captain, james, kirk].
proper_noun(captain_james_kirk) --> [captain, james].
proper_noun(captain_james_kirk) --> [captain, kirk].
proper_noun(captain_james_kirk) --> [james, kirk].
proper_noun(captain_james_kirk) --> [kirk].
proper_noun(star_wars1) --> [star, wars, i].
proper_noun(star_wars2) --> [star, wars, ii].
proper_noun(william_shatner) --> [william, shatner].
proper_noun(william_shatner) --> [shatner].
proper_noun(star_trek3) --> [star, trek, iii].
proper_noun(leonard_nimoy) --> [leonard, nimoy].
proper_noun(leonard_nimoy) --> [ nimoy].
proper_noun(spock) --> [spock].
proper_noun(george_lucas) --> [george, lucas].
proper_noun(george_lucas) --> [lucas].
proper_noun(attack_of_the_clones) --> [attack, of, the, clones].
proper_noun(actor) --> [actor].
proper_noun(director) --> [director].
proper_noun(spock_in_star_trek3) --> [spock, in,star,trek,iii].

/*These are the verb, they work with the database and perfrom actions. */
verb(X^Y^Z^[play_in(X,Y,Z)]) --> [play,Y,in].
verb(X^Y^[acts_in(X,Y)]) --> [acts, in].
verb(X^Y^[play(X,Y)]) --> [play].
verb(X^Y^[play(X,Y)]) --> [plays].
verb(X^Y^[is_an(X,Y)]) -->[is, an].
verb(X^Y^[is_a(X,Y)]) --> [is, a].
verb(X^Y^[is_the_actor_for(X,Y)]) --> [is, the, actor, for].
verb(X^Y^[is_the_title_of(X,Y)]) --> [is, the, title, of].
verb(X^Y^[is_the_director_of(X,Y)]) --> [is, the, director, of].
verb(X^Y^[is_the_character_for(X,Y)]) --> [is, the, character, of].
verb(X^Y^[direct(X,Y)]) --> [direct].


/* DATABASE. you can say they are like rules or answers to the questions that are going to be ask */
is_an(william_shatner, actor).
is_an(mark_hamill, actor).
is_an(harrison_ford, actor).
is_an(leonard_nimoy, actor).
acts_in(mark_hamill, star_wars4).
acts_in(harrison_ford, star_wars4).
acts_in(william_shatner, star_trek3).
acts_in(leonard_nimoy, star_trek3).
acts_in(mark_hamill, star_wars1).
acts_in(mark_hamill, star_wars2).
play(william_shatner, captain_james_kirk).
play(mark_hamill, luke_skywalker).
play(leonard_nimoy, spock).
play(leonard_nimoy, spock_in_star_trek3).
is_the_actor_for(william_shatner, captain_james_kirk).
is_the_actor_for(mark_hamill, luke_skywalker).
is_the_actor_for(leonard_nimoy, spock).
is_a(george_lucas, director).
is_the_title_of( attack_of_the_clones,star_wars2).
direct(george_lucas, star_wars1).
is_the_director_of(george_lucas,star_wars2).
is_the_character_for(captain_james_kirk,william_shatner).

