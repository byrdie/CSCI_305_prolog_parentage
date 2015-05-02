% Roy Smart
% Montana State University
% CSCI 305 Lab 4 "Prolog Parentage"
% May 2, 2015

% mother/2 rule
mother(M,C):- parent(M,C), female(M).

% father/2 rule
father(M,C):- parent(M,C), male(M).

% spouse/2 rule
spouse(M,C):- married(M,C).
spouse(M,C):- married(C,M).

% child/2 rule
child(M,C):- parent(C,M).

% son/2 rule
son(M,C):- child(M,C), male(M).

% daughter/2 rule
daughter(M,C):- child(M,C), female(M).

% sibling/2 rule
sibling(X, Y) :- father(W, X), father(W, Y), X \= Y.

% brother/2 rule
brother(M, C) :- sibling(M, C), male(M).

% sister/2 rule
sister(M, C) :- sibling(M, C), female(M).

% uncle/2 two rules: one by blood, one by marriage.
uncle(M, C) :- parent(X,C), brother(M, X).
uncle(M, C) :- parent(X,C), sister(Y, X), spouse(M, Y).

% aunt/2 two rules: one by blood, one by marriage.
aunt(M, C) :- parent(X,C), sister(M, X).
aunt(M, C) :- parent(X, C), brother(Y, X), spouse(M, Y).

% grandparent/2 rule
grandparent(M, C) :- parent(X, C), parent(M, X).

% grandfather/2 rule
grandfather(M, C) :- grandparent(M, C), male(M).

% grandmother/2 rule
grandmother(M, C) :- grandparent(M, C), female(M).

% grandchild/2 rule
grandchild(M, C) :- child(X, C), child(M, X).

% ancestor/2 rule
ancestor(M,C) :- parent(M,C).
ancestor(M,C) :- parent(M,X), ancestor(X,C).	% recursive call

% descendant/2 rule
descendant(M,C) :- child(M,C).
descendant(M,C) :- child(M,X), descendant(X,C).		% recursive call

% older/2 rule
older(M,C) :- born(M, X), born(C, Y), X < Y.

% younger/2 rule
younger(M,C) :- born(M, X), born(C, Y), X > Y.

%regentWhenBorn/2 rule
regentWhenBorn(M, C) :- reigned(M, A, B), born(C, X), X >= A, X < B.