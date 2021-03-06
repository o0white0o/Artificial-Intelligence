implement main
    open core

constants
    className = "main".
    classVersion = "".
clauses
    classInfo(className, classVersion).
    
domains
    professions_list = string*.
    reading_list = string*.
    
class predicates
    name : (string) nondeterm anyflow.
    profession : (string) nondeterm anyflow.
    person : (string Name, string Prof, string Book, string*,string*) nondeterm anyflow.
    check_reading : (string Prof, string Book) nondeterm anyflow.
    check_aleks_astr : (string AProf, string BRead) nondeterm anyflow.
    in_list : (string, string*) nondeterm anyflow.
    
clauses
    name("Alekseev"). name("Borisov"). name("Konstantinov"). name("Dmitriev").
    profession("Astronomy"). profession("Poet"). profession("Proze"). profession("Drama").
    
    person(Name, Prof, Book, Professions, Readings):-
        name(Name),
        profession(Prof),not(in_list(Prof,Professions)),
        profession(Book),not(in_list(Book,Readings)),
        check_reading(Prof,Book).
    
    check_reading("Poet","Drama").
    check_reading("Proze",Book):-
        profession(Book),Book<>"Proze",Book<>"Astronomy".
    check_reading(Prof, Book):-
        profession(Prof),
        profession(Book),
        Prof<>"Poet",Prof<>"Proze",
        Prof<>Book.
        
    check_aleks_astr(AProf, BRead):-
        AProf<>"Proze",!;
        BRead<>"Astronomy",!.
        
    in_list(Item,[Item|Tail]).
    in_list(Item,[Head|Tail]):-
        in_list(Item, Tail).
        
    run():-
        console::init(),
        person("Dmitriev",DProf,DRead,[],[]),
        DProf<>"Proze", %Прозаик только выпустил первую книгу, а у Дмитриева несколько произведений
        ARead=DProf, %Борисов купил книгу Дмитриева и обменялся с Алексеевым
        person("Alekseev",AProf,ARead,[DProf],[DRead]),
        person("Borisov",BProf,BRead,[DProf, AProf],[DRead, ARead]),
        BRead <> AProf, %Борисов обменялся с Алексеевым, у Алексеева не могло быть собственной книги
        check_aleks_astr(AProf, BRead), %Если Алексев - прозаик, то он не мог купить книгу по астрономии, по его словам
        person("Konstantinov",KProf,KRead,[DProf, AProf, BProf],[DRead, ARead, BRead]),
        stdIO::writef("% is % and reading % book\n","Alekseev",AProf,ARead),
        stdIO::writef("% is % and reading % book\n","Dmitriev",DProf,DRead),
        stdIO::writef("% is % and reading % book\n","Borisov",BProf,BRead),
        stdIO::writef("% is % and reading % book\n","Konstantinov",KProf,KRead),
        stdIO::write("_________\n\n"),
        fail.
    run():-
        stdIO::write("End of test\n").
        
end implement main

goal
    mainExe::run(main::run).