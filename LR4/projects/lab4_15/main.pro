implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
  %  classInfo(className, classVersion).

domains
    spisok = integer*.

class predicates
    summa_sp : (spisok, integer) nondeterm anyflow.

clauses
    summa_sp([],0).
    summa_sp([H|T],S) :-
        summa_sp(T,S1),
        S=H+S1.
    run():-
        console::init(),
        summa_sp([2, 3, 8, 4], N),
        stdIO::writef("summ of list %",N),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).