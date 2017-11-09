implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

domains
    dogs_list = string*.

class predicates
    dogs : (dogs_list) determ anyflow.

clauses
    dogs(["лайка","борзая","дог","болонка"]).
    run():-
        console::init(),
        dogs([_,X,_,_]),
        stdIO::writef("second dog is: %\n", X),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).