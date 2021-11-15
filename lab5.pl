/*Задание 1*/
swap(A, B):-(A @> B -> nechet(B, A); nechet(A, B)).
goal1:-read(A), read(B), swap(A, B).
nechet(A, B):-A @> B, !.
nechet(A, B):-B mod 2 =\= 0, writeln(B), B1 is B - 1, nechet(A, B1).
nechet(A, B):-B mod 2 =:= 0, B1 is B - 1, nechet(A, B1).

/*Задание 2*/
goal2:-repeat, read(X), check(X), !.
check(X):-X < 0, !.
check(X):-fib(X, NUMB), writeln(NUMB), fail.
fib(X, NUMB):-X < 0, !.
fib(0, 1):-!.
fib(1, 1):-!.
fib(X, NUMB):-X1 is X - 2, X2 is X - 1, fib(X1, A), fib(X2, B), NUMB is A + B.

/*Задание 3*/
task3(A, B, [H1|T1], [H1|T2], L2, L3):-
  H1 @< A, !, task3(A, B, T1, T2, L2, L3).
task3(A, B, [H1|T1], L1, [H1|T2], L3):-
  H1 @>= A, H1 @=< B, !, task3(A, B, T1, L1, T2, L3).
task3(A, B, [H1|T1], L1, L2, [H1|T2]):-
  task3(A, B, T1, L1, L2, T2).
task3(_, _, [], [], [], []).

goal3:-
  writeln("enter list: "),read(L),
  writeln("enter A: "),read(A),number(A),
  writeln("enter B: "),read(B),number(B),
  (A @> B, task3(B, A, L, L1, L2, L3);
           task3(A, B, L, L1, L2, L3)),
  write('L1: '), writeln(L1),
  write('L2: '), writeln(L2),
  write('L3: '), writeln(L3).

/*Задание 4*/

goal4 :- writeln('Vash spisok:'), read(S), maxh(S,COUNT), print(S, COUNT, R), writeln(R).

max(A,B,A) :- B<A.
max(A,B,B) :- A=<B.

hertz([], _, 0).
hertz([H|T], X, COUNT):- X =:= H, hertz(T, X, COUNT1), COUNT is COUNT1 + 1.
hertz([H|T], X, COUNT):- X =\= H, hertz(T, X, COUNT).

maxh([], 0).
maxh([H|T],MAX):-maxh(T, MAX1), hertz([H|T], H, COUNT), max(COUNT, MAX1, MAX).

print([], _, []).
print([H|T], MAXH, [H|R1]):- hertz([H|T], H, COUNT), COUNT =:= MAXH, print(T, MAXH, R1).
print([H|T], MAXH, R1):- hertz([H|T], H, COUNT), COUNT =\= MAXH, print(T, MAXH, R1).
