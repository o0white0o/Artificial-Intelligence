implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

domains
    name = string.
    rost = integer.
    ves = integer.

class facts
    dplayer : (name, rost, ves).

class predicates
    player : (name, rost, ves) nondeterm anyflow.

clauses
    player("Михайлов", 180, 87).
    player("Петров", 187, 93).
    player("Харламов", 177, 80).

    run():-
        console::init(),
        player(N,R,V),
        assertz(dplayer(N,R,V)),
        fail.
    run():-
        dplayer(N,R,V),
        stdIO::writef("player in DB: % % %\n", N, R, V),
        fail().
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).