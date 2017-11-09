implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

domains
    loc = east; west.
    state = state(loc,loc,loc,loc).
    path = state*.

class predicates
    go : (state, state) nondeterm anyflow.
    find_path : (state, state, path, path) nondeterm anyflow.
    move : (state, state) nondeterm anyflow.
    opposite : (loc, loc) nondeterm anyflow.
    unsafe : (state) nondeterm anyflow.
    member : (state, path) nondeterm anyflow.
    write_path : (path) nondeterm anyflow.
    write_move : (state, state) determ anyflow.

clauses
    go(S,G):-
        find_path(S,G,[S],L),
        stdIO::write("A solution is:\n"),
        write_path(L),
        fail.
    go(_,_).

    find_path(S,G,L,L1):- move(S,S1), not( unsafe(S1) ), not( member(S1,L) ),
    find_path( S1,G,[S1|L],L1),!.
    find_path(G,G,T,T):- !. /* Конечное состояние найдено, список L копируется в L1*/

    move(state(X,X,G,C),state(Y,Y,G,C)):-opposite(X,Y). /* мужик и волк */
    move(state(X,W,X,C),state(Y,W,Y,C)):-opposite(X,Y). /* мужик и коза */
    move(state(X,W,G,X),state(Y,W,G,Y)):-opposite(X,Y). /* мужик и капуста */
    move(state(X,W,G,C),state(Y,W,G,C)):-opposite(X,Y). /* один мужик */

    opposite(east,west).
    opposite(west,east):-!. /* описание противоположных сторон */

    unsafe( state(F,X,X,_) ):- opposite(F,X). /* волк съедает козу */
    unsafe( state(F,_,X,X) ):- opposite(F,X). /* коза съедает капусту */

    member(X,[X|_]).
    member(X,[_|L]):-member(X,L). /* проверка состояний, которые уже были */
    write_path( [H1,H2|T] ) :- !,
        write_move(H1,H2), write_path([H2|T]).
    write_path( [ ] ).
    write_move( state(X,W,G,C), state(Y,W,G,C) ) :- !,
        stdIO::writef(" Мужик едет с % на %\n",X,Y).
    write_move( state(X,X,G,C), state(Y,Y,G,C) ) :-!,
        stdIO::writef(" Мужик везет волка с % берега на %\n",X,Y).
    write_move( state(X,W,X,C), state(Y,W,Y,C) ) :-!,
        stdIO::writef(" Мужик везет козу с % берега на %\n",X,Y).
    write_move( state(X,W,G,X), state(Y,W,G,Y) ) :-!,
        stdIO::writef(" Мужик везет капусту с % берега на %\n",X,Y).

    run():-
        console::init(),
        go(state(east,east,east,east),state(west,west,west,west)),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).