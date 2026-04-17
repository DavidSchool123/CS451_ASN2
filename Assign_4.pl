/* Video Game Genres, by: Denis Moroz and David Ogunbanjo
   * Source: we used animals.pl as the template and then adapted it to match our topic. Which is video game genres.
   * More: from the genres we chose the ones we were familiar with: RPG, FPS, Racing, Fighting, Puzzle, Platformer, Horror, and Strategy. 
*/

/* Prolog tutorial 2.17 Video Game Genre identification game.  


  To begin the code type ?- start.
  Answer only in Yes/No.
*/

start :- hypothesis(Game),
      write('I think the game genre is '),
      write(Game),
      write('.'),
      nl,
      undo.

/* how to ask questions */

ask(P) :-
    write('Does the game '),
    write(P),
    write('? '),
    read(Answer),
    nl,
    ( (Answer == yes ; Answer == y) -> assert(yes(P)) ; assert(no(P)), fail).

/* how to ask questions and verify if not */

ask_no(P) :-
    write('Does the game '),
    write(P),
    write('? '),
    read(Answer),
    nl,
    ( (Answer == yes ; Answer == y) -> assert(yes(P)), fail ; assert(no(P)) ).

:- dynamic yes/1,no/1.

/* Verifies if something = yes  */

verify_if(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).

/* Verifies if something = no */

verify_if_not(S) :-
   (yes(S) -> fail ;
    (no(S) -> true ;
     ask_no(S))).

/* undo all yes/no assertions so that we can reuse start again  */

undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.

/* hypotheses to be tested */
hypothesis('an rpg') :- rpg, !.
hypothesis('an fps') :- fps, !.
hypothesis('a racing game') :- racing, !.
hypothesis('a fighting game') :- fighting, !.
hypothesis('a puzzle game') :- puzzle, !.
hypothesis('a platformer') :- platformer, !.
hypothesis('a horror game') :- horror, !.
hypothesis('a strategy game') :- strategy, !.
hypothesis(unknown).

/* Game genre identification rules */

rpg :- adventure,
       verify_if('has character levels'),
       verify_if('has a large world'),
       verify_if_not('uses guns').

fps :- action,
       verify_if('uses guns'),
       verify_if('uses first person view'),
       verify_if_not('uses cars').

racing :- vehicle,
          verify_if('focuses on speed'),
          verify_if_not('has story choices').

fighting :- action,
            verify_if('has one on one combat'),
            verify_if_not('uses cars').

puzzle :- thinking,
          verify_if('focuses on solving puzzles'),
          verify_if_not('uses guns').

platformer :- action,
              verify_if('focuses on jumping'),
              verify_if_not('uses cars'),
              verify_if_not('uses guns').

horror :- adventure,
          verify_if('is scary'),
          verify_if_not('focuses on racing').

strategy :- thinking,
            verify_if('controls many units'),
            verify_if_not('uses first person view').

/* Classification rules shared by many games  */

action :- verify_if('has fast gameplay'), !.
action :- verify_if('needs quick reflexes').

adventure :- verify_if('has exploration'), !.
adventure :- verify_if('has story choices').

thinking :- verify_if('needs planning'), !.
thinking :- verify_if('focuses on solving puzzles').

vehicle :- verify_if('uses cars'), !.
vehicle :- verify_if('uses vehicles').
