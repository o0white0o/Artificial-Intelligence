implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    summ : (integer Num, integer Res) nondeterm (i,o).

clauses
    summ(X,Y) :- X<10, Y=X, !.
    summ(X,Y) :-
        summ(X div 10, Y1),
        Y=Y1+(X mod 10).
    run():-
        console::init(),
        stdIO::write("Enter a number: "),
        X = stdIO::read(),
        summ(X, Y),
        stdIO::writef("Summ = %\n", Y),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).