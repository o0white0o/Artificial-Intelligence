implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

domains
    number = integer.

class predicates
    write_number : (number Number) nondeterm anyflow.

clauses
    write_number(N) :-
        N<=7,
        stdIO::writef("number is %\n", N),
        write_number(N+1).
    run():-
        console::init(),
        write_number(1),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).