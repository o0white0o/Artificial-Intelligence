implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class facts
    xpositive : (string, string).
    xnegative : (string, string).

class predicates
    expertize : () nondeterm anyflow.
    vopros : (string, string) nondeterm anyflow.
    fish_is : (string) nondeterm anyflow.
    positive : (string, string) nondeterm anyflow.
    negative : (string, string) nondeterm anyflow.
    remember : (string, string, string) nondeterm anyflow.
    clear_facts : () nondeterm anyflow.

clauses
    expertize():-fish_is(X),!,stdIO::write("ваша рыба это ",X," \n"),clear_facts.
    expertize():-stdIO::write("это неизвестная рыба!"),clear_facts.

    vopros(X, Y):-stdIO::write("вопрос – ",X, " ",Y, "? (да/нет)\n"),R = stdIO::readLine(),remember(X,Y,R).

    positive(X,Y):- xpositive(X,Y),!.
    positive(X,Y):-not(negative(X,Y)),!,vopros(X,Y).

    negative(X,Y):-xnegative(X,Y),!.

    remember(X,Y,"да"):-assertz(xpositive(X,Y)).
    remember(X,Y,"нет"):-assertz(xnegative(X,Y)),fail.

    clear_facts():-retract(xpositive(_,_)),fail.
    clear_facts():-retract(xnegative(_,_)),fail.

    fish_is("сом"):- positive("у рыбы","вес >40 кг").
    fish_is("сом"):- positive("у рыбы","вес <40 кг"),positive("у рыбы","есть усы").
    fish_is("щука"):- positive("у рыбы","вес <20 кг"),positive("у рыбы","длинное узкое тело").
    fish_is("окунь"):- positive("у рыбы","вес <20 кг"),positive("у рыбы","широкое тело"),positive("у рыбы","темные полосы").
    fish_is("плотва"):- positive("у рыбы","вес <20 кг"),positive("у рыбы","широкое тело"),positive("у рыбы","серебристая чешуя").
    run():-
        console::init(),
        expertize(),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).