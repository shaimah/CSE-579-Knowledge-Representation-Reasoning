%%%Problem1.
%%%%%%%%%%%%%%%%%%%
% File: blocks.lp: Blocks World
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sort and object declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% every block is a location
location(B) :- block(B).
% the table is a location
location(table).
%%%%%%%%%%%%%%%%%%%%%%%%%%
% state description
%%%%%%%%%%%%%%%%%%%%%%%%%%
% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..m.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect and preconditions of action
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect of moving a block
on(B,L,T+1) :- move(B,L,T).
% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).
% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% domain independent axioms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).
% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T=1..m.
% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..m-1.
% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T < m.

% count stacks on table, they shouldn't be more than the number that you have specified
:- #count{B: on(B,table,T)} > n,T = 0..m-1.

#show move/3.


%%%Problem2.
%%%%%%%%%%%%%%%%%%%
% File: blocks.lp: Blocks World
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sort and object declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% every block is a location
location(B) :- block(B).
% the table is a location
location(table).
%%%%%%%%%%%%%%%%%%%%%%%%%%
% state description
%%%%%%%%%%%%%%%%%%%%%%%%%%
% two blocks can't be on the same block at the same time
:- 2{on(BB,B,0)}, block(B).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% domain independent axioms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).
% uniqueness and existence of value constraints
:- not 1{on(B,LL,0)}1, block(B).

%% Additional constraints to ensure a valid initial state

% constraint to disallow cycles (The block on the very top cannot be below the block at the very bottom).
:- on(B1,B,0),on(B2,B1,0),on(B,B2,0),B1!=B2,B!=B1,B!=B2.
:- on(B1,B,0),on(B2,B1,0),on(B3,B2,0),on(B,B3,0),B1!=B2,B!=B1,B!=B2,B!=B3,B1!=B3,B2!=B3.

% if B1 in on B, then B cannot be on B1
:- on(B1,B,0), on(B,B1,0), B1 != B.

% the same block cannot be on top of itself
:- on(B1,B,0), B1 = B.

block(1..n).
#show on/3.


%%Problem 3
%%%%%%%%%%%%%%%%%%%
% File: blocks.lp: Blocks World
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sort and object declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% every block is a location
location(B) :- block(B).
% the table is a location
location(table).
%%%%%%%%%%%%%%%%%%%%%%%%%%
% state description
%%%%%%%%%%%%%%%%%%%%%%%%%%
% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..z.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect and preconditions of action
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect of moving a block
on(B,L,T+1) :- move(B,L,T).

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).
% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% domain independent axioms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).
% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T=1..z.
% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..z-1.
% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T < z.

% at any given time, if the location of the block you're moving to is occupied then the move isn't part of the serializable plan
:- 1{on(B1,B,T)}, move(B2,B,T), block(B),T = 0..z. 

#show move/3.

%%%%%%%%%%%%%%%%%%%
% File: blocks.lp: Blocks World
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sort and object declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% every block is a location
location(B) :- block(B).
% the table is a location
location(table).
%%%%%%%%%%%%%%%%%%%%%%%%%%
% state description
%%%%%%%%%%%%%%%%%%%%%%%%%%
% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..z.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect and preconditions of action
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect of moving a block
on(B,L,T+1) :- move(B,L,T).

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).
% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% domain independent axioms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).
% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T=1..z.
% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..z-1.
% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T < z.

% at any given time, if the location of the block you're moving to is occupied then the move isn't part of the serializable plan
:- 1{on(B1,B,T)}, move(B2,B,T), block(B),T = 0..z. 

%count total moves
num(K):- K= #count{B,LL,T: move(B,LL,T)}.
#minimize{K: num(K)}.
#show move/3.
#show num/1.