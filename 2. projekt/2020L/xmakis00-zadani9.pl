uloha9abs(X, X) :- X > 0, !.
uloha9abs(X, Y) :- Y is -X.

comabs(X, Y, Z) :- Y is X, Z is X, !.
comabs(X, Y, Z) :- Z is X, X > Y. 
comabs(X, Y, Z) :- Z is Y, X =< Y. 

sub2([H|_], TOSUB, DIFF) :- DIFF is H - TOSUB.

uloha9([], _).
uloha9([H|T], X) :-
    TOSUB is H,
    sub2(T, TOSUB, DIFF),
    uloha9abs(DIFF, DIFFABS),
    comabs(DIFFABS, X, LEL),
    uloha9(T, LEL), !, X is LEL.
uloha9([_|T], X) :- uloha9(T, X), !.
