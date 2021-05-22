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

%task 5
index_end:-read_str(Sr,_),reverse(Sr,[H|_]),EndS = H,list_el(Sr,EndS).
list_el([H|T],El):-list_el([H|T],El,0).
list_el([],_,_):-!.
list_el([H|T],El,Index):-Index1 is Index+1,(H = El-> write(Index1),write(" "),list_el(T,El,Index1);list_el(T,El,Index1)).

%task 6
third_el:-read_str(A,_), thirdel(A,0).
thirdel([],_):-!.
thirdel([H|T],Index):-Index1 is Index+1,(0 is Index1 mod 3 -> put(H),write(" "),thirdel(T,Index1);thirdel(T,Index1)).

% task 7
kol_zero([_|[]],Zero,Zero):-!.
kol_zero([_|[H2|T]],KZero,KolZero):-(H2=48 -> KZero1 is KZero+1,
kol_zero([H2|T],KZero1,KolZero);kol_zero([H2|T],KZero,KolZero)).

kol_p_m:-read_str(Stroka,_),kol_p_m(Stroka,0,Plus,0,Minus),kol_zero(Stroka,0,Zero),
    write("Plus = "),write(Plus),nl,write("Minus = "),write(Minus),nl,write("Zero = "),write(Zero),!.
kol_p_m([],Plus,Plus,Minus,Minus):-!.
kol_p_m([43|T],Plus,KolP,Minus,KolM):-Plus1 is Plus+1,
    kol_p_m(T,Plus1,KolP,Minus,KolM).
kol_p_m([45|T],Plus,KolP,Minus,KolM):-Minus1 is Minus+1,
    kol_p_m(T,Plus,KolP,Minus1,KolM).
kol_p_m([_|T],Plus,KolP,Minus,KolM):-kol_p_m(T,Plus,KolP,Minus,KolM).

%task 8
list_el_num([H|T],El,Num):-list_el_num([H|T],El,Num,0).
list_el_num([],119,0,_):-write("w no found"),nl,!.
list_el_num([],120,0,_):-write("x no found"),nl,!.
list_el_num([],_,0,_):-!.
list_el_num([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,
			Num = Chet1 -> !;list_el_num(T,El,Num,Chet1)).

find_w:-read_str(St,_),findw(St).
findw(St):-list_el_num(St,119,N1),list_el_num(St,120,N2),(N1<N2-> write("Found: "),put(119),nl; write("Found: "),put(120)).

%task 9
write_str_n(_,0):-!.
write_str_n(A,N):-write_str(A), nl, N1 is N-1, write_str_n(A, N1).
big_st:-read_str(Stroka1,N1), read_str(Stroka2, N2), (N1>N2->N3 is N1-N2, write_str_n(Stroka1, N3); N3 is N2-N1, write_str_n(Stroka2, N3)).

%task 10
abc_check:-read_str(Stroka,_), find(Stroka).
find([H1,H2,H3|T]):-(H1=97, H2=98, H3=99 -> write_str([119,119,119|T]);append1([H1,H2,H3|T], [122,122,122], Str), write_str(Str)).


%task 11
o_str:-read_str(Stroka, N), check(Stroka, N).
check(A,N):-(N>10-> Str=[_,_,_,_,_,_],append1(Str,_,A), write_str(Str);N1 is 6-N, plus(A,N1)).
plus(A,0):-write_str(A),!.
plus(A,N):-N1 is N-1, append1(A,[111], Str), plus(Str,N1).

%task 13
zamena:-read_str(Stroka,_),zamena(Stroka,0,[],NewSt),reverse(NewSt,R),write_str(R).
zamena([],_,St,St):-!.
zamena([H|T],Counter,NewSt,NStr):-Counter1 is Counter+1,0 is Counter1 mod 2,(H\=97,H\=98-> append1([97],NewSt,NSt1),zamena(T,Counter1,NSt1,NStr),!;append1([99],NewSt,NSt1),zamena(T,Counter1,NSt1,NStr)),!.
zamena([H|T],Counter,NewSt,NStr):-Counter1 is Counter+1,append1([H],NewSt,NSt1),zamena(T,Counter1,NSt1,NStr).

%task 14
kol_num:-read_str(St,_),kol_num(St,0,Kol),write(Kol).
kol_num([],K,K):-!.
kol_num([H|T],K,Kol):-(H>47,H<58->K1 is K+1,kol_num(T,K1,Kol);kol_num(T,K,Kol)).

%task 15
abc:-read_str(Stroka,_),abc(Stroka).
abc([]):-!.
abc([H|T]):-(H\=97,H\=98,H\=99->!,fail;abc(T)).

%task 16
word:-read_str(Stroka,_),word(Stroka,[],N),write_str(N).
word([],N,N):-!.
word([119,111,114,100|T],Temp,N):-append1(Temp,[108,101,116,116,101,114],Temp1),
    word(T,Temp1,N),!.
word([H|T],Temp,N):-append1(Temp,[H],Temp1),word(T,Temp1,N),!.

%task 17
xabc:-read_str(Stroka,_), del(Stroka,[],List), write_str(List).
del([],List,List):-!.
del([120,97,98,99|T],Temp,List):-append1(Temp,[97,98,99],Temp1), del(T,Temp1,List),!.
del([H|T],Temp,List):-append1(Temp,[H],Temp1),del(T,Temp1,List).

%task 18
abc_numb:-read_str(Stroka,_),abc_numb(Stroka,[],List),write_str(List).
abc_numb([],List,List):-!.
abc_numb([97,98,99,H|T],Buffer,NL):-H>47,H<58,abc_numb([H|T],Buffer,NL),!.
abc_numb([H|T],Buffer,NL):-append1(Buffer,[H],BufferN),abc_numb(T,BufferN,NL).

%task 19
aba:-read_str(Stroka,_),aba(Stroka,0,Kol),write(Kol).
aba([],Kol, Kol):-!.
aba([97,98,97|T],N,Kol):-N1 is N+1 ,aba(T,N1,Kol),!.
aba([_|T],N,Kol):-aba(T,N,Kol).

%task 20
space:-read_str(St,_),space(St,0,[],List),space(List,StStart),
    reverse(StStart,StEnd),space(StEnd,Stroka),reverse(Stroka,StrokaR),
    write_str(StrokaR).
space([],_,NL,NL):-!.
space([32|T],0,Buffer,NL):-append1(Buffer,[32],BufferN),space(T,1,BufferN,NL),!.
space([32|T],KolS,Buffer,NL):-space(T,KolS,Buffer,NL),!.
space([H|T],_,Buffer,NL):-append1(Buffer,[H],BufferN),space(T,0,BufferN,NL),!.
space([32|T],NSt):-space(T,NSt),!.
space(Nst,Nst):-!.