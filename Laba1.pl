program.

man(wolfgang).
man(tomas).
man(uwe).

man(klaus).
man(frank).
man(andreas).
man(michael).

man(hans).
man(adolf).
man(walter).


woman(helga).
woman(maria).
woman(elke).

woman(petra).
woman(gisela).
woman(ingrid).

woman(anna).
woman(sabine).
woman(gertrude).


men(X):-man(X), write(X), write(" "), fail.
women(X):-woman(X), write(X), write(" "), fail.

parent(wolfgang,petra).
parent(helga,petra).

parent(tomas,klaus).
parent(tomas,gisela).
parent(tomas,frank).
parent(tomas,ingrid).
parent(maria,klaus).
parent(maria,gisela).
parent(maria,frank).
parent(maria,ingrid).

parent(uwe,andreas).
parent(uwe,michael).
parent(elke,andreas).
parent(elke,michael).

parent(petra,hans).
parent(petra,adolf).
parent(petra,walter).
parent(klaus,hans).
parent(klaus,adolf).
parent(klaus,walter).

parent(ingrid,anna).
parent(ingrid,sabine).
parent(ingrid,gertrude).
parent(andreas,anna).
parent(andreas,sabine).
parent(andreas,gertrude).

child(X,Y):-parent(Y,X).
children(X):-child(Y,X), write(Y), write(" "), fail.

:- program.