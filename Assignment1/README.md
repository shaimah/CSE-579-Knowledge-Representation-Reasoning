# Choice Rules and Constraints - Simple Progamming Assignment
#### This assignment was completed using [Clingo](https://github.com/potassco/guide/releases/download/v2.2.0/guide.pdf), which I installed on my local machine. You may also use the online version of Clingo, but it will not include the command line.

#### A walkthrough for each problem is provided as a comment header in the input program file '''Assignment1.lp'''. 

## Assignment Problems and Instructions

### P1. Use clingo to find all solutions to the 8-queens problem that have no queens in the 4x4=16 squares in the middle of the board.

### P2. Use clingo to find all solutions to the so-called [world's hardest sudoku problem](https://abcnews.go.com/blogs/headlines/2012/06/can-you-solve-the-hardest-ever-sudoku).

### P3. Use clingo to find all solutions to a 16x16 Sudoku problem.

### P4. Use clingo to find all solutions to an Offset Sudoku problem.

### P5. Use clingo to find all solutions to an Anti-Knight Sudoku problem.

### P6. Use clingo to find all solutions to the Greater-Thank Sudoku problem.

## Additional Practice Problems (Not included in the input file)

### P7. Use clingo to determine how many bishops can be placed on a chessboard so that they do not attack each  other. Add the number of bishops as a symbolic constant that may be assigned a value in the command line.


### P8. About a set X of numbers we say that it is almost sum-free if the sum of two different elements of X never belongs to X. For instance, the set {1, 2, 4} is almost sum-free. Almost-Schur number A(k) is the largest integer n for which the interval {1, . . . , n} can be partitioned into k almost sum-free sets. Use clingo to find the exact values of A(1), A(2), A(3) and try to find the largest lower bound for A(4), i.e., the largest number l such that A(4) ≥ l.
