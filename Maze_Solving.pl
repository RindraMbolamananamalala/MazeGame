% AUTHOR : Rindra Mbolamananamalala


% solve_with_DFS( Start, Finish, Solution):
% Start: The Node where we should start.
% Finish: The Node where we should stop.
% Solution: The Path calculated between Start and Finish
solve_with_DFS(Start, Finish, Solution)  :-
 \+ wall(Start),
 \+ wall(Finish),
  depthfirst([], Start, Finish, Solution1),
  reverse_list(Solution1, Solution),
  display_list_content(Solution).

% extending the path [Node | Path] to the Finish Node will provide the
% Solution
depthfirst(Path, Node, Finish, [Node| Path] )  :-
   Node = Finish.

depthfirst(Path, Node, Finish, Solution)  :-
  edge(Node, Node1),
  % Cycle must be avoided
  \+ member(Node1, Path),
  % A Wall Node must be avoided
  \+ wall(Node),
  depthfirst([Node|Path], Node1, Finish, Solution).



% solve_with_IDDFS(Start, Finish, Solution):
% Start: The Node where we should start.
% Finish: The Node where we should stop.
% Solution: The Path calculated between Start and Finish

solve_with_IDDFS(Start, Finish, Solution) :-
  % Walls must be avoided
   \+ wall(Start),
   \+ wall(Finish),
    iterative_deepening_depthfirst_search(Start, Finish, Solution1),
    reverse_list(Solution1, Solution),
    display_list_content(Solution).

% From a given Node N, the shortest past leading to itself could be
% represented by Pat [N]
iterative_deepening_depthfirst_search(Node, Node, [Node]).

/*If we have to go from a start node N
  to an end node M, and given that N is not M, [LastNode|Path] is the
  path from FirstNode and LastNode, if it is TRUE that:
   1) Path is the path from FirstNode and LastButNotTheLatestNode node
   2) Exists an edge from LastButNotTheLatestNode and LastNode
   3) LastNote has never been visted
   4) We never visit a wall */
iterative_deepening_depthfirst_search(FirstNode, LastNode, [LastNode|Path]) :-
    iterative_deepening_depthfirst_search(FirstNode, LastButNotTheLatestNode, Path),
    edge(LastButNotTheLatestNode, LastNode),
    % Wall must be avoided
    \+ wall(LastButNotTheLatestNode),
    % Cycle must be avoided
    \+ (member(LastNode, Path)),
    % Wall must be avoided
    \+ wall(LastNode)
    .

% Reversing a List
reverse_list([],[]).
reverse_list([X|Xs],Acc) :-
    reverse_list(Xs,Acc1),
    append(Acc1, [X], Acc).

% Displaying the whole content of a List
display_list_content([]).
display_list_content([X|R]) :-
  write(X)
  , nl
  , display_list_content(R).


% Modeling the Maze
% First: Defining the Edges
edge((1, 1), (1, 2)).
edge((1, 1), (2, 1)).
edge((1, 2), (1, 3)).
edge((1, 2), (2, 2)).
edge((1, 2), (1, 1)).
edge((1, 3), (1, 4)).
edge((1, 3), (2, 3)).
edge((1, 3), (1, 2)).
edge((1, 4), (1, 5)).
edge((1, 4), (2, 4)).
edge((1, 4), (1, 3)).
edge((1, 5), (1, 6)).
edge((1, 5), (2, 5)).
edge((1, 5), (1, 4)).
edge((1, 6), (2, 6)).
edge((1, 6), (1, 5)).
edge((2, 1), (2, 2)).
edge((2, 1), (3, 1)).
edge((2, 1), (1, 1)).
edge((2, 2), (2, 3)).
edge((2, 2), (3, 2)).
edge((2, 2), (2, 1)).
edge((2, 2), (1, 2)).
edge((2, 3), (2, 4)).
edge((2, 3), (3, 3)).
edge((2, 3), (2, 2)).
edge((2, 3), (1, 3)).
edge((2, 4), (2, 5)).
edge((2, 4), (3, 4)).
edge((2, 4), (2, 3)).
edge((2, 4), (1, 4)).
edge((2, 5), (2, 6)).
edge((2, 5), (3, 5)).
edge((2, 5), (2, 4)).
edge((2, 5), (1, 5)).
edge((2, 6), (3, 6)).
edge((2, 6), (2, 5)).
edge((2, 6), (1, 6)).
edge((3, 1), (3, 2)).
edge((3, 1), (4, 1)).
edge((3, 1), (2, 1)).
edge((3, 2), (3, 3)).
edge((3, 2), (4, 2)).
edge((3, 2), (3, 1)).
edge((3, 2), (2, 2)).
edge((3, 3), (3, 4)).
edge((3, 3), (4, 3)).
edge((3, 3), (3, 2)).
edge((3, 3), (2, 3)).
edge((3, 4), (3, 5)).
edge((3, 4), (4, 4)).
edge((3, 4), (3, 3)).
edge((3, 4), (2, 4)).
edge((3, 5), (3, 6)).
edge((3, 5), (4, 5)).
edge((3, 5), (3, 4)).
edge((3, 5), (2, 5)).
edge((3, 6), (4, 6)).
edge((3, 6), (3, 5)).
edge((3, 6), (2, 6)).
edge((4, 1), (4, 2)).
edge((4, 1), (5, 1)).
edge((4, 1), (3, 1)).
edge((4, 2), (4, 3)).
edge((4, 2), (5, 2)).
edge((4, 2), (4, 1)).
edge((4, 2), (3, 2)).
edge((4, 3), (4, 4)).
edge((4, 3), (5, 3)).
edge((4, 3), (4, 2)).
edge((4, 3), (3, 3)).
edge((4, 4), (4, 5)).
edge((4, 4), (5, 4)).
edge((4, 4), (4, 3)).
edge((4, 4), (3, 4)).
edge((4, 5), (4, 6)).
edge((4, 5), (5, 5)).
edge((4, 5), (4, 4)).
edge((4, 5), (3, 5)).
edge((4, 6), (5, 6)).
edge((4, 6), (4, 5)).
edge((4, 6), (3, 6)).
edge((5, 1), (5, 2)).
edge((5, 1), (6, 1)).
edge((5, 1), (4, 1)).
edge((5, 2), (5, 3)).
edge((5, 2), (6, 2)).
edge((5, 2), (5, 1)).
edge((5, 2), (4, 2)).
edge((5, 3), (5, 4)).
edge((5, 3), (6, 3)).
edge((5, 3), (5, 2)).
edge((5, 3), (4, 3)).
edge((5, 4), (5, 5)).
edge((5, 4), (6, 4)).
edge((5, 4), (5, 3)).
edge((5, 4), (4, 4)).
edge((5, 5), (5, 6)).
edge((5, 5), (6, 5)).
edge((5, 5), (5, 4)).
edge((5, 5), (4, 5)).
edge((5, 6), (6, 6)).
edge((5, 6), (5, 5)).
edge((5, 6), (4, 6)).
edge((6, 1), (6, 2)).
edge((6, 1), (5, 1)).
edge((6, 2), (6, 3)).
edge((6, 2), (6, 1)).
edge((6, 2), (5, 2)).
edge((6, 3), (6, 4)).
edge((6, 3), (6, 2)).
edge((6, 3), (5, 3)).
edge((6, 4), (6, 5)).
edge((6, 4), (6, 3)).
edge((6, 4), (5, 4)).
edge((6, 5), (6, 6)).
edge((6, 5), (6, 4)).
edge((6, 5), (5, 5)).
edge((6, 6), (6, 5)).
edge((6, 6), (5, 6)).

% Secondly: Defining the Walls
wall((5,2)).
wall((4,3)).
wall((6,3)).
wall((3,4)).






