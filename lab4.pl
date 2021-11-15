parent(john, bob).
parent(mary, bob).
parent(mary, ann).
parent(bob, lis).
parent(bob, paul).
parent(bob, sam).
parent(paul, pat).

man(john).
man(bob).
man(paul).
man(sam).
woman(mary).
woman(ann).
woman(lis).
woman(pat).

son(X,Y):-parent(X,Y), man(Y).
father(F, C):-parent(F, C), man(F).
mother(M, C):-parent(M, C), woman(M).
brother(B, X):-parent(P, B), parent(P, X), man(B), not(B == X).
sister(S, X):-parent(P, S), parent(P, X), woman(S), not(S == X).
grandchild(C, X):-parent(P, C), parent(X, P).
aunt(A, X):-parent(P, X), sister(A, P).
hasthree(P):-parent(P, FIRST), parent(P, SECOND), parent(P, THIRD), not(FIRST == THIRD), not(SECOND == THIRD), not(SECOND == FIRST).
hastwo(P):-parent(P, FIRST), parent(P, SECOND), not(hasthree(P)), FIRST @< SECOND.
rod(X):-father(X, S), man(S).

soncount( Parent, N ):- findall(Child, son(Parent, Child), Children), sort( Children, Children1 ), length( Children1, N ).
