implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    hello : ().

clauses
    hello() :- stdIO::write("Hello").
    run():-
        console::init(),
        hello().
end implement main

goal
    mainExe::run(main::run).