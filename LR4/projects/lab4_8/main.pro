implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

domains
    person = string.

class predicates
    deti : (person Person) nondeterm anyflow.
    make_cut : (person Person) determ.

clauses
    deti("Петя").deti("Вася").deti("Олег").
    deti("Маша").deti("Оля").deti("Наташа").
    make_cut(X) :- X="Олег".
    run():-
        console::init(),
        deti(X),
        stdIO::writef("%\n",X),
        make_cut(X),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).