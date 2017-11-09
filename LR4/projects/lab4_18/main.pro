implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

class predicates
    student : (string) nondeterm anyflow.
    gorod : (string) nondeterm anyflow.
    velo : (string, string) nondeterm anyflow.
    fact : (string, string) nondeterm anyflow.
    fact_birth : (string, string) nondeterm anyflow.
    rodom : (string, string) nondeterm anyflow.
    rodom_penza : (string) nondeterm anyflow.

clauses
    student("Sergey").student("Boris").student("Victor").student("Grigory").student("Leo").
    gorod("Penza").gorod("Lvov").gorod("Moskow").gorod("Harkov").gorod("Riga").
    fact("Sergey","Riga").
    fact("Boris","Penza").
    fact("Victor","Moskow").
    fact("Grigory","Harkov").
    fact_birth("Boris","Riga").
    fact_birth("Victor","Lvov").

    velo(X,Y) :-
        student(X),gorod(Y),fact(X,Y),!;
        student(X),gorod(Y),not(fact(X,_)),not(fact(_,Y)).

    rodom_penza(X) :-
        student(X), Z="Penza", not(fact_birth(X,_)),
        gorod(U), U<>Z, velo(X,U), rodom("Leo",U).

    rodom(X,Z) :-
        student(X),gorod(Z),fact_birth(X,Z),!;
        student(X),X<>"LeO",Z="Penza",rodom_penza(X), !;
        student(X),gorod(Z),not(fact_birth(_,Z)),X="Leo",Z<>"Penza",student(K),not(fact_birth(K,_)),velo(K,Z);
        student(X),X<>"Leo",gorod(Z),Z<>"Penza",not(fact_birth(_,Z)),
            not(fact_birth(X,_)), gorod(Y),Y<>Z,velo(X,Y),
            not(rodom("Leo",Z)),not(rodom("Leo",Y)).
    run():-
        console::init(),
        rodom(X,"Moskow"),
        stdIO::writef("% is from Moskow\n",X),
        !.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).