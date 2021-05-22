%task 1
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|Tail]):-write_str(H),write(" "),write_list_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],List,List):-!.
append1([H1|T1],List,[H1|T3]):-append1(T1,List,T3).

pr(X):-read_str(List,X) , write_str(List), Z = ",", write(Z),  write_str(List),
    write(Z),  write_str(List).

%task 2
read_str1([H|T],N):-r_str1(H,T,N,0).
r_str1(_,[],I,N):-I is N+1,!.
r_str1(32,[H|T],I,N):-I1 is N+1, r_str1(H,T , I, I1),!.
r_str1(_,[H|T],I,N):-r_str1(H, T, I, N).

%task 3
reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

list_words:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append1([W],LW,LW1),list_words(T,LW1,LWN,[]);
append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);	kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),often_word_in_list(LW,_,Word,0,_),write_str(Word),!.
often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).

%task 4
pr4:-read_str(A,Length),(Length>5 -> pr4(A),reverse(A,AR),pr42(AR);
	   concl(A,Length)).
pr42([H1|[H2|[H3|_]]]):-put(H3),put(H2),put(H1),!.
pr4([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
pr4([_|_],0):-!.
pr4([H|T],Length):-put(H),L1 is Length-1,pr4([H|T],L1).

