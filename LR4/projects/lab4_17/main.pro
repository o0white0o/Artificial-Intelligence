implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    name : (string) nondeterm anyflow.
    mesto : (string) nondeterm anyflow.
    prizer : (string, string) nondeterm anyflow.
    solution : (string, string, string, string, string, string) nondeterm anyflow.

clauses
    name("Alex"). name("Petr"). name("Nike").
    mesto("One"). mesto("Two"). mesto("Three").

    prizer(X,Y):-
        name(X),
        mesto(Y),
        X = "Petr", Y<>"Two", Y<>"Three";
        name(X),
        mesto(Y),
        X = "Nike", Y<>"Three";
        name(X),
        mesto(Y),
        X<>"Petr", X<>"Nike".

    solution(X1,Y1,X2,Y2,X3,Y3):-
        name(X1),name(X2),name(X3),
        mesto(Y1),mesto(Y2),mesto(Y3),
        prizer(X1,Y1),prizer(X2,Y2),prizer(X3,Y3),
        Y1 <> Y2, Y2 <> Y3, Y1 <> Y3,
        X1 <> X2, X2 <> X3, X1 <> X3,!.

    run():-
        console::init(),
        solution(X1,Y1,X2,Y2,X3,Y3),
        stdIO::writef("% at %, % at %, % at %\n",X1,Y1,X2,Y2,X3,Y3),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).