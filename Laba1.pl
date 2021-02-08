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

:- program.