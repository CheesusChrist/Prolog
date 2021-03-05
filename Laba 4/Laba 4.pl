append_element([], X, X).
append_element([H|T1], X, [H|T2]) :- append_element(T1, X, T2).

read_list(N, L) :- read_list(N, 0, [], L), !.
read_list(N, N, L, L) :- !.
read_list(N, CurN, CurL, L) :- CurN1 is CurN + 1, read(X), append_element(CurL, [X], CurL1), read_list(N, CurN1, CurL1, L).

write_list([]) :- !.
write_list([H|T]) :- write(H), write(" "), write_list(T).

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

programmm:- write("There is no Element with that number").

min_list_up([H], H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).

min_list_down([],Min,Min):-!.
min_list_down([H|T],X,Min):-(H < X -> X1 is H; X1 is X),min_list_down(T,X1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).

program_8:-write("Number of elements in list: "), read(N),nl,
write("Enter list"), read_list(N,List), min_list_down(List,Min),
write("Min element of list: "), write(Min),!.

program_8:-write("List is empty").

member(X,[X|T]):-!.
member(X,[_|T]):-member(X,T).

reverse(L,NewList):-reverse(L,[],NewList).
reverse([],InvL,InvL):-!.
reverse([H|T],CurList,InvL):-reverse(T,[H|CurList],InvL).

sub_list([],_):-!.
sub_list([H|TS],[H|TL]):-sub_list(TS,TL).

p(S,L):-sub_list(S,L),!.
p(S,[_|T]):-p(S,T).

del_number(0,[_|T],T):- !.
del_number(X,[Head|T1],[Head|T2]) :- X1 is X-1,del_number(X1,T1,T2).

remove_equal([],_,[]):-!.
remove_equal([H|T],H,T1):-!,remove_equal(T,H,T1).
remove_equal([H|T],X,[H|T1]):-remove_equal(T,X,T1).

just_once([]):- !.
just_once([H|T]):- not(member(H,T)), just_once(T).

unique([],[]):-!.
unique([H|T],T1):-member(H,T),unique(T,T1),!.
unique([H|T],[H|T1]):-not(member(H,T)),unique(T,T1),!.

