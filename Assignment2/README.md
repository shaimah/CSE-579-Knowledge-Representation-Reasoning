# Simple Transition System in the Language of Clingo
#### A transition system is a directed graph where its vertices correspond to the state of the world and its edges are labelled by actions.

#### Anything that depends on the state of the world is called a **fluent** and it can be changed by executing an **action**.

#### For each problem, the action domain in ASP is represented using the following steps:
- Sort and object declation
- State constraints
- Effect and preconditions of actions
- Action constraints
- [Domain independent axioms](https://www.kocseaa.org/home/static_html/symposium09/slides/Friday%201%20-%20AI%20Vision/Joohyung%20Lee.pdf)

#### A walkthrough for each problem is provided as a comment header in the input program file `Assignment1.lp`. 

## Assignment Problems and Instructions

### Problem 1
#### Modify the file blocks.lp to reflect the assumption that the table is small, so that the number of blocks that can be placed on the table simultaneously is limited by a given constant. How many steps are required to solve the example problem above if only 4 blocks can be on the table at the same time? What if only 3? You may test your codes with a scenario, which is also represented by a clingo program such as blocks-scenario.lp below.
`
<pre><code>
%%%%%%%%%%%%%%%%%%%
% File: blocks-scenario.lp
%%%%%%%%%%%%%%%%%%%
block(1..6).
% initial state
:- not on(1,2,0; 2,table,0; 3,4,0; 4,table,0; 5,6,0; 6,table,0).
% goal
:- not on(3,2,m; 2,1,m; 1,table,m; 6,5,m; 5,4,m; 4,table,m).
</code></pre>


### Problem 2
#### The file `blocks.lp` specifies that the initial state correctly. Without the specification, there will be stable models that do not correspond to valid states, like the following. 
#### non(1,2,0) on(2,1,0) on(3,3,0) on(4,table,0) on(5,6,0) on(6,table,0)
#### Modify the file blocks.lp so that the stable models are in a 1-1 correspondence with valid states.

### Problem 3
#### A serializable plan is such that the actions that are scheduled for the same time period can be instead executed consecutively, in any order without affecting the result.
#### Modify `blocks.lp` to generate only serializable plans. Find a minimal length plan for the following scenario. (Hint: you need to modify blocks-scenario.lp to reflect this new scenario.)
`
Initially:
loc(m)=table, loc(l)=m, loc(a)=l, loc(b)=a, loc(c)=b,
loc(o)=table, loc(n)=o, loc(d)=n, loc(e)=d, loc(j)=e,
loc(k)=j, loc(f)=table, loc(g)=f, loc(h)=g, loc(i)=h
In maxstep:
loc(e)=j, loc(a)= e, loc(n)=a, loc(i)=d, loc(h)=i,
loc(m)=h, loc(o)= m, loc(k)=g, loc(c)=k, loc(b)=c,
loc(l)=b.
`
### Problem 4
#### A minimal length plan is not necessarily optimal. Modify the program done for Problem 3 to find a plan that has the least number of actions. What is that number when maxstep m is 8, 9, and 10?
