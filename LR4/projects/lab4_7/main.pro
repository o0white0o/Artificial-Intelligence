implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    gorod : (string City) multi anyflow.

clauses
    gorod("Moscow"). gorod("Minsk"). gorod("Kiev"). gorod("Omsk").
    run():-
        console::init(),
        gorod(X),
        stdIO::writef("%\n",X),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).