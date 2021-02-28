read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).

write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).

sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([Head|Tail], CurSum, Sum) :- CurSum1 is CurSum + Head, sum_ls_down(Tail, CurSum1, Sum).

sum_ls_up([],0) :- !.
sum_ls_up([Head|Tail], Sum) :- sum_ls_up(Tail,Sum1),Sum is (Sum1 + Head).

list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).

program:-write("Enter N: "), read(N),nl,
write("Enter List"), read_list(N,List),nl,
write("Enter Element: "), read(L),nl,
list_el_numb(List,L,Numb), write(Numb),!;
write("There is no Element").

programmm:- write("Enter N: "), read(N),nl,
write("Enter List"), read_list(N,List),nl,
write("Enter Element's number: "), read(Numb),nl,
list_el_numb(List,L,Numb), write(L),!.

programm:- write("There is no Element with that number").

min_list_up([H], H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).
