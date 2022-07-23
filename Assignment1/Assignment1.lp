%%% P1. Finding all possible solutions for the 8-queen problems with one additional constraint: no queens are allowed on the 4x4 square in the middle of the board

%% Hard constraints 

% No two queens can be on the same row

% No two queens can be on the same column

% No two queens can on the same diagonal

% No queens can be placed in the middle of the board (4x4)


%%% P2. Using clingo to solve the world's hardest sudoku

%% Input instances are ground atoms such that atom a expression a relation between row number, column number and the assigned value in this particular order
a(1,1,8). a(2,3,3). a(2,4,6). a(3,2,7).
a(3,5,9). a(3,7,2). a(4,2,5). a(4,6,7).
a(5,5,4). a(5,6,5). a(5,7,7). a(6,4,1).
a(6,8,3). a(7,3,1). a(7,8,6). a(7,9,8).
a(8,3,8). a(8,4,5). a(8,8,1). a(9,2,9).
a(9,7,4).

%% Write the following constraints to solve the puzzle

% Each number 1..9 is assigned to one cell in each box (this constraint ensures that the same number is not assinged more than once to each box)

% No two different numbers can be assigned to the same cell

% Every row must only contain unique values (Hint: two different column numbers may not exist given a row and a number)

% Every column must only contain unique values 


%%% P3. Use clingo to find all solutions to a nxn Sudoku problem, where N is the number of rows which is equal to the number of columns. Sudoku puzzles are typically 3x3

%% Input instances according to the given problem as a(R,C,V) - row and column number, and assigned value.

%* Execute the clingo program below 
(n is a symbolic constant of the row/column number that may be assigned a value in the command line or it can be hard-coded into the program instead)
(k is a symbolic constant of the dimension of each box (the sqrt of n) may be assigned a value in the command line or hard-coded into the program as well)
*%
% Each number 1..N is assigned to one cell in each box
1 { a(X,Y,N):X=1..n,Y=1..n,X1<=X,X<=X1+(k-1),Y1<=Y,Y<=Y1+(k-1) } 1
:- N=1..n, X1 = k*(0..k-1)+1, Y1 = k*(0..k-1)+1.

% no two different numbers given a row and a column
:- a(X,Y,N), a(X,Y,N1), N!=N1.

% no two different columns given a row and a number
:- a(X,Y,N), a(X,Y1,N), Y!=Y1.

% no two different rows given a column and a number
:- a(X,Y,N), a(X1,Y,N), X!=X1.


%%% P4. Offset Sudoku Clingo program

%%* Add the following constraint to the basic sudoku program. Every colour 
is repeated every 3 rows and every 3 columns (assuming a typical 9x9 grid) 
*%% 

%* The same number cannot exist in a row (R1) and a column (C1) given that there 
is another row(R2) or another column(C2) assigned the same number and the remainder of R1 and R2 or of C1 and C2,
when divided by 3, is the same. 
*%
:- a(R,C,N), a(R1,C1,N), R\3 == R1\3, C\3 == C1\3, R != R1, C != C1.

%%% P5. Writing a clingo program for the anti-knight problem.

%% To the basic sudoku program add the following constraint.

%Cells that are a knight's move away from each other cannot hold equal values
:- a(R,C,N), a(R1,C1,N), |R1-R|+|C1-C|==3.


%%% P6. Great Than Sudoku Clingo program

%% define the directions of the greater-than symbols on each row as given in the problem
left_right(1, l, l, r, l, l, l).
left_right(2, l, r, l, r, l, l).
left_right(3, r, l, r, r, r, l).
left_right(4, r, l, l, l, r, l).
left_right(5, l, r, r, l, r, r).
left_right(6, l, r, l, l, l, r).
left_right(7, r, l, r, l, l, r).
left_right(8, r, r, l, r, l, l).
left_right(9, l, r, l, r, l, l).

up_down(1, u, u, d, u, u, d, d, d, d).
up_down(2, u, d, d, d, d, d, u, u, d).
up_down(4, d, u, d, u, u, d, u, u, u).
up_down(5, u, d, u, d, d, u, u, u, u).
up_down(7, d, u, d, d, u, d, d, u, u).
up_down(8, d, u, u, u, u, d, d, d, d).

%% define the effect of the greater-than symbols on left-right directions
N1 < N2 :- left_right(R, D, _, _, _, _, _), D=l, a(R,1,N1), a(R,2,N2).
N1 < N2 :- left_right(R, _, D, _, _, _, _), D=l, a(R,2,N1), a(R,3,N2).
N1 < N2 :- left_right(R, _, _, D, _, _, _), D=l, a(R,4,N1), a(R,5,N2).
N1 < N2 :- left_right(R, _, _, _, D, _, _), D=l, a(R,5,N1), a(R,6,N2).
N1 < N2 :- left_right(R, _, _, _, _, D, _), D=l, a(R,7,N1), a(R,8,N2).
N1 < N2 :- left_right(R, _, _, _, _, _, D), D=l, a(R,8,N1), a(R,9,N2).

N1 > N2 :- left_right(R, D, _, _, _, _, _), D=r, a(R,1,N1), a(R,2,N2).
N1 > N2 :- left_right(R, _, D, _, _, _, _), D=r, a(R,2,N1), a(R,3,N2).
N1 > N2 :- left_right(R, _, _, D, _, _, _), D=r, a(R,4,N1), a(R,5,N2).
N1 > N2 :- left_right(R, _, _, _, D, _, _), D=r, a(R,5,N1), a(R,6,N2).
N1 > N2 :- left_right(R, _, _, _, _, D, _), D=r, a(R,7,N1), a(R,8,N2).
N1 > N2 :- left_right(R, _, _, _, _, _, D), D=r, a(R,8,N1), a(R,9,N2).

%%* Write the constraints for the up-down symbols given two scenarios: the first in case the direction
equality sign is facing downward and the second in case the equality sign is facing upward.
*%

%* Up-down symbols constraints in case the equality sign is facing downward: starting with the first column, 
the value assigned to a row (R) must be greater than the value assigned to the row below (R+1). 
Only the first constraint is provided starting with column 1 and rows 1..8
*%
N1 > N2 :- up_down(R, D, _, _, _, _, _, _, _, _), D=d, a(R,1,N1), a(R+1,1,N2).

% Up-down symbols constraints in case the equality sign is facing downward (same concept)
N1 < N2 :- up_down(R, D, _, _, _, _, _, _, _, _), D=u, a(R,1,N1), a(R+1,1,N2).



