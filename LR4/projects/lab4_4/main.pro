implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    add : (integer Op1, integer Op2) nondeterm anyflow.
    fadd : (real Op1, real Op2) nondeterm anyflow.
    maximum : (real Op1, real Op2, real Res) nondeterm (i,i,o).

clauses
    add(X,Y) :- Z=X+Y, stdIO::writef("Sum = %\n", Z).
    fadd(X,Y) :- Z=X+Y, stdIO::writef("FSum = %\n", Z).
    maximum(X,X,X).
    maximum(X,Y,X) :- X>Y.
    maximum(X,Y,Y) :- X<Y.
    run():-
        console::init(),
        add(3,4),
        fadd(2.2, 4.3),
        maximum(4,3,Z),
        stdIO::writef("% is greater of 3 and 4\n",Z),
        fail.
    run():-
        stdIO::write("End").
end implement main

goal
    mainExe::run(main::run).
