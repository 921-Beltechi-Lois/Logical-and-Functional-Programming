% a. Write a predicate to remove all occurrences of a certain atom from a list.

% Math model

%removeOcc(l1 l2...ln, elem)=
%{
% [], if n=0
% removeOcc(l2...ln, elem), if l1=elem
% {l1} U removeOcc(l2...ln, elem), otherwise
%}

% removeOcc(L: List, E: number, R: list)
% removeOcc(i,i,0)

removeOcc([],_,[]).
removeOcc([H|T], E,R):-
	H=:=E,
	removeOcc(T,E,R).
removeOcc([H|T], E, [H|R]):-
	removeOcc(T,E,R).

% ----------------------
%del(_, [], [], 0).
%del(X, [H|L1], [H|L2],N):-
%    X\==H,
%    del(X,L1,L2,N),
%    X\==H.
%del(X, [X|L1], L2, N):-
%	del(X,L1,L2,N1),
%	N is N1+1.
% ----------------------- + counter


% b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms.
%  In this initial list atom has n occurrences.
%  Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]]

% count(l1 l2...ln, elem)=
% 0, if n=0
% 1+count(l2...ln,elem), if l1=elem
% count(l2...ln,elem), otherwise

% count(L: list, E: Number, R: appereances)

count([], _, 0).
count([H|T], E, R1):-
	H=:=E,
	count(T,E,R),
	R1 is R+1.
count([H|T], E, R):-
	H=\=E,
	count(T,E,R).


% numberAtom(l1 l2...ln)=
% =[], if n=0
% =[l1, count(l1 l2...ln, l1)] U numberAtom(removeOcc(l2...ln,l1)), otherwise
%remove duplicates from list each time

%numberAtom(L: list, R: list)
%numberAtom(i,o)

numberAtom([],[]).
numberAtom([H|T], [[H, RC] | R]):-
	count([H|T], H, RC),  % RC = result counter of head
	removeOcc(T,H,RR), % remove head of the list each time
	numberAtom(RR,R). % new list, resulted list

















