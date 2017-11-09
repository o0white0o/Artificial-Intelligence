implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

class predicates
    city : (string, string) nondeterm anyflow.

clauses
    city("London", "England").
    city("SPb", "Russia").
    city("Kiev", "Ukraine").
    city("Pekin", "Asia").
    city("Warszawa", "Poland").
    city("Berlin", "Europe").
    city(X, "Europe") :- city(X,"Russia").
    city(X, "Europe") :- city(X,"Poland").
    run():-
        console::init(),
        city(X,"Europe"),
        stdIO::writef("% in Europe\n", X),
        fail.
    run():-
        stdIO::writef("\nend").
end implement main

goal
    mainExe::run(main::run).