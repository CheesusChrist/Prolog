max(X,Y,X):- X>=Y.
max(_,Y,Y).

max(X, Y, U, X):-X>=Y, X>=U.
max(_,Y, U, Y):- Y>=U.
max(_,_,U,U).

fact(1,1):-!.
fact(N,X):- N1 is N-1, fact(N1,X1), X is X1*N.

fact(1, CurX, CurX):-!.
fact(N,CurX,X):-CurX1 is CurX*N, N1 is N-1, fact(N1, CurX1, X).
factorial(N,X):-fact(N,1,X).

fib(0,0):-!.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.

fib(0,A,_,A):-!.
fib(N,A,B,X):- AB is A+B, N1 is N-1, fib(N1,B,AB,X).
fibonachi(N,X):-fib(N,0,1,X).

sumnumbers(N,N):- N<10.
sumnumbers(N,X):- N>=10, D is N div 10, M is N mod 10, sumnumbers(D,X1), X is M+X1.

sum(0,Sum,Sum):-!.
sum(N,Sum,X):- D is N div 10, M1 is N mod 10, Sum1 is Sum + M1,sum(D,Sum1,X). 
sumnumbers1(N,X):-sum(N,0,X).

maxDigit(N,N):- N<10.
maxDigit(N,X):- N1 is N div 10, N2 is N mod 10, maxDigit(N1,X1), N2=<X1,!, X is X1.
maxDigit(N,X):- N1 is N div 10, N2 is N mod 10, maxDigit(N1,X1), N2>X1, X is N2.

mDig(0,A,A):- !.
mDig(A,B,C):- D is A mod 10, D>B, !, E is A div 10, mDig(E,D,C).
mDig(A,B,C):- D is A div 10, mDig(D,B,C).

min(N,N):-N<10.
min(N,X):-N1 is N div 10, N2 is N mod 10, min(N1,X1), 1 is N2 mod 2, N2=<X1,!, X is N2. 
min(N,X):- N1 is N div 10, N2 is N mod 10, min(N1,X1), N2>X1, X is X1.

min1(0,N,N):- !.
min1(N,B,X):- D is N mod 10, 1 is D mod 2, D<B, !, E is N div 10, min1(E,D,X). 
min1(N,B,X):- D is N div 10, min1(D,B,X).
minimal(N,X):-min1(N,10,X).
