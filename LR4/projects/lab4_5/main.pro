implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

domains
    nazvanie = string.
    stolica = string.
    naselenie = integer.
    territoria = real.

class predicates
    strana : (nazvanie,naselenie,territoria,stolica) nondeterm anyflow.

clauses
    strana("China",1200,9597000,"Pekin").
    strana("Belgia",10,30000,"Brussel") .
    strana("Peru",20,1285000,"Lima") .
    run():-
        console::init(),
        strana(X, _,Y, _), Y > 1000000,
        stdIO::writef("% of territory %\n",X,Y),
        fail.
    run():-
        stdIO::write("End").
end implement main

goal
    mainExe::run(main::run).
