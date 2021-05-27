write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str(A,N,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

%1.1
build_all_razm_p:-
		read_str(A,_),read(K),b_a_rp(A,K,[]).

b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

%1.2
build_all_perm:-
		read_str(A,_),b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

%1.3
build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,K,[]).
b_a_r(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El, A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).

%1.4
sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).
pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail.

%1.5
sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,N),read(K),sochet(B,K,A),write_str(B),nl,fail.

%2
make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

aa_razm_p:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(aa_razm_P),nl,told.
aa_razm_P:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_pos(Word,Pos_a,[97]),
		 in_list([98,99,100,101,102],S1),
		 in_free_pos(Word,S1),
		 in_list([98,99,100,101,102],S2),
		 in_free_pos(Word,S2),
		 in_list([98,99,100,101,102],S3),
		 in_free_pos(Word,S3),
		 write_str(Word),nl,fail.
put_pos(Word,[Head1,Head2],[Sim]):-select_pos(Word,Head1,Sim),
    select_pos(Word,Head2,Sim).

select_pos(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_],!),
    (Head is 2->Word=[_,Sim,_,_,_],!);
    (Head is 3->Word=[_,_,Sim,_,_],!);
    (Head is 4->Word=[_,_,_,Sim,_],!);
    (Head is 5->Word=[_,_,_,_,Sim]).

in_free_pos([H1,H2,H3,H4,H5],Sim):-(var(H1)->H1 is Sim),!;
(var(H2)->H2 is Sim),!;
(var(H3)->H3 is Sim),!;
(var(H4)->H4 is Sim),!;
(var(H5)->H5 is Sim).

%3
aa_razm:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(aa_razm_), nl, told.
aa_razm_:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_pos(Word,Pos_a,[97]),
		 in_list_exlude([98,99,100,101,102],S1,NList),
		 in_free_pos(Word,S1),
		 in_list_exlude(NList,S2,NList1),
		 in_free_pos(Word,S2),
		 in_list_exlude(NList1,S3,NList2),
		 in_free_pos(Word,S3),
		 write_str(Word),nl,fail.

%4
ss_razm:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(ss_razm_),told.
ss_razm_:-make_ar(5,Pos),sochet(Pos_s,2,Pos),in_list([97,98,99,100,101,102],Simbol),put_pos(Word,Pos_s,[Simbol]),in_list_exlude([97,98,99,100,101,102],Simbol,List),
		 in_list_exlude(List,S1,NList),
		 in_free_pos(Word,S1),
		 in_list_exlude(NList,S2,NList1),
		 in_free_pos(Word,S2),
		 in_list_exlude(NList1,S3,NList2),
		 in_free_pos(Word,S3),
		 write_str(Word),nl,fail.

%5
ss_2_razm:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(ss_2_razm_),told.
ss_2_razm_:-make_ar(6,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), put_pos6(Word,[H1,H2],[Simbol1]),in_list_exlude([97,98,99,100,101,102],Simbol1,NList), in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),sochet(Pos_,2,NNPos),in_list(NList,Simbol2),put_pos6(Word,Pos_,[Simbol2]),
		 in_list_exlude(NList,Simbol2,LastSimbol),
		 in_list_exlude(LastSimbol,S1,LastSimbol1),
		 in_free_pos6(Word,S1),
		 in_list_exlude(LastSimbol1,S2,NList1),
		 in_free_pos6(Word,S2),
		 write_str(Word),nl,fail.

put_pos6(Word,[Head1,Head2],[Sim]):-select_pos6(Word,Head1,Sim),select_pos6(Word,Head2,Sim).
select_pos6(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_],!);
				 (Head is 2->Word=[_,Sim,_,_,_,_],!);
				 (Head is 3->Word=[_,_,Sim,_,_,_],!);
				 (Head is 4->Word=[_,_,_,Sim,_,_],!);
				 (Head is 5->Word=[_,_,_,_,Sim,_],!);
				 (Head is 6->Word=[_,_,_,_,_,Sim]).

in_free_pos6([H1,H2,H3,H4,H5,H6],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
                  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim).

%6
srazm:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(srazm_),told.
srazm_:-make_ar(7,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), %vibrali 2 pozicii v slove i simvol na etu pozicuyu
put_pos7(Word,[H1,H2],[Simbol1]), %put pos  stavit na vibr pozicii simvol,
in_list_exlude([97,98,99,100,101,102],Simbol1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),% ubrali simvol iz spiska simvolov i iz spiska simvolov i iz spiska mest ubrali 2 posicii iz pred. shaga
sochet(Pos_,3,NNPos),in_list(NList,Simbol2),put_pos73(Word,Pos_,[Simbol2]),% vibrali 2 mesta pod vtoroy simvol vibrali vtoroy simvol i postavili ego na 2 mesta
		 in_list_exlude(NList,Simbol2,LastSimbol),%ubrali 2 simvol iz spiska
		 in_list_exlude(LastSimbol,S1,LastSimbol1),%vibrali i ubrali 3 simvol
		 in_free_pos7(Word,S1),% postavili 3 simvol
		 in_list_exlude(LastSimbol1,S2,NList1),%vibrali i ubrali 4 simvol
		 in_free_pos7(Word,S2),% postavili 4 simvol
		 write_str(Word),nl,fail.

put_pos7(Word,[Head1,Head2],[Sim]):-select_pos7(Word,Head1,Sim),select_pos7(Word,Head2,Sim).
select_pos7(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim]).

put_pos73(Word,[Head1,Head2, Head3],[Sim]):-select_pos7(Word,Head1,Sim),select_pos7(Word,Head2,Sim), select_pos7(Word,Head3,Sim).
select_pos7(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim]).

in_free_pos7([H1,H2,H3,H4,H5,H6,H7],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
				  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim),!;
				  (var(H7)->H7 is Sim).

%7
sssrazm:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(sssrazm_),told.
sssrazm_:-make_ar(9,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), %vibrali 2 poz v slove i simvol na etu poziciyu
put_pos9(Word,[H1,H2],[Simbol1]), %put pos stavit na vibr pozic simvol,

in_list_exlude([97,98,99,100,101,102],Simbol1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),% ubrali simvol iz spiska simvolov i iz spiska mest ubrali 2 pozic is pred shaga

sochet([H3, H4],2,NNPos),in_list(NList,Simbol2),put_pos9(Word,[H3,H4],[Simbol2]),% viprali 2 mesta pod 2 simvol vibrali 2 simvol i postavili na eti mesta

in_list_exlude(NList,Simbol2,NList_),in_list_exlude(NNPos,H3,EPos),in_list_exlude(EPos,H4,Pos_),% ubrali 2 simvol i mesta iz pod nego

sochet(Pos1_,3,Pos_),in_list_exlude(NList_,Simbol3, LastSimbol),put_pos93(Word,Pos1_,[Simbol3]),%vibrali 3 mesta pod 3 simvol i postavili ego
		 in_list_exlude(LastSimbol,S1,LastSimbol1),%vubrali i ubrali 4 simvol
		 in_free_pos9(Word,S1),% postavili 4 simvol
		 in_list_exlude(LastSimbol1,S2,NList1),%vibrali i ubrali 5 simvol
		 in_free_pos9(Word,S2),% postavili 5 simvol
		 write_str(Word),nl,fail.

put_pos9(Word,[Head1,Head2],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

put_pos93(Word,[Head1,Head2,Head3],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim), select_pos9(Word,Head3,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

in_free_pos9([H1,H2,H3,H4,H5,H6,H7,H8,H9],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
				  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim),!;
				  (var(H7)->H7 is Sim),!;
				  (var(H8)->H8 is Sim),!;
				  (var(H9)->H9 is Sim).

%8
pr8:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),write_str([[97],[97],[97],[97]]),nl,not(pr8_),told.

pr8_:- make_ar(4,Pos),in_list(Pos,Index),in_list([98,99,100,101,102],Simbol1),put_pos4(Word,[Index],[Simbol1]), in_list_exlude([98,99,100,101,102],Simbol1,List), %убрали символ b-f
		 in_free_pos4(Word,[97]),% поставили 1a
		 in_free_pos4(Word,[97]),% поставили 2a
		 in_free_pos4(Word,[97]),% поставили 3a
		 write_str(Word),nl,fail.

put_pos4(Word,[Head1],[Sim]):-select_pos4(Word,Head1,Sim).
select_pos4(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_],!);
				 (Head is 2->Word=[_,Sim,_,_],!);
				 (Head is 3->Word=[_,_,Sim,_],!);
				 (Head is 4->Word=[_,_,_,Sim],!).

in_free_pos4([H1,H2,H3,H4],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
                  (var(H4)->H4 is Sim).

%9
pr9:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(pr9_),nl,told.
pr9_:-make_ar(7,Pos),sochet(Pos_a,3,Pos),put_pos73(Word,Pos_a,[97]),
		 in_list([97,98,99,100,101,102],S1),
		 in_free_pos7(Word,S1),
		 in_list([97,98,99,100,101,102],S2),
		 in_free_pos7(Word,S2),
		 in_list([97,98,99,100,101,102],S3),
		 in_free_pos7(Word,S3),
		 in_list([97,98,99,100,101,102],S3),
		 in_free_pos7(Word,S3),
		 write_str(Word),nl,fail.

%10
pr10:-tell('c:/Users/Daniel/Documents/GitHub/Prolog/Lab_9/Out.txt'),not(pr10_3111_),not(pr10_2211_),nl,told.
%slova vidaа aaabcde
pr10_3111_:-make_ar(7,Pos),sochet(Pos_,3,Pos),in_list_exlude([97,98,99,100,101,102],S1, List),put_pos73(Word,Pos_,[S1]),
		 in_list_exlude(List,S1_,Pos2),
		 in_free_pos7(Word,S1_),
		 in_list_exlude(Pos2,S2,Pos3),
		 in_free_pos7(Word,S2),
		 in_list_exlude(Pos3,S3,Pos4),
		 in_free_pos7(Word,S3),
		 in_list_exlude(Pos4,S4,_),
		 in_free_pos7(Word,S4),
		 write_str(Word),nl,fail.
%slova vida aabbcde
pr10_2211_:-make_ar(7,Pos),sochet([H1, H2],2,Pos),in_list_exlude(Pos,H1,Pos1),in_list_exlude(Pos1,H2,Pos2),sochet([H3, H4],2,Pos2),sochet([S1, S2],2,[97,98,99,100,101,102]), in_list_exlude([97,98,99,100,101,102],S1,Symbol1), in_list_exlude(Symbol1,S2,Symbol2),put_pos7(Word,[H1, H2],S1),put_pos7(Word,[H3, H4],S2),
         in_list_exlude(Symbol2,S1_,Sym),
		 in_free_pos7(Word,S1_),
		 in_list_exlude(Sym,S2_,Sym2),
		 in_free_pos7(Word,S2_),
		 in_list_exlude(Sym2,S3_,Sym3),
		 in_free_pos7(Word,S3_),
		 write_str(Word),nl,fail.
