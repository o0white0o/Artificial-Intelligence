implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

domains
    loc = right; middle; left.

class predicates
    move : (integer, loc, loc, loc).
    inform : (loc, loc).

clauses
    move(1, A,_,C) :- inform(A,C), !.
    move(N,A,B,C) :-
        move(N-1,A,C,B),
        inform(A,C),
        move(N-1,B,A,C).
    inform(Loc1, Loc2) :-
        stdIO::writef("Disk from % to %\n", Loc1, Loc2).
    run():-
        console::init(),
        stdIO::write("Enter a number of disks: "),
        N = stdIO::read(),
        move(N,left,middle,right),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).