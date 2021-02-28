read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).

write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).

sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([Head|Tail], CurSum, Sum) :- CurSum1 is CurSum + Head, sum_ls_down(Tail, CurSum1, Sum).

sum_ls_up([],0) :- !.
sum_ls_up([Head|Tail], Sum) :- sum_ls_up(Tail,Sum1),Sum is (Sum1 + Head).
