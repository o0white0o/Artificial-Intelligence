implement main
    open core

constants
    className = "main".
    classVersion = "".

clauses
    %classInfo(className, classVersion).

class predicates
    st_A : (string) nondeterm anyflow.
    st_B : (string) nondeterm anyflow.
    st_V : (string) nondeterm anyflow.
    st_D : (string) nondeterm anyflow.
    st_G : (string) nondeterm anyflow.
    ogr1 : (string, string, string, string, string) nondeterm anyflow.
    ogr2 : (string, string, string, string, string) nondeterm anyflow.
    spisok : (string, string, string, string, string) nondeterm anyflow.
    norm1 : (string, string, string, string, string) nondeterm anyflow.
    norm2 : (string, string, string, string, string) nondeterm anyflow.
    norm3 : (string, string, string, string, string) nondeterm anyflow.
    norm4 : (string, string, string, string, string) nondeterm anyflow.

clauses
    st_A(A):-A="Andrey"; A="no".
    st_D(D):-D="Dmitry"; D="no".
    st_B(B):-B="Boris"; B="no".
    st_V(V):-V="Viktor"; V="no".
    st_G(G):-G="Grigory"; G="no".

    ogr1("Andrey",_,_,"no",_). ogr1("no",_,_,"Viktor",_).
    ogr2(_,"Dmitry",_,_,"no"). ogr2(_,"no",_,_,_).

    norm1("Andrey","Dmitry","no",_,_).
    norm2("Andrey","no","Boris","no",_).
    norm3(_,"Dmitry","no","no",_).
    norm4(_,"no","no","Viktor","Grigory").

    spisok(A,D,B,V,G):-
        st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
        norm1(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);
        st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
        norm2(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);
        st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
        norm3(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);
        st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
        norm4(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);
        st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
        not(norm1(A,D,B,V,G)),not(norm2(A,D,B,V,G)),
        not(norm3(A,D,B,V,G)),not(norm4(A,D,B,V,G)),
        ogr1(A,D,B,V,G),ogr2(A,D,B,V,G).

    run():-
        console::init(),
        spisok(A,D,B,V,G),
        stdIO::writef("Students:\n%,%,%,%,%\n",A,D,B,V,G),
        fail.
    run():-
        stdIO::write("end").
end implement main

goal
    mainExe::run(main::run).