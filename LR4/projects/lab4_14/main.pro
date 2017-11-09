implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

domains
    dogs_list = string*.

class predicates
    find_it : (string,dogs_list) nondeterm anyflow.

clauses
    find_it(X,[X,_]).
    find_it(X,[_,Y]) :- find_it(X,[Y]).
    run():-
        console::init(),
        find_it("лайка", ["лайка","дог"]),
        stdIO::writef("лайка есть в списке\n"),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).