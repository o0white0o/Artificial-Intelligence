implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
   % classInfo(className, classVersion).

class predicates
    buy_car : (string Model, string Color) nondeterm anyflow.
    car : (string Model, string Color, integer Price) nondeterm anyflow.
    color : (string Color, string Tone) nondeterm anyflow.

clauses
    buy_car(Model,Color) :-
        car(Model,Color,Price),
        color(Color,"светлый"),
        !,
        Price<25000.
    car("москвич","синий",12000).
    car("жигули","зеленый",26000).
    car("вольво","синий",24000).
    car("волга","синий",20000).
    car("ауди","зеленый",20000).
    color("синий","темный").
    color("зеленый","светлый").
    run():-
        console::init(),
        buy_car(Model,Color),
        stdIO::writef("car % of % color\n", Model, Color),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).