read_string(10,L,L,N,N):-!.	% 10 - enter
read_string(X,L,CurL,N,CurN):-	NewN is CurN+1,append(CurL,[X],NewL),
				get0(Y),read_string(Y,L,NewL,N,NewN).
read_string(L,N):-	nl,write("input string: "),
			get0(X),read_string(X,L,[],N,0).

write_string([]):-!.
write_string([H|T]):-	put(H),
			write_string(T).


write_strings([]):-!.
write_strings([H|T]):-	write_string(H),nl,
			write_strings(T).

% task 1
predicate1:-	read_string(L,N),nl,

		writeln("output string (three times): "),
		write_string(L),write(", "),
		write_string(L),write(", "),
		write_string(L),nl,nl,

		write("string length: "),writeln(N),nl.

% task 2
predicate2:-	read_string(L,_),
		count_words(L,Count),
		write("number of words: "),
		writeln(Count),nl.

count_words([],Count,Count):-!.
count_words(L,Count,CurCount):-	skip_spaces(L,CurL),
				get_word(CurL,NewL,Word),
				Word \= [],
				NewCount is CurCount+1,
				count_words(NewL,Count,NewCount),!.
count_words(_,Count,Count).
count_words(L,Count):-count_words(L,Count,0).

skip_spaces([32|T],NewL):-skip_spaces(T,NewL),!.
skip_spaces(L,L).


get_word([],[],[]):-!.
get_word(L,NewL,Word):-get_word(L,NewL,Word,[]).

get_word([],[],Word,Word).
get_word([32|T],T,Word,Word):-!.
get_word([H|T],NewL,Word,CurWord):-	append(CurWord,[H],NewWord),
					get_word(T,NewL,Word,NewWord).
