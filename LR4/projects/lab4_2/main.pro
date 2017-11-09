implement main
    open core

constants
    className="main".
    classVersion="".

clauses

domains
    collector=string.
    title=string.
    author=string.
    publisher=string.
    personal_library=book(title,author,publication).
    publication=publication(publisher,year).
    year=integer.

class predicates
    collection:(collector,personal_library)nondeterm anyflow.

clauses
    collection("Иванов",book("Война и мир","Лев Толстой", publication("Просвещение",1990))).
    collection("Петров",book("Герой нашего времени", "Лермонтов",publication("Просвещение",1992))).
    run():-
        console::init(),
        collection(X,book(_,_,publication(_,1992))),
        stdIO::writef("% is owner of this book\n",X),
        fail.
    run():-
        stdIO::writef("\n end").
end implement main

goal
    mainExe::run(main::run).

