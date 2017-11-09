/*****************************************************************************

                        Copyright ©

******************************************************************************/

implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

domains
    person = string.

class predicates
    otec : (person Person, person Father) nondeterm anyflow.
    man : (person Person) nondeterm anyflow.
    brat : (person Person, person Brother) nondeterm anyflow.

clauses
    man(X) :- otec(X,_).
    brat(X,Y) :- otec(Z,Y),otec(Z,X),X<>Y.
    otec("Ivan","Igor"). otec("Ivan","Sidor"). otec("Sidor","Lisa").
    run():-
        console::init(),
        brat("Igor", X),
        stdIO::writef("% is brother of Igor\n", X),
        fail.
    run():-
        stdIO::write("End").
end implement main

goal
    mainExe::run(main::run).
