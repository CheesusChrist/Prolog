read_str(List):-get0(X),read_str(X,List,[]).
read_str(10,List,List):-!.
read_str(X,List,B):-append(B,[X],B1),get0(X1),read_str(X1,List,B1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str(List):-get0(X),read_str(X,List,[]).
read_str(10,List,List):-!.
read_str(X,List,B):-append(B,[X],B1),get0(X1),read_str(X1,List,B1).

%task 1
count_chars([],CurCount,CurCount):-!.
count_chars([_|T],CurCount,CountCh):-CurCount1 is CurCount + 1, count_chars(T,CurCount1,CountCh).
count_chars(List,CountCh):-count_chars(List,0,CountCh).

task1:-
read_str(List), write_str(List),write(, ),nl,
write_str(List),write(, ),nl,
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
task2:- write("Write str: "),nl,read_str(List),write("Count words: "),count_words(List,Count),write(Count).

member_list([X|_],X):-!.
member_list([_|T],X):-member_list(T,X).

unique([],[]):-!.
unique([H|T],T1):-member(H,T),unique(T,T1),!.
unique([H|T],[H|T1]):-not(member(H,T)),unique(T,T1),!.

kolEl([],_,N,N):-!.
kolEl([H|T],X,N,Count):- (H = X -> N1 is (N + 1), kolEl(T,X,N1,Count);N1 is N, kolEl(T,X,N1,Count)).
kolEl([H|T],X,Count):-kolEl([H|T],X,0,Count).

max_word([],_,_,CurWord,CurWord):-!.
max_word([H|T],ListWord,CurCount,CurWord,Word):- kolEl(ListWord,H,CountH),(CountH > CurCount->(CurCount1 is CountH,CurWord1 = H);(CurCount1 is CurCount, CurWord1 = CurWord)),
	max_word(T,ListWord,CurCount1,CurWord1,Word).
max_word(UniListWord,ListWord,Word):-max_word(UniListWord,ListWord,0,[],Word).

write_list([]) :- !.
write_list([H|T]) :- write(H), write(" "), write_list(T).

task3:- write("Write str: "),read_str(List),
	count_words(List,CountW),
	get_words(List,ListWord,CountW),
	write("List words: "),write(ListWord),nl,
	unique(ListWord,UniListWord),
	write("Unique list words: "), write(UniListWord),nl,
	write("Max count word: "),
	max_word(UniListWord,ListWord,Word),
	write_str(Word).

length_list([],0):-!.
length_list([_|T],X):-length_list(T,X1),X is (X1 + 1).

list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).

append_element([], X, X).
append_element([H|T1], X, [H|T2]) :- append_element(T1, X, T2).


repeat(_, Length, Length):-!.
repeat(Elem, CurNum, Length):-write(Elem), write(" "),CurNum1 is CurNum+1, repeat(Elem,CurNum1,Length).
rep(Elem,Length):-repeat(Elem,0,Length).

task4:-write("Write str: "),nl,read_str(List),length_list(List,Length),nl,Length1 is Length-1, nl,
((Length>5)->list_el_numb(List,E0,0),list_el_numb(List,E1,1),list_el_numb(List,E2,2), Length2 is Length-2,
 Length3 is Length-3, list_el_numb(List,E3,Length3),list_el_numb(List,E4,Length2),list_el_numb(List,E5,Length1), append_element([E0,E1,E2,E3,E4,E5],[],NewNewList),write_str(NewNewList); list_el_numb(List,E6,0), rep(E6,Length)).

write_all([],_,_):-!.
write_all([H|T],CurNum,Elem):-((H is Elem)->write(CurNum),write(" "),CurNum1 is CurNum+1;CurNum1 is CurNum+1),
write_all(T,CurNum1,Elem).
write_a(List,Elem):-write_all(List,0,Elem).

task5:-write("Write str: "),nl,read_str(List),length_list(List,Length),nl,Length1 is Length-1,
list_el_numb(List,Elem,Length1), write("Last elem is "), write(Elem), nl, write("Numbers are "),
write_a(List,Elem).

show_three([],_):-!.
show_three([H|T],CurNum):-((0 is CurNum mod 3)->write(H),write(" "),CurNum1 is CurNum+1;
                          CurNum1 is CurNum+1), show_three(T,CurNum1).
show([H|T]):-show_three([H|T],1).

task6:-write("Write str: "),nl,read_str(List),nl,show(List).

count_plus_minus([],Plus,Minus,Plus,Minus):-!.
count_plus_minus([H|T],Plus,Minus,X,Y):-((H is 43)->Plus1 is Plus + 1;Plus1 is Plus),
((H is 45)->Minus1 is Minus + 1;Minus1 is Minus), count_plus_minus(T,Plus1,Minus1,X,Y).

count([H|T],Plus,Minus):-count_plus_minus([H|T],0,0,Plus,Minus).

zero_after([],Zero,Zero):-!.
zero_after([H|T],Zero,X):-((H is 48)->Zero1 is Zero + 1;Zero1 is Zero), zero_after(T,Zero1,X).
zero([_|T],Zero):-zero_after(T,0,Zero).

task7:- write("Write str: "),nl,read_str(List),nl,count(List,Plus,Minus), write("Plus = "),write(Plus),nl,
write("Minus = "), write(Minus), nl, write("Zero = "), zero(List,Zero), write(Zero),nl.

find_w_elem([],_,NumbW):-NumbW is (-1),!.
find_w_elem(_,_,NumbW):-not(NumbW is -1),!.
find_w_elem([H|T],CurNumb,NumbW):-((H is 119)->NumbW is CurNumb;CurNumb1 is CurNumb+1,
                                   find_w_elem(T,CurNumb1,NumbW)).
find_w(List,NumbW):-find_w_elem(List,0,NumbW).

find_x_elem([],_,NumbX):-NumbX is (-1),!.
find_x_elem(_,_,NumbX):-not(NumbX is -1),!.
find_x_elem([H|T],CurNumb,NumbX):-((H is 120)->NumbX is CurNumb;CurNumb1 is CurNumb+1,
                                   find_x_elem(T,CurNumb1,NumbX)).
find_x(List,NumbX):-find_x_elem(List,0,NumbX).

check_wx(NumbW,NumbX):-NumbW is NumbX, write("There is no 'w' or 'x' in line").
check_wx(NumbW,NumbX):-NumbW is -1, not(NumbX is -1), write("There is no 'w' in line").
check_wx(NumbW,NumbX):-not(NumbW is -1), NumbX is -1, write("There is no 'x' in line").
check_wx(NumbW,NumbX):-not(NumbW is -1), not(NumbX is -1),((NumbW < NumbX)->write("W occurs earlier");
                                                       write("X occurs earlier")).

task8:- write("Write str: "),nl,read_str(List),nl, find_w(List,NumbW), find_x(List,NumbX), nl, check_wx(NumbW,NumbX).

check_length(L1,L2,Razn,_):-L1 is L2, Razn is 0.
check_length(L1,L2,Razn,1):-L1 > L2, Razn is L1-L2.
check_length(L1,L2,Razn,2):-L1 < L2, Razn is L2-L1.

repeat_line(_,Num,Num):-!.
repeat_line(Larger,CurNum,Num):-write_str(Larger),nl, CurNum1 is CurNum+1, repeat_line(Larger,CurNum1,Num).
repeat_l(Larger,Num):-repeat_line(Larger,0,Num).


task9:-write("Write str1: "),nl,read_str(List1),length_list(List1,Length1),
       write("Write str2: "),nl,read_str(List2),length_list(List2,Length2),
       check_length(Length1,Length2,Razn,Larger),
       ((Razn is 0)->write("Line1 length = Line2 length");((Larger is 1)->repeat_l(List1,Razn);repeat_l(List2,Razn))).
