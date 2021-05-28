write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),write(" "),write_list_str(T).

read_str(List):-get0(X),read_str(X,List,[]).
read_str(10,List,List):-!.
read_str(X,List,B):-append(B,[X],B1),get0(X1),read_str(X1,List,B1).

%task 1
count_chars([],CurCount,CurCount):-!.
count_chars([_|T],CurCount,CountCh):-CurCount1 is CurCount + 1, count_chars(T,CurCount1,CountCh).
count_chars(List,CountCh):-count_chars(List,0,CountCh).

task1:-
	write("Write str: "),read_str(List), write("Three str: "),
	write_str(List),write(,  ),
	write_str(List),write(,  ),
	write_str(List),write("."),nl,
	write("Count chars: "),count_chars(List,CountCh),write(CountCh).