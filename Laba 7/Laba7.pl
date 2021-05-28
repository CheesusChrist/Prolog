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

%task 2
count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1), get_word(T,W1,Word,A2).


get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

count_words(List,Count):-count_words(List,0,Count).
task2:- write("Write str: "),read_str(List),write("Count words: "),count_words(List,Count),write(Count).

%task 3
unique_list([],[]):-!.
unique_list([H|T],T1):-member(H,T),unique_list(T,T1),!.
unique_list([H|T],[H|T1]):-not(member(H,T)),unique_list(T,T1),!.

kolEl([],_,N,N):-!.
kolEl([H|T],X,CurCount,Count):- (H = X -> CurCount1 is CurCount + 1;CurCount1 is CurCount), kolEl(T,X,CurCount1,Count).
kolEl(List,X,Count):-kolEl(List,X,0,Count).

max_word([],_,_,CurWord,CurWord):-!.
max_word([H|T],ListWord,CurCount,CurWord,Word):- kolEl(ListWord,H,CountH),(CountH > CurCount->(CurCount1 is CountH,CurWord1 = H);(CurCount1 is CurCount, CurWord1 = CurWord)),
	max_word(T,ListWord,CurCount1,CurWord1,Word).
max_word(UniListWord,ListWord,Word):-max_word(UniListWord,ListWord,0,[],Word).

task3:- write("Write str: "),read_str(List),
	count_words(List,CountW),
	get_words(List,ListWord,CountW),
	write("List words: "),write_list_str(ListWord),nl,
	unique_list(ListWord,UniListWord),
	write("Unique list words: "),write_list_str(UniListWord),nl,
	write("Max count word: "),
	max_word(UniListWord,ListWord,Word),
	write_str(Word).
