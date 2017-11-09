implement main
    open core
domains
    s=string.
    list=s*.

class predicates
    boxer : (s, s) nondeterm (i, o).
    member : (s, list) nondeterm.
    stronger : (s, s, list) nondeterm.
    insertEveryPosition : (s, list, list) multi (i, o, i).
    permutation : (list, list) nondeterm (i, o).
    solve : (list) nondeterm (o).
    print_list : (list).

clauses
/* structure of boxers; for example, James can be first name or last name (two variants) */
    boxer("James", "Frensis James").
    boxer("James", "James Tomas").
    boxer("Frensis", "Gerbert Frensis").
    boxer("Frensis", "Frensis James").
    boxer("Gerbert", "Tomas Gerbert").
    boxer("Gerbert", "Gerbert Frensis").
    boxer("Tomas", "James Tomas").
    boxer("Tomas", "Tomas Gerbert").

    member(P, [P|_]).
    member(P, [_|T]):-member(P, T).
/* function for showing that boxer P1 stronger than boxer P2 */
    stronger(P1, P2, [P1|T]):-member(P2, T), !.
    stronger(P1, P2, [_|T]):-stronger(P1, P2, T).

/* function for transporting elements in list */
    insertEveryPosition(X,  [X|T],  T).
    insertEveryPosition(X,  [H|T],  [H|S]):-
        insertEveryPosition(X,  T,  S).

    permutation([],  []).
    permutation([H|T],  R):-
        permutation(T,  X),  insertEveryPosition(H,  R,  X).

/* recursive function for printing all list */
    print_list([]):- stdIO::nl().
    print_list([X|Y]):- stdIO::write(X, " -> "),  print_list(Y).

/* function for resolving task*/
    solve(L):-
        permutation(["James Tomas", "Tomas Gerbert", "Gerbert Frensis", "Frensis James"], L),
        /* some Gerbert(G1) stronger than some Tomas (T1)*/
        boxer("Tomas", T1), boxer("Gerbert", G1),
        stronger(G1, T1, L),
        /* some Frensis (F2) stronger than some Gerbert(G2) and stronger than some Tomas (T2)*/
        boxer("Frensis", F2), boxer("Tomas", T2), boxer("Gerbert", G2),
        stronger(F2, T2, L), stronger(F2, G2, L),
        /* some James (J3) stronger than some Gerbert(G3),
            but this Gerbert(G3) stronger than some Frensis (F3)*/
        boxer("Gerbert", G3), boxer("James", J3), boxer("Frensis", F3),
        stronger(J3, G3, L), stronger(G3, F3, L),
        F3<>G3, F3<>J3,
        F2<>G2, T2<>G2,
        T1<>G1.

% start
    run() :- solve(L),  print_list(L),  fail.
    run().
end implement main
goal
    console::runUtf8(main::run).

